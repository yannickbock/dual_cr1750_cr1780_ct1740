#include "display.h"

static ticks = 0;

void display_on(bool on)
{
	HAL_GPIO_WritePin(GPIOC, DISPLAY_ON_Pin, on);

	display_d1(on);
	display_d2(on);
	display_d3(on);
	display_d4(on);
	display_d5(on);

	display_number(-1, false);
}

void display_d1(bool on)
{
	HAL_GPIO_WritePin(GPIOA, DISPLAY_D1_Pin, on);
}

void display_d2(bool on)
{
	HAL_GPIO_WritePin(GPIOA, DISPLAY_D2_Pin, on);
}

void display_d3(bool on)
{
	HAL_GPIO_WritePin(GPIOD, DISPLAY_D3_Pin, on);
}

void display_d4(bool on)
{
	HAL_GPIO_WritePin(GPIOD, DISPLAY_D4_Pin, on);
}

void display_d5(bool on)
{
	HAL_GPIO_WritePin(GPIOC, DISPLAY_D5_Pin, on);
}

void display_a(bool on)
{
	HAL_GPIO_WritePin(GPIOC, DISPLAY_A_Pin, on);
}

void display_b(bool on)
{
	HAL_GPIO_WritePin(GPIOA, DISPLAY_B_Pin, on);
}

void display_c(bool on)
{
	HAL_GPIO_WritePin(GPIOA, DISPLAY_C_Pin, on);
}

void display_d(bool on)
{
	HAL_GPIO_WritePin(GPIOB, DISPLAY_D_Pin, on);
}

void display_e(bool on)
{
	HAL_GPIO_WritePin(GPIOB, DISPLAY_E_Pin, on);
}

void display_f(bool on)
{
	HAL_GPIO_WritePin(GPIOB, DISPLAY_F_Pin, on);
}

void display_g(bool on)
{
	HAL_GPIO_WritePin(GPIOB, DISPLAY_G_Pin, on);
}

void display_dp(bool on)
{
	HAL_GPIO_WritePin(GPIOA, DISPLAY_DP_Pin, on);
}

void display_number(uint8_t number, bool dot)
{
	switch (number)
	{
		case 0:
			display_a(true);
			display_b(true);
			display_c(true);
			display_d(true);
			display_e(true);
			display_f(true);
			display_g(false);
			break;
		case 1:
			display_a(false);
			display_b(true);
			display_c(true);
			display_d(false);
			display_e(false);
			display_f(false);
			display_g(false);
			break;
		case 2:
			display_a(true);
			display_b(true);
			display_c(false);
			display_d(true);
			display_e(true);
			display_f(false);
			display_g(true);
			break;
		case 3:
			display_a(true);
			display_b(true);
			display_c(true);
			display_d(true);
			display_e(false);
			display_f(false);
			display_g(true);
			break;
		case 4:
			display_a(false);
			display_b(true);
			display_c(true);
			display_d(false);
			display_e(false);
			display_f(true);
			display_g(true);
			break;
		case 5:
			display_a(true);
			display_b(false);
			display_c(true);
			display_d(true);
			display_e(false);
			display_f(true);
			display_g(true);
			break;
		case 6:
			display_a(true);
			display_b(false);
			display_c(true);
			display_d(true);
			display_e(true);
			display_f(true);
			display_g(true);
			break;
		case 7:
			display_a(true);
			display_b(true);
			display_c(true);
			display_d(false);
			display_e(false);
			display_f(false);
			display_g(false);
			break;
		case 8:
			display_a(true);
			display_b(true);
			display_c(true);
			display_d(true);
			display_e(true);
			display_f(true);
			display_g(true);
			break;
		case 9:
			display_a(true);
			display_b(true);
			display_c(true);
			display_d(true);
			display_e(false);
			display_f(true);
			display_g(true);
			break;
		case 10: // A
			display_a(true);
			display_b(true);
			display_c(true);
			display_d(true);
			display_e(false);
			display_f(true);
			display_g(true);
			break;
		case 11: // B
			display_a(true);
			display_b(true);
			display_c(true);
			display_d(true);
			display_e(true);
			display_f(true);
			display_g(true);
			break;
		case 12: // C
			display_a(true);
			display_b(false);
			display_c(false);
			display_d(true);
			display_e(true);
			display_f(true);
			display_g(true);
			break;
		case 13: // D
			display_a(true);
			display_b(true);
			display_c(true);
			display_d(true);
			display_e(true);
			display_f(true);
			display_g(false);
			break;
		case 14: // E
			display_a(true);
			display_b(false);
			display_c(false);
			display_d(true);
			display_e(true);
			display_f(true);
			display_g(true);
			break;
		case 15: // F
			display_a(true);
			display_b(false);
			display_c(false);
			display_d(false);
			display_e(true);
			display_f(true);
			display_g(true);
			break;
		case 16: // T
			display_a(true);
			display_b(false);
			display_c(false);
			display_d(false);
			display_e(false);
			display_f(false);
			display_g(false);
			break;
		case 17: // L
			display_a(false);
			display_b(false);
			display_c(false);
			display_d(true);
			display_e(true);
			display_f(true);
			display_g(false);
			break;
		case 18: // U
			display_a(false);
			display_b(true);
			display_c(true);
			display_d(true);
			display_e(true);
			display_f(true);
			display_g(false);
			break;
		default:
			display_a(false);
			display_b(false);
			display_c(false);
			display_d(false);
			display_e(false);
			display_f(false);
			display_g(false);
			break;
	}

	display_dp(dot);
}

