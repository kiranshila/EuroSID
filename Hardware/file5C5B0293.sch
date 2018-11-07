EESchema Schematic File Version 4
LIBS:EuroSID-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:+3.3V #PWR0135
U 1 1 5C3E306A
P 1450 7000
F 0 "#PWR0135" H 1450 6850 50  0001 C CNN
F 1 "+3.3V" H 1465 7173 50  0000 C CNN
F 2 "" H 1450 7000 50  0001 C CNN
F 3 "" H 1450 7000 50  0001 C CNN
	1    1450 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 7000 1450 7050
$Comp
L power:GND #PWR0136
U 1 1 5C3E8151
P 1450 7550
F 0 "#PWR0136" H 1450 7300 50  0001 C CNN
F 1 "GND" H 1455 7377 50  0000 C CNN
F 2 "" H 1450 7550 50  0001 C CNN
F 3 "" H 1450 7550 50  0001 C CNN
	1    1450 7550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0146
U 1 1 5C3F5FB1
P 5400 1500
F 0 "#PWR0146" H 5400 1350 50  0001 C CNN
F 1 "+3.3V" H 5415 1673 50  0000 C CNN
F 2 "" H 5400 1500 50  0001 C CNN
F 3 "" H 5400 1500 50  0001 C CNN
	1    5400 1500
	1    0    0    -1  
$EndComp
Connection ~ 5400 1600
Wire Wire Line
	5400 1600 5300 1600
$Comp
L power:GND #PWR0147
U 1 1 5C3FCAA5
P 5400 5650
F 0 "#PWR0147" H 5400 5400 50  0001 C CNN
F 1 "GND" H 5405 5477 50  0000 C CNN
F 2 "" H 5400 5650 50  0001 C CNN
F 3 "" H 5400 5650 50  0001 C CNN
	1    5400 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 5650 5300 5650
Wire Wire Line
	5300 5650 5300 5350
Wire Wire Line
	5400 5650 5500 5650
Wire Wire Line
	5500 5650 5500 5350
Connection ~ 5400 5650
Wire Wire Line
	5400 5350 5400 5650
Text GLabel 4200 1950 0    50   Input ~ 0
RESET
Text GLabel 4200 2150 0    50   Input ~ 0
PROG
Text GLabel 4200 4550 0    50   Input ~ 0
FILTER2_SW
Text GLabel 4200 4650 0    50   Input ~ 0
MOD_SW
Text GLabel 4200 4750 0    50   Input ~ 0
MODE_SW
Text GLabel 4250 3150 0    50   Input ~ 0
FREQ_SW
Text GLabel 4250 3050 0    50   Input ~ 0
FREQ_B
Text GLabel 4200 3650 0    50   Input ~ 0
ATTACK
Text GLabel 4200 3750 0    50   Input ~ 0
DECAY
Text GLabel 4200 3850 0    50   Input ~ 0
SUSTAIN
Text GLabel 4200 3950 0    50   Input ~ 0
RELEASE
Text GLabel 6500 1950 2    50   Input ~ 0
PWM
Text GLabel 6500 2050 2    50   Input ~ 0
CUTOFF
Text GLabel 6500 2150 2    50   Input ~ 0
RESONANCE
Text GLabel 6500 2250 2    50   Input ~ 0
FREQ_ATTEN
Text GLabel 4200 4950 0    50   Input ~ 0
SID_RES
Text GLabel 4200 5150 0    50   Input ~ 0
FREQ_A
Text GLabel 4250 3250 0    50   Input ~ 0
CUTOFF_CV
Text GLabel 6500 2350 2    50   Input ~ 0
SHAPE_CV
Text GLabel 6500 2550 2    50   Input ~ 0
PWM_ATTEN
Text GLabel 6500 2650 2    50   Input ~ 0
SET_CV
Text GLabel 6500 2750 2    50   Input ~ 0
FILTER1_SW
Text GLabel 4200 4150 0    50   Input ~ 0
IN3_CV
Text GLabel 6500 3650 2    50   Input ~ 0
IN1_CV
Text GLabel 6500 3750 2    50   Input ~ 0
IN2_CV
Text GLabel 6500 3850 2    50   Input ~ 0
GATE_1
Text GLabel 6500 4650 2    50   Input ~ 0
GATE_2
Text GLabel 6500 4750 2    50   Input ~ 0
GATE_3
Text GLabel 6500 4850 2    50   Input ~ 0
SID_LATCH
Text GLabel 6500 4950 2    50   Input ~ 0
SID_CLK
Text GLabel 6500 5050 2    50   Input ~ 0
VOICE_SW
Text GLabel 6500 5150 2    50   Input ~ 0
SID_DATA
Text GLabel 4200 4250 0    50   Input ~ 0
FILTER_SW
Text GLabel 4200 4350 0    50   Input ~ 0
FILTEREXT_SW
Text GLabel 4200 4450 0    50   Input ~ 0
FILTER3_SW
Text GLabel 6500 4150 2    50   Input ~ 0
LED_DATA
Text GLabel 6500 3950 2    50   Input ~ 0
LED_CLK
Text GLabel 6500 3450 2    50   Input ~ 0
LED_LATCH
Wire Wire Line
	5400 1600 5500 1600
