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
L Connector_Generic:Conn_01x20 J1
U 1 1 60F83C02
P 1900 1450
F 0 "J1" V 2117 1396 50  0001 C CNN
F 1 "Display" V 2050 1400 50  0000 C CNN
F 2 "dual_cr1750_display:DISPLAY_01x20" H 1900 1450 50  0001 C CNN
F 3 "~" H 1900 1450 50  0001 C CNN
	1    1900 1450
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x16 P602
U 1 1 60F85363
P 1800 2650
F 0 "P602" V 1925 2596 50  0000 C CNN
F 1 "Conn_01x16" V 2016 2596 50  0001 C CNN
F 2 "dual_cr1750_display:Conn_01x16" H 1800 2650 50  0001 C CNN
F 3 "~" H 1800 2650 50  0001 C CNN
	1    1800 2650
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 60F87B0C
P 1000 3000
F 0 "H2" H 1100 3046 50  0000 L CNN
F 1 "MountingHole" H 1100 2955 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_2.2mm_M2" H 1000 3000 50  0001 C CNN
F 3 "~" H 1000 3000 50  0001 C CNN
	1    1000 3000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 60F88152
P 1000 3250
F 0 "H1" H 1100 3296 50  0000 L CNN
F 1 "MountingHole" H 1100 3205 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_2.2mm_M2" H 1000 3250 50  0001 C CNN
F 3 "~" H 1000 3250 50  0001 C CNN
	1    1000 3250
	1    0    0    -1  
$EndComp
Text GLabel 1000 1650 3    50   Input ~ 0
D1
Text GLabel 1100 1650 3    50   Input ~ 0
D2
Text GLabel 1200 1650 3    50   Input ~ 0
D3
Text GLabel 1300 1650 3    50   Input ~ 0
D4
Text GLabel 1400 1650 3    50   Input ~ 0
D5
Text GLabel 1500 1650 3    50   Input ~ 0
D6
Text GLabel 1600 1650 3    50   Input ~ 0
D7
Text GLabel 1700 1650 3    50   Input ~ 0
D8
Text GLabel 1800 1650 3    50   Input ~ 0
D9
Text GLabel 1900 1650 3    50   Input ~ 0
D10
Text GLabel 2000 1650 3    50   Input ~ 0
D11
Text GLabel 2100 1650 3    50   Input ~ 0
D12
Text GLabel 2200 1650 3    50   Input ~ 0
D13
Text GLabel 2300 1650 3    50   Input ~ 0
D14
Text GLabel 2400 1650 3    50   Input ~ 0
D15
Text GLabel 2500 1650 3    50   Input ~ 0
D16
Text GLabel 2600 1650 3    50   Input ~ 0
D17
Text GLabel 2700 1650 3    50   Input ~ 0
D18
Text GLabel 2800 1650 3    50   Input ~ 0
D19
Text GLabel 2900 1650 3    50   Input ~ 0
D20
Text GLabel 1600 5300 2    50   Input ~ 0
D17
Text GLabel 1600 5200 2    50   Input ~ 0
D16
Text GLabel 1600 5100 2    50   Input ~ 0
D14
Text GLabel 1600 5000 2    50   Input ~ 0
D13
Text GLabel 1950 4400 2    50   Input ~ 0
D3
Text GLabel 1600 3800 2    50   Input ~ 0
D1
Text GLabel 1600 3900 2    50   Input ~ 0
D20
Text GLabel 1600 4700 2    50   Input ~ 0
D5
Text GLabel 1600 4800 2    50   Input ~ 0
D7
Text GLabel 1600 4900 2    50   Input ~ 0
D8
Text GLabel 1600 4000 2    50   Input ~ 0
D10
Text GLabel 1600 4100 2    50   Input ~ 0
D18
Text GLabel 1600 4200 2    50   Input ~ 0
D15
Text GLabel 1600 4400 2    50   Input ~ 0
D9
Text GLabel 1600 4500 2    50   Input ~ 0
D6
$Comp
L Transistor_BJT:2SC1815 T702
U 1 1 60F91C0A
P 5250 2700
F 0 "T702" V 5578 2700 50  0000 C CNN
F 1 "2SC945" V 5487 2700 50  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 5450 2625 50  0001 L CIN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Toshiba%20PDFs/2SC1815.pdf" H 5250 2700 50  0001 L CNN
	1    5250 2700
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_BJT:2SC1815 T701
U 1 1 60F92334
P 6250 2700
F 0 "T701" V 6578 2700 50  0000 C CNN
F 1 "2SC945" V 6487 2700 50  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 6450 2625 50  0001 L CIN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Toshiba%20PDFs/2SC1815.pdf" H 6250 2700 50  0001 L CNN
	1    6250 2700
	0    1    -1   0   
