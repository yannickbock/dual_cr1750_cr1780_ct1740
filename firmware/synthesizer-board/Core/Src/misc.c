#include "misc.h"

int misc_get_revision()
{
	return (int)HAL_GPIO_ReadPin(GPIOB, STANDBY_VERSION_Pin);
}

bool misc_is_standby()
{
	bool revision_a = misc_get_revision();
	bool standby = HAL_GPIO_ReadPin(GPIOB, STANDBY_Pin);

	return (revision_a && standby) || (!revision_a && !standby);
}

bool misc_is_manual()
{
	return !HAL_GPIO_ReadPin(GPIOB, MANUAL_Pin);
}

void misc_mute(bool on)
{
	bool revision_a = !misc_get_revision();

	if (revision_a)
	{
		HAL_GPIO_WritePin(GPIOC, MUTING_A_Pin, !on);
		HAL_GPIO_WritePin(GPIOC, MUTING_B_Pin, GPIO_PIN_RESET);
	}
	else
	{
		HAL_GPIO_WritePin(GPIOC, MUTING_B_Pin, on);
		HAL_GPIO_WritePin(GPIOC, MUTING_A_Pin, GPIO_PIN_RESET);
	}
}

Mode misc_get_mode(int am_frequency)
{
	if (!HAL_GPIO_ReadPin(GPIOB, FM_AM_Pin))
	{
		return FM;
	}
	else if (HAL_GPIO_ReadPin(GPIOB, FM_AM_Pin) && am_frequency > 0)
	{
		return AM;
	}

	return OTHER;
}

void misc_bt_on()
{
	HAL_GPIO_WritePin(GPIOB, BT_ON_OFF_Pin, GPIO_PIN_SET);
	HAL_Delay(150);
}

void misc_bt_off()
{
	HAL_GPIO_WritePin(GPIOB, BT_ON_OFF_Pin, GPIO_PIN_RESET);
	HAL_Delay(150);
}

void misc_bt_pause()
{
	HAL_GPIO_WritePin(GPIOA, BT_PAUSE_Pin, GPIO_PIN_SET);
	HAL_Delay(350);
	HAL_GPIO_WritePin(GPIOA, BT_PAUSE_Pin, GPIO_PIN_RESET);
}

void misc_bt_next()
{
	HAL_GPIO_WritePin(GPIOA, BT_NEXT_Pin, GPIO_PIN_SET);
	HAL_Delay(150);
	HAL_GPIO_WritePin(GPIOA, BT_NEXT_Pin, GPIO_PIN_RESET);
}

void misc_bt_prev()
{
	HAL_GPIO_WritePin(GPIOA, BT_PREV_Pin, GPIO_PIN_SET);
	HAL_Delay(150);
	HAL_GPIO_WritePin(GPIOA, BT_PREV_Pin, GPIO_PIN_RESET);
}

bool misc_bt_is_present()
{
	return !HAL_GPIO_ReadPin(GPIOB, BT_DETECTION_Pin);
}
