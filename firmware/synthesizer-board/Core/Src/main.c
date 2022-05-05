/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2021 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <math.h>
#include <string.h>
#include <stdbool.h>
#include <stdlib.h>

#include "display.h"
#include "station.h"
#include "keydecoder.h"
#include "misc.h"

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
ADC_HandleTypeDef hadc1;

RTC_HandleTypeDef hrtc;

TIM_HandleTypeDef htim1;
TIM_HandleTypeDef htim3;
TIM_HandleTypeDef htim6;
TIM_HandleTypeDef htim7;
TIM_HandleTypeDef htim14;
TIM_HandleTypeDef htim15;
TIM_HandleTypeDef htim16;

/* USER CODE BEGIN PV */
RTC_TimeTypeDef TIME = {0};
RTC_DateTypeDef DATE = {0};

int a = 4250;

double FREQUENCY_CALIBRATION = 0.9975;
int FM_FREQUENCY = 8750;
int FM_FREQUENCY_COUNTER = 0;
bool FM_FREQUENCY_COUNTER_UPDATED = false;

Mode MODE = OTHER;
bool CLOCK = false;
int STATION = -1;
bool BLUETOOTH = false;
bool BLUETOOTH_ON = false;

bool STANDBY = true;
bool STANDBY_DISPLAY_ON = true;

bool SET_BUTTON = false;
bool MEMORY_BUTTON = false;

bool LOCK_FREQUENCY = true;
bool SCAN_STOP = false;

int AM_FREQUENCY = 531;
int AM_FREQUENCY_COUNTER = 0;

int OFF_COUNTER = 0;
bool COLD_START = true;


int calculateFMFrequencyControlCounterPeriod(bool fastMode)
{
	// PFUI!
	int fm_difference = abs(FM_FREQUENCY - FM_FREQUENCY_COUNTER);

	int arr = 0;
	if (fastMode)
	{
		arr = 2500 - 500 * fm_difference;
		arr = arr < 250 ? 250 : arr;
	}
	else
	{
		arr = 3500 - abs(1.05 + 0.05 * fm_difference + 0.75 * exp(fm_difference));
		arr = arr < 250 ? 250 : arr;
	}

	return arr;
}

int calculateFMFrequencyControlCounterPrescaler(bool fastMode)
{
	// PFUI!
	double psc = 5000 - ((4 * FM_FREQUENCY_COUNTER) / 9);//4200 - 0.3675 * FM_FREQUENCY_COUNTER;
	if (fastMode)
	{
		psc = psc / 2;
		psc = psc < 110 ? 110 : psc;
	}
	else
	{
		psc = psc * 2.75;
	}

	return psc;
}

void stopFrequencyControl()
{
	HAL_TIM_Base_Stop_IT(&htim14);
}