$EndComp
$Comp
L Device:D_Small D701
U 1 1 60F92ED3
P 4700 2800
F 0 "D701" V 4654 2870 50  0000 L CNN
F 1 "IS1588" V 4745 2870 50  0000 L CNN
F 2 "Diodes_THT:D_DO-35_SOD27_P7.62mm_Horizontal" V 4700 2800 50  0001 C CNN
F 3 "~" V 4700 2800 50  0001 C CNN
	1    4700 2800
	0    1    1    0   
$EndComp
$Comp
L Device:D_Small D702
U 1 1 60F93C2B
P 4700 2400
F 0 "D702" V 4746 2330 50  0000 R CNN
F 1 "IS1588" V 4655 2330 50  0000 R CNN
F 2 "Diodes_THT:D_DO-35_SOD27_P7.62mm_Horizontal" V 4700 2400 50  0001 C CNN
F 3 "~" V 4700 2400 50  0001 C CNN
	1    4700 2400
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Zener_Small D703
U 1 1 60F945EA
P 5900 2200
F 0 "D703" V 5854 2270 50  0000 L CNN
F 1 "HZ4C-3" V 5945 2270 50  0000 L CNN
F 2 "Diodes_THT:D_DO-35_SOD27_P7.62mm_Horizontal" V 5900 2200 50  0001 C CNN
F 3 "~" V 5900 2200 50  0001 C CNN
	1    5900 2200
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R701
U 1 1 60F95637
P 5550 3150
F 0 "R701" V 5746 3150 50  0000 C CNN
F 1 "8,2k" V 5655 3150 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 5550 3150 50  0001 C CNN
F 3 "~" H 5550 3150 50  0001 C CNN
	1    5550 3150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R706
U 1 1 60F95C49
P 6250 1250
F 0 "R706" V 6054 1250 50  0000 C CNN
F 1 "560" V 6145 1250 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 6250 1250 50  0001 C CNN
F 3 "~" H 6250 1250 50  0001 C CNN
	1    6250 1250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R707
U 1 1 60F964A1
P 6250 1600
F 0 "R707" V 6054 1600 50  0000 C CNN
F 1 "560" V 6145 1600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 6250 1600 50  0001 C CNN
F 3 "~" H 6250 1600 50  0001 C CNN
	1    6250 1600
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R702
U 1 1 60F9679A
P 6250 1950
F 0 "R702" V 6054 1950 50  0000 C CNN
F 1 "8,2k" V 6145 1950 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 6250 1950 50  0001 C CNN
F 3 "~" H 6250 1950 50  0001 C CNN
	1    6250 1950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R703
U 1 1 60F96AEF
P 5950 3150
F 0 "R703" V 5754 3150 50  0000 C CNN
F 1 "56k" V 5845 3150 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 5950 3150 50  0001 C CNN
F 3 "~" H 5950 3150 50  0001 C CNN
	1    5950 3150
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R704
U 1 1 60F96E0F
P 5250 3500
F 0 "R704" H 5309 3546 50  0000 L CNN
F 1 "56k" H 5309 3455 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 5250 3500 50  0001 C CNN
F 3 "~" H 5250 3500 50  0001 C CNN
	1    5250 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R705
