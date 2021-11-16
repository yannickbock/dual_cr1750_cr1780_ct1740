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
L Connector_Generic:Conn_01x07 J1
U 1 1 61068402
P 1000 1300
F 0 "J1" H 918 775 50  0001 C CNN
F 1 "Conn_01x07" H 918 866 50  0001 C CNN
F 2 "dual_ct1740_power-supply:Conn_01x07" H 1000 1300 50  0001 C CNN
F 3 "~" H 1000 1300 50  0001 C CNN
	1    1000 1300
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x05 J3
U 1 1 6106A153
P 10650 1450
F 0 "J3" H 10568 1025 50  0001 C CNN
F 1 "Conn_01x05" H 10568 1116 50  0001 C CNN
F 2 "dual_ct1740_power-supply:Conn_01x05" H 10650 1450 50  0001 C CNN
F 3 "~" H 10650 1450 50  0001 C CNN
	1    10650 1450
	1    0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x06 P201
U 1 1 6106BD84
P 1000 2450
F 0 "P201" H 1000 2800 50  0000 C CNN
F 1 "Conn_01x06" H 918 2776 50  0001 C CNN
F 2 "dual_ct1740_power-supply:Conn_01x06" H 1000 2450 50  0001 C CNN
F 3 "~" H 1000 2450 50  0001 C CNN
	1    1000 2450
	-1   0    0    -1  
$EndComp
$Comp
L Device:Fuse F203
U 1 1 6106F8B5
P 2450 1000
F 0 "F203" V 2253 1000 50  0000 C CNN
F 1 "T315mA" V 2344 1000 50  0000 C CNN
F 2 "Fuse_Holders_and_Fuses:Fuseholder5x20_horiz_open_inline_Type-I" V 2380 1000 50  0001 C CNN
F 3 "~" H 2450 1000 50  0001 C CNN
	1    2450 1000
	0    -1   1    0   
$EndComp
$Comp
L Device:Fuse F201
U 1 1 6106FF19
P 2450 1500
F 0 "F201" V 2253 1500 50  0000 C CNN
F 1 "T100mA" V 2344 1500 50  0000 C CNN
F 2 "Fuse_Holders_and_Fuses:Fuseholder5x20_horiz_open_inline_Type-I" V 2380 1500 50  0001 C CNN
F 3 "~" H 2450 1500 50  0001 C CNN
	1    2450 1500
	0    -1   1    0   
$EndComp
Text GLabel 1200 1600 2    31   Output ~ 0
~~3.3V-N
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 61087EAD
P 1000 4050
F 0 "H1" H 1000 4250 50  0000 C CNN
F 1 "MountingHole_Pad" H 1100 4008 50  0001 L CNN
F 2 "Mounting_Holes:MountingHole_4mm_Pad" H 1000 4050 50  0001 C CNN
F 3 "~" H 1000 4050 50  0001 C CNN
	1    1000 4050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 61088D16
P 1500 4050
F 0 "H2" H 1500 4250 50  0000 C CNN
F 1 "MountingHole_Pad" H 1600 4008 50  0001 L CNN
F 2 "Mounting_Holes:MountingHole_4mm_Pad" H 1500 4050 50  0001 C CNN
F 3 "~" H 1500 4050 50  0001 C CNN
	1    1500 4050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 6108B8D5
P 2000 4050
F 0 "H3" H 2000 4250 50  0000 C CNN
F 1 "MountingHole_Pad" H 2100 4008 50  0001 L CNN
F 2 "Mounting_Holes:MountingHole_4mm_Pad" H 2000 4050 50  0001 C CNN
F 3 "~" H 2000 4050 50  0001 C CNN
	1    2000 4050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 6108C275
P 2500 4050
F 0 "H4" H 2500 4250 50  0000 C CNN
F 1 "MountingHole_Pad" H 2600 4008 50  0001 L CNN
F 2 "Mounting_Holes:MountingHole_4mm_Pad" H 2500 4050 50  0001 C CNN
F 3 "~" H 2500 4050 50  0001 C CNN
	1    2500 4050
	1    0    0    -1  
