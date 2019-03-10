#ifndef MCUSETUP_H
#define MCUSETUP_H

#include "main.h"

ADC_HandleTypeDef hadc1;
ADC_HandleTypeDef hadc2;
ADC_HandleTypeDef hadc3;
SPI_HandleTypeDef hspi1;
SPI_HandleTypeDef hspi2;
UART_HandleTypeDef huart1;

void SystemClock_Config(void);
void MCU_Setup();
void Error_Handler(void);

#endif