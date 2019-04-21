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

typedef struct State {
  int currentVoice;
  Shape currentShape[3];   // For each voice
  _Bool currentFilters[4]; // 1,2,3,Ext
  FilterType currentFilterType;
  Envelope currentEnv;
} State;

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
// IN2_CV,IN1_CV
uint16_t ADC3Readings[2];

// Main state struct
// Starting voice 1, starting shape square
State thisState = {1, {Square, Square, Square}, {0, 0, 0, 0}, LP, {0, 0, 0, 0}};

int rescale(int source, int numBitsSource, int numBitsTarget) {
  int sourceMax = (1 << numBitsSource) - 1;
  int targetMax = (1 << numBitsTarget) - 1;

  return floor(((double)source / (double)sourceMax) * targetMax);
}

void updateVOandGate() {
  // Write a 16 bit-scaled DMA frequency to SID
  int test = rescale(ADC2Readings[5],12,16);
  setVoiceFreq(&sid, rescale(ADC3Readings[1], 12, 16), 0);
  setVoiceFreq(&sid, rescale(ADC3Readings[0], 12, 16), 1);
  setVoiceFreq(&sid, test, 2);
  writeVoiceFreq(&sid, 0);
  writeVoiceFreq(&sid, 1);
  writeVoiceFreq(&sid, 2);
  // Gate
  /*
  HAL_GPIO_ReadPin(GATE_1_GPIO_Port, GATE_1_Pin) ? gateVoice(&sid, 0)
                                                 : ungateVoice(&sid, 0);
  HAL_GPIO_ReadPin(GATE_2_GPIO_Port, GATE_2_Pin) ? gateVoice(&sid, 1)
                                                 : ungateVoice(&sid, 1);
  HAL_GPIO_ReadPin(GATE_3_GPIO_Port, GATE_3_Pin) ? gateVoice(&sid, 2)
                                                 : ungateVoice(&sid, 2);
                                                 */
  gateVoice(&sid, 0);
  HAL_Delay(5);
  ungateVoice(&sid,0);
  gateVoice(&sid, 1);
  HAL_Delay(5);
  ungateVoice(&sid,1);
  gateVoice(&sid, 2);
  HAL_Delay(5);
  ungateVoice(&sid,2);
}

void buttonLogic() {
  // Voice button
  if (HAL_GPIO_ReadPin(VOICE_SW_GPIO_Port, VOICE_SW_Pin)) {
    switch (thisState.currentVoice) {
    case 0:
      thisState.currentVoice = 1;
      break;
    case 1:
      thisState.currentVoice = 2;
      break;
    case 2:
      thisState.currentVoice = 0;
      break;
    }
  }

  // Shape button
  if (HAL_GPIO_ReadPin(SHAPE_SW_GPIO_Port, SHAPE_SW_Pin)) {
    switch (thisState.currentShape[thisState.currentVoice]) {
    case Square:
      thisState.currentShape[thisState.currentVoice] = Triangle;
      break;
    case Triangle:
      thisState.currentShape[thisState.currentVoice] = Sawtooth;
      break;
    case Sawtooth:
      thisState.currentShape[thisState.currentVoice] = Noise;
      break;
    case Noise:
      thisState.currentShape[thisState.currentVoice] = Square;
      break;
    }
  }

  // Display the current voice LED and the current voice's shape
  switch (thisState.currentVoice) {
  case 0:
    setLEDBrightness(VOICE1_LED, DEFAULT_LED_BRIGHTNESS);
    setLEDBrightness(VOICE2_LED, 0);
    setLEDBrightness(VOICE3_LED, 0);
    break;
  case 1:
    setLEDBrightness(VOICE1_LED, 0);
    setLEDBrightness(VOICE2_LED, DEFAULT_LED_BRIGHTNESS);
    setLEDBrightness(VOICE3_LED, 0);
    break;
  case 2:
    setLEDBrightness(VOICE1_LED, 0);
    setLEDBrightness(VOICE2_LED, 0);
    setLEDBrightness(VOICE3_LED, DEFAULT_LED_BRIGHTNESS);
    break;
  }

  switch (thisState.currentShape[thisState.currentVoice]) {
  case Square:
    setLEDBrightness(SQUARE_LED, DEFAULT_LED_BRIGHTNESS);
    setLEDBrightness(TRIANGLE_LED, 0);
    setLEDBrightness(SAW_LED, 0);
    setLEDBrightness(NOISE_LED, 0);
    break;
  case Triangle:
    setLEDBrightness(SQUARE_LED, 0);
    setLEDBrightness(TRIANGLE_LED, DEFAULT_LED_BRIGHTNESS);
    setLEDBrightness(SAW_LED, 0);
    setLEDBrightness(NOISE_LED, 0);
    break;
  case Sawtooth:
    setLEDBrightness(SQUARE_LED, 0);
    setLEDBrightness(TRIANGLE_LED, 0);
    setLEDBrightness(SAW_LED, DEFAULT_LED_BRIGHTNESS);
    setLEDBrightness(NOISE_LED, 0);
    break;
  case Noise:
    setLEDBrightness(SQUARE_LED, 0);
    setLEDBrightness(TRIANGLE_LED, 0);
    setLEDBrightness(SAW_LED, 0);
    setLEDBrightness(NOISE_LED, DEFAULT_LED_BRIGHTNESS);
    break;
  }

  // Write voice's shapes to SID
  for (int i = 0; i < NUM_VOICES; i++) {
    setVoiceShape(&sid, thisState.currentShape[i], i);
  }

  // Filter Target Buttons
  if (HAL_GPIO_ReadPin(FILTER1_SW_GPIO_Port, FILTER1_SW_Pin)) {
    setLEDBrightness(FILTER1_LED, DEFAULT_LED_BRIGHTNESS);
    thisState.currentFilters[0] = 1;
  } else {
    setLEDBrightness(FILTER1_LED, 0);
    thisState.currentFilters[0] = 0;
  }
  if (HAL_GPIO_ReadPin(FILTER2_SW_GPIO_Port, FILTER2_SW_Pin)) {
    setLEDBrightness(FILTER2_LED, DEFAULT_LED_BRIGHTNESS);
    thisState.currentFilters[1] = 1;
  } else {
    setLEDBrightness(FILTER2_LED, 0);
    thisState.currentFilters[1] = 0;
  }
  if (HAL_GPIO_ReadPin(FILTER3_SW_GPIO_Port, FILTER3_SW_Pin)) {
    setLEDBrightness(FILTER3_LED, DEFAULT_LED_BRIGHTNESS);
    thisState.currentFilters[2] = 1;
  } else {
    setLEDBrightness(FILTER3_LED, 0);
    thisState.currentFilters[2] = 0;
  }
  if (HAL_GPIO_ReadPin(FILTEREXT_SW_GPIO_Port, FILTEREXT_SW_Pin)) {
    setLEDBrightness(FILTEREXT_LED, DEFAULT_LED_BRIGHTNESS);
    thisState.currentFilters[3] = 1;
  } else {
    setLEDBrightness(FILTEREXT_LED, 0);
    thisState.currentFilters[3] = 0;
  }

  // Filter Button
  if (HAL_GPIO_ReadPin(FILTER_SW_GPIO_Port, FILTER_SW_Pin)) {
    switch (thisState.currentFilterType) {
    case LP:
      setLEDBrightness(LP_LED, 0);
      setLEDBrightness(HP_LED, DEFAULT_LED_BRIGHTNESS);
      thisState.currentFilterType = HP;
      break;
    case HP:
      setLEDBrightness(HP_LED, 0);
      setLEDBrightness(BP_LED, DEFAULT_LED_BRIGHTNESS);
      thisState.currentFilterType = BP;
      break;
    case BP:
      setLEDBrightness(BP_LED, 0);
      setLEDBrightness(LP_LED, DEFAULT_LED_BRIGHTNESS);
      thisState.currentFilterType = LP;
      break;
      // Currently not exposed to control surface
    case ThreeOff:
      thisState.currentFilterType = LP;
    }
  }

  // Write filter info to SID chip
  for (int i = 0; i < 4; i++) {
    setFilterTargets(&sid, i, thisState.currentFilters[i]);
  }
  setFilterType(&sid, thisState.currentFilterType);
  writeFilterVolume(&sid); // Writes the Filter type as well

  writeLEDs(&ledDriver);
}