Wire Wire Line
	5400 1500 5400 1600
$Comp
L power:+3.3VA #PWR0148
U 1 1 5BEED548
P 5800 1550
F 0 "#PWR0148" H 5800 1400 50  0001 C CNN
F 1 "+3.3VA" H 5815 1723 50  0000 C CNN
F 2 "" H 5800 1550 50  0001 C CNN
F 3 "" H 5800 1550 50  0001 C CNN
	1    5800 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 1550 5800 1650
Wire Wire Line
	5800 1650 5700 1650
Wire Wire Line
	5700 1650 5700 1750
$Comp
L Device:C C61
U 1 1 5BEF0667
P 1250 6100
F 0 "C61" H 1365 6146 50  0000 L CNN
F 1 "100 nF" H 1365 6055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1288 5950 50  0001 C CNN
F 3 "~" H 1250 6100 50  0001 C CNN
	1    1250 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C59
U 1 1 5BEF066E
P 750 6100
F 0 "C59" H 865 6146 50  0000 L CNN
F 1 "10 nF" H 865 6055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 788 5950 50  0001 C CNN
F 3 "~" H 750 6100 50  0001 C CNN
	1    750  6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C63
U 1 1 5BEF067C
P 1750 6100
F 0 "C63" H 1865 6146 50  0000 L CNN
F 1 "1 uF" H 1865 6055 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-2012-12_Kemet-R" H 1788 5950 50  0001 C CNN
F 3 "~" H 1750 6100 50  0001 C CNN
	1    1750 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C64
U 1 1 5BEF0698
P 2250 6100
F 0 "C64" H 2368 6146 50  0000 L CNN
F 1 "10 uF" H 2368 6055 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.7" H 2288 5950 50  0001 C CNN
F 3 "~" H 2250 6100 50  0001 C CNN
	1    2250 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 5800 1750 5800
Connection ~ 1500 5800
Wire Wire Line
	2250 5950 2250 5800
Wire Wire Line
	1750 5950 1750 5800
Connection ~ 1750 5800
Wire Wire Line
	1250 5950 1250 5800
Connection ~ 1250 5800
Wire Wire Line
	1250 5800 750  5800
Wire Wire Line
	750  5800 750  5950
$Comp
L power:GND #PWR0140
U 1 1 5BEF06E1
P 1450 6350
F 0 "#PWR0140" H 1450 6100 50  0001 C CNN
F 1 "GND" H 1455 6177 50  0000 C CNN
F 2 "" H 1450 6350 50  0001 C CNN
F 3 "" H 1450 6350 50  0001 C CNN
	1    1450 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 6350 1750 6350
Connection ~ 1450 6350
Wire Wire Line
	2250 6250 2250 6350
Wire Wire Line
	1750 6250 1750 6350
Connection ~ 1750 6350
Wire Wire Line
	1250 6250 1250 6350
Connection ~ 1250 6350
Wire Wire Line
	1250 6350 750  6350
Wire Wire Line
	750  6250 750  6350
$Comp
L power:+3.3VA #PWR0141
U 1 1 5BEF77DE
P 1500 5750
F 0 "#PWR0141" H 1500 5600 50  0001 C CNN
F 1 "+3.3VA" H 1515 5923 50  0000 C CNN
F 2 "" H 1500 5750 50  0001 C CNN
F 3 "" H 1500 5750 50  0001 C CNN
	1    1500 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 5750 1500 5800
$Comp
L power:GND #PWR0137
U 1 1 5BF2206A
P 1900 3050
F 0 "#PWR0137" H 1900 2800 50  0001 C CNN
F 1 "GND" H 1905 2877 50  0000 C CNN
F 2 "" H 1900 3050 50  0001 C CNN
F 3 "" H 1900 3050 50  0001 C CNN
	1    1900 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 5800 1250 5800
Wire Wire Line
	1750 5800 2250 5800
