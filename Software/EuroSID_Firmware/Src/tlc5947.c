#include "tlc5947.h"
#include "spi.h"

uint16_t* LEDState;


void LEDinit()
{
    // Turn on SPI1 - LED SPI - pins
    HAL_SPI_MspInit(&hspi1);
    clearDevice(&hspi1,287); // The width of the data register in the chip
    LEDState = (uint16_t *)malloc(2 * 24);
    memset(LEDState,0,2*24);
}

void setLED(int led,uint16_t pwm)
{
    pwm &= 4095;
    LEDState[led] = pwm;
    writeLED(LEDState);
}

void clearLED()
{
    int i;
    for(i = 0; i < NUM_LED; i++)
    {
        LEDState[i] = 123;
    }
    writeLED(LEDState);
}

void writeLED(uint16_t* data)
{
    int i;
    for(i = 0; i < NUM_LED; i++)
    {
        uint16_t thisLEDData = data[i] << 4;
        HAL_SPI_Transmit(&hspi1,&thisLEDData,1,HAL_MAX_DELAY);
    }
}