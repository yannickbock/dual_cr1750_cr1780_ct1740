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
L Connector_Generic:Conn_01x03 J1
U 1 1 617FE134
P 1150 1500
F 0 "J1" V 1114 1680 50  0001 L CNN
F 1 "Conn_01x03" V 1023 1680 50  0001 L CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x03_Pitch2.54mm" H 1150 1500 50  0001 C CNN
F 3 "~" H 1150 1500 50  0001 C CNN
	1    1150 1500
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 618067E3
P 1150 1700
F 0 "#PWR0110" H 1150 1450 50  0001 C CNN
F 1 "GND" V 1150 1500 50  0000 C CNN
F 2 "" H 1150 1700 50  0001 C CNN
F 3 "" H 1150 1700 50  0001 C CNN
	1    1150 1700
	1    0    0    -1  
$EndComp
Text GLabel 1050 1700 3    50   Input ~ 0
+35V
Text GLabel 1250 1700 3    50   Output ~ 0
-18V
$Comp
L Converter_DCDC:TC7662AxPA U2
U 1 1 618DA0A9
P 5100 1800
F 0 "U2" H 5100 2800 50  0000 C CNN
F 1 "TC7662AxPA" H 5100 2700 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm" H 5200 1700 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21468B.pdf" H 5200 1700 50  0001 C CNN
	1    5100 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 618DE7A0
P 5100 2300
F 0 "#PWR0101" H 5100 2050 50  0001 C CNN
F 1 "GND" H 5100 2150 50  0000 C CNN
F 2 "" H 5100 2300 50  0001 C CNN
F 3 "" H 5100 2300 50  0001 C CNN
	1    5100 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C3
U 1 1 618E050C
P 5650 1900
F 0 "C3" H 5768 1946 50  0000 L CNN
F 1 "22µF" H 5768 1855 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D5.0mm_P2.00mm" H 5688 1750 50  0001 C CNN
F 3 "~" H 5650 1900 50  0001 C CNN
	1    5650 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 1700 5650 1700
Wire Wire Line
	5650 1700 5650 1750
Wire Wire Line
	5500 2100 5650 2100
Wire Wire Line
	5650 2100 5650 2050
$Comp
L power:GND #PWR0102
U 1 1 618E4E6F
P 6100 1950
F 0 "#PWR0102" H 6100 1700 50  0001 C CNN
F 1 "GND" H 6100 1800 50  0000 C CNN
F 2 "" H 6100 1950 50  0001 C CNN
F 3 "" H 6100 1950 50  0001 C CNN
	1    6100 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 1500 6100 1650
Wire Wire Line
	5500 1500 6100 1500
$Comp
L Device:D_Zener D1
U 1 1 618E9C93
P 3150 1950
F 0 "D1" V 3104 2030 50  0000 L CNN
F 1 "7.5V" V 3195 2030 50  0000 L CNN
F 2 "Diodes_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3150 1950 50  0001 C CNN
F 3 "~" H 3150 1950 50  0001 C CNN
	1    3150 1950
	0    1    1    0   
$EndComp
Text GLabel 2550 1500 0    50   Input ~ 0
+35V
Text GLabel 3750 1500 2    50   Output ~ 0
+19V
$Comp
L power:GND #PWR0103
U 1 1 618EF0B3
P 3150 2100
F 0 "#PWR0103" H 3150 1850 50  0001 C CNN
F 1 "GND" H 3150 1950 50  0000 C CNN
F 2 "" H 3150 2100 50  0001 C CNN
F 3 "" H 3150 2100 50  0001 C CNN
	1    3150 2100
	1    0    0    -1  
$EndComp
Text GLabel 5100 1300 1    50   Input ~ 0
+19V
Text GLabel 6250 1500 2    50   Output ~ 0
-18V
Wire Wire Line
	6100 1500 6250 1500
Connection ~ 6100 1500
$Comp
L Device:CP C4
U 1 1 618F63F8
P 6100 1800
F 0 "C4" H 5982 1754 50  0000 R CNN
F 1 "100µF" H 5982 1845 50  0000 R CNN
F 2 "Capacitors_THT:CP_Radial_D6.3mm_P2.50mm" H 6138 1650 50  0001 C CNN
F 3 "~" H 6100 1800 50  0001 C CNN
	1    6100 1800
	-1   0    0    1   
$EndComp
$Comp
L Regulator_Linear:MC78L15_TO92 U1
U 1 1 618F1C95
P 3150 1500
F 0 "U1" H 3150 1742 50  0000 C CNN
F 1 "MC78L12_TO92" H 3150 1651 50  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-92_Molded_Narrow_Oval" H 3150 1725 50  0001 C CIN
F 3 "https://www.onsemi.com/pub/Collateral/MC78L00A-D.PDF" H 3150 1450 50  0001 C CNN
	1    3150 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 618FEB32
P 2700 1800
F 0 "C1" H 2815 1846 50  0000 L CNN
F 1 "330nF" H 2815 1755 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 2738 1650 50  0001 C CNN
F 3 "~" H 2700 1800 50  0001 C CNN
	1    2700 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 618FFC1F
P 3600 1800
F 0 "C2" H 3715 1846 50  0000 L CNN
F 1 "100nF" H 3715 1755 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 3638 1650 50  0001 C CNN
F 3 "~" H 3600 1800 50  0001 C CNN
	1    3600 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1500 3600 1500
Wire Wire Line
	3600 1500 3600 1650
Wire Wire Line
	2850 1500 2700 1500
Wire Wire Line
	2700 1500 2700 1650
$Comp
L power:GND #PWR0104
U 1 1 61901910
P 2700 1950
F 0 "#PWR0104" H 2700 1700 50  0001 C CNN
F 1 "GND" H 2700 1800 50  0000 C CNN
F 2 "" H 2700 1950 50  0001 C CNN
F 3 "" H 2700 1950 50  0001 C CNN
	1    2700 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 61901DD7
P 3600 1950
F 0 "#PWR0105" H 3600 1700 50  0001 C CNN
F 1 "GND" H 3600 1800 50  0000 C CNN
F 2 "" H 3600 1950 50  0001 C CNN
F 3 "" H 3600 1950 50  0001 C CNN
	1    3600 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 1500 2700 1500
Connection ~ 2700 1500
Wire Wire Line
	3750 1500 3600 1500
Connection ~ 3600 1500
$EndSCHEMATC
