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

void misc_bt_toggle_power();
void misc_bt_pause();
void misc_bt_next();
void misc_bt_prev();

bool misc_bt_is_present();
