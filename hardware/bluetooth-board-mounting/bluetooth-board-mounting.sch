EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Mechanical:MountingHole H1
U 1 1 61E44BCC
P 3000 2500
F 0 "H1" H 3100 2500 50  0000 L CNN
F 1 "MountingHole" H 3100 2455 50  0001 L CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3" H 3000 2500 50  0001 C CNN
F 3 "~" H 3000 2500 50  0001 C CNN
	1    3000 2500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 61E44F65
P 3500 2500
F 0 "H2" H 3600 2500 50  0000 L CNN
F 1 "MountingHole" H 3600 2455 50  0001 L CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3" H 3500 2500 50  0001 C CNN
F 3 "~" H 3500 2500 50  0001 C CNN
	1    3500 2500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 U1
U 1 1 61E453F6
P 1700 2500
F 0 "U1" V 1950 2450 50  0000 C CNN
F 1 "BT / M18" V 1850 2450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 1700 2500 50  0001 C CNN
F 3 "~" H 1700 2500 50  0001 C CNN
	1    1700 2500
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R10
U 1 1 61E482E5
P 1500 2850
F 0 "R10" H 1600 3350 50  0000 C CNN
F 1 "100" H 1600 3450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1430 2850 50  0001 C CNN
F 3 "~" H 1500 2850 50  0001 C CNN
	1    1500 2850
	-1   0    0    1   
$EndComp
Text GLabel 1500 3000 3    50   Output ~ 0
OUT_R
Text GLabel 1600 3000 3    50   Output ~ 0
OUT_L
$Comp
L power:GND #PWR0105
U 1 1 61E991AB
P 1700 2700
F 0 "#PWR0105" H 1700 2450 50  0001 C CNN
F 1 "GND" V 1700 2500 50  0000 C CNN
F 2 "" H 1700 2700 50  0001 C CNN
F 3 "" H 1700 2700 50  0001 C CNN
	1    1700 2700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 61E9A965
P 1800 2700
F 0 "#PWR0106" H 1800 2550 50  0001 C CNN
F 1 "+5V" V 1800 2900 50  0000 C CNN
F 2 "" H 1800 2700 50  0001 C CNN
F 3 "" H 1800 2700 50  0001 C CNN
	1    1800 2700
	-1   0    0    1   
$EndComp
Text GLabel 1900 2700 3    50   Input ~ 0
MUTE
Text GLabel 2000 2700 3    50   Input ~ 0
KEY
$Comp
L Device:R R9
U 1 1 61E48BD6
P 1600 2850
F 0 "R9" H 1500 3350 50  0000 C CNN
F 1 "100" H 1500 3450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1530 2850 50  0001 C CNN
F 3 "~" H 1600 2850 50  0001 C CNN
	1    1600 2850
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 61F67F91
P 8350 3550
F 0 "J1" H 8430 3542 50  0000 L CNN
F 1 "Conn_01x06" H 8430 3451 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x03_Pitch2.54mm" H 8350 3550 50  0001 C CNN
F 3 "~" H 8350 3550 50  0001 C CNN
	1    8350 3550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J11
U 1 1 61F69C85
P 8350 4300
F 0 "J11" H 8430 4342 50  0000 L CNN
F 1 "Conn_01x03" H 8430 4251 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x03_Pitch2.54mm" H 8350 4300 50  0001 C CNN
F 3 "~" H 8350 4300 50  0001 C CNN
	1    8350 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 61F88E2B
P 8150 3650
F 0 "#PWR0109" H 8150 3400 50  0001 C CNN
F 1 "GND" V 8150 3450 50  0000 C CNN
F 2 "" H 8150 3650 50  0001 C CNN
F 3 "" H 8150 3650 50  0001 C CNN
	1    8150 3650
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0111
U 1 1 61F89208
P 8150 3550
F 0 "#PWR0111" H 8150 3400 50  0001 C CNN
F 1 "+5V" V 8150 3700 50  0000 L CNN
F 2 "" H 8150 3550 50  0001 C CNN
F 3 "" H 8150 3550 50  0001 C CNN
	1    8150 3550
	0    -1   -1   0   
$EndComp
Text GLabel 8150 4400 0    50   Input ~ 0
OUT_L
Text GLabel 8150 4200 0    50   Input ~ 0
OUT_R
$Comp
L power:GND #PWR0112
U 1 1 61F8C9F1
P 8150 4300
F 0 "#PWR0112" H 8150 4050 50  0001 C CNN
F 1 "GND" V 8150 4100 50  0000 C CNN
F 2 "" H 8150 4300 50  0001 C CNN
F 3 "" H 8150 4300 50  0001 C CNN
	1    8150 4300
	0    1    1    0   
$EndComp
Text GLabel 8150 3450 0    50   Input ~ 0
KEY
$EndSCHEMATC
