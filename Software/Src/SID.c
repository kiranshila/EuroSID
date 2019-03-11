#include "SID.h"

// Setter methods for all of the voice settings
void setVoiceFreq(SID *sidChip, uint16_t freq, int voice) {
  if (voice > NUM_VOICES || voice < 0) {
    return; // Error
  }
  sidChip->_voices[voice]._freq = freq;
}

void setVoicePWM(SID *sidChip, uint16_t pwm, int voice) {
  if (voice > NUM_VOICES || voice < 0) {
    return; // Error
  }
  if (pwm > 4095)
    pwm = 4095; // Clamp to 12 bits
  sidChip->_voices[voice]._pwm = pwm;
}

void setVoiceShape(SID *sidChip, Shape shape, int voice) {
  if (voice > NUM_VOICES || voice < 0) {
    return; // Error
  }
  sidChip->_voices[voice]._currentShape = shape;
}

void setVoiceEnv(SID *sidChip, Envelope env, int voice) {
  if (voice > NUM_VOICES || voice < 0) {
    return; // Error
  }
  sidChip->_voices[voice]._env = env;
}

// Functions to write each voice setting to the appropriate register
void writeVoiceFreq(SID *sidChip, int voice) {
  if (voice > NUM_VOICES || voice < 0) {
    return; // Error
  }
  // Frequency is two bytes
  writeSID(sidChip, VOICE_1_FREQ_LOW + (voice * VOICE_REGISTER_OFFSET),
           sidChip->_voices[voice]._freq & 0xFF);

  writeSID(sidChip, VOICE_1_FREQ_HIGH + (voice * VOICE_REGISTER_OFFSET),
           (sidChip->_voices[voice]._freq & 0xFF00) >> 8);
}

void writeVoicePWM(SID *sidChip, int voice) {
  if (voice > NUM_VOICES || voice < 0) {
    return; // Error
  }
  // Frequency is two bytes
  writeSID(sidChip, VOICE_1_PWM_LOW + (voice * VOICE_REGISTER_OFFSET),
           sidChip->_voices[voice]._pwm & 0xFF);

  writeSID(sidChip, VOICE_1_PWM_HIGH + (voice * VOICE_REGISTER_OFFSET),
           (sidChip->_voices[voice]._pwm & 0xF00) >> 8); // Masked to 5 bits
}

void writeVoiceEnv(SID *sidChip, int voice) {
  uint8_t attack_decay = 0;
  attack_decay |= (sidChip->_voices[voice]._env.Attack & 0xF) << 4;
  attack_decay |= sidChip->_voices[voice]._env.Decay & 0xF;

  uint8_t sustain_release = 0;
  sustain_release |= (sidChip->_voices[voice]._env.Sustain & 0xF) << 4;
  sustain_release |= sidChip->_voices[voice]._env.Release & 0xF;

  writeSID(sidChip, VOICE_1_ATTACK_DECAY + (voice * VOICE_REGISTER_OFFSET),
           attack_decay);
  writeSID(sidChip, VOICE_1_SUSTAIN_RELEASE + (voice * VOICE_REGISTER_OFFSET),
           sustain_release);
}

void gateVoice(SID *sidChip, int voice) {
  if (voice > NUM_VOICES || voice < 0) {
    return; // Error
  }
  // Gating set the GATE bit to high, that starts the AD sequence

  // We have to first construct the data byte

  // FIXME, do we support compound voices?
  uint8_t data = 0;
  switch (sidChip->_voices[voice]._currentShape) {
  case Square:
    data |= 1 << 6;
    break;
  case Noise:
    data |= 1 << 7;
    break;
  case Sawtooth:
    data |= 1 << 5;
    break;
  case Triangle:
    data |= 1 << 4;
    break;
  }

  // Set the gate bit
  data |= 1;

  // FIXME - set gate/ringmod

  // Write the data to the SID chip
  writeSID(sidChip, VOICE_1_CONTROL + (voice * VOICE_REGISTER_OFFSET), data);
}

void ungateVoice(SID *sidChip, int voice) {
  if (voice > NUM_VOICES || voice < 0) {
    return; // Error
  }
  // Gating set the GATE bit to high, that starts the AD sequence

  // We have to first construct the data byte

  // FIXME, do we support compound voices?
  uint8_t data = 0;
  switch (sidChip->_voices[voice]._currentShape) {
  case Square:
    data |= 1 << 6;
    break;
  case Noise:
    data |= 1 << 7;
    break;
  case Sawtooth:
    data |= 1 << 5;
    break;
  case Triangle:
    data |= 1 << 4;
    break;
  }

  // Set the gate bit
  data &= 0xFE;

  // FIXME - set gate/ringmod

  // Write the data to the SID chip
  writeSID(sidChip, VOICE_1_CONTROL + (voice * VOICE_REGISTER_OFFSET), data);
}

