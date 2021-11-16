#include "keydecoder.h"

void keydecoder_out(uint8_t number)
{
	HAL_GPIO_WritePin(GPIOD, KD_OUT_1_Pin, number != 1);
	HAL_GPIO_WritePin(GPIOD, KD_OUT_2_Pin, number != 2);
	HAL_GPIO_WritePin(GPIOD, KD_OUT_3_Pin, number != 3);
	HAL_GPIO_WritePin(GPIOB, KD_OUT_4_Pin, number != 4);
	HAL_GPIO_WritePin(GPIOB, KD_OUT_5_Pin, number != 5);
	HAL_Delay(1);
}

bool keydecoder_in(uint8_t number)
{
	switch (number)
	{
		case 1:
			return HAL_GPIO_ReadPin(GPIOC, KD_IN_1_Pin);
		case 2:
			return HAL_GPIO_ReadPin(GPIOD, KD_IN_2_Pin);
		case 3:
			return HAL_GPIO_ReadPin(GPIOD, KD_IN_3_Pin);
		case 4:
			return HAL_GPIO_ReadPin(GPIOD, KD_IN_4_Pin);
		default:
			return false;
	}
}
