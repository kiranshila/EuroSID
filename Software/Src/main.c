#include "main.h"
#include "MCUSetup.h"
#include "SID.h"
#include "TLC5947.h"

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

int main(void) {
  MCU_Setup();

  setAllLEDBrightness(4095);
  // clearLEDs();
  writeLEDs(&ledDriver);

  // Set the initial state of the SID CS and RES line to high
  HAL_GPIO_WritePin(sid._cs_port, sid._cs, GPIO_PIN_SET);
  HAL_GPIO_WritePin(sid._res_port, sid._res, GPIO_PIN_SET);

  // Setup the sid object
  memcpy(sid._voices, sidVoices, sizeof(Voice) * 3);
  sid._filter = initialFilter;

  // Test all voices
  //testAllVoices(&sid);
  testFilter(&sid);
  //megelovania(&sid);
}