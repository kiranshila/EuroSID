EESchema Schematic File Version 4
LIBS:EuroSID-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 4700 3800 950  850 
U 5C513ACF
F0 "DIGITAL" 50
F1 "file5C513ACE.sch" 50
$EndSheet
$Sheet
S 4700 2700 1000 800 
U 5C513EEB
F0 "ANALOG" 50
F1 "file5C513EEA.sch" 50
$EndSheet
$Comp
L power:GND #PWR?
U 1 1 5BFB5474
P 3850 3950
AR Path="/5C5B0291/5BFB5474" Ref="#PWR?"  Part="1" 
AR Path="/5BFD63E3/5BFB5474" Ref="#PWR0149"  Part="1" 
F 0 "#PWR0149" H 3850 3700 50  0001 C CNN
F 1 "GND" V 3855 3822 50  0000 R CNN
F 2 "" H 3850 3950 50  0001 C CNN
F 3 "" H 3850 3950 50  0001 C CNN
	1    3850 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3950 3850 3900
Wire Wire Line
	3850 3900 3700 3900
Text GLabel 3750 3500 2    50   Input ~ 0
-10V_REF_IO
Wire Wire Line
	3750 3500 3700 3500
Text GLabel 3750 3300 2    50   Input ~ 0
3.3A_IO
Text GLabel 3750 3400 2    50   Input ~ 0
-12V_IO
Text GLabel 3750 3600 2    50   Input ~ 0
12V_IO
Text GLabel 3750 3700 2    50   Input ~ 0
3.3_IO
Wire Wire Line
	3700 3300 3750 3300
Wire Wire Line
	3700 3400 3750 3400
Wire Wire Line
	3700 3600 3750 3600
Wire Wire Line
	3700 3700 3750 3700
$Comp
L Connector:Conn_01x07_Female J18
U 1 1 5C2415F5
P 3500 3600
F 0 "J18" H 3394 4085 50  0000 C CNN
F 1 "Power_Connector_IO" H 3394 3994 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x07_P2.54mm_Vertical_SMD_Pin1Left" H 3500 3600 50  0001 C CNN
F 3 "~" H 3500 3600 50  0001 C CNN
	1    3500 3600
	-1   0    0    -1  
$EndComp
Text GLabel 3750 3800 2    50   Input ~ 0
5V_IO
Wire Wire Line
	3750 3800 3700 3800
Text GLabel 1750 3300 0    50   Input ~ 0
FREQ_A_IO
Text GLabel 1750 3400 0    50   Input ~ 0
FREQ_B_IO
Text GLabel 2450 4100 2    50   Input ~ 0
GATE_3_IO
Text GLabel 2450 4000 2    50   Input ~ 0
GATE_2_IO
Text GLabel 2450 3900 2    50   Input ~ 0
GATE_1_IO
Text GLabel 2450 3800 2    50   Input ~ 0
LED_DATA_IO
Text GLabel 2450 3700 2    50   Input ~ 0
LED_CLK_IO
Text GLabel 2450 3600 2    50   Input ~ 0
LED_LATCH_IO
Text GLabel 2450 3500 2    50   Input ~ 0
GATE_1_IO
Text GLabel 2450 3400 2    50   Input ~ 0
GATE_2_IO
Text GLabel 2450 3300 2    50   Input ~ 0
GATE_3_IO
Text GLabel 1750 3500 0    50   Input ~ 0
FREQ_SW_IO
Text GLabel 1750 3600 0    50   Input ~ 0
FILTER_SW_IO
Text GLabel 1750 3700 0    50   Input ~ 0
FILTEREXT_SW_IO
Text GLabel 1750 3800 0    50   Input ~ 0
FILTER3_SW_IO
Text GLabel 1750 3900 0    50   Input ~ 0
FILTER2_SW_IO
Text GLabel 2450 4200 2    50   Input ~ 0
MOD_SW_IO
Text GLabel 1750 4100 0    50   Input ~ 0
MODE_SW_IO
Text GLabel 1750 4200 0    50   Input ~ 0
VOICE_SW_IO
Text GLabel 1750 4300 0    50   Input ~ 0
SET_SW_IO
Text GLabel 2450 4300 2    50   Input ~ 0
SHAPE_SW_IO
Text GLabel 1750 4000 0    50   Input ~ 0
FILTER1_SW_IO
$Comp
L Connector_Generic:Conn_02x11_Odd_Even J?
U 1 1 5C55A49C
P 2050 3800
AR Path="/5C5B0294/5C55A49C" Ref="J?"  Part="1" 
AR Path="/5BFD63E3/5C55A49C" Ref="J20"  Part="1" 
F 0 "J20" H 2100 4517 50  0000 C CNN
F 1 "Digital_Connector_IO" H 2100 4426 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x11_P2.54mm_Vertical_SMD" H 2050 3800 50  0001 C CNN
F 3 "~" H 2050 3800 50  0001 C CNN
	1    2050 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 3300 1850 3300