void potInputs() { // ADSR
  thisState.currentEnv.Attack = rescale(ADC1Readings[5], 12, 4);
  thisState.currentEnv.Decay = rescale(ADC1Readings[6], 12, 4);
  thisState.currentEnv.Sustain = rescale(ADC1Readings[7], 12, 4);
  thisState.currentEnv.Release = rescale(ADC1Readings[8], 12, 4);
  setVoiceEnv(&sid, thisState.currentEnv, thisState.currentVoice);
  writeVoiceEnv(&sid, thisState.currentVoice);
}

int main(void) {
  MCU_Setup();

  // setAllLEDBrightness(1024);
  clearLEDs();
  writeLEDs(&ledDriver);

  // Set the initial state of the SID CS and RES line to high
  HAL_GPIO_WritePin(sid._cs_port, sid._cs, GPIO_PIN_SET);
  HAL_GPIO_WritePin(sid._res_port, sid._res, GPIO_PIN_SET);

  // Setup the sid object
  clearSID(&sid);
  memcpy(sid._voices, sidVoices, sizeof(Voice) * 3);
  sid._filter = initialFilter;
  writeFilterCutoff(&sid);
  writeFilterResonance(&sid);
  writeFilterVolume(&sid);
  for (int i = 0; i < NUM_VOICES; i++) {
    writeVoiceEnv(&sid, i);
    writeVoiceFreq(&sid, i);
    writeVoicePWM(&sid, i);
  }
  HAL_Delay(1000);

  // start the DMA collecting the ADC data
  HAL_ADC_Start_DMA(&hadc1, (uint32_t *)ADC1Readings, 9);
  HAL_ADC_Start_DMA(&hadc2, (uint32_t *)ADC2Readings, 6);
  HAL_ADC_Start_DMA(&hadc3, (uint16_t *)ADC3Readings, 2);

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
  setLEDBrightness(ATTACK_LED, DEFAULT_ADSR_LED_BRIGHTNESS);
  setLEDBrightness(DECAY_LED, DEFAULT_ADSR_LED_BRIGHTNESS);
  setLEDBrightness(SUSTAIN_LED, DEFAULT_ADSR_LED_BRIGHTNESS);
  setLEDBrightness(RELEASE_LED, DEFAULT_ADSR_LED_BRIGHTNESS);
  // Write changes
  writeLEDs(&ledDriver);

  // -------------- MAIN ROUTINE ------------- ///
  while (1) {
    // Update frequency and gate for every input
    updateVOandGate();
    // Change state from button inputs
    buttonLogic();
    // Deal with potentiometer inputs
    potInputs();
  }
}