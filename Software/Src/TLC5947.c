#include "TLC5947.h"

uint16_t _buffer[NUM_CHANNELS];

void write(TLC5947 *pins) {
  HAL_GPIO_WritePin(pins->_lat_port, pins->_lat, GPIO_PIN_RESET);
  // 24 Channels per TLC5947, set in NUM_CHANNELS
  for (int16_t channel = NUM_CHANNELS - 1; channel >= 0; channel--) {
    // 12 bits per channel, send MSB first
    for (int8_t brightness = 11; brightness >= 0; brightness--) {
      HAL_GPIO_WritePin(pins->_clk_port, pins->_clk, GPIO_PIN_RESET);
      if (_buffer[channel] & (1 << brightness))
        HAL_GPIO_WritePin(pins->_data_port, pins->_data, GPIO_PIN_SET);
      else
        HAL_GPIO_WritePin(pins->_data_port, pins->_data, GPIO_PIN_RESET);

      HAL_GPIO_WritePin(pins->_clk_port, pins->_clk, GPIO_PIN_SET);
    }
  }
  HAL_GPIO_WritePin(pins->_clk_port, pins->_clk, GPIO_PIN_RESET);
  HAL_GPIO_WritePin(pins->_lat_port, pins->_lat, GPIO_PIN_SET);
  HAL_GPIO_WritePin(pins->_lat_port, pins->_lat, GPIO_PIN_RESET);
}

void setLEDBrightness(uint16_t led, uint16_t value) {
  if (value > 4095)
    value = 4095;
  if (led > NUM_CHANNELS)
    return;
  _buffer[led] = value;
}

void clear()
{
  for(int i = 0; i < NUM_CHANNELS; i++)
  {
    _buffer[i] = 0;
  }
}