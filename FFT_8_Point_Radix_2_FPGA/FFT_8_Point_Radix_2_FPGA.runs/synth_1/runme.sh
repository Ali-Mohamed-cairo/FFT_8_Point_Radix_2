#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
  PATH=P:/Programs_installed/Xilinx/SDK/2018.2/bin;P:/Programs_installed/Xilinx/Vivado/2018.2/ids_lite/ISE/bin/nt64;P:/Programs_installed/Xilinx/Vivado/2018.2/ids_lite/ISE/lib/nt64:P:/Programs_installed/Xilinx/Vivado/2018.2/bin
else
  PATH=P:/Programs_installed/Xilinx/SDK/2018.2/bin;P:/Programs_installed/Xilinx/Vivado/2018.2/ids_lite/ISE/bin/nt64;P:/Programs_installed/Xilinx/Vivado/2018.2/ids_lite/ISE/lib/nt64:P:/Programs_installed/Xilinx/Vivado/2018.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='O:/ADI_Internship/Assignments/FFT_Final_Project/FFT_8_Point_Radix_2_FPGA/FFT_8_Point_Radix_2_FPGA.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log FFT_8_Point_Radix_2_Wrapper.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source FFT_8_Point_Radix_2_Wrapper.tcl