Wire Wire Line
	1450 6350 1250 6350
Wire Wire Line
	1750 6350 2250 6350
$Comp
L Device:C C54
U 1 1 5BF63F9B
P 650 7250
F 0 "C54" H 765 7296 50  0000 L CNN
F 1 "100 nF" H 765 7205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 688 7100 50  0001 C CNN
F 3 "~" H 650 7250 50  0001 C CNN
	1    650  7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C55
U 1 1 5BF640D3
P 1150 7250
F 0 "C55" H 1265 7296 50  0000 L CNN
F 1 "100 nF" H 1265 7205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1188 7100 50  0001 C CNN
F 3 "~" H 1150 7250 50  0001 C CNN
	1    1150 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C56
U 1 1 5BF64109
P 1650 7250
F 0 "C56" H 1765 7296 50  0000 L CNN
F 1 "100 nF" H 1765 7205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1688 7100 50  0001 C CNN
F 3 "~" H 1650 7250 50  0001 C CNN
	1    1650 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C57
U 1 1 5BF64143
P 2200 7250
F 0 "C57" H 2318 7296 50  0000 L CNN
F 1 "4.7 uF" H 2318 7205 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3216-18_Kemet-A" H 2238 7100 50  0001 C CNN
F 3 "~" H 2200 7250 50  0001 C CNN
	1    2200 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 7050 1150 7050
Wire Wire Line
	650  7050 650  7100
Wire Wire Line
	1450 7050 1650 7050
Wire Wire Line
	2200 7050 2200 7100
Connection ~ 1450 7050
Wire Wire Line
	1150 7100 1150 7050
Connection ~ 1150 7050
Wire Wire Line
	1150 7050 650  7050
Wire Wire Line
	1650 7100 1650 7050
Connection ~ 1650 7050
Wire Wire Line
	1650 7050 2200 7050
Wire Wire Line
	650  7400 650  7450
Wire Wire Line
	650  7450 1150 7450
Wire Wire Line
	1450 7450 1450 7550
Wire Wire Line
	1450 7450 1650 7450
Wire Wire Line
	2200 7450 2200 7400
Connection ~ 1450 7450
Wire Wire Line
	1650 7400 1650 7450
Connection ~ 1650 7450
Wire Wire Line
	1650 7450 2200 7450
Wire Wire Line
	1150 7400 1150 7450
Connection ~ 1150 7450
Wire Wire Line
	1150 7450 1450 7450
$Comp
L power:+3.3V #PWR0142
U 1 1 5BF7E841
P 3500 7000
F 0 "#PWR0142" H 3500 6850 50  0001 C CNN
F 1 "+3.3V" H 3515 7173 50  0000 C CNN
F 2 "" H 3500 7000 50  0001 C CNN
F 3 "" H 3500 7000 50  0001 C CNN
	1    3500 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 7000 3500 7050
$Comp
L power:GND #PWR0143
U 1 1 5BF7E848
P 3500 7550
F 0 "#PWR0143" H 3500 7300 50  0001 C CNN
F 1 "GND" H 3505 7377 50  0000 C CNN
F 2 "" H 3500 7550 50  0001 C CNN
F 3 "" H 3500 7550 50  0001 C CNN
	1    3500 7550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C58
U 1 1 5BF7E84E
P 2700 7250
F 0 "C58" H 2815 7296 50  0000 L CNN
F 1 "100 nF" H 2815 7205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2738 7100 50  0001 C CNN
F 3 "~" H 2700 7250 50  0001 C CNN
	1    2700 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C60
U 1 1 5BF7E855
P 3200 7250
F 0 "C60" H 3315 7296 50  0000 L CNN
F 1 "100 nF" H 3315 7205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3238 7100 50  0001 C CNN
F 3 "~" H 3200 7250 50  0001 C CNN
	1    3200 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C62
U 1 1 5BF7E85C
P 3700 7250
F 0 "C62" H 3815 7296 50  0000 L CNN
F 1 "100 nF" H 3815 7205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3738 7100 50  0001 C CNN
F 3 "~" H 3700 7250 50  0001 C CNN
	1    3700 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C65
U 1 1 5BF7E863
P 4250 7250
F 0 "C65" H 4368 7296 50  0000 L CNN
F 1 "4.7 uF" H 4368 7205 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3216-18_Kemet-A" H 4288 7100 50  0001 C CNN
F 3 "~" H 4250 7250 50  0001 C CNN
	1    4250 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 7050 3200 7050
Wire Wire Line
	2700 7050 2700 7100
