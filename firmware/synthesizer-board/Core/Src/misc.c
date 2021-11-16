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
	bool revision_a = misc_get_revision();

	if (on && !revision_a)
	{
		HAL_GPIO_WritePin(GPIOC, MUTING_Pin, GPIO_PIN_RESET);
	}
	else if (!on && !revision_a)
	{
		HAL_GPIO_WritePin(GPIOC, MUTING_Pin, GPIO_PIN_SET);
	}
	else if (on && revision_a)
	{
		HAL_GPIO_WritePin(GPIOC, MUTING_Pin, GPIO_PIN_SET);
	}
	else if (!on && revision_a)
	{
		HAL_GPIO_WritePin(GPIOC, MUTING_Pin, GPIO_PIN_RESET);
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