void setFilterCutoff(SID *sidChip, uint16_t cutoff) {
  if (cutoff > 2047)
    cutoff = 2047; // Clamp to 11 bits

  sidChip->_filter._cutoff = cutoff;
}

void writeFilterCutoff(SID *sidChip) {
  // Cutoff is two bytes
  writeSID(sidChip, FILTER_CUTOFF_LOW, sidChip->_filter._cutoff & 7);
  writeSID(sidChip, FILTER_CUTOFF_HIGH, (sidChip->_filter._cutoff & 2040) >> 3);
}

void setFilterResonance(SID *sidChip, uint8_t resonance) {
  if (resonance > 15)
    resonance = 15; // Clamp to 4 bits
  sidChip->_filter._resonance = resonance;
}

void setFilterTargets(SID *sidChip, int whatToFilter, _Bool filterOn) {
  if (whatToFilter > NUM_VOICES + 1 || whatToFilter < 0) {
    return; // Error
  }
  sidChip->_filter._filterPipe[whatToFilter] = filterOn;
}

void writeFilterResonance(SID *sidChip) {
  // Data contains resonance and filter target
  uint8_t data = 0;
  data |= (sidChip->_filter._resonance & 0xF) << 4;
  for (int i = 0; i < NUM_VOICES + 1; i++) {
    data |= sidChip->_filter._filterPipe[i] << i;
  }
  writeSID(sidChip, FILTER_RES, data);
}

void setVolume(SID *sidChip, uint8_t volume) {
  if (volume > 15)
    volume = 15; // Clamp to 4 bits
  sidChip->_filter._volume = volume;
}

void setFilterType(SID *sidChip, FilterType type) {
  sidChip->_filter._type = type;
}

void writeFilterVolume(SID *sidChip) {
  // Data contains volume and filter type
  uint8_t data = 0;
  data |= sidChip->_filter._volume & 0xF;
  switch (sidChip->_filter._type) {
  case ThreeOff:
    data |= 1 << 7;
    break;
  case HP:
    data |= 1 << 6;
    break;
  case BP:
    data |= 1 << 5;
    break;
  case LP:
    data |= 1 << 4;
    break;
  }
  writeSID(sidChip, FILTER_MODE, data);
}

// Writes data to the SID chip over SPI
void writeSID(SID *sidChip, uint8_t addr, uint8_t data) {
  // The first bit out of MOSI is the LSB, which goes to the furthest location
  // in the shift register. In our case, that is A0, which is the LSB of the
  // address bus on the SID

  uint16_t writeBytes = 0;
  // writeBytes needs to be D7, ..., D0, A4, ..., A0
  // data is already 8 bits, so it can be shifted over by the size of addr (5)
  // addr needs to be masked to 5 bits and is in place properly
  writeBytes |= (data << 5) | (addr & 0x1F);

  // We don't have to package the data into anything weird as the DATA_SIZE in
  // the SPI init was set to SID_WORD of 13 bits. So we set SIZE to 1 as we are
  // transmitting one word.
  HAL_SPI_Transmit(sidChip->_spi, &writeBytes, 1, HAL_MAX_DELAY);
  // Now toggle the CS line on the SID for one cycle of the clock
  HAL_GPIO_WritePin(sidChip->_cs_port, sidChip->_cs, GPIO_PIN_RESET);
  HAL_Delay((1 / SID_FREQ) * 10000);
  HAL_GPIO_WritePin(sidChip->_cs_port, sidChip->_cs, GPIO_PIN_SET);
}

// Reset the SID chip and clear all registers
void clearSID(SID *sidChip) {
  // From the datasheet, hold ~RES Low for 10 clock cycles
  HAL_GPIO_WritePin(sidChip->_res_port, sidChip->_res, GPIO_PIN_RESET);
  HAL_Delay(1 / SID_FREQ * 1000);
  HAL_GPIO_WritePin(sidChip->_res_port, sidChip->_res, GPIO_PIN_SET);
  // Now write zeros to every register
  for (int i = 0; i < NUM_REGISTERS; i++) {
    writeSID(sidChip, i, 0);
  }
}

// General testing functions
void sweepVoiceFreq(SID *sidChip, int voice) {
  if (voice > NUM_VOICES || voice < 0) {
    return; // Error
  }
  for (int i = 0; i < 4; i++) {
    switch (i) {
    case 0:
      setVoiceShape(sidChip, Square, voice);
      break;
    case 1:
      setVoiceShape(sidChip, Sawtooth, voice);
      break;
    case 2:
      setVoiceShape(sidChip, Noise, voice);
      break;
    case 3:
      setVoiceShape(sidChip, Triangle, voice);
      break;
    }
    for (int j = 0; j < 65535; j += 300) {
      setVoiceFreq(sidChip, j, voice);
      writeVoiceFreq(sidChip, voice);
      gateVoice(sidChip, voice);
      HAL_Delay(5);
      ungateVoice(sidChip, voice);
    }
  }
}

