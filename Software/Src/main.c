#include "main.h"
#include "MCUSetup.h"
#include "SID.h"
#include "TLC5947.h"

ADC_HandleTypeDef hadc1;
ADC_HandleTypeDef hadc2;
ADC_HandleTypeDef hadc3;
DMA_HandleTypeDef hdma_adc1;
DMA_HandleTypeDef hdma_adc2;
DMA_HandleTypeDef hdma_adc3;
SPI_HandleTypeDef hspi2;
UART_HandleTypeDef huart1;

TLC5947 ledDriver = {LED_LATCH_Pin,     LED_CLK_Pin,
                     LED_DATA_Pin,      LED_LATCH_GPIO_Port,
                     LED_CLK_GPIO_Port, LED_DATA_GPIO_Port};

// Initialize the three voices with Square voices, 0 freq and pwm, and 0
// envelopes
Voice sidVoices[] = {{Square, 0, 0, {0, 0, 0, 0}},
                     {Square, 0, 0, {0, 0, 0, 0}},
                     {Square, 0, 0, {0, 0, 0, 0}}};

// Setup the initial filter settings
// 0 Cutoff, 0 Resonance, 100% Volume, Low Pass, Filter Nothing
Filter initialFilter = {0, 0, 0xF, LP, {0, 0, 0, 0}};

SID sid = {SID_RES_Pin, SID_CS_Pin, SID_RES_GPIO_Port, SID_CS_GPIO_Port,
           &hspi2};

uint16_t ADC1Readings[9]; // For the first ADC peripheral, 9 channels

int main(void) {
  MCU_Setup();
  HAL_ADC_Start_DMA(&hadc1, (uint32_t *)ADC1Readings,9); // start the DMA collecting the data

  setAllLEDBrightness(4095);
  // clearLEDs();
  writeLEDs(&ledDriver);

  // Set the initial state of the SID CS and RES line to high
  HAL_GPIO_WritePin(sid._cs_port, sid._cs, GPIO_PIN_SET);
  HAL_GPIO_WritePin(sid._res_port, sid._res, GPIO_PIN_SET);

  // Setup the sid object
  memcpy(sid._voices, sidVoices, sizeof(Voice) * 3);
  sid._filter = initialFilter;
  clearSID(&sid);

  char message[25];

  /**
  while (1) {
    for (int i = 5; i < 9; i++) {
      sprintf(message, "Channel %d: %d\n\r", i, ADC1Readings[i]);
      HAL_UART_Transmit(&huart1, message, 25, HAL_MAX_DELAY);
      HAL_Delay(5);
    }
  }

  */

  // Test all voices
  testAllVoices(&sid);
  //testFilter(&sid);
  // megelovania(&sid);
}