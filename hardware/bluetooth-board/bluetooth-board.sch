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
L Transistor_BJT:BC847 Q3
U 1 1 61E4DFED
P 4400 1650
F 0 "Q3" H 4591 1696 50  0000 L CNN
F 1 "BC847" H 4591 1605 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 4600 1575 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 4400 1650 50  0001 L CNN
F 4 "C2145" H 4400 1650 50  0001 C CNN "LCSC"
	1    4400 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 61E4E0EF
P 4500 1300
F 0 "R6" H 4430 1254 50  0000 R CNN
F 1 "9.1k" H 4430 1345 50  0000 R CNN
F 2 "Resistors_SMD:R_0805" V 4430 1300 50  0001 C CNN
F 3 "~" H 4500 1300 50  0001 C CNN
F 4 "C17855" H 4500 1300 50  0001 C CNN "LCSC"
	1    4500 1300
	-1   0    0    1   
$EndComp
$Comp
L Device:R R5
U 1 1 61E4E0F9
P 4050 1650
F 0 "R5" V 3843 1650 50  0000 C CNN
F 1 "3.3k" V 3934 1650 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 3980 1650 50  0001 C CNN
F 3 "~" H 4050 1650 50  0001 C CNN
F 4 "C26010" V 4050 1650 50  0001 C CNN "LCSC"
	1    4050 1650
	0    1    1    0   
$EndComp
$Comp
L Transistor_BJT:BC847 Q1
U 1 1 61E4F667
P 1400 1650
F 0 "Q1" H 1591 1696 50  0000 L CNN
F 1 "BC847" H 1591 1605 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 1600 1575 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 1400 1650 50  0001 L CNN
F 4 "C2145" H 1400 1650 50  0001 C CNN "LCSC"
	1    1400 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 61E4F7B1
P 1500 1300
F 0 "R2" H 1430 1254 50  0000 R CNN
F 1 "51k" H 1430 1345 50  0000 R CNN
F 2 "Resistors_SMD:R_0805" V 1430 1300 50  0001 C CNN
F 3 "~" H 1500 1300 50  0001 C CNN
F 4 "C17737" H 1500 1300 50  0001 C CNN "LCSC"
	1    1500 1300
	-1   0    0    1   
$EndComp
$Comp
L Device:R R1
U 1 1 61E4F7BB
P 1050 1650
F 0 "R1" V 843 1650 50  0000 C CNN
F 1 "3.3k" V 934 1650 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 980 1650 50  0001 C CNN
F 3 "~" H 1050 1650 50  0001 C CNN
F 4 "C26010" V 1050 1650 50  0001 C CNN "LCSC"
	1    1050 1650
	0    1    1    0   
$EndComp
$Comp
L Transistor_BJT:BC847 Q2
U 1 1 61E5107B
P 2900 1650
F 0 "Q2" H 3091 1696 50  0000 L CNN
F 1 "BC847" H 3091 1605 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 3100 1575 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 2900 1650 50  0001 L CNN
F 4 "C2145" H 2900 1650 50  0001 C CNN "LCSC"
	1    2900 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 61E5120D
P 3000 1300
F 0 "R4" H 2930 1254 50  0000 R CNN
F 1 "33k" H 2930 1345 50  0000 R CNN
F 2 "Resistors_SMD:R_0805" V 2930 1300 50  0001 C CNN
F 3 "~" H 3000 1300 50  0001 C CNN
F 4 "C17633" H 3000 1300 50  0001 C CNN "LCSC"
	1    3000 1300
	-1   0    0    1   
$EndComp
$Comp
L Device:R R3
U 1 1 61E51217
P 2550 1650
F 0 "R3" V 2343 1650 50  0000 C CNN
F 1 "3.3k" V 2434 1650 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 2480 1650 50  0001 C CNN
F 3 "~" H 2550 1650 50  0001 C CNN
F 4 "C26010" V 2550 1650 50  0001 C CNN "LCSC"
	1    2550 1650
	0    1    1    0   
$EndComp
Text GLabel 4650 1000 2    50   Output ~ 0
KEY
$Comp
L power:GND #PWR0102
U 1 1 61E913F9
P 4500 1850
F 0 "#PWR0102" H 4500 1600 50  0001 C CNN
F 1 "GND" H 4500 1700 50  0000 C CNN
F 2 "" H 4500 1850 50  0001 C CNN
F 3 "" H 4500 1850 50  0001 C CNN
	1    4500 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 61E916C6
P 1500 1850
F 0 "#PWR0103" H 1500 1600 50  0001 C CNN
F 1 "GND" H 1500 1700 50  0000 C CNN
F 2 "" H 1500 1850 50  0001 C CNN
F 3 "" H 1500 1850 50  0001 C CNN
	1    1500 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 61E91AEB