Wire Wire Line
	1750 3400 1850 3400
Wire Wire Line
	1750 3500 1850 3500
Wire Wire Line
	1750 3600 1850 3600
Wire Wire Line
	1750 3700 1850 3700
Wire Wire Line
	1750 3800 1850 3800
Wire Wire Line
	1750 3900 1850 3900
Wire Wire Line
	1750 4000 1850 4000
Wire Wire Line
	1750 4100 1850 4100
Wire Wire Line
	1750 4200 1850 4200
Wire Wire Line
	1750 4300 1850 4300
Wire Wire Line
	2350 4300 2450 4300
Wire Wire Line
	2350 4200 2450 4200
Wire Wire Line
	2350 4100 2450 4100
Wire Wire Line
	2350 4000 2450 4000
Wire Wire Line
	2350 3900 2450 3900
Wire Wire Line
	2350 3800 2450 3800
Wire Wire Line
	2350 3700 2450 3700
Wire Wire Line
	2350 3600 2450 3600
Wire Wire Line
	2350 3500 2450 3500
Wire Wire Line
	2350 3400 2450 3400
Wire Wire Line
	2350 3300 2450 3300
Text GLabel 1750 4700 0    50   Input ~ 0
CUTOFF_CV_IO
Text GLabel 1750 4800 0    50   Input ~ 0
IN3_CV_IO
Text GLabel 1750 4900 0    50   Input ~ 0
IN2_CV_IO
Text GLabel 1750 5000 0    50   Input ~ 0
IN1_CV_IO
Text GLabel 2450 4900 2    50   Input ~ 0
SET_CV_IO
Text GLabel 2450 4800 2    50   Input ~ 0
PWM_CV_IO
Text GLabel 2450 4700 2    50   Input ~ 0
SHAPE_CV_IO
Text GLabel 1750 5550 0    50   Input ~ 0
ATTACK_IO
Text GLabel 1750 5650 0    50   Input ~ 0
DECAY_IO
Text GLabel 1750 5750 0    50   Input ~ 0
SUSTAIN_IO
Text GLabel 1750 5850 0    50   Input ~ 0
RELEASE_IO
Text GLabel 1650 6100 0    50   Input ~ 0
SET_ATTEN_IO
Text GLabel 1650 6200 0    50   Input ~ 0
PWM_ATTEN_IO
Text GLabel 1650 6300 0    50   Input ~ 0
FREQ_ATTEN_IO
Text GLabel 2450 5750 2    50   Input ~ 0
RESONANCE_IO
Text GLabel 2450 5650 2    50   Input ~ 0
CUTOFF_IO
Text GLabel 2450 5550 2    50   Input ~ 0
PWM_IO
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J?
U 1 1 5C55A4CA
P 2050 4800
AR Path="/5C5B0294/5C55A4CA" Ref="J?"  Part="1" 
AR Path="/5BFD63E3/5C55A4CA" Ref="J21"  Part="1" 
F 0 "J21" H 2100 5117 50  0000 C CNN
F 1 "CV_Connector_IO" H 2100 5026 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x04_P2.54mm_Vertical_SMD" H 2050 4800 50  0001 C CNN
F 3 "~" H 2050 4800 50  0001 C CNN
	1    2050 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C55A4D1
P 2450 5900
AR Path="/5C5B0294/5C55A4D1" Ref="#PWR?"  Part="1" 
AR Path="/5BFD63E3/5C55A4D1" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 2450 5650 50  0001 C CNN
F 1 "GND" H 2455 5727 50  0000 C CNN
F 2 "" H 2450 5900 50  0001 C CNN
F 3 "" H 2450 5900 50  0001 C CNN
	1    2450 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 5050 2450 5000
Wire Wire Line
	2450 5000 2350 5000
Wire Wire Line
	2350 4900 2450 4900
Wire Wire Line
	2350 4800 2450 4800
Wire Wire Line
	2350 4700 2450 4700
Wire Wire Line
	1850 4700 1750 4700
Wire Wire Line
	1850 4800 1750 4800
Wire Wire Line
	1850 4900 1750 4900