Wire Wire Line
	3500 7050 3700 7050
Wire Wire Line
	4250 7050 4250 7100
Connection ~ 3500 7050
Wire Wire Line
	3200 7100 3200 7050
Connection ~ 3200 7050
Wire Wire Line
	3200 7050 2700 7050
Wire Wire Line
	3700 7100 3700 7050
Connection ~ 3700 7050
Wire Wire Line
	3700 7050 4250 7050
Wire Wire Line
	2700 7400 2700 7450
Wire Wire Line
	2700 7450 3200 7450
Wire Wire Line
	3500 7450 3500 7550
Wire Wire Line
	3500 7450 3700 7450
Wire Wire Line
	4250 7450 4250 7400
Connection ~ 3500 7450
Wire Wire Line
	3700 7400 3700 7450
Connection ~ 3700 7450
Wire Wire Line
	3700 7450 4250 7450
Wire Wire Line
	3200 7400 3200 7450
Connection ~ 3200 7450
Wire Wire Line
	3200 7450 3500 7450
$Comp
L power:+3.3V #PWR0144
U 1 1 5BF821BD
P 5550 7000
F 0 "#PWR0144" H 5550 6850 50  0001 C CNN
F 1 "+3.3V" H 5565 7173 50  0000 C CNN
F 2 "" H 5550 7000 50  0001 C CNN
F 3 "" H 5550 7000 50  0001 C CNN
	1    5550 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 7000 5550 7050
$Comp
L power:GND #PWR0145
U 1 1 5BF821C4
P 5550 7550
F 0 "#PWR0145" H 5550 7300 50  0001 C CNN
F 1 "GND" H 5555 7377 50  0000 C CNN
F 2 "" H 5550 7550 50  0001 C CNN
F 3 "" H 5550 7550 50  0001 C CNN
	1    5550 7550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C66
U 1 1 5BF821CA
P 4750 7250
F 0 "C66" H 4865 7296 50  0000 L CNN
F 1 "100 nF" H 4865 7205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4788 7100 50  0001 C CNN
F 3 "~" H 4750 7250 50  0001 C CNN
	1    4750 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C67
U 1 1 5BF821D1
P 5250 7250
F 0 "C67" H 5365 7296 50  0000 L CNN
F 1 "100 nF" H 5365 7205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5288 7100 50  0001 C CNN
F 3 "~" H 5250 7250 50  0001 C CNN
	1    5250 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C68
U 1 1 5BF821D8
P 5750 7250
F 0 "C68" H 5865 7296 50  0000 L CNN
F 1 "100 nF" H 5865 7205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5788 7100 50  0001 C CNN
F 3 "~" H 5750 7250 50  0001 C CNN
	1    5750 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C69
U 1 1 5BF821DF
P 6300 7250
F 0 "C69" H 6418 7296 50  0000 L CNN
F 1 "4.7 uF" H 6418 7205 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3216-18_Kemet-A" H 6338 7100 50  0001 C CNN
F 3 "~" H 6300 7250 50  0001 C CNN
	1    6300 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 7050 5250 7050
Wire Wire Line
	4750 7050 4750 7100
Wire Wire Line
	5550 7050 5750 7050
Wire Wire Line
	6300 7050 6300 7100
Connection ~ 5550 7050
Wire Wire Line
	5250 7100 5250 7050
Connection ~ 5250 7050
Wire Wire Line
	5250 7050 4750 7050
Wire Wire Line
	5750 7100 5750 7050
Connection ~ 5750 7050
Wire Wire Line
	5750 7050 6300 7050
Wire Wire Line
	4750 7400 4750 7450
Wire Wire Line
	4750 7450 5250 7450
Wire Wire Line
	5550 7450 5550 7550
Wire Wire Line
	5550 7450 5750 7450
Wire Wire Line
	6300 7450 6300 7400
Connection ~ 5550 7450
Wire Wire Line
	5750 7400 5750 7450
Connection ~ 5750 7450
Wire Wire Line
	5750 7450 6300 7450
Wire Wire Line
	5250 7400 5250 7450
Connection ~ 5250 7450
Wire Wire Line
	5250 7450 5550 7450
$Comp
L Connector:Conn_ARM_JTAG_SWD_10 J17
U 1 1 5BF86C4D
P 1950 2250
F 0 "J17" H 1510 2296 50  0000 R CNN
F 1 "Conn_ARM_JTAG_SWD_10" H 1510 2205 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 2000 1700 50  0001 L TNN
F 3 "http://infocenter.arm.com/help/topic/com.arm.doc.faqs/attached/13634/cortex_debug_connectors.pdf" V 1600 1000 50  0001 C CNN
	1    1950 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 3050 1900 2950