void testAllVoices(SID *sidChip) {
  clearSID(sidChip);

  // Set volume to MAX
  setVolume(sidChip, 15);
  writeFilterVolume(sidChip);

  // Wait
  HAL_Delay(100);

  // Set an envelope for all voices
  Envelope myEnv = {0, 12, 0, 4};
  setVoiceEnv(sidChip, myEnv, 0);
  writeVoiceEnv(sidChip, 0);
  setVoiceEnv(sidChip, myEnv, 1);
  writeVoiceEnv(sidChip, 1);
  setVoiceEnv(sidChip, myEnv, 2);
  writeVoiceEnv(sidChip, 2);

  // Set PWM for all voices
  setVoicePWM(sidChip, 2048, 0);
  writeVoicePWM(sidChip, 0);
  setVoicePWM(sidChip, 2048, 1);
  writeVoicePWM(sidChip, 1);
  setVoicePWM(sidChip, 2048, 2);
  writeVoicePWM(sidChip, 2);

  for (int i = 0; i < NUM_VOICES; i++) {
    sweepVoiceFreq(sidChip, i);
  }
}

// Test the filter
void testFilter(SID *sidChip) {
  // Setup voice triad
  Envelope myEnv = {0, 0, 15, 0}; // Max sustain
  setVoiceEnv(sidChip, myEnv, 0);
  writeVoiceEnv(sidChip, 0);
  setVoicePWM(sidChip, 4096, 0);
  writeVoicePWM(sidChip, 0);
  setVoiceShape(sidChip, Triangle, 0);
  setVoiceEnv(sidChip, myEnv, 1);
  writeVoiceEnv(sidChip, 1);
  setVoicePWM(sidChip, 4096, 1);
  writeVoicePWM(sidChip, 1);
  setVoiceShape(sidChip, Triangle, 1);
  setVoiceEnv(sidChip, myEnv, 2);
  writeVoiceEnv(sidChip, 2);
  setVoicePWM(sidChip, 4096, 2);
  writeVoicePWM(sidChip, 2);
  setVoiceShape(sidChip, Sawtooth, 2);

  // Set max volume
  // Set volume to MAX
  setVolume(sidChip, 15);
  writeFilterVolume(sidChip);

  // Set decent frequency
  setVoiceFreq(sidChip, 4389, 0);
  writeVoiceFreq(sidChip, 0);
  setVoiceFreq(sidChip, 5530, 1);
  writeVoiceFreq(sidChip, 1);
  setVoiceFreq(sidChip, 6577, 2);
  writeVoiceFreq(sidChip, 2);

  // Turn on the filter for voice targets
  setFilterTargets(sidChip, 0, 1);
  setFilterTargets(sidChip, 1, 1);
  setFilterTargets(sidChip, 2, 1);

  // Set resonance to middle
  setFilterResonance(sidChip, 128);
  writeFilterResonance(sidChip);

  // For each filter type
  for (int i = 0; i < 3; i++) {
    switch (i) {
    case 0:
      setFilterType(sidChip, LP);
      writeFilterVolume(sidChip);
      break;
    case 1:
      setFilterType(sidChip, HP);
      writeFilterVolume(sidChip);
      break;
    case 2:
      setFilterType(sidChip, BP);
      writeFilterVolume(sidChip);
      break;
    }
    // Sweep cutoff
    gateVoice(sidChip, 0);
    gateVoice(sidChip, 1);
    gateVoice(sidChip, 2);
    for (int j = 0; j < 2048; j++) {
      setFilterCutoff(sidChip, j);
      writeFilterCutoff(sidChip);
      HAL_Delay(0.5);
    }
    ungateVoice(sidChip, 0);
    ungateVoice(sidChip, 1);
    ungateVoice(sidChip, 2);
  }
}

void megelovania(SID *sidChip) {
  clearSID(sidChip);
  Envelope myEnv = {0, 0, 15, 0}; // Max sustain
  setVoiceEnv(sidChip, myEnv, 0);
  writeVoiceEnv(sidChip, 0);
  setVoicePWM(sidChip, 4096, 0);
  writeVoicePWM(sidChip, 0);
  setVoiceShape(sidChip, Sawtooth, 0);

  // Set max volume
  // Set volume to MAX
  setVolume(sidChip, 15);
  writeFilterVolume(sidChip);

  // Turn off the filter for voice targets
  setFilterTargets(sidChip, 0, 0);
  setFilterTargets(sidChip, 1, 0);
  setFilterTargets(sidChip, 2, 0);

  int tempo = 120;
  for(int i = 0; i < SONG_LENGTH; i ++)
  {
    setVoiceFreq(sidChip,megelovaniaNotes[i],0);
    writeVoiceFreq(sidChip,0);
    gateVoice(sidChip,0);
    HAL_Delay(200);
    ungateVoice(sidChip,0);
    HAL_Delay(10);
  }
}