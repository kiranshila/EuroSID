
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f3xx_hal.h"
#include "string.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#define DEFAULT_LED_BRIGHTNESS 1024
#define DEFAULT_ADSR_LED_BRIGHTNESS 4096
/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET *

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define SID_RES_Pin GPIO_PIN_13
#define SID_RES_GPIO_Port GPIOC
#define SID_CS_Pin GPIO_PIN_14
#define SID_CS_GPIO_Port GPIOC
#define FREQ_A_Pin GPIO_PIN_15
#define FREQ_A_GPIO_Port GPIOC
#define FREQ_B_Pin GPIO_PIN_0
#define FREQ_B_GPIO_Port GPIOF
#define FREQ_SW_Pin GPIO_PIN_1
#define FREQ_SW_GPIO_Port GPIOF
#define ATTACK_Pin GPIO_PIN_0
#define ATTACK_GPIO_Port GPIOC
#define DECAY_Pin GPIO_PIN_1
#define DECAY_GPIO_Port GPIOC
#define SUSTAIN_Pin GPIO_PIN_2
#define SUSTAIN_GPIO_Port GPIOC
#define RELEASE_Pin GPIO_PIN_3
#define RELEASE_GPIO_Port GPIOC
#define PWM_Pin GPIO_PIN_0
#define PWM_GPIO_Port GPIOA
#define CUTOFF_Pin GPIO_PIN_1
#define CUTOFF_GPIO_Port GPIOA
#define RESONANCE_Pin GPIO_PIN_2
#define RESONANCE_GPIO_Port GPIOA
#define FREQ_ATTEN_Pin GPIO_PIN_3
#define FREQ_ATTEN_GPIO_Port GPIOA
#define CUTOFF_CV_Pin GPIO_PIN_4
#define CUTOFF_CV_GPIO_Port GPIOF
#define SHAPE_CV_Pin GPIO_PIN_4
#define SHAPE_CV_GPIO_Port GPIOA
#define PWM_CV_Pin GPIO_PIN_5
#define PWM_CV_GPIO_Port GPIOA
#define PWM_ATTEN_Pin GPIO_PIN_6
#define PWM_ATTEN_GPIO_Port GPIOA
#define SET_CV_Pin GPIO_PIN_7
#define SET_CV_GPIO_Port GPIOA
#define SET_ATTEN_Pin GPIO_PIN_4
#define SET_ATTEN_GPIO_Port GPIOC
#define IN3_CV_Pin GPIO_PIN_5
#define IN3_CV_GPIO_Port GPIOC
#define IN1_CV_Pin GPIO_PIN_0
#define IN1_CV_GPIO_Port GPIOB
#define IN2_CV_Pin GPIO_PIN_1
#define IN2_CV_GPIO_Port GPIOB
#define GATE_1_Pin GPIO_PIN_2
#define GATE_1_GPIO_Port GPIOB
#define GATE_2_Pin GPIO_PIN_10
#define GATE_2_GPIO_Port GPIOB
#define GATE_3_Pin GPIO_PIN_11
#define GATE_3_GPIO_Port GPIOB
#define SID_LATCH_Pin GPIO_PIN_12
#define SID_LATCH_GPIO_Port GPIOB
#define SID_CLK_Pin GPIO_PIN_13
#define SID_CLK_GPIO_Port GPIOB
#define VOICE_SW_Pin GPIO_PIN_14
#define VOICE_SW_GPIO_Port GPIOB
#define SID_DATA_Pin GPIO_PIN_15
#define SID_DATA_GPIO_Port GPIOB
#define FILTER_SW_Pin GPIO_PIN_6
#define FILTER_SW_GPIO_Port GPIOC
#define FILTEREXT_SW_Pin GPIO_PIN_7
#define FILTEREXT_SW_GPIO_Port GPIOC
#define FILTER3_SW_Pin GPIO_PIN_8
#define FILTER3_SW_GPIO_Port GPIOC
#define FILTER2_SW_Pin GPIO_PIN_9
#define FILTER2_SW_GPIO_Port GPIOC
#define FILTER1_SW_Pin GPIO_PIN_8
#define FILTER1_SW_GPIO_Port GPIOA
#define TX_Pin GPIO_PIN_9
#define TX_GPIO_Port GPIOA
#define RX_Pin GPIO_PIN_10
#define RX_GPIO_Port GPIOA
#define SHAPE_SW_Pin GPIO_PIN_11
#define SHAPE_SW_GPIO_Port GPIOA
#define SET_SW_Pin GPIO_PIN_12
#define SET_SW_GPIO_Port GPIOA
#define SWDIO_Pin GPIO_PIN_13
#define SWDIO_GPIO_Port GPIOA
#define SWCLK_Pin GPIO_PIN_14
#define SWCLK_GPIO_Port GPIOA
#define LED_LATCH_Pin GPIO_PIN_15
#define LED_LATCH_GPIO_Port GPIOA
#define MOD_SW_Pin GPIO_PIN_10
#define MOD_SW_GPIO_Port GPIOC
#define MODE_SW_Pin GPIO_PIN_11
#define MODE_SW_GPIO_Port GPIOC
#define LED_CLK_Pin GPIO_PIN_3
#define LED_CLK_GPIO_Port GPIOB
#define LED_DATA_Pin GPIO_PIN_5
#define LED_DATA_GPIO_Port GPIOB
/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