Wire Wire Line
	1900 2950 1850 2950
Wire Wire Line
	1850 2950 1850 2850
Wire Wire Line
	1950 2850 1950 2950
Wire Wire Line
	1950 2950 1900 2950
Connection ~ 1900 2950
$Comp
L power:+3.3V #PWR0138
U 1 1 5BF90955
P 1950 1600
F 0 "#PWR0138" H 1950 1450 50  0001 C CNN
F 1 "+3.3V" H 1965 1773 50  0000 C CNN
F 2 "" H 1950 1600 50  0001 C CNN
F 3 "" H 1950 1600 50  0001 C CNN
	1    1950 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 1600 1950 1650
Text GLabel 2600 1950 2    50   Input ~ 0
RESET
Wire Wire Line
	2600 1950 2450 1950
Text GLabel 6500 3150 2    50   Input ~ 0
SET_SW
Text GLabel 6500 3350 2    50   Input ~ 0
SWCLK
Text GLabel 2600 2250 2    50   Input ~ 0
SWDIO
Wire Wire Line
	2600 2250 2450 2250
Text GLabel 2600 2150 2    50   Input ~ 0
SWCLK
Wire Wire Line
	2600 2150 2450 2150
$Comp
L Connector:Conn_01x06_Male J16
U 1 1 5BFB55EB
P 1850 3800
F 0 "J16" H 1822 3680 50  0000 R CNN
F 1 "Conn_01x06_Male" H 1822 3771 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 1850 3800 50  0001 C CNN
F 3 "~" H 1850 3800 50  0001 C CNN
	1    1850 3800
	1    0    0    1   
$EndComp
Text GLabel 6500 2850 2    50   Input ~ 0
TX
Text GLabel 6500 2950 2    50   Input ~ 0
RX
Text GLabel 2200 3600 2    50   Input ~ 0
TX
Wire Wire Line
	2200 3600 2050 3600
Text GLabel 2200 3700 2    50   Input ~ 0
RX
Wire Wire Line
	2200 3700 2050 3700
$Comp
L power:GND #PWR0139
U 1 1 5BFD1A9D
P 2200 4050
F 0 "#PWR0139" H 2200 3800 50  0001 C CNN
F 1 "GND" H 2205 3877 50  0000 C CNN
F 2 "" H 2200 4050 50  0001 C CNN
F 3 "" H 2200 4050 50  0001 C CNN
	1    2200 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 4050 2200 4000
Wire Wire Line
	2200 4000 2050 4000
NoConn ~ 2050 3500
NoConn ~ 2050 3800
NoConn ~ 2050 3900
NoConn ~ 2450 2350
NoConn ~ 2450 2450
Text GLabel 4200 4050 0    50   Input ~ 0
SET_ATTEN
Text GLabel 6500 3050 2    50   Input ~ 0
SHAPE_SW
$Comp
L MCU_ST_STM32F3:STM32F303RBTx U13
U 1 1 5BDFE304
P 5400 3550
F 0 "U13" H 5400 1664 50  0000 C CNN
F 1 "STM32F303RBTx" H 5400 1573 50  0000 C CNN
F 2 "Package_QFP:LQFP-64_10x10mm_P0.5mm" H 4800 1850 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00058181.pdf" H 5400 3550 50  0001 C CNN
	1    5400 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0155
U 1 1 5BE1EF17
P 3500 5850
F 0 "#PWR0155" H 3500 5700 50  0001 C CNN
F 1 "+3.3V" H 3515 6023 50  0000 C CNN
F 2 "" H 3500 5850 50  0001 C CNN
F 3 "" H 3500 5850 50  0001 C CNN
	1    3500 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 5850 3500 5900
$Comp
L power:GND #PWR0156
U 1 1 5BE1EF1E
P 3500 6400
F 0 "#PWR0156" H 3500 6150 50  0001 C CNN
F 1 "GND" H 3505 6227 50  0000 C CNN
F 2 "" H 3500 6400 50  0001 C CNN
F 3 "" H 3500 6400 50  0001 C CNN
	1    3500 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C72
U 1 1 5BE1EF24
P 2700 6100
F 0 "C72" H 2815 6146 50  0000 L CNN
F 1 "100 nF" H 2815 6055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2738 5950 50  0001 C CNN
F 3 "~" H 2700 6100 50  0001 C CNN
	1    2700 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C73