U 1 1 60F97156
P 7000 2600
F 0 "R705" V 6804 2600 50  0000 C CNN
F 1 "5,6k" V 6895 2600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 7000 2600 50  0001 C CNN
F 3 "~" H 7000 2600 50  0001 C CNN
	1    7000 2600
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C701
U 1 1 60F9E1DF
P 6550 2750
F 0 "C701" H 6642 2796 50  0000 L CNN
F 1 "40nF" H 6642 2705 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D10.0mm_W2.5mm_P5.00mm" H 6550 2750 50  0001 C CNN
F 3 "~" H 6550 2750 50  0001 C CNN
	1    6550 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 2500 4700 2600
Wire Wire Line
	5050 2600 4700 2600
Connection ~ 4700 2600
Wire Wire Line
	4700 2600 4700 2700
Wire Wire Line
	6450 2600 6550 2600
Wire Wire Line
	6550 2600 6550 2650
Wire Wire Line
	6550 2850 6550 2900
Wire Wire Line
	6550 2900 6250 2900
Wire Wire Line
	6050 3150 6250 3150
Wire Wire Line
	6250 3150 6250 2900
Connection ~ 6250 2900
Wire Wire Line
	5450 3150 4700 3150
Wire Wire Line
	4700 3150 4700 2900
Wire Wire Line
	5250 2900 5250 3400
Wire Wire Line
	5650 3150 5750 3150
Connection ~ 6550 2600
Wire Wire Line
	5900 2300 5900 2600
Connection ~ 5900 2600
Wire Wire Line
	5900 2600 6050 2600
Wire Wire Line
	6150 1600 5900 1600
Wire Wire Line
	5900 1600 5900 2100
Wire Wire Line
	6350 1950 6550 1950
Wire Wire Line
	6550 1950 6550 2600
Wire Wire Line
	6150 1950 4700 1950
Wire Wire Line
	4700 1950 4700 2300
Text GLabel 1100 2450 1    50   Input ~ 0
P602_2
Text GLabel 1000 2450 1    50   Input ~ 0
P602_1
Text GLabel 1200 2450 1    50   Input ~ 0
P602_3
Text GLabel 1300 2450 1    50   Input ~ 0
P602_4
Text GLabel 1400 2450 1    50   Input ~ 0
P602_5
Text GLabel 1500 2450 1    50   Input ~ 0
P602_6
Text GLabel 1600 2450 1    50   Input ~ 0
P602_7
Text GLabel 1700 2450 1    50   Input ~ 0
P602_8
Text GLabel 1800 2450 1    50   Input ~ 0
P602_9
Text GLabel 1900 2450 1    50   Input ~ 0
P602_10
Text GLabel 2000 2450 1    50   Input ~ 0
P602_11
Text GLabel 2100 2450 1    50   Input ~ 0
P602_12
Text GLabel 2200 2450 1    50   Input ~ 0
P602_13
Text GLabel 2300 2450 1    50   Input ~ 0
P602_14
Text GLabel 2400 2450 1    50   Input ~ 0
P602_15
Text GLabel 2500 2450 1    50   Input ~ 0
P602_16
Text GLabel 1450 3900 0    50   Input ~ 0
P602_2
Text GLabel 1450 3800 0    50   Input ~ 0
P602_1
Text GLabel 1450 4000 0    50   Input ~ 0
P602_3
Text GLabel 1450 4100 0    50   Input ~ 0
P602_4
Text GLabel 1450 4200 0    50   Input ~ 0
P602_5
Text GLabel 1450 4300 0    50   Input ~ 0
P602_6
Text GLabel 1450 4400 0    50   Input ~ 0
P602_7
Text GLabel 1450 4500 0    50   Input ~ 0
P602_8
Text GLabel 1450 4600 0    50   Input ~ 0
P602_9
Text GLabel 1450 4700 0    50   Input ~ 0
P602_10
Text GLabel 1450 4800 0    50   Input ~ 0
P602_11
Text GLabel 1450 4900 0    50   Input ~ 0
P602_12
Text GLabel 1450 5000 0    50   Input ~ 0
P602_13
Text GLabel 1450 5100 0    50   Input ~ 0
P602_14
Text GLabel 1450 5200 0    50   Input ~ 0
P602_15
Text GLabel 1450 5300 0    50   Input ~ 0
P602_16
Text GLabel 4550 3150 0    50   Input ~ 0
D4
Wire Wire Line
	4550 3150 4700 3150