$EndComp
NoConn ~ 1200 1300
$Comp
L Diode_Bridge:B380C800DM D21
U 1 1 610B6CF8
P 5650 2500
F 0 "D21" H 5050 2850 50  0000 L CNN
F 1 "B380C800DM" H 5050 2750 50  0000 L CNN
F 2 "Diodes_THT:Diode_Bridge_DIP-4_W7.62mm_P5.08mm" H 5800 2625 50  0001 L CNN
F 3 "https://www.vishay.com/docs/88533/800dm.pdf" H 5650 2500 50  0001 C CNN
	1    5650 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 610C2337
P 5200 2650
F 0 "#PWR0116" H 5200 2400 50  0001 C CNN
F 1 "GND" H 5200 2500 50  0000 C CNN
F 2 "" H 5200 2650 50  0001 C CNN
F 3 "" H 5200 2650 50  0001 C CNN
	1    5200 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2650 5200 2500
Wire Wire Line
	5200 2500 5350 2500
Wire Wire Line
	6100 2500 5950 2500
$Comp
L Device:CP C21
U 1 1 610C80AF
P 6100 2800
F 0 "C21" H 6218 2846 50  0000 L CNN
F 1 "2200µF" H 6218 2755 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D16.0mm_P7.50mm" H 6138 2650 50  0001 C CNN
F 3 "~" H 6100 2800 50  0001 C CNN
	1    6100 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 610C9BA1
P 6100 2950
F 0 "#PWR0118" H 6100 2700 50  0001 C CNN
F 1 "GND" H 6100 2800 50  0000 C CNN
F 2 "" H 6100 2950 50  0001 C CNN
F 3 "" H 6100 2950 50  0001 C CNN
	1    6100 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 2650 6100 2500
$Comp
L Regulator_Linear:L78L24_TO92 U51
U 1 1 610CD765
P 8350 4000
F 0 "U51" H 8350 4242 50  0000 C CNN
F 1 "L78L24" H 8350 4151 50  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 8350 4225 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/15/55/e5/aa/23/5b/43/fd/CD00000446.pdf/files/CD00000446.pdf/jcr:content/translations/en.CD00000446.pdf" H 8350 3950 50  0001 C CNN
	1    8350 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 610CFFB6
P 8350 4300
F 0 "#PWR0119" H 8350 4050 50  0001 C CNN
F 1 "GND" H 8350 4150 50  0000 C CNN
F 2 "" H 8350 4300 50  0001 C CNN
F 3 "" H 8350 4300 50  0001 C CNN
	1    8350 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C52
U 1 1 610D6EBD
P 8800 4300
F 0 "C52" H 8915 4346 50  0000 L CNN
F 1 "100nF" H 8915 4255 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 8838 4150 50  0001 C CNN
F 3 "~" H 8800 4300 50  0001 C CNN
	1    8800 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 610D9646
P 8800 4450
F 0 "#PWR0124" H 8800 4200 50  0001 C CNN
F 1 "GND" H 8800 4300 50  0000 C CNN
F 2 "" H 8800 4450 50  0001 C CNN
F 3 "" H 8800 4450 50  0001 C CNN
	1    8800 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 4000 8800 4000
Wire Wire Line
	8800 4000 8800 4150
$Comp
L Regulator_Linear:LM317_TO-220 U31
U 1 1 610E4B69
P 8350 1000
F 0 "U31" H 8350 1242 50  0000 C CNN
F 1 "LM317" H 8350 1151 50  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 8350 1250 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm317.pdf" H 8350 1000 50  0001 C CNN
	1    8350 1000
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM317_TO-220 U41
U 1 1 610E56BF
P 8350 2500
F 0 "U41" H 8350 2742 50  0000 C CNN
F 1 "LM317" H 8350 2651 50  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 8350 2750 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm317.pdf" H 8350 2500 50  0001 C CNN
	1    8350 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C31
U 1 1 610EAA5F
P 7900 1300
F 0 "C31" H 8015 1346 50  0000 L CNN
F 1 "100nF" H 8015 1255 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 7938 1150 50  0001 C CNN
F 3 "~" H 7900 1300 50  0001 C CNN
	1    7900 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C41
U 1 1 610EB9DB
P 7900 2800
F 0 "C41" H 8015 2846 50  0000 L CNN
F 1 "100nF" H 8015 2755 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 7938 2650 50  0001 C CNN
F 3 "~" H 7900 2800 50  0001 C CNN
	1    7900 2800
	1    0    0    -1  
