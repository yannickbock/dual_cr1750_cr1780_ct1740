#include <stdint.h>
#include <stm32g0xx_hal.h>
#include "main.h"
#include <stm32g0xx_hal_flash.h>
#include <stm32g0xx_hal_flash_ex.h>

struct Station {
	uint32_t Frequency;
	uint32_t DutyCycle;
};

struct Station station_fm_get(uint8_t);
void station_fm_set(uint8_t, uint32_t, uint32_t);

struct Station station_am_get(uint8_t);
void station_am_set(uint8_t, uint32_t, uint32_t);

void station_led(int);