Connection ~ 4700 3150
Text GLabel 4550 1950 0    50   Input ~ 0
D2
Wire Wire Line
	4550 1950 4700 1950
Connection ~ 4700 1950
Text GLabel 4550 1700 0    50   Input ~ 0
P602_9
Wire Wire Line
	5450 2600 5600 2600
Wire Wire Line
	5600 2600 5600 1700
Wire Wire Line
	4550 1700 5600 1700
Connection ~ 5600 2600
Wire Wire Line
	5600 2600 5900 2600
Text GLabel 4550 4000 0    50   Input ~ 0
P602_3
Wire Wire Line
	4550 4000 5750 4000
Wire Wire Line
	5750 4000 5750 3150
Connection ~ 5750 3150
Wire Wire Line
	5750 3150 5850 3150
Text GLabel 6500 1600 2    50   Input ~ 0
P602_2
Wire Wire Line
	6150 1250 5900 1250
Wire Wire Line
	5900 1250 5900 1600
Connection ~ 5900 1600
Text GLabel 6500 1250 2    50   Input ~ 0
P602_1
Wire Wire Line
	6500 1250 6350 1250
Wire Wire Line
	6500 1600 6350 1600
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 60FE6BD3
P 7450 2600
F 0 "J4" H 7530 2642 50  0000 L CNN
F 1 "P804_7" H 7530 2551 50  0000 L CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 7450 2600 50  0001 C CNN
F 3 "~" H 7450 2600 50  0001 C CNN
	1    7450 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 2600 7100 2600
Wire Wire Line
	6900 2600 6550 2600
$Comp
L Connector_Generic:Conn_01x01 J3
U 1 1 60FEAA69
P 4350 3800
F 0 "J3" H 4268 3575 50  0000 C CNN
F 1 "P804_8" H 4268 3666 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 4350 3800 50  0001 C CNN
F 3 "~" H 4350 3800 50  0001 C CNN
	1    4350 3800
	-1   0    0    1   
$EndComp
Wire Wire Line
	4550 3800 5250 3800
Wire Wire Line
	5250 3800 5250 3600
$Comp
L Connector_Generic:Conn_01x01 J5
U 1 1 60FED0A6
P 2800 2650
F 0 "J5" H 2900 2650 50  0000 L CNN
F 1 "Conn_01x01" H 2880 2601 50  0001 L CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 2800 2650 50  0001 C CNN
F 3 "~" H 2800 2650 50  0001 C CNN
	1    2800 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	1450 3800 1600 3800
Wire Wire Line
	1450 3900 1600 3900
Wire Wire Line
	1450 4000 1600 4000
Wire Wire Line
	1450 4100 1600 4100
Wire Wire Line
	1450 4200 1600 4200
Wire Wire Line
	1450 4400 1600 4400
Wire Wire Line
	1450 4500 1600 4500
Wire Wire Line
	1450 4700 1600 4700
Wire Wire Line
	1450 4800 1600 4800
Wire Wire Line
	1450 4900 1600 4900
Wire Wire Line
	1450 5000 1600 5000
Wire Wire Line
	1450 5100 1600 5100
Wire Wire Line
	1450 5200 1600 5200
Wire Wire Line
	1450 5300 1600 5300
Text GLabel 1950 4200 2    50   Input ~ 0
D12
Wire Wire Line
	1850 4300 1850 4200
Wire Wire Line
	1850 4200 1950 4200
Wire Wire Line
	1450 4300 1850 4300
Wire Wire Line
	1850 4300 1850 4400
Wire Wire Line
	1850 4400 1950 4400
Connection ~ 1850 4300
$Comp
L Connector_Generic:Conn_01x01 J6
U 1 1 61050FD4
P 3050 2650
F 0 "J6" H 3150 2650 50  0000 L CNN
F 1 "Conn_01x01" H 3130 2601 50  0001 L CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 3050 2650 50  0001 C CNN
F 3 "~" H 3050 2650 50  0001 C CNN
	1    3050 2650
	0    1    1    0   
$EndComp
NoConn ~ 2800 2450
NoConn ~ 3050 2450
$EndSCHEMATC