void startFrequencyControl()
{
	HAL_TIM_Base_Start_IT(&htim14);
}

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
	if (htim->Instance == TIM6)
	{
		// 64 = PRESCALER / 7 = DEPENDING ON CPU-FREQUENCY / 10.7 MHz = IF
		FM_FREQUENCY_COUNTER = (((TIM3->CNT * 64 * 7 * FREQUENCY_CALIBRATION) - 1070000) / 1000.0);
		FM_FREQUENCY_COUNTER_UPDATED = true;

		TIM3->CNT = 0;
		TIM6->CNT = 0;
	}

	if (htim->Instance == TIM16)
	{
		// 7 = DEPENDING ON CPU-FREQUENCY / 455 kHz = IF
		AM_FREQUENCY_COUNTER = ((TIM1->CNT * 7 * FREQUENCY_CALIBRATION) / 100.0) - 455;

		TIM1->CNT = 0;
		TIM16->CNT = 0;
	}
	else if (htim->Instance == TIM7)
	{
		int display_value = 0;
		if (CLOCK)
		{
			if (!SET_BUTTON)
			{
				HAL_RTC_GetTime(&hrtc, &TIME, RTC_FORMAT_BIN);
				HAL_RTC_GetDate(&hrtc, &DATE, RTC_FORMAT_BIN);
			}

			display_value = TIME.Hours*100 + TIME.Minutes;
		}
		else if (MODE == FM)
		{
			display_value = SET_BUTTON && !CLOCK ? FM_FREQUENCY_COUNTER : FM_FREQUENCY;
		}
		else
		{
			display_value = SET_BUTTON && !CLOCK ? AM_FREQUENCY_COUNTER : AM_FREQUENCY;
		}

		if (OFF_COUNTER > 0)
		{
			display_show_off();
			OFF_COUNTER -= 1;
		}
		else if (!CLOCK && MODE == AM && BLUETOOTH && STATION == 0)
		{
			display_show_bluetooth();
		}
		else
		{
			display(display_value, (CLOCK && TIME.Seconds %2 == 1) || (!CLOCK && MODE == FM));
		}
	}
	else if (htim->Instance == TIM14)
	{
		if (MODE == FM)
		{
			TIM14->PSC = calculateFMFrequencyControlCounterPrescaler(!LOCK_FREQUENCY);
			TIM14->ARR = calculateFMFrequencyControlCounterPeriod(true);

			SCAN_STOP = !SCAN_STOP ? HAL_GPIO_ReadPin(GPIOC, SCAN_STOP_Pin) : true;

			if (TIM15->CCR2 < TIM15->ARR && FM_FREQUENCY < FM_FREQUENCY_COUNTER)
			{
				TIM15->CCR2++;
			}
			else if (TIM15->CCR2 > 0 && FM_FREQUENCY > FM_FREQUENCY_COUNTER)
			{
				TIM15->CCR2--;
			}

			// SCAN EMERGENCY-STOP
			if ((TIM15->CCR2 == 0) || (TIM15->CCR2 == TIM15->ARR))
			{
				FM_FREQUENCY = ((int)(FM_FREQUENCY_COUNTER / 10)) * 10;
				SCAN_STOP = true;
			}
		}
		else if (MODE == AM)
		{
			int am_difference = abs(AM_FREQUENCY - AM_FREQUENCY_COUNTER);
			int arr = 1500 - 175 * am_difference;
			int psc = 3500 - 0.5 * AM_FREQUENCY_COUNTER;
			TIM14->PSC = psc < 150 ? 150 : psc;
			TIM14->ARR = arr < 50 ? 50 : arr;

			if (TIM15->CCR2 < TIM15->ARR && AM_FREQUENCY < AM_FREQUENCY_COUNTER)
			{
				TIM15->CCR2++;
			}
			else if (TIM15->CCR2 > 0 && AM_FREQUENCY > AM_FREQUENCY_COUNTER)
			{
				TIM15->CCR2--;
			}
		}
	}
}

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_ADC1_Init(void);
static void MX_TIM1_Init(void);
static void MX_TIM3_Init(void);
static void MX_TIM6_Init(void);
static void MX_TIM14_Init(void);
static void MX_TIM7_Init(void);
static void MX_RTC_Init(void);
static void MX_TIM15_Init(void);
static void MX_TIM16_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
void saveFMStation()
{
	uint32_t dc = TIM15->CCR2;
	HAL_Delay(100);
	station_fm_set(STATION, FM_FREQUENCY, dc);
}

void saveAMStation()
{
	station_am_set(STATION, AM_FREQUENCY, TIM15->CCR2);
}

void setStation(int number, bool force)
{
	station_led(number);

	Mode mode = misc_get_mode(AM_FREQUENCY_COUNTER);
	bool modeChangedToFM = mode == FM && MODE != FM;
	bool modeChangedToAM = mode == AM && MODE != AM;

	if (modeChangedToFM || MODE == FM && (STATION != number || force))
	{
		setFMStation(number);
	}
	else if (modeChangedToAM || MODE == AM && (STATION != number || force))
	{
		setAMStation(number);
	}
}

void setFMStation(int number)
{
	STATION = number;
	misc_mute(true);

	stopFrequencyControl();
	struct Station station = station_fm_get(number);
	FM_FREQUENCY = station.Frequency;
	TIM15->CCR2 = station.DutyCycle;

	HAL_GPIO_WritePin(GPIOB, CENTER_LED_Pin, GPIO_PIN_SET);

	FM_FREQUENCY_COUNTER_UPDATED = false;
	while (!FM_FREQUENCY_COUNTER_UPDATED);
	FM_FREQUENCY_COUNTER_UPDATED = false;

	startFrequencyControl();

	int i = 0;
	LOCK_FREQUENCY = false;
	for(; i < 500 && abs(FM_FREQUENCY - FM_FREQUENCY_COUNTER) > 2; i++)
	{
		HAL_Delay(1);
	}
	LOCK_FREQUENCY = true;


	HAL_Delay(500 - i);
	misc_mute(false);
	HAL_GPIO_WritePin(GPIOB, CENTER_LED_Pin, GPIO_PIN_RESET);
}

void setAMStation(int number)
{
	STATION = number;
	misc_mute(true);

	struct Station station = station_am_get(number);
	AM_FREQUENCY = station.Frequency;
	TIM15->CCR2 = station.DutyCycle;

	HAL_Delay(500);
	misc_mute(false);
}