void display(int value, bool dot)
{
	HAL_GPIO_WritePin(GPIOA, DISPLAY_D6_OFF_Pin, false);
	uint8_t n = 0;
	if (ticks == 1)
	{
		n = (value % 100000 - value % value % 10000) / 10000;
		display_d1(n != 0);
		display_d2(false);
		display_d3(false);
		display_d4(false);
		display_d5(false);
		display_number(n, false);
	}
	if (ticks == 2)
	{
		n = (value % 10000 - value % value % 1000) / 1000;
		display_d1(false);
		display_d2(true);
		display_d3(false);
		display_d4(false);
		display_d5(false);
		display_number(n, false);
	}
	if (ticks == 3)
	{
		n = (value % 1000 - value % value % 100) / 100;
		display_d1(false);
		display_d2(false);
		display_d3(true);
		display_d4(false);
		display_d5(false);
		display_number(n, dot);
	}
	if (ticks == 4)
	{
		n = (value % 100 - value % value % 10) / 10;
		display_d1(false);
		display_d2(false);
		display_d3(false);
		display_d4(true);
		display_d5(false);
		display_number(n, false);
	}
	if (ticks == 5)
	{
		n = (value % 10 - value % value % 1) / 1;
		display_d1(false);
		display_d2(false);
		display_d3(false);
		display_d4(false);
		display_d5(true);
		display_number(n, false);
	}

	if (ticks == 5)
	{
		ticks = 0;
	}
	ticks++;
}

void display_show_off()
{
	if (ticks == 1)
	{
		display_d1(false);
		display_d2(false);
		display_d3(false);
		display_d4(false);
		display_d5(false);
	}
	if (ticks == 2)
	{
		display_d1(false);
		display_d2(false);
		display_d3(false);
		display_d4(false);
		display_d5(false);
	}
	if (ticks == 3)
	{
		display_d1(false);
		display_d2(false);
		display_d3(true);
		display_d4(false);
		display_d5(false);
		display_number(0, false);
	}
	if (ticks == 4)
	{
		display_d1(false);
		display_d2(false);
		display_d3(false);
		display_d4(true);
		display_d5(false);
		display_number(15, false);
	}
	if (ticks == 5)
	{
		display_d1(false);
		display_d2(false);
		display_d3(false);
		display_d4(false);
		display_d5(true);
		display_number(15, false);
	}

	if (ticks == 5)
	{
		ticks = 0;
	}
	ticks++;
}



void display_show_bluetooth()
{
	HAL_GPIO_WritePin(GPIOA, DISPLAY_D6_OFF_Pin, true);
	if (ticks == 1)
		{
			display_d1(false);
			display_d2(false);
			display_d3(false);
			display_d4(false);
			display_d5(false);
		}
		if (ticks == 2)
		{
			display_d1(false);
			display_d2(true);
			display_d3(false);
			display_d4(false);
			display_d5(false);
			display_number(8, false);
		}
		if (ticks == 3)
		{
			display_d1(false);
			display_d2(false);
			display_d3(true);
			display_d4(false);
			display_d5(false);
			display_number(17, false);
		}
		if (ticks == 4)
		{
			display_d1(false);
			display_d2(false);
			display_d3(false);
			display_d4(true);
			display_d5(false);
			display_number(18, false);
		}
		if (ticks == 5)
		{
			display_d1(false);
			display_d2(false);
			display_d3(false);
			display_d4(false);
			display_d5(true);
			display_number(14, false);
		}

		if (ticks == 5)
		{
			ticks = 0;
		}
		ticks++;
}

