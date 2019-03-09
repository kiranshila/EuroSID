#include "main.h"
#include "MCUSetup.h"
#include "TLC5947.h"

TLC5947 ledDriver = {(uint16_t)LED_LATCH_Pin, (uint16_t)LED_CLK_Pin,
                     (uint16_t)LED_DATA_Pin,  LED_LATCH_GPIO_Port,
                     LED_CLK_GPIO_Port,       LED_DATA_GPIO_Port};

int main(void) {
  MCU_Setup();

  while (1) {
    for (int i = 0; i < NUM_CHANNELS; i++) {
      clear();
      setLEDBrightness(i, 4095);
      write(&ledDriver);
      HAL_Delay(50);
    }
  }
}