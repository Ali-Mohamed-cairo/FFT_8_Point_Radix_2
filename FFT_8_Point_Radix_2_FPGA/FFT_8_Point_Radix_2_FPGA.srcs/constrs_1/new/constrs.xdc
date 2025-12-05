## ----------------------------------------------------------------------------
## FMC Expansion Connector - Bank 34
## ---------------------------------------------------------------------------- 
set_property PACKAGE_PIN L19 [get_ports {IN0_Real}];  # "FMC-CLK0_N"
set_property PACKAGE_PIN L18 [get_ports {IN0_Img }];  # "FMC-CLK0_P"
set_property PACKAGE_PIN M20 [get_ports {IN1_Real}];  # "FMC-LA00_CC_N"
set_property PACKAGE_PIN M19 [get_ports {IN1_Img }];  # "FMC-LA00_CC_P"
set_property PACKAGE_PIN N20 [get_ports {IN2_Real}];  # "FMC-LA01_CC_N"
set_property PACKAGE_PIN N19 [get_ports {IN2_Img }];  # "FMC-LA01_CC_P" - corrected 6/6/16 GE
set_property PACKAGE_PIN P18 [get_ports {IN3_Real}];  # "FMC-LA02_N"
set_property PACKAGE_PIN P17 [get_ports {IN3_Img }];  # "FMC-LA02_P"
set_property PACKAGE_PIN P22 [get_ports {IN4_Real}];  # "FMC-LA03_N"
set_property PACKAGE_PIN N22 [get_ports {IN4_Img }];  # "FMC-LA03_P"
set_property PACKAGE_PIN M22 [get_ports {IN5_Real}];  # "FMC-LA04_N"
set_property PACKAGE_PIN M21 [get_ports {IN5_Img }];  # "FMC-LA04_P"
set_property PACKAGE_PIN K18 [get_ports {IN6_Real}];  # "FMC-LA05_N"
set_property PACKAGE_PIN J18 [get_ports {IN6_Img }];  # "FMC-LA05_P"
set_property PACKAGE_PIN L22 [get_ports {IN7_Real}];  # "FMC-LA06_N"
set_property PACKAGE_PIN L21 [get_ports {IN7_Img }];  # "FMC-LA06_P"
set_property PACKAGE_PIN T17 [get_ports {Load}];  # "FMC-LA07_N"

set_property PACKAGE_PIN T16 [get_ports {OUT0_Real}];  # "FMC-LA07_P"
set_property PACKAGE_PIN J22 [get_ports {OUT0_Img }];  # "FMC-LA08_N"
set_property PACKAGE_PIN J21 [get_ports {OUT1_Real}];  # "FMC-LA08_P"
set_property PACKAGE_PIN R21 [get_ports {OUT1_Img }];  # "FMC-LA09_N"
set_property PACKAGE_PIN R20 [get_ports {OUT2_Real}];  # "FMC-LA09_P"
set_property PACKAGE_PIN T19 [get_ports {OUT2_Img }];  # "FMC-LA10_N"
set_property PACKAGE_PIN R19 [get_ports {OUT3_Real}];  # "FMC-LA10_P"
set_property PACKAGE_PIN N18 [get_ports {OUT3_Img }];  # "FMC-LA11_N"
set_property PACKAGE_PIN N17 [get_ports {OUT4_Real}];  # "FMC-LA11_P"
set_property PACKAGE_PIN P21 [get_ports {OUT4_Img }];  # "FMC-LA12_N"
set_property PACKAGE_PIN P20 [get_ports {OUT5_Real}];  # "FMC-LA12_P"
set_property PACKAGE_PIN M17 [get_ports {OUT5_Img }];  # "FMC-LA13_N"
set_property PACKAGE_PIN L17 [get_ports {OUT6_Real}];  # "FMC-LA13_P"
set_property PACKAGE_PIN K20 [get_ports {OUT6_Img }];  # "FMC-LA14_N"
set_property PACKAGE_PIN K19 [get_ports {OUT7_Real}];  # "FMC-LA14_P"
set_property PACKAGE_PIN J17 [get_ports {OUT7_Img }];  # "FMC-LA15_N""

## ----------------------------------------------------------------------------
## User DIP Switches - Bank 35
## ---------------------------------------------------------------------------- 
set_property PACKAGE_PIN F22 [get_ports {RST}];  # "SW0"


# ----------------------------------------------------------------------------
# Clock Source - Bank 13
# ---------------------------------------------------------------------------- 
set_property PACKAGE_PIN Y9 [get_ports {CLK}];  # "CLK"

# ----------------------------------------------------------------------------
# Timing cons
# ---------------------------------------------------------------------------- 
create_clock -name CLK -period 10 [get_ports CLK]


# Set the bank voltage for IO Bank 34 to 1.8V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 34]];
# set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 34]];
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 34]];

# Set the bank voltage for IO Bank 35 to 1.8V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 35]];
# set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 35]];
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 35]];

# Note that the bank voltage for IO Bank 13 is fixed to 3.3V on ZedBoard. 
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]];