P 3000 1850
F 0 "#PWR0104" H 3000 1600 50  0001 C CNN
F 1 "GND" H 3000 1700 50  0000 C CNN
F 2 "" H 3000 1850 50  0001 C CNN
F 3 "" H 3000 1850 50  0001 C CNN
	1    3000 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1000 1500 1150
Wire Wire Line
	3000 1150 3000 1000
Connection ~ 3000 1000
Wire Wire Line
	3000 1000 1500 1000
Wire Wire Line
	4500 1150 4500 1000
Wire Wire Line
	4500 1000 3000 1000
$Comp
L power:GND #PWR0108
U 1 1 61F60DA0
P 3700 4250
F 0 "#PWR0108" H 3700 4000 50  0001 C CNN
F 1 "GND" V 3700 4050 50  0000 C CNN
F 2 "" H 3700 4250 50  0001 C CNN
F 3 "" H 3700 4250 50  0001 C CNN
	1    3700 4250
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_02x06_Odd_Even J1
U 1 1 62082A68
P 1550 2750
F 0 "J1" H 1600 3075 50  0000 C CNN
F 1 "Conn_02x06_Odd_Even" H 1600 3076 50  0001 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x06_Pitch2.54mm" H 1550 2750 50  0001 C CNN
F 3 "~" H 1550 2750 50  0001 C CNN
	1    1550 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 620A534F
P 3550 4250
F 0 "R10" V 3343 4250 50  0000 C CNN
F 1 "1k" V 3434 4250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 3480 4250 50  0001 C CNN
F 3 "~" H 3550 4250 50  0001 C CNN
F 4 "C17513" V 3550 4250 50  0001 C CNN "LCSC"
	1    3550 4250
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 620AE0E0
P 3100 2650
F 0 "R7" V 2893 2650 50  0000 C CNN
F 1 "3.3k" V 2984 2650 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 3030 2650 50  0001 C CNN
F 3 "~" H 3100 2650 50  0001 C CNN
F 4 "C26010" V 3100 2650 50  0001 C CNN "LCSC"
	1    3100 2650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 620AF5F0
P 3850 2650
F 0 "#PWR0105" H 3850 2400 50  0001 C CNN
F 1 "GND" V 3850 2450 50  0000 C CNN
F 2 "" H 3850 2650 50  0001 C CNN
F 3 "" H 3850 2650 50  0001 C CNN
	1    3850 2650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 620AFCFE
P 3250 2850
F 0 "#PWR0106" H 3250 2600 50  0001 C CNN
F 1 "GND" V 3250 2650 50  0000 C CNN
F 2 "" H 3250 2850 50  0001 C CNN
F 3 "" H 3250 2850 50  0001 C CNN
	1    3250 2850
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 620B02F2
P 4000 2850
F 0 "R8" V 4100 2850 50  0000 C CNN
F 1 "10k" V 4200 2850 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 3930 2850 50  0001 C CNN
F 3 "~" H 4000 2850 50  0001 C CNN
F 4 "C17414" V 4000 2850 50  0001 C CNN "LCSC"
	1    4000 2850
	0    1    1    0   
$EndComp
$Comp
L Isolator:LTV-817S U1
U 1 1 6209A4FA
P 3550 2750
F 0 "U1" H 3550 3075 50  0000 C CNN
F 1 "LTV-217" H 3550 2984 50  0000 C CNN
F 2 "Housings_SSOP:SOP-4_4.4x2.8mm_Pitch1.27mm" H 3550 2450 50  0001 C CNN
F 3 "http://www.us.liteon.com/downloads/LTV-817-827-847.PDF" H 3200 3050 50  0001 C CNN
F 4 "C691224" H 3550 2750 50  0001 C CNN "LCSC"
	1    3550 2750
	1    0    0    -1  
$EndComp
Text GLabel 1850 2550 2    50   Output ~ 0
PA5
Text GLabel 1850 2750 2    50   Output ~ 0
PA3
Text GLabel 1850 2850 2    50   Output ~ 0
PA2
Text GLabel 1850 2950 2    50   BiDi ~ 0
PA1
Text GLabel 1350 2550 0    50   Output ~ 0
3.3V
$Comp
L power:GND #PWR0109
U 1 1 620C78CE
P 1350 2650
F 0 "#PWR0109" H 1350 2400 50  0001 C CNN
F 1 "GND" V 1350 2450 50  0000 C CNN
F 2 "" H 1350 2650 50  0001 C CNN
F 3 "" H 1350 2650 50  0001 C CNN
	1    1350 2650
	0    1    1    0   