U 1 1 5BE1EF2B
P 3200 6100
F 0 "C73" H 3315 6146 50  0000 L CNN
F 1 "100 nF" H 3315 6055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3238 5950 50  0001 C CNN
F 3 "~" H 3200 6100 50  0001 C CNN
	1    3200 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C74
U 1 1 5BE1EF32
P 3700 6100
F 0 "C74" H 3815 6146 50  0000 L CNN
F 1 "100 nF" H 3815 6055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3738 5950 50  0001 C CNN
F 3 "~" H 3700 6100 50  0001 C CNN
	1    3700 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C75
U 1 1 5BE1EF39
P 4250 6100
F 0 "C75" H 4368 6146 50  0000 L CNN
F 1 "4.7 uF" H 4368 6055 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3216-18_Kemet-A" H 4288 5950 50  0001 C CNN
F 3 "~" H 4250 6100 50  0001 C CNN
	1    4250 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 5900 3200 5900
Wire Wire Line
	2700 5900 2700 5950
Wire Wire Line
	3500 5900 3700 5900
Wire Wire Line
	4250 5900 4250 5950
Connection ~ 3500 5900
Wire Wire Line
	3200 5950 3200 5900
Connection ~ 3200 5900
Wire Wire Line
	3200 5900 2700 5900
Wire Wire Line
	3700 5950 3700 5900
Connection ~ 3700 5900
Wire Wire Line
	3700 5900 4250 5900
Wire Wire Line
	2700 6250 2700 6300
Wire Wire Line
	2700 6300 3200 6300
Wire Wire Line
	3500 6300 3500 6400
Wire Wire Line
	3500 6300 3700 6300
Wire Wire Line
	4250 6300 4250 6250
Connection ~ 3500 6300
Wire Wire Line
	3700 6250 3700 6300
Connection ~ 3700 6300
Wire Wire Line
	3700 6300 4250 6300
Wire Wire Line
	3200 6250 3200 6300
Connection ~ 3200 6300
Wire Wire Line
	3200 6300 3500 6300
Wire Wire Line
	5300 1600 5300 1750
Wire Wire Line
	5400 1600 5400 1750
Wire Wire Line
	5500 1600 5500 1750
Wire Wire Line
	5500 1600 5600 1600
Wire Wire Line
	5600 1600 5600 1750
Connection ~ 5500 1600
Wire Wire Line
	6100 1950 6500 1950
Wire Wire Line
	6100 2050 6500 2050
Wire Wire Line
	6100 2150 6500 2150
Wire Wire Line
	6100 2250 6500 2250
Wire Wire Line
	4250 3250 4700 3250
Wire Wire Line
	4200 3650 4700 3650
Wire Wire Line
	4200 3750 4700 3750
Wire Wire Line
	4200 3850 4700 3850
Wire Wire Line
	4200 3950 4700 3950
Wire Wire Line
	6100 2350 6500 2350
Text GLabel 6500 2450 2    50   Input ~ 0
PWM_CV
Wire Wire Line
	6100 2450 6500 2450
Wire Wire Line
	6100 2550 6500 2550
Wire Wire Line
	6100 2650 6500 2650
Wire Wire Line
	4200 4050 4700 4050
Wire Wire Line
	4200 4150 4700 4150
Wire Wire Line
	6100 3750 6500 3750
Wire Wire Line
	6100 3650 6500 3650
Wire Wire Line
	6100 2750 6500 2750
Wire Wire Line
	6100 3050 6500 3050
Wire Wire Line
	6500 3150 6100 3150
Wire Wire Line
	6100 3850 6500 3850
Wire Wire Line
	6100 4650 6500 4650
Wire Wire Line
	6100 4750 6500 4750
Wire Wire Line
	6100 5050 6500 5050
Wire Wire Line
	4200 4250 4700 4250
Wire Wire Line
	4200 4350 4700 4350
Wire Wire Line
	4200 4450 4700 4450
Wire Wire Line
	4200 4550 4700 4550
Wire Wire Line
	4200 4650 4700 4650
Wire Wire Line
	4200 4750 4700 4750
Wire Wire Line
	4200 4950 4700 4950
Text GLabel 4200 5050 0    50   Input ~ 0
SID_CS
Wire Wire Line
	4200 5050 4700 5050
Wire Wire Line
	4200 5150 4700 5150
Wire Wire Line
	4250 3050 4700 3050
Wire Wire Line
	4250 3150 4700 3150
Wire Wire Line
	4200 1950 4700 1950
Wire Wire Line
	4200 2150 4700 2150
Wire Wire Line
	6100 4150 6500 4150
