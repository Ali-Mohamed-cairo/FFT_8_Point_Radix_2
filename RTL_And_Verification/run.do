vlib work
vlog *.*v +cover -covercells
vsim -voptargs=+acc work.FFT_8_Point_Radix_2_tb -cover
do wave.do
#do wave2.do
coverage save -onexit FFT_8_Point_Radix_2_tb.ucdb 
run -all
vcover report FFT_8_Point_Radix_2_tb.ucdb -details -annotate -all -output FFT_8_Point_Radix_2_cover_report.txt
vcover report FFT_8_Point_Radix_2_tb.ucdb -summary -output FFT_8_Point_Radix_2_Coverage_summary.txt