double getCalibrationValue()
{
	uint32_t y = 0;

	for (int i = 0; i < 5; i++)
	{
		HAL_ADC_Start(&hadc1);
		HAL_ADC_PollForConversion(&hadc1, HAL_MAX_DELAY);
		int x = HAL_ADC_GetValue(&hadc1);

		y += x / 5;
	}

	// +/- 0.5%
	double value = 0.995 + 0.000002442 * y;

	return value;
}

void enable_5volt(bool on)
{
	HAL_GPIO_WritePin(GPIOC, DISABLE_5V_Pin, on);
}

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_ADC1_Init();
  MX_TIM1_Init();
  MX_TIM3_Init();
  MX_TIM6_Init();
  MX_TIM14_Init();
  MX_TIM7_Init();
  MX_RTC_Init();
  MX_TIM15_Init();
  MX_TIM16_Init();
  /* USER CODE BEGIN 2 */
  misc_mute(true);

  HAL_TIM_Base_Start(&htim1); 					// AM FRECQUENCY ETR
  HAL_TIM_Base_Start(&htim3); 					// FM FRECQUENCY ETR
  HAL_TIM_Base_Start_IT(&htim6); 				// FM FRECQUENCY COUNT PERIOD
  HAL_TIM_Base_Start_IT(&htim16); 				// AM FRECQUENCY COUNT PERIOD
  HAL_TIM_Base_Start_IT(&htim7);				// DISPLAY MULTIPLEXING
  HAL_TIM_PWM_Start(&htim15, TIM_CHANNEL_2); 	// TUNING VOLTAGE PWM
  startFrequencyControl();

  display_on(true);
  enable_5volt(true);
  MODE = misc_get_mode(AM_FREQUENCY_COUNTER);
  BLUETOOTH = misc_bt_is_present();
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
	  FREQUENCY_CALIBRATION = getCalibrationValue();

	  bool standby = misc_is_standby();
	  bool poweredOn = STANDBY && !standby;
	  bool poweredOff = !STANDBY && standby;
	  if (poweredOn)
	  {
		  STANDBY = false;
		  OFF_COUNTER = 0;
		  enable_5volt(true);
		  display_on(true);
		  startFrequencyControl();

		  // Standby detection is delayed, set station again to prevent timer duty cycle drift.
		  setStation(STATION, true);
	  }
	  else if (poweredOff)
	  {
		  STANDBY = true;

		  if (COLD_START)
		  {
			  OFF_COUNTER = 1000;
			  COLD_START = false;
		  }

		  enable_5volt(false);
		  display_on(STANDBY_DISPLAY_ON);
		  stopFrequencyControl();
	  }

	  Mode mode = misc_get_mode(AM_FREQUENCY_COUNTER);
	  bool modeChangedToOther = mode == OTHER && MODE != OTHER;
	  bool modeChangedToFMorAM = (mode == FM && MODE != FM) || (mode == AM && MODE != AM);
	  MODE = mode;

	  if (modeChangedToOther)
	  {
		  stopFrequencyControl();
	  }
	  else if (modeChangedToFMorAM)
	  {
		  // Mode detection is delayed, set station again to prevent timer duty cycle drift.
		  setStation(STATION, true);
		  startFrequencyControl();
	  }

	  keydecoder_out(1);
	  CLOCK = keydecoder_in(1);
	  SET_BUTTON = keydecoder_in(2);

	  keydecoder_out(2);
	  if (!STANDBY && keydecoder_in(2) && keydecoder_in(3))
	  {
		  // TUNING UP QUICK
		  LOCK_FREQUENCY = false;
		  if (MODE == FM && FM_FREQUENCY < 10800)
		  {
			  FM_FREQUENCY += 5;
			  HAL_Delay(30);
		  }
		  else if (MODE == AM && AM_FREQUENCY < 1602 && !BLUETOOTH)
		  {
			  AM_FREQUENCY += 9;
			  HAL_Delay(50);
		  }
		  else if (MODE == AM && BLUETOOTH && STATION == 0)
		  {
			  misc_bt_pause();
		  }
		  LOCK_FREQUENCY = true;
	  }
	  else if (!STANDBY && keydecoder_in(2) && keydecoder_in(4))
	  {
		  // TUNING DOWN QUICK
		  LOCK_FREQUENCY = false;
		  if (MODE == FM && FM_FREQUENCY > 8750)
		  {
			  FM_FREQUENCY -= 5;
			  HAL_Delay(30);
		  }
		  else if (MODE == AM && AM_FREQUENCY > 531 && !BLUETOOTH)
		  {
			  AM_FREQUENCY -= 9;
			  HAL_Delay(50);
		  }
		  else if (MODE == AM && BLUETOOTH && STATION == 0)
		  {
			  misc_bt_pause();
		  }
		  LOCK_FREQUENCY = true;
	  }
	  else if (!STANDBY && keydecoder_in(1))
	  {
		  // SCAN DOWN
		  if (MODE == FM)
		  {
			  misc_mute(true);
			  LOCK_FREQUENCY = false;

			  for (int i = 0; i < 2 && FM_FREQUENCY > 8750; i++)
			  {
				  FM_FREQUENCY -= 5;
				  HAL_Delay(20);
				  while ((abs(FM_FREQUENCY_COUNTER - FM_FREQUENCY)) > 4);
			  }

			  SCAN_STOP = false;

			  do
			  {
				  FM_FREQUENCY -= 5;
				  HAL_Delay(20);
				  while ((abs(FM_FREQUENCY_COUNTER - FM_FREQUENCY)) > 4);
			  } while (!SCAN_STOP && FM_FREQUENCY > 8750);

			  if (FM_FREQUENCY % 10 == 5)
			  {
				  FM_FREQUENCY += 5;
			  }

			  HAL_Delay(250);
			  LOCK_FREQUENCY = true;
			  misc_mute(false);
		  }
	  }
	  else if (!STANDBY && keydecoder_in(2))
	  {
		  // SCAN UP
		  if (MODE == FM)
		  {
			  misc_mute(true);
			  LOCK_FREQUENCY = false;

			  for (int i = 0; i < 2 && FM_FREQUENCY < 10800; i++)
			  {
				  FM_FREQUENCY += 5;
				  HAL_Delay(20);
				  while ((abs(FM_FREQUENCY_COUNTER - FM_FREQUENCY)) > 4);
			  }

			  SCAN_STOP = false;

			  do
			  {
				  FM_FREQUENCY += 5;
				  HAL_Delay(20);
				  while ((abs(FM_FREQUENCY_COUNTER - FM_FREQUENCY)) > 4);
			  } while (!SCAN_STOP && FM_FREQUENCY < 10800);

			  if (FM_FREQUENCY % 10 == 5)
			  {
				  FM_FREQUENCY -= 5;
			  }

			  HAL_Delay(250);
			  LOCK_FREQUENCY = true;
			  misc_mute(false);
		  }
	  }
	  else if (!STANDBY && keydecoder_in(3))
	  {
		  // TUNING UP
		  if (MODE == FM && FM_FREQUENCY < 10800)
		  {
			  FM_FREQUENCY += 5;
			  HAL_Delay(200);
		  }
		  else if (MODE == AM && AM_FREQUENCY < 1602 && !BLUETOOTH)
		  {
			  AM_FREQUENCY += 9;
			  HAL_Delay(200);
		  }
		  else if (MODE == AM && BLUETOOTH && STATION == 0)
		  {
			  misc_bt_next();
		  }
	  }
	  else if (!STANDBY && keydecoder_in(4))
	  {
		  // TUNING DOWN
		  if (MODE == FM && FM_FREQUENCY > 8750)
		  {
			  FM_FREQUENCY -= 5;
			  HAL_Delay(200);
		  }
		  else if (MODE == AM && AM_FREQUENCY > 531 && !BLUETOOTH)
		  {
			  AM_FREQUENCY -= 9;
			  HAL_Delay(200);
		  }
		  else if (MODE == AM && BLUETOOTH && STATION == 0)
		  {
			  misc_bt_prev();
		  }
	  }

	  keydecoder_out(3);
	  if (CLOCK && SET_BUTTON && keydecoder_in(1))
	  {
		  // MIN
		  HAL_RTC_GetTime(&hrtc, &TIME, RTC_FORMAT_BIN);
		  HAL_RTC_GetDate(&hrtc, &DATE, RTC_FORMAT_BIN);

		  if (TIME.Minutes == 59)
		  {
			  TIME.Minutes = 0;
		  }
		  else
		  {
			  TIME.Minutes++;
		  }

		  HAL_Delay(200);
		  HAL_RTC_SetTime(&hrtc, &TIME, RTC_FORMAT_BIN);
	  }
	  else if (CLOCK && SET_BUTTON && keydecoder_in(2))
	  {
		  // HOURS
		  HAL_RTC_GetTime(&hrtc, &TIME, RTC_FORMAT_BIN);
		  HAL_RTC_GetDate(&hrtc, &DATE, RTC_FORMAT_BIN);

		  if (TIME.Hours == 23)
		  {
			  TIME.Hours = 0;
		  }
		  else
		  {
			  TIME.Hours++;
		  }

		  HAL_Delay(200);
		  HAL_RTC_SetTime(&hrtc, &TIME, RTC_FORMAT_BIN);
	  }
	  else if (keydecoder_in(3))
	  {
		  // MEMORY
		  if (!STANDBY && !MEMORY_BUTTON && MODE == FM)
		  {
			  saveFMStation();
			  MEMORY_BUTTON = true;
		  }
		  else if (!STANDBY && !MEMORY_BUTTON && MODE == AM)
		  {
			  saveAMStation();
			  MEMORY_BUTTON = true;
		  }
		  else if (STANDBY)
		  {
			  STANDBY_DISPLAY_ON = !STANDBY_DISPLAY_ON;
			  display_on(STANDBY_DISPLAY_ON);
			  HAL_Delay(500);
		  }
	  }
	  else if (!keydecoder_in(3))
	  {
		  MEMORY_BUTTON = false;
	  }

	  keydecoder_out(4);
	  if (!STANDBY && keydecoder_in(2))
	  {
		  // S3
		  setStation(3, false);
	  }
	  else if (!STANDBY && keydecoder_in(3))
	  {
		  // S2
		  setStation(2, false);
	  }
	  else if (!STANDBY && keydecoder_in(4))
	  {
		  // S1
		  setStation(1, false);
	  }

	  keydecoder_out(5);
	  if (!STANDBY && keydecoder_in(2))
	  {
		  // S6
		  setStation(6, false);
	  }
	  else if (!STANDBY && keydecoder_in(3))
	  {
		  // S5
		  setStation(5, false);
	  }
	  else if (!STANDBY && keydecoder_in(4))
	  {
		  // S4
		  setStation(4, false);
	  }

	  // If station buttons are broken and do not lock properly set MAN as default.
	  if (misc_is_manual() || STATION == -1)
	  {
		  setStation(0, false);
	  }

	  if (BLUETOOTH && MODE == AM && STATION == 0)
	  {
		  misc_mute(true);

		  if (!BLUETOOTH_ON)
		  {
			  misc_bt_on();
			  BLUETOOTH_ON = true;
		  }
	  }
	  else if (BLUETOOTH && (MODE != AM || MODE == AM && STATION != 0))
	  {
		  if (BLUETOOTH_ON)
		  {
			  misc_bt_off();
			  BLUETOOTH_ON = false;
		  }
	  }


    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Configure the main internal regulator output voltage
  */
  HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE1);
  /** Configure LSE Drive Capability
  */
  HAL_PWR_EnableBkUpAccess();
  __HAL_RCC_LSEDRIVE_CONFIG(RCC_LSEDRIVE_LOW);
  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE|RCC_OSCILLATORTYPE_LSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.LSEState = RCC_LSE_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = RCC_PLLM_DIV4;
  RCC_OscInitStruct.PLL.PLLN = 63;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLR = RCC_PLLR_DIV4;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the peripherals clocks
  */
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_RTC|RCC_PERIPHCLK_ADC;
  PeriphClkInit.AdcClockSelection = RCC_ADCCLKSOURCE_SYSCLK;
  PeriphClkInit.RTCClockSelection = RCC_RTCCLKSOURCE_LSE;

  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }
  /** Enables the Clock Security System
  */
  HAL_RCC_EnableCSS();
}