$EndComp
Text GLabel 9400 1000 2    50   Output ~ 0
+14V
Text GLabel 9400 2500 2    50   Output ~ 0
+13V
$Comp
L Device:CP C32
U 1 1 610F294E
P 9250 1300
F 0 "C32" H 9368 1346 50  0000 L CNN
F 1 "33µF" H 9368 1255 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D5.0mm_P2.00mm" H 9288 1150 50  0001 C CNN
F 3 "~" H 9250 1300 50  0001 C CNN
	1    9250 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C42
U 1 1 610F410D
P 9250 2800
F 0 "C42" H 9368 2846 50  0000 L CNN
F 1 "33µF" H 9368 2755 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D5.0mm_P2.00mm" H 9288 2650 50  0001 C CNN
F 3 "~" H 9250 2800 50  0001 C CNN
	1    9250 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 610F95A6
P 8800 3350
F 0 "#PWR0125" H 8800 3100 50  0001 C CNN
F 1 "GND" H 8800 3200 50  0000 C CNN
F 2 "" H 8800 3350 50  0001 C CNN
F 3 "" H 8800 3350 50  0001 C CNN
	1    8800 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 610F9F04
P 8800 1850
F 0 "#PWR0126" H 8800 1600 50  0001 C CNN
F 1 "GND" H 8800 1700 50  0000 C CNN
F 2 "" H 8800 1850 50  0001 C CNN
F 3 "" H 8800 1850 50  0001 C CNN
	1    8800 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0127
U 1 1 610FA71B
P 7900 1450
F 0 "#PWR0127" H 7900 1200 50  0001 C CNN
F 1 "GND" H 7900 1300 50  0000 C CNN
F 2 "" H 7900 1450 50  0001 C CNN
F 3 "" H 7900 1450 50  0001 C CNN
	1    7900 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0128
U 1 1 610FB4B6
P 7900 2950
F 0 "#PWR0128" H 7900 2700 50  0001 C CNN
F 1 "GND" H 7900 2800 50  0000 C CNN
F 2 "" H 7900 2950 50  0001 C CNN
F 3 "" H 7900 2950 50  0001 C CNN
	1    7900 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 2950 8800 3000
Wire Wire Line
	8800 1450 8800 1500
Wire Wire Line
	8350 1500 8800 1500
Wire Wire Line
	8350 1300 8350 1500
Connection ~ 8800 1500
Wire Wire Line
	8800 1500 8800 1550
Wire Wire Line
	8800 3000 8350 3000
Wire Wire Line
	8350 3000 8350 2800
Connection ~ 8800 3000
Wire Wire Line
	8800 3000 8800 3050
Wire Wire Line
	8650 2500 8800 2500
Wire Wire Line
	8800 2500 8800 2650
Wire Wire Line
	8050 1000 7900 1000
Wire Wire Line
	7900 1000 7900 1150
Wire Wire Line
	8050 2500 7900 2500
Wire Wire Line
	7900 2500 7900 2650
Wire Wire Line
	8650 1000 8800 1000
Wire Wire Line
	8800 1000 8800 1150
Wire Wire Line
	8800 1000 9250 1000
Wire Wire Line
	9250 1000 9250 1150
Connection ~ 8800 1000
Wire Wire Line
	8800 2500 9250 2500
Wire Wire Line
	9250 2500 9250 2650
Connection ~ 8800 2500
$Comp
L power:GND #PWR0131
U 1 1 6110CA84
P 9250 1450
F 0 "#PWR0131" H 9250 1200 50  0001 C CNN
F 1 "GND" H 9250 1300 50  0000 C CNN
F 2 "" H 9250 1450 50  0001 C CNN
F 3 "" H 9250 1450 50  0001 C CNN
	1    9250 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0132
U 1 1 6110D3B7
P 9250 2950
F 0 "#PWR0132" H 9250 2700 50  0001 C CNN
F 1 "GND" H 9250 2800 50  0000 C CNN
F 2 "" H 9250 2950 50  0001 C CNN
F 3 "" H 9250 2950 50  0001 C CNN
	1    9250 2950
	1    0    0    -1  
$EndComp
Text GLabel 10450 1250 0    50   Input ~ 0
+14V
Text GLabel 10450 1550 0    50   Input ~ 0
+13V
$Comp
L Device:CP C11
U 1 1 611CC4F5
P 3950 4300
F 0 "C11" H 4068 4346 50  0000 L CNN
F 1 "1000µF" H 4068 4255 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D16.0mm_P7.50mm" H 3988 4150 50  0001 C CNN
F 3 "~" H 3950 4300 50  0001 C CNN
	1    3950 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0135