Wire Wire Line
	6100 3450 6500 3450
Wire Wire Line
	6100 3950 6500 3950
Wire Wire Line
	6100 5150 6500 5150
Wire Wire Line
	6100 4850 6500 4850
Wire Wire Line
	6100 4950 6500 4950
Wire Wire Line
	6100 3350 6500 3350
Text GLabel 6500 3250 2    50   Input ~ 0
SWDIO
Wire Wire Line
	6100 3250 6500 3250
Wire Wire Line
	6100 2950 6500 2950
Wire Wire Line
	6100 2850 6500 2850
NoConn ~ 4700 3450
NoConn ~ 4700 4850
NoConn ~ 6100 4550
NoConn ~ 6100 4450
NoConn ~ 6100 4350
NoConn ~ 6100 4250
NoConn ~ 6100 4050
Wire Wire Line
	5500 5650 5600 5650
Wire Wire Line
	5600 5650 5600 5350
Connection ~ 5500 5650
NoConn ~ 5200 1750
Text GLabel 9300 1950 0    50   Input ~ 0
FREQ_A
Text GLabel 9300 2050 0    50   Input ~ 0
FREQ_B
Text GLabel 10000 2750 2    50   Input ~ 0
GATE_3
Text GLabel 10000 2650 2    50   Input ~ 0
GATE_2
Text GLabel 10000 2550 2    50   Input ~ 0
GATE_1
Text GLabel 10000 2450 2    50   Input ~ 0
LED_DATA
Text GLabel 10000 2350 2    50   Input ~ 0
LED_CLK
Text GLabel 10000 2250 2    50   Input ~ 0
LED_LATCH
Text GLabel 10000 2150 2    50   Input ~ 0
GATE_1
Text GLabel 10000 2050 2    50   Input ~ 0
GATE_2
Text GLabel 10000 1950 2    50   Input ~ 0
GATE_3
Text GLabel 9300 2150 0    50   Input ~ 0
FREQ_SW
Text GLabel 9300 2250 0    50   Input ~ 0
FILTER_SW
Text GLabel 9300 2350 0    50   Input ~ 0
FILTEREXT_SW
Text GLabel 9300 2450 0    50   Input ~ 0
FILTER3_SW
Text GLabel 9300 2550 0    50   Input ~ 0
FILTER2_SW
Text GLabel 10000 2850 2    50   Input ~ 0
MOD_SW
Text GLabel 9300 2750 0    50   Input ~ 0
MODE_SW
Text GLabel 9300 2850 0    50   Input ~ 0
VOICE_SW
Text GLabel 9300 2950 0    50   Input ~ 0
SET_SW
Text GLabel 10000 2950 2    50   Input ~ 0
SHAPE_SW
Text GLabel 9300 2650 0    50   Input ~ 0
FILTER1_SW
$Comp
L Connector_Generic:Conn_02x11_Odd_Even J24
U 1 1 5C3285D2
P 9600 2450
F 0 "J24" H 9650 3167 50  0000 C CNN
F 1 "Digital_Connector" H 9650 3076 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x11_P2.54mm_Vertical" H 9600 2450 50  0001 C CNN
F 3 "~" H 9600 2450 50  0001 C CNN
	1    9600 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 1950 9400 1950
Wire Wire Line
	9300 2050 9400 2050
Wire Wire Line
	9300 2150 9400 2150
Wire Wire Line
	9300 2250 9400 2250
Wire Wire Line
	9300 2350 9400 2350
Wire Wire Line
	9300 2450 9400 2450
Wire Wire Line
	9300 2550 9400 2550
Wire Wire Line
	9300 2650 9400 2650
Wire Wire Line
	9300 2750 9400 2750
Wire Wire Line
	9300 2850 9400 2850
Wire Wire Line
	9300 2950 9400 2950
Wire Wire Line
	9900 2950 10000 2950
Wire Wire Line
	9900 2850 10000 2850
Wire Wire Line
	9900 2750 10000 2750
Wire Wire Line
	9900 2650 10000 2650
Wire Wire Line
	9900 2550 10000 2550
Wire Wire Line
	9900 2450 10000 2450
Wire Wire Line
	9900 2350 10000 2350
Wire Wire Line
	9900 2250 10000 2250
Wire Wire Line
	9900 2150 10000 2150
Wire Wire Line
	9900 2050 10000 2050
Wire Wire Line
	9900 1950 10000 1950
