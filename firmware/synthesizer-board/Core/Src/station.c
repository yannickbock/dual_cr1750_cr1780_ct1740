#include "station.h"

// RM0444 - Reference manual / PAGE 70
// https://www.st.com/resource/en/reference_manual/rm0444-stm32g0x1-advanced-armbased-32bit-mcus-stmicroelectronics.pdf

struct Station station_fm_get(uint8_t number)
{
	uint32_t address = 0x0801F800 + 8 * number;
	uint64_t value = *(uint32_t*)address;

	struct Station x;
	x.Frequency = (value & 0xFFFF0000) >> 16;
	x.DutyCycle = value & 0xFFFF;

	if (x.Frequency < 8750 || x.Frequency > 10800 || x.DutyCycle < 0 || x.DutyCycle > 17500)
	{
		x.Frequency = 8750;
		x.DutyCycle = 13000;
	}

	return x;
}

void station_fm_set(uint8_t number, uint32_t frequency, uint32_t dutycycle)
{
	HAL_StatusTypeDef status = HAL_FLASH_Unlock();
	status = FLASH_WaitForLastOperation(1000);

	__HAL_FLASH_CLEAR_FLAG(FLASH_FLAG_EOP | FLASH_FLAG_WRPERR | FLASH_FLAG_PGAERR);
	status = FLASH_WaitForLastOperation(1000);
	CLEAR_BIT(FLASH->CR, FLASH_CR_PER);
	status = FLASH_WaitForLastOperation(1000);

	uint64_t stations[7][2]; // address / value
	for (int i = 0; i <= 6; i++)
	{
		uint32_t x = 0x0801F800 + 8 * i;
		stations[i][0] = x;
		stations[i][1] = *(uint32_t*)x;
	}
	stations[number][1] = (frequency << 16) + dutycycle;

	FLASH_EraseInitTypeDef eraseInit =
	{
		.TypeErase = FLASH_TYPEERASE_PAGES,
		.Banks = FLASH_BANK_1,
		.Page = 63, // 63 = 0x0801F800 - 0x0801FFFF
		.NbPages = 1
	};

	uint32_t pageEraseError = 0;
	status = HAL_FLASHEx_Erase(&eraseInit, &pageEraseError);

	for (int i = 0; i <= 6; i++)
	{
		status = HAL_FLASH_Program(TYPEPROGRAM_DOUBLEWORD, (uint32_t)stations[i][0], stations[i][1]);
		status = FLASH_WaitForLastOperation(1000);
	}

	status = HAL_FLASH_Lock();
}

struct Station station_am_get(uint8_t number)
{
	uint32_t address = 0x801F000 + 8 * number;
	uint64_t value = *(uint32_t*)address;

	struct Station x;
	x.Frequency = (value & 0xFFFF0000) >> 16;
	x.DutyCycle = value & 0xFFFF;

	if (x.Frequency < 531 || x.Frequency > 1602 || x.DutyCycle < 0 || x.DutyCycle > 17500)
	{
		x.Frequency = 531;
		x.DutyCycle = 13000;
	}

	return x;
}

void station_am_set(uint8_t number, uint32_t frequency, uint32_t dutycycle)
{
	HAL_StatusTypeDef status = HAL_FLASH_Unlock();
	status = FLASH_WaitForLastOperation(1000);

	__HAL_FLASH_CLEAR_FLAG(FLASH_FLAG_EOP | FLASH_FLAG_WRPERR | FLASH_FLAG_PGAERR);
	status = FLASH_WaitForLastOperation(1000);
	CLEAR_BIT(FLASH->CR, FLASH_CR_PER);
	status = FLASH_WaitForLastOperation(1000);

	uint64_t stations[7][2]; // address / value
	for (int i = 0; i <= 6; i++)
	{
		uint32_t x = 0x801F000 + 8 * i;
		stations[i][0] = x;
		stations[i][1] = *(uint32_t*)x;
	}
	stations[number][1] = (frequency << 16) + dutycycle;

	FLASH_EraseInitTypeDef eraseInit =
	{
		.TypeErase = FLASH_TYPEERASE_PAGES,
		.Banks = FLASH_BANK_1,
		.Page = 62,
		.NbPages = 1
	};

	uint32_t pageEraseError = 0;
	status = HAL_FLASHEx_Erase(&eraseInit, &pageEraseError);

	for (int i = 0; i <= 6; i++)
	{
		status = HAL_FLASH_Program(TYPEPROGRAM_DOUBLEWORD, (uint32_t)stations[i][0], stations[i][1]);
		status = FLASH_WaitForLastOperation(1000);
	}

	status = HAL_FLASH_Lock();
}

void station_led(int number)
{
	HAL_GPIO_WritePin(GPIOB, LED_MAN_Pin, number == 0);
	HAL_GPIO_WritePin(GPIOA, LED_S1_Pin, number == 1);
	HAL_GPIO_WritePin(GPIOA, LED_S2_Pin, number == 2);
	HAL_GPIO_WritePin(GPIOC, LED_S3_Pin, number == 3);
	HAL_GPIO_WritePin(GPIOC, LED_S4_Pin, number == 4);
	HAL_GPIO_WritePin(GPIOB, LED_S5_Pin, number == 5);
	HAL_GPIO_WritePin(GPIOB, LED_S6_Pin, number == 6);
}
