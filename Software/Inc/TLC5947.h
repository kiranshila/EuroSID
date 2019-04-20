#ifndef TLC5947_H
#define TLC5947_H

#include "main.h"
#include "stdint.h"
#include "stdlib.h"

// LED Pin Numbers
#define VOICE1_LED 0
#define VOICE2_LED 1
#define VOICE3_LED 2
#define MODEG_LED 3
#define MODER_LED 4
#define FILTER1_LED 7
#define FILTER2_LED 8
#define FILTER3_LED 9
#define FILTEREXT_LED 10
#define LP_LED 11
#define HP_LED 12
#define BP_LED 13
#define MOD_LED 14
#define SYNC_LED 15
#define SQUARE_LED 16
#define TRIANGLE_LED 17
#define SAW_LED 18
#define NOISE_LED 19
#define ATTACK_LED 20
#define DECAY_LED 21
#define SUSTAIN_LED 22
#define RELEASE_LED 23

#define NUM_CHANNELS 24

typedef struct {
  uint16_t _lat;
  uint16_t _clk;
  uint16_t _data;

  GPIO_TypeDef *_lat_port;
  GPIO_TypeDef *_clk_port;
  GPIO_TypeDef *_data_port;
} TLC5947;

// Function prototypes
void setLEDBrightness(uint16_t led, uint16_t value);
void writeLEDs(TLC5947 *pins);
void clearLEDs();
void setAllLEDBrightness(uint16_t value);

#endif