Text GLabel 9300 3350 0    50   Input ~ 0
CUTOFF_CV
Text GLabel 9300 3450 0    50   Input ~ 0
IN3_CV
Text GLabel 9300 3550 0    50   Input ~ 0
IN2_CV
Text GLabel 9300 3650 0    50   Input ~ 0
IN1_CV
Text GLabel 10000 3550 2    50   Input ~ 0
SET_CV
Text GLabel 10000 3450 2    50   Input ~ 0
PWM_CV
Text GLabel 10000 3350 2    50   Input ~ 0
SHAPE_CV
Text GLabel 9300 4200 0    50   Input ~ 0
ATTACK
Text GLabel 9300 4300 0    50   Input ~ 0
DECAY
Text GLabel 9300 4400 0    50   Input ~ 0
SUSTAIN
Text GLabel 9300 4500 0    50   Input ~ 0
RELEASE
Text GLabel 9200 4750 0    50   Input ~ 0
SET_ATTEN
Text GLabel 9200 4850 0    50   Input ~ 0
PWM_ATTEN
Text GLabel 9200 4950 0    50   Input ~ 0
FREQ_ATTEN
Text GLabel 10000 4400 2    50   Input ~ 0
RESONANCE
Text GLabel 10000 4300 2    50   Input ~ 0
CUTOFF
Text GLabel 10000 4200 2    50   Input ~ 0
PWM
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J25
U 1 1 5C42AEF9
P 9600 3450
F 0 "J25" H 9650 3767 50  0000 C CNN
F 1 "CV_Connector" H 9650 3676 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x04_P2.54mm_Vertical" H 9600 3450 50  0001 C CNN
F 3 "~" H 9600 3450 50  0001 C CNN
	1    9600 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5C444A45
P 10000 4550
F 0 "#PWR025" H 10000 4300 50  0001 C CNN
F 1 "GND" H 10005 4377 50  0000 C CNN
F 2 "" H 10000 4550 50  0001 C CNN
F 3 "" H 10000 4550 50  0001 C CNN
	1    10000 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 3700 10000 3650
Wire Wire Line
	10000 3650 9900 3650
Wire Wire Line
	9900 3550 10000 3550
Wire Wire Line
	9900 3450 10000 3450
Wire Wire Line
	9900 3350 10000 3350
Wire Wire Line
	9400 3350 9300 3350
Wire Wire Line
	9400 3450 9300 3450
Wire Wire Line
	9400 3550 9300 3550
Wire Wire Line
	9400 3650 9300 3650
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J26
U 1 1 5C48DB66
P 9600 4300
F 0 "J26" H 9650 4617 50  0000 C CNN
F 1 "Pot_Connector" H 9650 4526 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x04_P2.54mm_Vertical" H 9600 4300 50  0001 C CNN
F 3 "~" H 9600 4300 50  0001 C CNN
	1    9600 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 4550 10000 4500
Wire Wire Line
	10000 4500 9900 4500
$Comp
L power:GND #PWR023
U 1 1 5C4BCD26
P 10000 3700
F 0 "#PWR023" H 10000 3450 50  0001 C CNN
F 1 "GND" H 10005 3527 50  0000 C CNN
F 2 "" H 10000 3700 50  0001 C CNN
F 3 "" H 10000 3700 50  0001 C CNN
	1    10000 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 4200 9400 4200
Wire Wire Line
	9300 4300 9400 4300
Wire Wire Line
	9300 4400 9400 4400
Wire Wire Line
	9400 4500 9300 4500
Wire Wire Line
	10000 4200 9900 4200
Wire Wire Line
	10000 4300 9900 4300
Wire Wire Line
	10000 4400 9900 4400
$Comp
L Connector_Generic:Conn_01x04 J27
U 1 1 5C50D171
P 9600 4850
F 0 "J27" H 9679 4842 50  0000 L CNN
F 1 "Attenuverter_Connector" H 9679 4751 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 9600 4850 50  0001 C CNN
F 3 "~" H 9600 4850 50  0001 C CNN
	1    9600 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 4750 9200 4750
Wire Wire Line
	9200 4850 9400 4850
Wire Wire Line
	9400 4950 9200 4950
$Comp
L power:GND #PWR021
U 1 1 5C52CCC9
P 9300 5150
F 0 "#PWR021" H 9300 4900 50  0001 C CNN
F 1 "GND" H 9305 4977 50  0000 C CNN
F 2 "" H 9300 5150 50  0001 C CNN
F 3 "" H 9300 5150 50  0001 C CNN
	1    9300 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 5150 9300 5050
Wire Wire Line
	9300 5050 9400 5050
$EndSCHEMATC
