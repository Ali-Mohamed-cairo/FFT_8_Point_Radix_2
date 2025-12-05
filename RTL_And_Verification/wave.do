onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /FFT_8_Point_Radix_2_tb/CLK_tb
add wave -noupdate /FFT_8_Point_Radix_2_tb/RST_tb
add wave -noupdate /FFT_8_Point_Radix_2_tb/nSeed
add wave -noupdate /FFT_8_Point_Radix_2_tb/nseed
add wave -noupdate -expand -group Sample_Inputs /FFT_8_Point_Radix_2_tb/Mem_IN
add wave -noupdate -expand -group Sample_Inputs /FFT_8_Point_Radix_2_tb/SignalSample_0_Img_tb
add wave -noupdate -expand -group Sample_Inputs /FFT_8_Point_Radix_2_tb/SignalSample_0_Real_tb
add wave -noupdate -expand -group Sample_Inputs /FFT_8_Point_Radix_2_tb/SignalSample_1_Img_tb
add wave -noupdate -expand -group Sample_Inputs /FFT_8_Point_Radix_2_tb/SignalSample_1_Real_tb
add wave -noupdate -expand -group Sample_Inputs /FFT_8_Point_Radix_2_tb/SignalSample_2_Img_tb
add wave -noupdate -expand -group Sample_Inputs /FFT_8_Point_Radix_2_tb/SignalSample_2_Real_tb
add wave -noupdate -expand -group Sample_Inputs /FFT_8_Point_Radix_2_tb/SignalSample_3_Img_tb
add wave -noupdate -expand -group Sample_Inputs /FFT_8_Point_Radix_2_tb/SignalSample_3_Real_tb
add wave -noupdate -expand -group Sample_Inputs /FFT_8_Point_Radix_2_tb/SignalSample_4_Img_tb
add wave -noupdate -expand -group Sample_Inputs /FFT_8_Point_Radix_2_tb/SignalSample_4_Real_tb
add wave -noupdate -expand -group Sample_Inputs /FFT_8_Point_Radix_2_tb/SignalSample_5_Img_tb
add wave -noupdate -expand -group Sample_Inputs /FFT_8_Point_Radix_2_tb/SignalSample_5_Real_tb
add wave -noupdate -expand -group Sample_Inputs /FFT_8_Point_Radix_2_tb/SignalSample_6_Img_tb
add wave -noupdate -expand -group Sample_Inputs /FFT_8_Point_Radix_2_tb/SignalSample_6_Real_tb
add wave -noupdate -expand -group Sample_Inputs /FFT_8_Point_Radix_2_tb/SignalSample_7_Img_tb
add wave -noupdate -expand -group Sample_Inputs /FFT_8_Point_Radix_2_tb/SignalSample_7_Real_tb
add wave -noupdate -expand -group First_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/IN00_Img
add wave -noupdate -expand -group First_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/IN00_Real
add wave -noupdate -expand -group First_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/IN01_Img
add wave -noupdate -expand -group First_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/IN01_Real
add wave -noupdate -expand -group First_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/IN10_Img
add wave -noupdate -expand -group First_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/IN10_Real
add wave -noupdate -expand -group First_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/IN11_Img
add wave -noupdate -expand -group First_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/IN11_Real
add wave -noupdate -expand -group First_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/IN20_Img
add wave -noupdate -expand -group First_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/IN20_Real
add wave -noupdate -expand -group First_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/IN21_Img
add wave -noupdate -expand -group First_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/IN21_Real
add wave -noupdate -expand -group First_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/IN30_Img
add wave -noupdate -expand -group First_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/IN30_Real
add wave -noupdate -expand -group First_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/IN31_Img
add wave -noupdate -expand -group First_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/IN31_Real
add wave -noupdate -expand -group First_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/OUT00_Img
add wave -noupdate -expand -group First_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/OUT00_Real
add wave -noupdate -expand -group First_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/OUT01_Img
add wave -noupdate -expand -group First_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/OUT01_Real
add wave -noupdate -expand -group First_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/OUT10_Img
add wave -noupdate -expand -group First_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/OUT10_Real
add wave -noupdate -expand -group First_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/OUT11_Img
add wave -noupdate -expand -group First_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/OUT11_Real
add wave -noupdate -expand -group First_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/OUT20_Img
add wave -noupdate -expand -group First_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/OUT20_Real
add wave -noupdate -expand -group First_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/OUT21_Img
add wave -noupdate -expand -group First_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/OUT21_Real
add wave -noupdate -expand -group First_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/OUT30_Img
add wave -noupdate -expand -group First_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/OUT30_Real
add wave -noupdate -expand -group First_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/OUT31_Img
add wave -noupdate -expand -group First_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/First_Stage/OUT31_Real
add wave -noupdate -expand -group Second_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/IN00_Img
add wave -noupdate -expand -group Second_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/IN00_Real
add wave -noupdate -expand -group Second_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/IN01_Img
add wave -noupdate -expand -group Second_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/IN01_Real
add wave -noupdate -expand -group Second_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/IN10_Img
add wave -noupdate -expand -group Second_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/IN10_Real
add wave -noupdate -expand -group Second_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/IN11_Img
add wave -noupdate -expand -group Second_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/IN11_Real
add wave -noupdate -expand -group Second_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/IN20_Img
add wave -noupdate -expand -group Second_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/IN20_Real
add wave -noupdate -expand -group Second_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/IN21_Img
add wave -noupdate -expand -group Second_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/IN21_Real
add wave -noupdate -expand -group Second_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/IN30_Img
add wave -noupdate -expand -group Second_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/IN30_Real
add wave -noupdate -expand -group Second_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/IN31_Img
add wave -noupdate -expand -group Second_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/IN31_Real
add wave -noupdate -expand -group Second_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/OUT00_Img
add wave -noupdate -expand -group Second_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/OUT00_Real
add wave -noupdate -expand -group Second_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/OUT01_Img
add wave -noupdate -expand -group Second_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/OUT01_Real
add wave -noupdate -expand -group Second_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/OUT10_Img
add wave -noupdate -expand -group Second_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/OUT10_Real
add wave -noupdate -expand -group Second_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/OUT11_Img
add wave -noupdate -expand -group Second_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/OUT11_Real
add wave -noupdate -expand -group Second_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/OUT20_Img
add wave -noupdate -expand -group Second_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/OUT20_Real
add wave -noupdate -expand -group Second_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/OUT21_Img
add wave -noupdate -expand -group Second_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/OUT21_Real
add wave -noupdate -expand -group Second_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/OUT30_Img
add wave -noupdate -expand -group Second_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/OUT30_Real
add wave -noupdate -expand -group Second_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/OUT31_Img
add wave -noupdate -expand -group Second_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Second_Stage/OUT31_Real
add wave -noupdate -expand -group Third_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/IN00_Img
add wave -noupdate -expand -group Third_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/IN00_Real
add wave -noupdate -expand -group Third_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/IN01_Img
add wave -noupdate -expand -group Third_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/IN01_Real
add wave -noupdate -expand -group Third_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/IN10_Img
add wave -noupdate -expand -group Third_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/IN10_Real
add wave -noupdate -expand -group Third_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/IN11_Img
add wave -noupdate -expand -group Third_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/IN11_Real
add wave -noupdate -expand -group Third_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/IN20_Img
add wave -noupdate -expand -group Third_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/IN20_Real
add wave -noupdate -expand -group Third_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/IN21_Img
add wave -noupdate -expand -group Third_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/IN21_Real
add wave -noupdate -expand -group Third_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/IN30_Img
add wave -noupdate -expand -group Third_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/IN30_Real
add wave -noupdate -expand -group Third_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/IN31_Img
add wave -noupdate -expand -group Third_Stage_Input /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/IN31_Real
add wave -noupdate -expand -group Third_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/OUT00_Img
add wave -noupdate -expand -group Third_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/OUT00_Real
add wave -noupdate -expand -group Third_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/OUT01_Img
add wave -noupdate -expand -group Third_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/OUT01_Real
add wave -noupdate -expand -group Third_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/OUT10_Img
add wave -noupdate -expand -group Third_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/OUT10_Real
add wave -noupdate -expand -group Third_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/OUT11_Img
add wave -noupdate -expand -group Third_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/OUT11_Real
add wave -noupdate -expand -group Third_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/OUT20_Img
add wave -noupdate -expand -group Third_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/OUT20_Real
add wave -noupdate -expand -group Third_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/OUT21_Img
add wave -noupdate -expand -group Third_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/OUT21_Real
add wave -noupdate -expand -group Third_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/OUT30_Img
add wave -noupdate -expand -group Third_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/OUT30_Real
add wave -noupdate -expand -group Third_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/OUT31_Img
add wave -noupdate -expand -group Third_Stage_OUT /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/OUT31_Real
add wave -noupdate -expand -group FFT_OUT_Values /FFT_8_Point_Radix_2_tb/Mem_OUT_Img
add wave -noupdate -expand -group FFT_OUT_Values /FFT_8_Point_Radix_2_tb/Mem_OUT_Real
add wave -noupdate -expand -group FFT_OUT_Values /FFT_8_Point_Radix_2_tb/Third_OUT00_Img_tb
add wave -noupdate -expand -group FFT_OUT_Values /FFT_8_Point_Radix_2_tb/Third_OUT00_Real_tb
add wave -noupdate -expand -group FFT_OUT_Values /FFT_8_Point_Radix_2_tb/Third_OUT01_Img_tb
add wave -noupdate -expand -group FFT_OUT_Values /FFT_8_Point_Radix_2_tb/Third_OUT01_Real_tb
add wave -noupdate -expand -group FFT_OUT_Values /FFT_8_Point_Radix_2_tb/Third_OUT10_Img_tb
add wave -noupdate -expand -group FFT_OUT_Values /FFT_8_Point_Radix_2_tb/Third_OUT10_Real_tb
add wave -noupdate -expand -group FFT_OUT_Values /FFT_8_Point_Radix_2_tb/Third_OUT11_Img_tb
add wave -noupdate -expand -group FFT_OUT_Values /FFT_8_Point_Radix_2_tb/Third_OUT11_Real_tb
add wave -noupdate -expand -group FFT_OUT_Values /FFT_8_Point_Radix_2_tb/Third_OUT20_Img_tb
add wave -noupdate -expand -group FFT_OUT_Values /FFT_8_Point_Radix_2_tb/Third_OUT20_Real_tb
add wave -noupdate -expand -group FFT_OUT_Values /FFT_8_Point_Radix_2_tb/Third_OUT21_Img_tb
add wave -noupdate -expand -group FFT_OUT_Values /FFT_8_Point_Radix_2_tb/Third_OUT21_Real_tb
add wave -noupdate -expand -group FFT_OUT_Values /FFT_8_Point_Radix_2_tb/Third_OUT30_Img_tb
add wave -noupdate -expand -group FFT_OUT_Values /FFT_8_Point_Radix_2_tb/Third_OUT30_Real_tb
add wave -noupdate -expand -group FFT_OUT_Values /FFT_8_Point_Radix_2_tb/Third_OUT31_Img_tb
add wave -noupdate -expand -group FFT_OUT_Values /FFT_8_Point_Radix_2_tb/Third_OUT31_Real_tb
add wave -noupdate -expand -group Third_Stage_MAC0 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_0/IN0_Img
add wave -noupdate -expand -group Third_Stage_MAC0 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_0/IN0_Real
add wave -noupdate -expand -group Third_Stage_MAC0 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_0/IN1_Img
add wave -noupdate -expand -group Third_Stage_MAC0 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_0/IN1_Real
add wave -noupdate -expand -group Third_Stage_MAC0 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_0/OUT0_Img
add wave -noupdate -expand -group Third_Stage_MAC0 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_0/OUT0_Real
add wave -noupdate -expand -group Third_Stage_MAC0 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_0/OUT1_Img
add wave -noupdate -expand -group Third_Stage_MAC0 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_0/OUT1_Real
add wave -noupdate -expand -group Third_Stage_MAC0 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_0/W8_Img
add wave -noupdate -expand -group Third_Stage_MAC0 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_0/W8_Real
add wave -noupdate -expand -group Third_Stage_MAC1 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_1/IN0_Img
add wave -noupdate -expand -group Third_Stage_MAC1 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_1/IN0_Real
add wave -noupdate -expand -group Third_Stage_MAC1 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_1/IN1_Img
add wave -noupdate -expand -group Third_Stage_MAC1 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_1/IN1_Real
add wave -noupdate -expand -group Third_Stage_MAC1 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_1/OUT0_Img
add wave -noupdate -expand -group Third_Stage_MAC1 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_1/OUT0_Real
add wave -noupdate -expand -group Third_Stage_MAC1 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_1/OUT1_Img
add wave -noupdate -expand -group Third_Stage_MAC1 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_1/OUT1_Real
add wave -noupdate -expand -group Third_Stage_MAC1 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_1/W8_Img
add wave -noupdate -expand -group Third_Stage_MAC1 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_1/W8_Index
add wave -noupdate -expand -group Third_Stage_MAC1 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_1/W8_Real
add wave -noupdate -expand -group Third_Stage_MAC2 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_2/IN0_Img
add wave -noupdate -expand -group Third_Stage_MAC2 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_2/IN0_Real
add wave -noupdate -expand -group Third_Stage_MAC2 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_2/IN1_Img
add wave -noupdate -expand -group Third_Stage_MAC2 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_2/IN1_Real
add wave -noupdate -expand -group Third_Stage_MAC2 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_2/OUT0_Img
add wave -noupdate -expand -group Third_Stage_MAC2 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_2/OUT0_Real
add wave -noupdate -expand -group Third_Stage_MAC2 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_2/OUT1_Img
add wave -noupdate -expand -group Third_Stage_MAC2 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_2/OUT1_Real
add wave -noupdate -expand -group Third_Stage_MAC2 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_2/W8_Img
add wave -noupdate -expand -group Third_Stage_MAC2 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_2/W8_Index
add wave -noupdate -expand -group Third_Stage_MAC2 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_2/W8_Real
add wave -noupdate -expand -group Third_Stage_MAC3 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_3/IN0_Img
add wave -noupdate -expand -group Third_Stage_MAC3 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_3/IN0_Real
add wave -noupdate -expand -group Third_Stage_MAC3 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_3/IN1_Img
add wave -noupdate -expand -group Third_Stage_MAC3 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_3/IN1_Real
add wave -noupdate -expand -group Third_Stage_MAC3 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_3/OUT0_Img
add wave -noupdate -expand -group Third_Stage_MAC3 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_3/OUT0_Real
add wave -noupdate -expand -group Third_Stage_MAC3 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_3/OUT1_Img
add wave -noupdate -expand -group Third_Stage_MAC3 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_3/OUT1_Real
add wave -noupdate -expand -group Third_Stage_MAC3 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_3/W8_Img
add wave -noupdate -expand -group Third_Stage_MAC3 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_3/W8_Index
add wave -noupdate -expand -group Third_Stage_MAC3 /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_3/W8_Real
add wave -noupdate -expand -group Multiplier_MAC2_3rd_Stage /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_2/Cplx_Multiplier/IN0_Real
add wave -noupdate -expand -group Multiplier_MAC2_3rd_Stage /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_2/Cplx_Multiplier/IN0_Img
add wave -noupdate -expand -group Multiplier_MAC2_3rd_Stage /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_2/Cplx_Multiplier/IN1_Real
add wave -noupdate -expand -group Multiplier_MAC2_3rd_Stage /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_2/Cplx_Multiplier/IN1_Img
add wave -noupdate -expand -group Multiplier_MAC2_3rd_Stage /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_2/Cplx_Multiplier/OUT_Real
add wave -noupdate -expand -group Multiplier_MAC2_3rd_Stage /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_2/Cplx_Multiplier/OUT_Img
add wave -noupdate -expand -group Multiplier_MAC3_3rd_Stage /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_3/Cplx_Multiplier/IN0_Real
add wave -noupdate -expand -group Multiplier_MAC3_3rd_Stage /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_3/Cplx_Multiplier/IN0_Img
add wave -noupdate -expand -group Multiplier_MAC3_3rd_Stage /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_3/Cplx_Multiplier/IN1_Real
add wave -noupdate -expand -group Multiplier_MAC3_3rd_Stage /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_3/Cplx_Multiplier/IN1_Img
add wave -noupdate -expand -group Multiplier_MAC3_3rd_Stage /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_3/Cplx_Multiplier/OUT_Real
add wave -noupdate -expand -group Multiplier_MAC3_3rd_Stage /FFT_8_Point_Radix_2_tb/FFT_8_Point_Radix_2_DUT/Third_Stage/MAC_3/Cplx_Multiplier/OUT_Img
add wave -noupdate -expand -group Error_Variables /FFT_8_Point_Radix_2_tb/Average_Error_Sum
add wave -noupdate -expand -group Error_Variables /FFT_8_Point_Radix_2_tb/Error_PerSeed
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6068 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 283
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1047787 ps} {1102749 ps}
