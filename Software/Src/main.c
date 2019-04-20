#include "main.h"
#include "MCUSetup.h"
#include "SID.h"
#include "TLC5947.h"
#include "math.h"

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

// PWM, CUTOFF, RESONANCE, FREQ_ATTEN, CUTOFF_CV, ATTACK, DECAY, SUSTAIN,
// RELEASE,
uint16_t ADC1Readings[9];
// SHAPE_CV, PWM_CV, PWM_ATTEN, SET_CV, SET_ATTEN, IN3_CV
uint16_t ADC2Readings[6];
// IN1_CV,IN2_CV
uint16_t ADC3Readings[2];

// Main state struct
// Starting voice 1, starting shape square
State thisState = {1,Square};

int rescale(int source, int numBitsSource, int numBitsTarget) {
  int sourceMax = pow(2, numBitsSource) - 1;
  int targetMax = pow(2, numBitsTarget) - 1;

  return floor((source / sourceMax) * targetMax);
}

void updateVOandGate() {
  // Write a 16 bit-scaled DMA frequency to SID
  setVoiceFreq(&sid, rescale(ADC3Readings[0], 12, 16), 0);
  setVoiceFreq(&sid, rescale(ADC3Readings[1], 12, 16), 1);
  setVoiceFreq(&sid, rescale(ADC2Readings[5], 12, 16), 2);
  writeVoiceFreq(&sid, 0);
  writeVoiceFreq(&sid, 1);
  writeVoiceFreq(&sid, 2);
  // Gate
  HAL_GPIO_ReadPin(GATE_1_GPIO_Port, GATE_1_Pin) ? gateVoice(&sid, 0)
                                                 : ungateVoice(&sid, 0);
  HAL_GPIO_ReadPin(GATE_2_GPIO_Port, GATE_2_Pin) ? gateVoice(&sid, 1)
                                                 : ungateVoice(&sid, 1);
  HAL_GPIO_ReadPin(GATE_3_GPIO_Port, GATE_3_Pin) ? gateVoice(&sid, 2)
                                                 : ungateVoice(&sid, 2);
}

void buttonLogic() {
  // Voice button
  if (HAL_GPIO_ReadPin(VOICE_SW_GPIO_Port, VOICE_SW_Pin)) {
    switch (thisState.currentVoice) {
    case 1:
      setLEDBrightness(VOICE1_LED, 0);
      setLEDBrightness(VOICE2_LED, DEFAULT_LED_BRIGHTNESS);
      thisState.currentVoice = 2;
      break;
    case 2:
      setLEDBrightness(VOICE2_LED, 0);
      setLEDBrightness(VOICE3_LED, DEFAULT_LED_BRIGHTNESS);
      thisState.currentVoice = 3;
      break;
    case 3:
      setLEDBrightness(VOICE3_LED, 0);
      setLEDBrightness(VOICE1_LED, DEFAULT_LED_BRIGHTNESS);
      thisState.currentVoice = 1;
      break;
    }
    writeLEDs(&ledDriver);
  }
}

int main(void) {
  MCU_Setup();
  HAL_ADC_Start_DMA(&hadc1, (uint32_t *)ADC1Readings,
                    9); // start the DMA collecting the data
  // HAL_ADC_Start_DMA(&hadc2, (uint32_t *)ADC2Readings, 6);
  // HAL_ADC_Start_DMA(&hadc3, (uint16_t *)ADC3Readings, 2);

  // setAllLEDBrightness(1024);
  clearLEDs();
  writeLEDs(&ledDriver);

  // Set the initial state of the SID CS and RES line to high
  HAL_GPIO_WritePin(sid._cs_port, sid._cs, GPIO_PIN_SET);
  HAL_GPIO_WritePin(sid._res_port, sid._res, GPIO_PIN_SET);

  // Setup the sid object
  memcpy(sid._voices, sidVoices, sizeof(Voice) * 3);
  sid._filter = initialFilter;
  clearSID(&sid);

  // char message[25];
  // sprintf(message,"PWM Value: %d\n\r",ADC1Readings[4]);
  // HAL_UART_Transmit(&huart1,message,sizeof(message),HAL_MAX_DELAY);

  // Test all voices
  // testAllVoices(&sid);
  // testFilter(&sid);
  // megelovania(&sid);

  // -------------- Setup Inital LED State ------------- ///
  // Startup at voice 1
  setLEDBrightness(VOICE1_LED, DEFAULT_LED_BRIGHTNESS);
  // Startup on square waveform
  setLEDBrightness(SQUARE_LED, DEFAULT_LED_BRIGHTNESS);
  // All filter targets are off, LP
  setLEDBrightness(LP_LED, DEFAULT_LED_BRIGHTNESS);
  // Just leave ADSR on for now
  setLEDBrightness(ATTACK_LED, DEFAULT_LED_BRIGHTNESS);
  setLEDBrightness(DECAY_LED, DEFAULT_LED_BRIGHTNESS);
  setLEDBrightness(SUSTAIN_LED, DEFAULT_LED_BRIGHTNESS);
  setLEDBrightness(RELEASE_LED, DEFAULT_LED_BRIGHTNESS);
  // Write changes
  writeLEDs(&ledDriver);

  // -------------- MAIN ROUTINE ------------- ///
  while (1) {
    // Update frequency and gate for every input
    updateVOandGate();
    // Change state from button inputs
    buttonLogic();
  }
}