Wire Wire Line
	1850 5000 1750 5000
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J?
U 1 1 5C55A4E0
P 2050 5650
AR Path="/5C5B0294/5C55A4E0" Ref="J?"  Part="1" 
AR Path="/5BFD63E3/5C55A4E0" Ref="J22"  Part="1" 
F 0 "J22" H 2100 5967 50  0000 C CNN
F 1 "Pot_Connector_IO" H 2100 5876 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x04_P2.54mm_Vertical_SMD" H 2050 5650 50  0001 C CNN
F 3 "~" H 2050 5650 50  0001 C CNN
	1    2050 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 5900 2450 5850
Wire Wire Line
	2450 5850 2350 5850
$Comp
L power:GND #PWR?
U 1 1 5C55A4E9
P 2450 5050
AR Path="/5C5B0294/5C55A4E9" Ref="#PWR?"  Part="1" 
AR Path="/5BFD63E3/5C55A4E9" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 2450 4800 50  0001 C CNN
F 1 "GND" H 2455 4877 50  0000 C CNN
F 2 "" H 2450 5050 50  0001 C CNN
F 3 "" H 2450 5050 50  0001 C CNN
	1    2450 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 5550 1850 5550
Wire Wire Line
	1750 5650 1850 5650
Wire Wire Line
	1750 5750 1850 5750
Wire Wire Line
	1850 5850 1750 5850
Wire Wire Line
	2450 5550 2350 5550
Wire Wire Line
	2450 5650 2350 5650
Wire Wire Line
	2450 5750 2350 5750
$Comp
L Connector_Generic:Conn_01x04 J?
U 1 1 5C55A4F6
P 2050 6200
AR Path="/5C5B0294/5C55A4F6" Ref="J?"  Part="1" 
AR Path="/5BFD63E3/5C55A4F6" Ref="J23"  Part="1" 
F 0 "J23" H 2129 6192 50  0000 L CNN
F 1 "Attenuverter_Connector_IO" H 2129 6101 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical_SMD_Pin1Left" H 2050 6200 50  0001 C CNN
F 3 "~" H 2050 6200 50  0001 C CNN
	1    2050 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 6100 1650 6100
Wire Wire Line
	1650 6200 1850 6200
Wire Wire Line
	1850 6300 1650 6300
$Comp
L power:GND #PWR?
U 1 1 5C55A500
P 1750 6500
AR Path="/5C5B0294/5C55A500" Ref="#PWR?"  Part="1" 
AR Path="/5BFD63E3/5C55A500" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 1750 6250 50  0001 C CNN
F 1 "GND" H 1755 6327 50  0000 C CNN
F 2 "" H 1750 6500 50  0001 C CNN
F 3 "" H 1750 6500 50  0001 C CNN
	1    1750 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 6500 1750 6400
Wire Wire Line
	1750 6400 1850 6400
$Comp
L Connector_Generic:Conn_01x04 J?
U 1 1 5C5A3F82
P 4000 4750
AR Path="/5C5AA76E/5C5A3F82" Ref="J?"  Part="1" 
AR Path="/5BFD63E3/5C5A3F82" Ref="J28"  Part="1" 
F 0 "J28" H 4079 4742 50  0000 L CNN
F 1 "SID_Audio_Connector_IO" H 4079 4651 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical_SMD_Pin1Left" H 4000 4750 50  0001 C CNN
F 3 "~" H 4000 4750 50  0001 C CNN
	1    4000 4750
	1    0    0    -1  
$EndComp
Text GLabel 3650 4650 0    50   Input ~ 0
SID2_OUT_IO
Text GLabel 3650 4750 0    50   Input ~ 0
SID1_OUT_IO
Text GLabel 3650 4850 0    50   Input ~ 0
SID1_EXT_IO
$Comp
L power:GND #PWR?
U 1 1 5C5A3F8C
P 3750 5050
AR Path="/5C5A3F8C" Ref="#PWR?"  Part="1" 
AR Path="/5C5AA76E/5C5A3F8C" Ref="#PWR?"  Part="1" 
AR Path="/5BFD63E3/5C5A3F8C" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 3750 4800 50  0001 C CNN
F 1 "GND" H 3755 4877 50  0000 C CNN
F 2 "" H 3750 5050 50  0001 C CNN
F 3 "" H 3750 5050 50  0001 C CNN
	1    3750 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 5050 3750 4950
Wire Wire Line
	3750 4950 3800 4950
Wire Wire Line
	3650 4850 3800 4850
Wire Wire Line
	3650 4750 3800 4750
Wire Wire Line
	3650 4650 3800 4650
$EndSCHEMATC