$EndComp
Text GLabel 1350 2750 0    50   Output ~ 0
5V
$Comp
L power:GND #PWR0110
U 1 1 620C7EB6
P 1350 2850
F 0 "#PWR0110" H 1350 2600 50  0001 C CNN
F 1 "GND" V 1350 2650 50  0000 C CNN
F 2 "" H 1350 2850 50  0001 C CNN
F 3 "" H 1350 2850 50  0001 C CNN
	1    1350 2850
	0    1    1    0   
$EndComp
Text GLabel 900  1650 0    50   Input ~ 0
PA5
Text GLabel 2400 1650 0    50   Input ~ 0
PA4
Text GLabel 2950 2650 0    50   Input ~ 0
PA2
Text GLabel 1350 2950 0    50   Input ~ 0
PB11
Text GLabel 1350 3050 0    50   Output ~ 0
PB10
Text GLabel 2950 3500 0    50   Input ~ 0
PB10
Text GLabel 3400 4250 0    50   Input ~ 0
PB11
$Comp
L Connector_Generic:Conn_01x01 J2
U 1 1 620DFC49
P 4650 3300
F 0 "J2" H 4750 3350 50  0001 L CNN
F 1 "Conn_01x01" H 4730 3251 50  0001 L CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 4650 3300 50  0001 C CNN
F 3 "~" H 4650 3300 50  0001 C CNN
	1    4650 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J3
U 1 1 620E063F
P 4650 3500
F 0 "J3" H 4730 3542 50  0001 L CNN
F 1 "Conn_01x01" H 4730 3451 50  0001 L CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 4650 3500 50  0001 C CNN
F 3 "~" H 4650 3500 50  0001 C CNN
	1    4650 3500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 620E0A64
P 4650 3700
F 0 "J4" H 4730 3742 50  0001 L CNN
F 1 "Conn_01x01" H 4730 3651 50  0001 L CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 4650 3700 50  0001 C CNN
F 3 "~" H 4650 3700 50  0001 C CNN
	1    4650 3700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J5
U 1 1 620E0D04
P 4650 3900
F 0 "J5" H 4730 3942 50  0001 L CNN
F 1 "Conn_01x01" H 4730 3851 50  0001 L CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 4650 3900 50  0001 C CNN
F 3 "~" H 4650 3900 50  0001 C CNN
	1    4650 3900
	1    0    0    -1  
$EndComp
Text GLabel 4450 3700 0    50   Input ~ 0
KEY
Text GLabel 3850 3700 2    50   Input ~ 0
5V
$Comp
L power:GND #PWR0111
U 1 1 621034B8
P 4450 3300
F 0 "#PWR0111" H 4450 3050 50  0001 C CNN
F 1 "GND" V 4450 3100 50  0000 C CNN
F 2 "" H 4450 3300 50  0001 C CNN
F 3 "" H 4450 3300 50  0001 C CNN
	1    4450 3300
	0    1    1    0   
$EndComp
Text GLabel 4450 3900 0    50   Input ~ 0
DP
Text GLabel 4150 2850 2    50   Input ~ 0
DP
NoConn ~ 1850 3050
Wire Wire Line
	4650 1000 4500 1000
Connection ~ 4500 1000
$Comp
L Relay_SolidState:ASSR-1218 U2
U 1 1 623115FD
P 3550 3600
F 0 "U2" H 3550 3925 50  0000 C CNN
F 1 "AQY282SX" H 3550 3834 50  0000 C CNN
F 2 "Housings_SSOP:SOP-4_3.8x4.1mm_Pitch2.54mm" H 3350 3400 50  0001 L CIN
F 3 "https://docs.broadcom.com/docs/AV02-0173EN" H 3550 3600 50  0001 L CNN
F 4 "C250827" H 3550 3600 50  0001 C CNN "LCSC"
	1    3550 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 6231BE5D
P 3250 3700
F 0 "#PWR0101" H 3250 3450 50  0001 C CNN
F 1 "GND" V 3250 3500 50  0000 C CNN
F 2 "" H 3250 3700 50  0001 C CNN
F 3 "" H 3250 3700 50  0001 C CNN
	1    3250 3700
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 6231C84F
P 3100 3500
F 0 "R9" V 2893 3500 50  0000 C CNN
F 1 "820" V 2984 3500 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 3030 3500 50  0001 C CNN
F 3 "~" H 3100 3500 50  0001 C CNN
F 4 "C17837" V 3100 3500 50  0001 C CNN "LCSC"
	1    3100 3500
	0    1    1    0   
$EndComp
Text GLabel 3900 1650 0    50   Input ~ 0
PA3
Wire Wire Line
	4450 3500 3850 3500
Text GLabel 1850 2650 2    50   Output ~ 0
PA4
$EndSCHEMATC