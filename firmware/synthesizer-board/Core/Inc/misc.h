#include <stdint.h>
#include <stdbool.h>
#include "stm32g0xx_hal.h"
#include "main.h"

typedef enum Modes { FM, AM, OTHER } Mode;

int misc_get_revision();
bool misc_is_standby();
bool misc_is_manual();
void misc_mute(bool);
Mode misc_get_mode(int);
