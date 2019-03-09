#ifndef TLC5947_H
#define TLC5947_H

#include "stdlib.h"
#include "stdint.h"
#include "main.h"

#define NUM_CHANNELS 24

typedef struct{
  uint16_t _lat;
  uint16_t _clk;
  uint16_t _data;

  GPIO_TypeDef *_lat_port;
  GPIO_TypeDef *_clk_port;
  GPIO_TypeDef *_data_port;
}TLC5947;

void setLEDBrightness(uint16_t led, uint16_t value);
void write(TLC5947* pins);

#endif