U 1 1 611DF5A6
P 3950 4450
F 0 "#PWR0135" H 3950 4200 50  0001 C CNN
F 1 "GND" H 3950 4300 50  0000 C CNN
F 2 "" H 3950 4450 50  0001 C CNN
F 3 "" H 3950 4450 50  0001 C CNN
	1    3950 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 4000 3950 4150
Wire Wire Line
	3800 4000 3950 4000
$Comp
L Connector_Generic:Conn_01x03 U12
U 1 1 6125C450
P 5200 4000
F 0 "U12" V 5350 4000 50  0000 C CNN
F 1 "Conn_01x03" H 5280 3901 50  0001 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 5200 4000 50  0001 C CNN
F 3 "~" H 5200 4000 50  0001 C CNN
	1    5200 4000
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 U11
U 1 1 6125E7C3
P 4750 4000
F 0 "U11" V 4900 4000 50  0000 C CNN
F 1 "Conn_01x03" H 4830 3901 50  0001 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 4750 4000 50  0001 C CNN
F 3 "~" H 4750 4000 50  0001 C CNN
	1    4750 4000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0133
U 1 1 6126255B
P 4750 4200
F 0 "#PWR0133" H 4750 3950 50  0001 C CNN
F 1 "GND" V 4750 4000 50  0000 C CNN
F 2 "" H 4750 4200 50  0001 C CNN
F 3 "" H 4750 4200 50  0001 C CNN
	1    4750 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0134
U 1 1 612638C5
P 5200 4200
F 0 "#PWR0134" H 5200 3950 50  0001 C CNN
F 1 "GND" V 5200 4000 50  0000 C CNN
F 2 "" H 5200 4200 50  0001 C CNN
F 3 "" H 5200 4200 50  0001 C CNN
	1    5200 4200
	1    0    0    -1  
$EndComp
$Comp
L Relay_SolidState:ASSR-1218 U1
U 1 1 6111D2EC
P 3850 1100
F 0 "U1" H 3850 1425 50  0000 C CNN
F 1 "AQY282EH" H 3850 1334 50  0000 C CNN
F 2 "Housings_DIP:DIP-4_W7.62mm" H 3650 900 50  0001 L CIN
F 3 "https://docs.broadcom.com/docs/AV02-0173EN" H 3850 1100 50  0001 L CNN
	1    3850 1100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1200 1000 2300 1000
$Comp
L power:GND #PWR0139
U 1 1 6112A86B
P 4300 1350
F 0 "#PWR0139" H 4300 1100 50  0001 C CNN
F 1 "GND" H 4300 1200 50  0000 C CNN
F 2 "" H 4300 1350 50  0001 C CNN
F 3 "" H 4300 1350 50  0001 C CNN
	1    4300 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 611329B7
P 4300 1000
F 0 "R1" V 4093 1000 50  0000 C CNN
F 1 "10k" V 4184 1000 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4230 1000 50  0001 C CNN
F 3 "~" H 4300 1000 50  0001 C CNN
	1    4300 1000
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 61738DED
P 2500 4150
F 0 "#PWR0108" H 2500 3900 50  0001 C CNN
F 1 "GND" H 2505 3977 50  0000 C CNN
F 2 "" H 2500 4150 50  0001 C CNN
F 3 "" H 2500 4150 50  0001 C CNN
	1    2500 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 617394B0
P 2000 4150
F 0 "#PWR0109" H 2000 3900 50  0001 C CNN
F 1 "GND" H 2005 3977 50  0000 C CNN
F 2 "" H 2000 4150 50  0001 C CNN
F 3 "" H 2000 4150 50  0001 C CNN
	1    2000 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 61739A64
P 1500 4150
F 0 "#PWR0110" H 1500 3900 50  0001 C CNN
F 1 "GND" H 1505 3977 50  0000 C CNN
F 2 "" H 1500 4150 50  0001 C CNN
F 3 "" H 1500 4150 50  0001 C CNN
	1    1500 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 6173A068
P 1000 4150
F 0 "#PWR0111" H 1000 3900 50  0001 C CNN
F 1 "GND" H 1005 3977 50  0000 C CNN
F 2 "" H 1000 4150 50  0001 C CNN
F 3 "" H 1000 4150 50  0001 C CNN
	1    1000 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 1350 4300 1200
