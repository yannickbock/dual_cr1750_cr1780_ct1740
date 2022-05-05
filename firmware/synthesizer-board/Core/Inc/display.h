#include "stm32g0xx_hal.h"
#include "main.h"
#include <string.h>
#include <stdbool.h>
#include <stdlib.h>

void display_on(bool);

void display_d1(bool);
void display_d2(bool);
void display_d3(bool);
void display_d4(bool);
void display_d5(bool);

void display_a(bool);
void display_b(bool);
void display_c(bool);
void display_d(bool);
void display_e(bool);
void display_f(bool);
void display_g(bool);
void display_dp(bool);

void display_number(uint8_t, bool);

void display(int, bool);

void display_show_off();

void display_show_bluetooth();
