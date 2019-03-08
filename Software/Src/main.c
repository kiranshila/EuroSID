#include "main.h"
#include "MCUSetup.h"

int main(void) {
  peripheralSetup();

  while (1) {
    HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_5);
    HAL_Delay(50);
  }
}