Wire Wire Line
	4300 1200 4150 1200
$Comp
L Diode_Bridge:B380C800DM D11
U 1 1 6143A12E
P 3500 4000
F 0 "D11" H 2900 4350 50  0000 L CNN
F 1 "B380C800DM" H 2900 4250 50  0000 L CNN
F 2 "Diodes_THT:Diode_Bridge_DIP-4_W7.62mm_P5.08mm" H 3650 4125 50  0001 L CNN
F 3 "https://www.vishay.com/docs/88533/800dm.pdf" H 3500 4000 50  0001 C CNN
	1    3500 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 6148B15C
P 3050 4150
F 0 "#PWR0113" H 3050 3900 50  0001 C CNN
F 1 "GND" H 3055 3977 50  0000 C CNN
F 2 "" H 3050 4150 50  0001 C CNN
F 3 "" H 3050 4150 50  0001 C CNN
	1    3050 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 4000 3050 4000
Wire Wire Line
	3050 4000 3050 4150
Wire Wire Line
	3550 1200 1200 1200
$Comp
L Connector_Generic:Conn_01x03 U13
U 1 1 61526749
P 5650 4000
F 0 "U13" V 5800 4000 50  0000 C CNN
F 1 "Conn_01x03" V 5523 3812 50  0001 R CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 5650 4000 50  0001 C CNN
F 3 "~" H 5650 4000 50  0001 C CNN
	1    5650 4000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 6152B629
P 5650 4200
F 0 "#PWR0107" H 5650 3950 50  0001 C CNN
F 1 "GND" V 5650 4000 50  0000 C CNN
F 2 "" H 5650 4200 50  0001 C CNN
F 3 "" H 5650 4200 50  0001 C CNN
	1    5650 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R42
U 1 1 610F5DC8
P 8800 3200
F 0 "R42" H 8730 3154 50  0000 R CNN
F 1 "2.55k" H 8730 3245 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" V 8730 3200 50  0001 C CNN
F 3 "~" H 8800 3200 50  0001 C CNN
	1    8800 3200
	-1   0    0    1   
$EndComp
$Comp
L Device:R R41
U 1 1 610F5363
P 8800 2800
F 0 "R41" H 8870 2846 50  0000 L CNN
F 1 "270" H 8870 2755 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" V 8730 2800 50  0001 C CNN
F 3 "~" H 8800 2800 50  0001 C CNN
	1    8800 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R32
U 1 1 610F19DF
P 8800 1700
F 0 "R32" H 8730 1654 50  0000 R CNN
F 1 "2.74k" H 8730 1745 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" V 8730 1700 50  0001 C CNN
F 3 "~" H 8800 1700 50  0001 C CNN
	1    8800 1700
	-1   0    0    1   
$EndComp
$Comp
L Device:R R31
U 1 1 610EE323
P 8800 1300
F 0 "R31" H 8870 1346 50  0000 L CNN
F 1 "270" H 8870 1255 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" V 8730 1300 50  0001 C CNN
F 3 "~" H 8800 1300 50  0001 C CNN
	1    8800 1300
	1    0    0    -1  
$EndComp
Text GLabel 4450 1000 2    50   Input ~ 0
+28V
Text GLabel 6250 2500 2    50   Output ~ 0
+28V
Wire Wire Line
	6250 2500 6100 2500
Connection ~ 6100 2500
Text GLabel 10450 1650 0    50   Input ~ 0
+24V
Text GLabel 4100 4000 2    50   Output ~ 0
+35V
Wire Wire Line
	4100 4000 3950 4000
Connection ~ 3950 4000
Text GLabel 4650 4200 3    50   Input ~ 0
+35V
Text GLabel 5100 4200 3    50   Input ~ 0
+35V
Text GLabel 5550 4200 3    50   Input ~ 0
+35V
Text GLabel 5750 4200 3    50   Output ~ 0
-18V
Text GLabel 7750 1000 0    50   Input ~ 0
+28V
Wire Wire Line
	7750 1000 7900 1000
Connection ~ 7900 1000
Text GLabel 7750 2500 0    50   Input ~ 0
+28V
Wire Wire Line
	7750 2500 7900 2500
Connection ~ 7900 2500
Wire Wire Line
	9400 1000 9250 1000
Connection ~ 9250 1000
Wire Wire Line
	9400 2500 9250 2500
