/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32g0xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */



/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

void HAL_TIM_MspPostInit(TIM_HandleTypeDef *htim);

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define SCAN_STOP_Pin GPIO_PIN_0
#define SCAN_STOP_GPIO_Port GPIOC
#define MUTING_A_Pin GPIO_PIN_1
#define MUTING_A_GPIO_Port GPIOC
#define MUTING_B_Pin GPIO_PIN_3
#define MUTING_B_GPIO_Port GPIOC
#define FREQUENCY_CALIBRATION_Pin GPIO_PIN_0
#define FREQUENCY_CALIBRATION_GPIO_Port GPIOA
#define DISPLAY_D6_OFF_Pin GPIO_PIN_2
#define DISPLAY_D6_OFF_GPIO_Port GPIOA
#define BT_PREV_Pin GPIO_PIN_3
#define BT_PREV_GPIO_Port GPIOA
#define BT_NEXT_Pin GPIO_PIN_4
#define BT_NEXT_GPIO_Port GPIOA
#define BT_PAUSE_Pin GPIO_PIN_5
#define BT_PAUSE_GPIO_Port GPIOA
#define LED_S1_Pin GPIO_PIN_6
#define LED_S1_GPIO_Port GPIOA
#define LED_S2_Pin GPIO_PIN_7
#define LED_S2_GPIO_Port GPIOA
#define LED_S3_Pin GPIO_PIN_4
#define LED_S3_GPIO_Port GPIOC
#define LED_S4_Pin GPIO_PIN_5
#define LED_S4_GPIO_Port GPIOC
#define LED_S5_Pin GPIO_PIN_0
#define LED_S5_GPIO_Port GPIOB
#define LED_S6_Pin GPIO_PIN_1
#define LED_S6_GPIO_Port GPIOB
#define LED_MAN_Pin GPIO_PIN_2
#define LED_MAN_GPIO_Port GPIOB
#define BT_ON_OFF_Pin GPIO_PIN_10
#define BT_ON_OFF_GPIO_Port GPIOB
#define BT_DETECTION_Pin GPIO_PIN_11
#define BT_DETECTION_GPIO_Port GPIOB
#define DISPLAY_G_Pin GPIO_PIN_12
#define DISPLAY_G_GPIO_Port GPIOB
#define DISPLAY_F_Pin GPIO_PIN_13
#define DISPLAY_F_GPIO_Port GPIOB
#define DISPLAY_E_Pin GPIO_PIN_14
#define DISPLAY_E_GPIO_Port GPIOB
#define DISPLAY_D_Pin GPIO_PIN_15
#define DISPLAY_D_GPIO_Port GPIOB
#define DISPLAY_C_Pin GPIO_PIN_8
#define DISPLAY_C_GPIO_Port GPIOA
#define DISPLAY_B_Pin GPIO_PIN_9
#define DISPLAY_B_GPIO_Port GPIOA
#define DISPLAY_A_Pin GPIO_PIN_6
#define DISPLAY_A_GPIO_Port GPIOC
#define DISPLAY_D5_Pin GPIO_PIN_7
#define DISPLAY_D5_GPIO_Port GPIOC
#define DISPLAY_D4_Pin GPIO_PIN_8
#define DISPLAY_D4_GPIO_Port GPIOD
#define DISPLAY_D3_Pin GPIO_PIN_9
#define DISPLAY_D3_GPIO_Port GPIOD
#define DISPLAY_D2_Pin GPIO_PIN_10
#define DISPLAY_D2_GPIO_Port GPIOA
#define DISPLAY_D1_Pin GPIO_PIN_11
#define DISPLAY_D1_GPIO_Port GPIOA
#define AM_FREQUENCY_Pin GPIO_PIN_12
#define AM_FREQUENCY_GPIO_Port GPIOA
#define DISPLAY_DP_Pin GPIO_PIN_15
#define DISPLAY_DP_GPIO_Port GPIOA
#define DISPLAY_ON_Pin GPIO_PIN_8
#define DISPLAY_ON_GPIO_Port GPIOC
#define KD_IN_1_Pin GPIO_PIN_9
#define KD_IN_1_GPIO_Port GPIOC
#define KD_IN_2_Pin GPIO_PIN_0
#define KD_IN_2_GPIO_Port GPIOD
#define KD_IN_3_Pin GPIO_PIN_1
#define KD_IN_3_GPIO_Port GPIOD
#define FM_FREQUENCY_Pin GPIO_PIN_2
#define FM_FREQUENCY_GPIO_Port GPIOD
#define KD_IN_4_Pin GPIO_PIN_3
#define KD_IN_4_GPIO_Port GPIOD
#define KD_OUT_1_Pin GPIO_PIN_4
#define KD_OUT_1_GPIO_Port GPIOD
#define KD_OUT_2_Pin GPIO_PIN_5
#define KD_OUT_2_GPIO_Port GPIOD
#define KD_OUT_3_Pin GPIO_PIN_6
#define KD_OUT_3_GPIO_Port GPIOD
#define KD_OUT_4_Pin GPIO_PIN_3
#define KD_OUT_4_GPIO_Port GPIOB
#define KD_OUT_5_Pin GPIO_PIN_4
#define KD_OUT_5_GPIO_Port GPIOB
#define MANUAL_Pin GPIO_PIN_5
#define MANUAL_GPIO_Port GPIOB
#define FM_AM_Pin GPIO_PIN_6
#define FM_AM_GPIO_Port GPIOB
#define CENTER_LED_Pin GPIO_PIN_7
#define CENTER_LED_GPIO_Port GPIOB
#define STANDBY_Pin GPIO_PIN_8
#define STANDBY_GPIO_Port GPIOB
#define STANDBY_VERSION_Pin GPIO_PIN_9
#define STANDBY_VERSION_GPIO_Port GPIOB
#define DISABLE_5V_Pin GPIO_PIN_10
#define DISABLE_5V_GPIO_Port GPIOC
/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