/**
  * @brief ADC1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_ADC1_Init(void)
{

  /* USER CODE BEGIN ADC1_Init 0 */

  /* USER CODE END ADC1_Init 0 */

  ADC_ChannelConfTypeDef sConfig = {0};

  /* USER CODE BEGIN ADC1_Init 1 */

  /* USER CODE END ADC1_Init 1 */
  /** Configure the global features of the ADC (Clock, Resolution, Data Alignment and number of conversion)
  */
  hadc1.Instance = ADC1;
  hadc1.Init.ClockPrescaler = ADC_CLOCK_SYNC_PCLK_DIV4;
  hadc1.Init.Resolution = ADC_RESOLUTION_12B;
  hadc1.Init.DataAlign = ADC_DATAALIGN_RIGHT;
  hadc1.Init.ScanConvMode = ADC_SCAN_DISABLE;
  hadc1.Init.EOCSelection = ADC_EOC_SINGLE_CONV;
  hadc1.Init.LowPowerAutoWait = DISABLE;
  hadc1.Init.LowPowerAutoPowerOff = DISABLE;
  hadc1.Init.ContinuousConvMode = DISABLE;
  hadc1.Init.NbrOfConversion = 1;
  hadc1.Init.DiscontinuousConvMode = DISABLE;
  hadc1.Init.ExternalTrigConv = ADC_SOFTWARE_START;
  hadc1.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_NONE;
  hadc1.Init.DMAContinuousRequests = DISABLE;
  hadc1.Init.Overrun = ADC_OVR_DATA_PRESERVED;
  hadc1.Init.SamplingTimeCommon1 = ADC_SAMPLETIME_1CYCLE_5;
  hadc1.Init.SamplingTimeCommon2 = ADC_SAMPLETIME_1CYCLE_5;
  hadc1.Init.OversamplingMode = DISABLE;
  hadc1.Init.TriggerFrequencyMode = ADC_TRIGGER_FREQ_HIGH;
  if (HAL_ADC_Init(&hadc1) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure Regular Channel
  */
  sConfig.Channel = ADC_CHANNEL_0;
  sConfig.Rank = ADC_REGULAR_RANK_1;
  sConfig.SamplingTime = ADC_SAMPLINGTIME_COMMON_1;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN ADC1_Init 2 */

  /* USER CODE END ADC1_Init 2 */

}