Connection ~ 9250 2500
Text GLabel 7750 4000 0    50   Input ~ 0
+28V
Text GLabel 8950 4000 2    50   Output ~ 0
+24V
Wire Wire Line
	8950 4000 8800 4000
Connection ~ 8800 4000
$Comp
L Device:C C51
U 1 1 61917DA5
P 7900 4300
F 0 "C51" H 8015 4346 50  0000 L CNN
F 1 "330nF" H 8015 4255 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 7938 4150 50  0001 C CNN
F 3 "~" H 7900 4300 50  0001 C CNN
	1    7900 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 4000 7900 4000
Wire Wire Line
	7900 4150 7900 4000
Connection ~ 7900 4000
Wire Wire Line
	7900 4000 8050 4000
$Comp
L power:GND #PWR0101
U 1 1 6191BF50
P 7900 4450
F 0 "#PWR0101" H 7900 4200 50  0001 C CNN
F 1 "GND" H 7900 4300 50  0000 C CNN
F 2 "" H 7900 4450 50  0001 C CNN
F 3 "" H 7900 4450 50  0001 C CNN
	1    7900 4450
	1    0    0    -1  
$EndComp
Text GLabel 4850 4200 3    50   Output ~ 0
+15V
Text GLabel 1200 2450 2    50   Input ~ 0
+15V
Text GLabel 1200 2550 2    50   Input ~ 0
-18V
$Comp
L Device:Fuse F202
U 1 1 6106DA20
P 2450 2000
F 0 "F202" V 2253 2000 50  0000 C CNN
F 1 "T63mA" V 2344 2000 50  0000 C CNN
F 2 "Fuse_Holders_and_Fuses:Fuseholder5x20_horiz_open_inline_Type-I" V 2380 2000 50  0001 C CNN
F 3 "~" H 2450 2000 50  0001 C CNN
	1    2450 2000
	0    -1   1    0   
$EndComp
Wire Wire Line
	2150 1400 2150 1500
Wire Wire Line
	2150 1500 2300 1500
Wire Wire Line
	1200 1400 2150 1400
Wire Wire Line
	2300 2000 2000 2000
Wire Wire Line
	2000 2000 2000 1500
Wire Wire Line
	2000 1500 1200 1500
Text GLabel 1200 2750 2    31   Input ~ 0
~~3.3V-N
Text GLabel 1200 2650 2    31   Input ~ 0
~~3.3V-L
Text GLabel 2600 2000 2    31   Output ~ 0
~~3.3V-L
Text GLabel 2600 1000 2    31   Output ~ 0
~~20V-L
Text GLabel 5650 2800 3    31   Input ~ 0
~~20V-L
Text GLabel 5650 2200 1    31   Input ~ 0
~~20V-N
Text GLabel 1200 1100 2    31   Output ~ 0
~~20V-N
Text GLabel 2600 1500 2    31   Output ~ 0
~~25V-L
Text GLabel 3500 3700 1    31   Input ~ 0
~~25V-L
Text GLabel 3500 4300 3    31   Input ~ 0
~~25V-N
Text GLabel 3550 1000 0    31   Output ~ 0
~~25V-N
$Comp
L power:GND #PWR0102
U 1 1 619F9CB9
P 1200 2250
F 0 "#PWR0102" H 1200 2000 50  0001 C CNN
F 1 "GND" V 1200 2050 50  0000 C CNN
F 2 "" H 1200 2250 50  0001 C CNN
F 3 "" H 1200 2250 50  0001 C CNN
	1    1200 2250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 619FAEC2
P 10450 1350
F 0 "#PWR0104" H 10450 1100 50  0001 C CNN
F 1 "GND" V 10450 1150 50  0000 C CNN
F 2 "" H 10450 1350 50  0001 C CNN
F 3 "" H 10450 1350 50  0001 C CNN
	1    10450 1350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 619FBB7A
P 10450 1450
F 0 "#PWR0105" H 10450 1200 50  0001 C CNN
F 1 "GND" V 10450 1250 50  0000 C CNN
F 2 "" H 10450 1450 50  0001 C CNN
F 3 "" H 10450 1450 50  0001 C CNN
	1    10450 1450
	0    1    1    0   
$EndComp
Text GLabel 1200 2350 2    50   Input ~ 0
+5V
Text GLabel 5300 4200 3    50   Output ~ 0
+5V
$EndSCHEMATC
