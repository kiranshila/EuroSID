#ifndef SID_H
#define SID_H

#include "main.h"
#include "stdint.h"

// SID Chip Parameters
#define NUM_VOICES 3
#define SID_FREQ 1e6
#define SID_WORD 13 // Size of Data and Addr combined
#define NUM_REGISTERS 24

// The actaul memory locations for the SID registers
#define VOICE_1_FREQ_LOW 0x00
#define VOICE_1_FREQ_HIGH 0x01
#define VOICE_1_PWM_LOW 0x02
#define VOICE_1_PWM_HIGH 0x03
#define VOICE_1_CONTROL 0x04
#define VOICE_1_ATTACK_DECAY 0x05
#define VOICE_1_SUSTAIN_RELEASE 0x06

#define FILTER_CUTOFF_LOW 0x15
#define FILTER_CUTOFF_HIGH 0x16
#define FILTER_RES 0x17
#define FILTER_MODE 0x18

// The register offset between voices
#define VOICE_REGISTER_OFFSET 0x07

// The shapes a voice can have
typedef enum Shape { Square, Triangle, Sawtooth, Noise } Shape;

// The filter types
typedef enum FilterType { ThreeOff, HP, BP, LP } FilterType;

// Envelope Parameters - Gaurd against values greater than 4 bits
typedef struct Envelope {
  uint8_t Attack;
  uint8_t Decay;
  uint8_t Sustain;
  uint8_t Release;
} Envelope;

typedef struct Voice {
  Shape _currentShape;
  uint16_t _freq;
  uint16_t _pwm; // Gaurd against values greater than 12 bits
  Envelope _env;
} Voice;

typedef struct Filter {
  uint16_t _cutoff; // Gaurd against 11 bits
  uint8_t _resonance; // Gaud against 4 bits
  uint8_t _volume; // Gaurd against 4 bits
  FilterType _type;
  _Bool _filterPipe[NUM_VOICES + 1]; // Each voice plus the external input can
                                     // be filtered independently
} Filter;

typedef struct SID {
  // Pins and Ports
  uint16_t _res;
  uint16_t _cs;
  GPIO_TypeDef *_res_port;
  GPIO_TypeDef *_cs_port;

  // SPI Handler
  SPI_HandleTypeDef *_spi;

  // Buffers to hold the voice settings
  Voice _voices[NUM_VOICES];
  Filter _filter;
} SID;

// Function Prototypes

// Low Level SID Functions
void clearSID(SID *sidChip);
void writeSID(SID *sidChip, uint8_t addr, uint8_t data);

// Setters for internals
// Voice Settings
void setVoiceFreq(SID *sidChip, uint16_t freq, int voice);
void setVoicePWM(SID *sidChip, uint16_t pwm, int voice);
void setVoiceShape(SID *sidChip, Shape shape, int voice);
void setVoiceEnv(SID *sidChip, Envelope env, int voice);
// Filter Settings
void setFilterCutoff(SID *sidChip, uint16_t cutoff);
void setFilterResonance(SID *sidChip, uint8_t resonance);
void setFilterTargets(SID *sidChip, int whatToFilter, _Bool filterOn);
void setVolume(SID *sidChip, uint8_t volume);
void setFilterType(SID *sidChip, FilterType type);

// Apply internal settings to SID Chip
void writeVoiceFreq(SID *sidChip, int voice);
void writeVoicePWM(SID *sidChip, int voice);
void writeVoiceEnv(SID *sidChip, int voice);
void writeFilterCutoff(SID *sidChip);
void writeFilterResonance(SID *sidChip);
void writeFilterVolume(SID *sidChip);

// Produce the sound by activating the envelope
void gateVoice(SID *sidChip, int voice);
void ungateVoice(SID *sidChip, int voice);


#endif