/**
  * @brief RTC Initialization Function
  * @param None
  * @retval None
  */
static void MX_RTC_Init(void)
{

  /* USER CODE BEGIN RTC_Init 0 */

  /* USER CODE END RTC_Init 0 */

  /* USER CODE BEGIN RTC_Init 1 */

  /* USER CODE END RTC_Init 1 */
  /** Initialize RTC Only
  */
  hrtc.Instance = RTC;
  hrtc.Init.HourFormat = RTC_HOURFORMAT_24;
  hrtc.Init.AsynchPrediv = 127;
  hrtc.Init.SynchPrediv = 255;
  hrtc.Init.OutPut = RTC_OUTPUT_DISABLE;
  hrtc.Init.OutPutRemap = RTC_OUTPUT_REMAP_NONE;
  hrtc.Init.OutPutPolarity = RTC_OUTPUT_POLARITY_HIGH;
  hrtc.Init.OutPutType = RTC_OUTPUT_TYPE_OPENDRAIN;
  hrtc.Init.OutPutPullUp = RTC_OUTPUT_PULLUP_NONE;
  if (HAL_RTC_Init(&hrtc) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN RTC_Init 2 */

  /* USER CODE END RTC_Init 2 */

}

/**
  * @brief TIM1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM1_Init(void)
{

  /* USER CODE BEGIN TIM1_Init 0 */

  /* USER CODE END TIM1_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};

  /* USER CODE BEGIN TIM1_Init 1 */

  /* USER CODE END TIM1_Init 1 */
  htim1.Instance = TIM1;
  htim1.Init.Prescaler = 0;
  htim1.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim1.Init.Period = 65535;
  htim1.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim1.Init.RepetitionCounter = 0;
  htim1.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_ENABLE;
  if (HAL_TIM_Base_Init(&htim1) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_ETRMODE2;
  sClockSourceConfig.ClockPolarity = TIM_CLOCKPOLARITY_NONINVERTED;
  sClockSourceConfig.ClockPrescaler = TIM_CLOCKPRESCALER_DIV1;
  sClockSourceConfig.ClockFilter = 0;
  if (HAL_TIM_ConfigClockSource(&htim1, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterOutputTrigger2 = TIM_TRGO2_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim1, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM1_Init 2 */

  /* USER CODE END TIM1_Init 2 */

}

/**
  * @brief TIM3 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM3_Init(void)
{

  /* USER CODE BEGIN TIM3_Init 0 */

  /* USER CODE END TIM3_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};

  /* USER CODE BEGIN TIM3_Init 1 */

  /* USER CODE END TIM3_Init 1 */
  htim3.Instance = TIM3;
  htim3.Init.Prescaler = 0;
  htim3.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim3.Init.Period = 65535;
  htim3.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim3.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_ENABLE;
  if (HAL_TIM_Base_Init(&htim3) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_ETRMODE2;
  sClockSourceConfig.ClockPolarity = TIM_CLOCKPOLARITY_NONINVERTED;
  sClockSourceConfig.ClockPrescaler = TIM_CLOCKPRESCALER_DIV1;
  sClockSourceConfig.ClockFilter = 0;
  if (HAL_TIM_ConfigClockSource(&htim3, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim3, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM3_Init 2 */

  /* USER CODE END TIM3_Init 2 */

}

/**
  * @brief TIM6 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM6_Init(void)
{

  /* USER CODE BEGIN TIM6_Init 0 */

  /* USER CODE END TIM6_Init 0 */

  TIM_MasterConfigTypeDef sMasterConfig = {0};

  /* USER CODE BEGIN TIM6_Init 1 */

  /* USER CODE END TIM6_Init 1 */
  htim6.Instance = TIM6;
  htim6.Init.Prescaler = 1000;
  htim6.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim6.Init.Period = 900;
  htim6.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim6) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim6, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM6_Init 2 */

  /* USER CODE END TIM6_Init 2 */

}

/**
  * @brief TIM7 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM7_Init(void)
{

  /* USER CODE BEGIN TIM7_Init 0 */

  /* USER CODE END TIM7_Init 0 */

  TIM_MasterConfigTypeDef sMasterConfig = {0};

  /* USER CODE BEGIN TIM7_Init 1 */

  /* USER CODE END TIM7_Init 1 */
  htim7.Instance = TIM7;
  htim7.Init.Prescaler = 500;
  htim7.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim7.Init.Period = 250;
  htim7.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim7) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim7, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM7_Init 2 */

  /* USER CODE END TIM7_Init 2 */

}

/**
  * @brief TIM14 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM14_Init(void)
{

  /* USER CODE BEGIN TIM14_Init 0 */

  /* USER CODE END TIM14_Init 0 */

  /* USER CODE BEGIN TIM14_Init 1 */

  /* USER CODE END TIM14_Init 1 */
  htim14.Instance = TIM14;
  htim14.Init.Prescaler = 500;
  htim14.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim14.Init.Period = 1000;
  htim14.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim14.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_ENABLE;
  if (HAL_TIM_Base_Init(&htim14) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM14_Init 2 */

  /* USER CODE END TIM14_Init 2 */

}

/**
  * @brief TIM15 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM15_Init(void)
{

  /* USER CODE BEGIN TIM15_Init 0 */

  /* USER CODE END TIM15_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};
  TIM_BreakDeadTimeConfigTypeDef sBreakDeadTimeConfig = {0};

  /* USER CODE BEGIN TIM15_Init 1 */

  /* USER CODE END TIM15_Init 1 */
  htim15.Instance = TIM15;
  htim15.Init.Prescaler = 0;
  htim15.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim15.Init.Period = 17500;
  htim15.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim15.Init.RepetitionCounter = 0;
  htim15.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_ENABLE;
  if (HAL_TIM_Base_Init(&htim15) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim15, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_Init(&htim15) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim15, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = 200;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCNPolarity = TIM_OCNPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  sConfigOC.OCIdleState = TIM_OCIDLESTATE_RESET;
  sConfigOC.OCNIdleState = TIM_OCNIDLESTATE_RESET;
  if (HAL_TIM_PWM_ConfigChannel(&htim15, &sConfigOC, TIM_CHANNEL_2) != HAL_OK)
  {
    Error_Handler();
  }
  sBreakDeadTimeConfig.OffStateRunMode = TIM_OSSR_DISABLE;
  sBreakDeadTimeConfig.OffStateIDLEMode = TIM_OSSI_DISABLE;
  sBreakDeadTimeConfig.LockLevel = TIM_LOCKLEVEL_OFF;
  sBreakDeadTimeConfig.DeadTime = 0;
  sBreakDeadTimeConfig.BreakState = TIM_BREAK_DISABLE;
  sBreakDeadTimeConfig.BreakPolarity = TIM_BREAKPOLARITY_HIGH;
  sBreakDeadTimeConfig.BreakFilter = 0;
  sBreakDeadTimeConfig.AutomaticOutput = TIM_AUTOMATICOUTPUT_DISABLE;
  if (HAL_TIMEx_ConfigBreakDeadTime(&htim15, &sBreakDeadTimeConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM15_Init 2 */

  /* USER CODE END TIM15_Init 2 */
  HAL_TIM_MspPostInit(&htim15);

}

/**
  * @brief TIM16 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM16_Init(void)
{

  /* USER CODE BEGIN TIM16_Init 0 */

  /* USER CODE END TIM16_Init 0 */

  /* USER CODE BEGIN TIM16_Init 1 */

  /* USER CODE END TIM16_Init 1 */
  htim16.Instance = TIM16;
  htim16.Init.Prescaler = 1000;
  htim16.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim16.Init.Period = 900;
  htim16.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim16.Init.RepetitionCounter = 0;
  htim16.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim16) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM16_Init 2 */

  /* USER CODE END TIM16_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOF_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();
  __HAL_RCC_GPIOD_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOC, MUTING_A_Pin|MUTING_B_Pin, GPIO_PIN_SET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOA, DISPLAY_D6_OFF_Pin|BT_PREV_Pin|BT_NEXT_Pin|BT_PAUSE_Pin
                          |LED_S1_Pin|LED_S2_Pin|DISPLAY_C_Pin|DISPLAY_B_Pin
                          |DISPLAY_D2_Pin|DISPLAY_D1_Pin|DISPLAY_DP_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOC, LED_S3_Pin|LED_S4_Pin|DISPLAY_A_Pin|DISPLAY_D5_Pin
                          |DISPLAY_ON_Pin|DISABLE_5V_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOB, LED_S5_Pin|LED_S6_Pin|LED_MAN_Pin|BT_ON_OFF_Pin
                          |DISPLAY_G_Pin|DISPLAY_F_Pin|DISPLAY_E_Pin|DISPLAY_D_Pin
                          |KD_OUT_4_Pin|KD_OUT_5_Pin|CENTER_LED_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOD, DISPLAY_D4_Pin|DISPLAY_D3_Pin|KD_OUT_1_Pin|KD_OUT_2_Pin
                          |KD_OUT_3_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin : SCAN_STOP_Pin */
  GPIO_InitStruct.Pin = SCAN_STOP_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_PULLUP;
  HAL_GPIO_Init(SCAN_STOP_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : MUTING_A_Pin */
  GPIO_InitStruct.Pin = MUTING_A_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_PULLUP;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(MUTING_A_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pins : MUTING_B_Pin LED_S3_Pin LED_S4_Pin DISPLAY_A_Pin
                           DISPLAY_D5_Pin DISPLAY_ON_Pin DISABLE_5V_Pin */
  GPIO_InitStruct.Pin = MUTING_B_Pin|LED_S3_Pin|LED_S4_Pin|DISPLAY_A_Pin
                          |DISPLAY_D5_Pin|DISPLAY_ON_Pin|DISABLE_5V_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

  /*Configure GPIO pins : DISPLAY_D6_OFF_Pin BT_PREV_Pin BT_NEXT_Pin BT_PAUSE_Pin
                           LED_S1_Pin LED_S2_Pin DISPLAY_C_Pin DISPLAY_B_Pin
                           DISPLAY_D2_Pin DISPLAY_D1_Pin DISPLAY_DP_Pin */
  GPIO_InitStruct.Pin = DISPLAY_D6_OFF_Pin|BT_PREV_Pin|BT_NEXT_Pin|BT_PAUSE_Pin
                          |LED_S1_Pin|LED_S2_Pin|DISPLAY_C_Pin|DISPLAY_B_Pin
                          |DISPLAY_D2_Pin|DISPLAY_D1_Pin|DISPLAY_DP_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pins : LED_S5_Pin LED_S6_Pin LED_MAN_Pin BT_ON_OFF_Pin
                           DISPLAY_G_Pin DISPLAY_F_Pin DISPLAY_E_Pin DISPLAY_D_Pin
                           KD_OUT_4_Pin KD_OUT_5_Pin CENTER_LED_Pin */
  GPIO_InitStruct.Pin = LED_S5_Pin|LED_S6_Pin|LED_MAN_Pin|BT_ON_OFF_Pin
                          |DISPLAY_G_Pin|DISPLAY_F_Pin|DISPLAY_E_Pin|DISPLAY_D_Pin
                          |KD_OUT_4_Pin|KD_OUT_5_Pin|CENTER_LED_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /*Configure GPIO pins : BT_DETECTION_Pin MANUAL_Pin FM_AM_Pin */
  GPIO_InitStruct.Pin = BT_DETECTION_Pin|MANUAL_Pin|FM_AM_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_PULLUP;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /*Configure GPIO pins : DISPLAY_D4_Pin DISPLAY_D3_Pin KD_OUT_1_Pin KD_OUT_2_Pin
                           KD_OUT_3_Pin */
  GPIO_InitStruct.Pin = DISPLAY_D4_Pin|DISPLAY_D3_Pin|KD_OUT_1_Pin|KD_OUT_2_Pin
                          |KD_OUT_3_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);

  /*Configure GPIO pin : KD_IN_1_Pin */
  GPIO_InitStruct.Pin = KD_IN_1_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(KD_IN_1_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pins : KD_IN_2_Pin KD_IN_3_Pin KD_IN_4_Pin */
  GPIO_InitStruct.Pin = KD_IN_2_Pin|KD_IN_3_Pin|KD_IN_4_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);

  /*Configure GPIO pin : STANDBY_Pin */
  GPIO_InitStruct.Pin = STANDBY_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(STANDBY_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : STANDBY_VERSION_Pin */
  GPIO_InitStruct.Pin = STANDBY_VERSION_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_PULLDOWN;
  HAL_GPIO_Init(STANDBY_VERSION_GPIO_Port, &GPIO_InitStruct);

}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
