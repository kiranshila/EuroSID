#pragma once
#include "main.h"

#define NUM_LED 24
#define PWM_SIZE 12

void LEDinit();
void setLED(int,uint16_t);
void clearLED();
void writeLED(uint16_t*);