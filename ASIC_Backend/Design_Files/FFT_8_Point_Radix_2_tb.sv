//Timescale : Time unit = 1ns / Time precision = 1ps
`timescale 1ns/1ps

`define CLOCK_PERIOD 10

// helper macro for Q4.8 to real conversion
`define Q4_8_TO_REAL(x) ( $itor($signed(x)) / 256.0 )

module FFT_8_Point_Radix_2_tb();
	//Testbench parameters
	//Assuming having initial real inputs Therefore all the first stage inputs have single bit imaginary width and will take zero value
	parameter SIGNAL_SAMPLE_REAL_WIDTH = 'd9,
	          SIGNAL_SAMPLE_IMG_WIDTH  = 'd9,
			  FIRST_MULTI_OUT          = 'd9,
			  FIRST_OUT_x0             = 'd10,
			  FIRST_OUT_x1             = 'd9,
			  SECOND_MULTI_0or2        = 'd10,
			  SECOND_MULTI_1or3        = 'd9,
			  SECOND_OUT_00or20        = 'd11,
			  SECOND_OUT_01or21        = 'd10,
			  SECOND_OUT_1xor3x        = 'd9,
			  THIRD_MULTI_OUT0         = 'd11,
			  THIRD_MULTI_OUT_1or2or3  = 'd11,
			  THIRD_OUTx_x             = 'd12; 
			  
	//Testbench signals
	reg                                CLK_tb;
	reg                                RST_tb;
	reg signed [SIGNAL_SAMPLE_REAL_WIDTH-1:0] SignalSample_0_Real_tb,
								              SignalSample_1_Real_tb,
								              SignalSample_2_Real_tb,
								              SignalSample_3_Real_tb,
								              SignalSample_4_Real_tb,
								              SignalSample_5_Real_tb,
								              SignalSample_6_Real_tb,
								              SignalSample_7_Real_tb;
								  
	reg signed [SIGNAL_SAMPLE_IMG_WIDTH-1:0] SignalSample_0_Img_tb ,
	                                         SignalSample_1_Img_tb ,
	                                         SignalSample_2_Img_tb ,
	                                         SignalSample_3_Img_tb ,
	                                         SignalSample_4_Img_tb ,
	                                         SignalSample_5_Img_tb ,
	                                         SignalSample_6_Img_tb ,
	                                         SignalSample_7_Img_tb ;
	
	wire signed [THIRD_OUTx_x-1:0]           Third_OUT00_Real_tb,
	                                         Third_OUT00_Img_tb ,
	                                         Third_OUT01_Real_tb,
	                                         Third_OUT01_Img_tb ,
	                                         Third_OUT10_Real_tb,
	                                         Third_OUT10_Img_tb ,
	                                         Third_OUT11_Real_tb,
	                                         Third_OUT11_Img_tb ,
	                                         Third_OUT20_Real_tb,
	                                         Third_OUT20_Img_tb ,
	                                         Third_OUT21_Real_tb,
	                                         Third_OUT21_Img_tb ,
	                                         Third_OUT30_Real_tb,
	                                         Third_OUT30_Img_tb ,
	                                         Third_OUT31_Real_tb,
	                                         Third_OUT31_Img_tb ;
	
		//Input array
	reg signed [SIGNAL_SAMPLE_REAL_WIDTH-1:0] Mem_IN [799:0];
	
		//Golden model outputs
	reg signed [THIRD_OUTx_x-1:0] Mem_OUT_Real [799:0];
	reg signed [THIRD_OUTx_x-1:0] Mem_OUT_Img  [799:0];
	
		//Error calculation signals
	real FFT_Verilog_OUT_real [0:7];    	     	     	      
	real FFT_Verilog_OUT_img  [0:7];    	     	     	      
	
	real Error_Sum_real,    
		 Error_Sum_img,
		 diff,//Average error per seed variable 
		 Error_PerSeed,
		 Average_Error_Sum;//Total average error for all seeds
		 
	integer count;
	
		//Testcases seed variables
	int unsigned nSeed, //Total number of seeds
			     nseed, //input Seed counter
			     Check_seed; //Seed to be checked counter
	
	
	//Module instantiation
	//For the adder and subtractor inputs assign the width parameter which is greater among the two operands.
	FFT_8_Point_Radix_2_TOP #(
		//Inputs parameters (Naming convention: (STAGE_ORDER)_IN(MAC_ORDER)(INPUT_ORDER)_(REALorIMG)_WIDTH)
		.SIGNALSAMPLE_0_REAL_WIDTH ( SIGNAL_SAMPLE_REAL_WIDTH ), 
		.SIGNALSAMPLE_0_IMG_WIDTH  ( SIGNAL_SAMPLE_IMG_WIDTH  ), 
		.SIGNALSAMPLE_1_REAL_WIDTH ( SIGNAL_SAMPLE_REAL_WIDTH ), 
		.SIGNALSAMPLE_1_IMG_WIDTH  ( SIGNAL_SAMPLE_IMG_WIDTH  ), 
		.SIGNALSAMPLE_2_REAL_WIDTH ( SIGNAL_SAMPLE_REAL_WIDTH ), 
		.SIGNALSAMPLE_2_IMG_WIDTH  ( SIGNAL_SAMPLE_IMG_WIDTH  ), 
		.SIGNALSAMPLE_3_REAL_WIDTH ( SIGNAL_SAMPLE_REAL_WIDTH ), 
		.SIGNALSAMPLE_3_IMG_WIDTH  ( SIGNAL_SAMPLE_IMG_WIDTH  ), 
		.SIGNALSAMPLE_4_REAL_WIDTH ( SIGNAL_SAMPLE_REAL_WIDTH ), 
		.SIGNALSAMPLE_4_IMG_WIDTH  ( SIGNAL_SAMPLE_IMG_WIDTH  ), 
		.SIGNALSAMPLE_5_REAL_WIDTH ( SIGNAL_SAMPLE_REAL_WIDTH ), 
		.SIGNALSAMPLE_5_IMG_WIDTH  ( SIGNAL_SAMPLE_IMG_WIDTH  ), 
		.SIGNALSAMPLE_6_REAL_WIDTH ( SIGNAL_SAMPLE_REAL_WIDTH ), 
		.SIGNALSAMPLE_6_IMG_WIDTH  ( SIGNAL_SAMPLE_IMG_WIDTH  ), 
		.SIGNALSAMPLE_7_REAL_WIDTH ( SIGNAL_SAMPLE_REAL_WIDTH ), 
		.SIGNALSAMPLE_7_IMG_WIDTH  ( SIGNAL_SAMPLE_IMG_WIDTH  ), 
		//Multipliers parameters (Naming convention: (STAGE_ORDER)_MUTLI(MAC_ORDER)_(REALorIMG)_WIDTH)
		.FIRST_MULTI0_REAL_WIDTH ( FIRST_MULTI_OUT ), .SECOND_MULTI0_REAL_WIDTH ( SECOND_MULTI_0or2 ), .THIRD_MULTI0_REAL_WIDTH ( THIRD_MULTI_OUT0 ),
		.FIRST_MULTI0_IMG_WIDTH  ( FIRST_MULTI_OUT ), .SECOND_MULTI0_IMG_WIDTH  ( SECOND_MULTI_0or2 ), .THIRD_MULTI0_IMG_WIDTH  ( THIRD_MULTI_OUT0 ),
		.FIRST_MULTI1_REAL_WIDTH ( FIRST_MULTI_OUT ), .SECOND_MULTI1_REAL_WIDTH ( SECOND_MULTI_1or3 ), .THIRD_MULTI1_REAL_WIDTH ( THIRD_MULTI_OUT_1or2or3 ),
		.FIRST_MULTI1_IMG_WIDTH  ( FIRST_MULTI_OUT ), .SECOND_MULTI1_IMG_WIDTH  ( SECOND_MULTI_1or3 ), .THIRD_MULTI1_IMG_WIDTH  ( THIRD_MULTI_OUT_1or2or3 ),
		.FIRST_MULTI2_REAL_WIDTH ( FIRST_MULTI_OUT ), .SECOND_MULTI2_REAL_WIDTH ( SECOND_MULTI_0or2 ), .THIRD_MULTI2_REAL_WIDTH ( THIRD_MULTI_OUT_1or2or3 ),
		.FIRST_MULTI2_IMG_WIDTH  ( FIRST_MULTI_OUT ), .SECOND_MULTI2_IMG_WIDTH  ( SECOND_MULTI_0or2 ), .THIRD_MULTI2_IMG_WIDTH  ( THIRD_MULTI_OUT_1or2or3 ),
		.FIRST_MULTI3_REAL_WIDTH ( FIRST_MULTI_OUT ), .SECOND_MULTI3_REAL_WIDTH ( SECOND_MULTI_1or3 ), .THIRD_MULTI3_REAL_WIDTH ( THIRD_MULTI_OUT_1or2or3 ),
		.FIRST_MULTI3_IMG_WIDTH  ( FIRST_MULTI_OUT ), .SECOND_MULTI3_IMG_WIDTH  ( SECOND_MULTI_1or3 ), .THIRD_MULTI3_IMG_WIDTH  ( THIRD_MULTI_OUT_1or2or3 ),
		//Outputs parameters (Naming convention: (STAGE_ORDER)_OUT(MAC_ORDER)(INPUT_ORDER)_(REALorIMG)_WIDTH)
		.FIRST_OUT00_REAL_WIDTH ( FIRST_OUT_x0 ), .SECOND_OUT00_REAL_WIDTH ( SECOND_OUT_00or20 ), .THIRD_OUT00_REAL_WIDTH ( THIRD_OUTx_x ),
		.FIRST_OUT00_IMG_WIDTH  ( FIRST_OUT_x0 ), .SECOND_OUT00_IMG_WIDTH  ( SECOND_OUT_00or20 ), .THIRD_OUT00_IMG_WIDTH  ( THIRD_OUTx_x ),
		.FIRST_OUT01_REAL_WIDTH ( FIRST_OUT_x1 ), .SECOND_OUT01_REAL_WIDTH ( SECOND_OUT_01or21 ), .THIRD_OUT01_REAL_WIDTH ( THIRD_OUTx_x ),
		.FIRST_OUT01_IMG_WIDTH  ( FIRST_OUT_x1 ), .SECOND_OUT01_IMG_WIDTH  ( SECOND_OUT_01or21 ), .THIRD_OUT01_IMG_WIDTH  ( THIRD_OUTx_x ),
		.FIRST_OUT10_REAL_WIDTH ( FIRST_OUT_x0 ), .SECOND_OUT10_REAL_WIDTH ( SECOND_OUT_1xor3x ), .THIRD_OUT10_REAL_WIDTH ( THIRD_OUTx_x ),
		.FIRST_OUT10_IMG_WIDTH  ( FIRST_OUT_x0 ), .SECOND_OUT10_IMG_WIDTH  ( SECOND_OUT_1xor3x ), .THIRD_OUT10_IMG_WIDTH  ( THIRD_OUTx_x ),
		.FIRST_OUT11_REAL_WIDTH ( FIRST_OUT_x1 ), .SECOND_OUT11_REAL_WIDTH ( SECOND_OUT_1xor3x ), .THIRD_OUT11_REAL_WIDTH ( THIRD_OUTx_x ),
		.FIRST_OUT11_IMG_WIDTH  ( FIRST_OUT_x1 ), .SECOND_OUT11_IMG_WIDTH  ( SECOND_OUT_1xor3x ), .THIRD_OUT11_IMG_WIDTH  ( THIRD_OUTx_x ),
		.FIRST_OUT20_REAL_WIDTH ( FIRST_OUT_x0 ), .SECOND_OUT20_REAL_WIDTH ( SECOND_OUT_00or20 ), .THIRD_OUT20_REAL_WIDTH ( THIRD_OUTx_x ),
		.FIRST_OUT20_IMG_WIDTH  ( FIRST_OUT_x0 ), .SECOND_OUT20_IMG_WIDTH  ( SECOND_OUT_00or20 ), .THIRD_OUT20_IMG_WIDTH  ( THIRD_OUTx_x ),
		.FIRST_OUT21_REAL_WIDTH ( FIRST_OUT_x1 ), .SECOND_OUT21_REAL_WIDTH ( SECOND_OUT_01or21 ), .THIRD_OUT21_REAL_WIDTH ( THIRD_OUTx_x ),
		.FIRST_OUT21_IMG_WIDTH  ( FIRST_OUT_x1 ), .SECOND_OUT21_IMG_WIDTH  ( SECOND_OUT_01or21 ), .THIRD_OUT21_IMG_WIDTH  ( THIRD_OUTx_x ),
		.FIRST_OUT30_REAL_WIDTH ( FIRST_OUT_x0 ), .SECOND_OUT30_REAL_WIDTH ( SECOND_OUT_1xor3x ), .THIRD_OUT30_REAL_WIDTH ( THIRD_OUTx_x ),
		.FIRST_OUT30_IMG_WIDTH  ( FIRST_OUT_x0 ), .SECOND_OUT30_IMG_WIDTH  ( SECOND_OUT_1xor3x ), .THIRD_OUT30_IMG_WIDTH  ( THIRD_OUTx_x ),
		.FIRST_OUT31_REAL_WIDTH ( FIRST_OUT_x1 ), .SECOND_OUT31_REAL_WIDTH ( SECOND_OUT_1xor3x ), .THIRD_OUT31_REAL_WIDTH ( THIRD_OUTx_x ),
		.FIRST_OUT31_IMG_WIDTH  ( FIRST_OUT_x1 ), .SECOND_OUT31_IMG_WIDTH  ( SECOND_OUT_1xor3x ), .THIRD_OUT31_IMG_WIDTH  ( THIRD_OUTx_x ) 
	) FFT_8_Point_Radix_2_DUT(
		.SignalSample_0_Real( SignalSample_0_Real_tb ),
		.SignalSample_0_Img ( SignalSample_0_Img_tb  ),
		.SignalSample_1_Real( SignalSample_1_Real_tb ),
		.SignalSample_1_Img ( SignalSample_1_Img_tb  ),
		.SignalSample_2_Real( SignalSample_2_Real_tb ),
		.SignalSample_2_Img ( SignalSample_2_Img_tb  ),
		.SignalSample_3_Real( SignalSample_3_Real_tb ),
		.SignalSample_3_Img ( SignalSample_3_Img_tb  ),
		.SignalSample_4_Real( SignalSample_4_Real_tb ),
		.SignalSample_4_Img ( SignalSample_4_Img_tb  ),
		.SignalSample_5_Real( SignalSample_5_Real_tb ),
		.SignalSample_5_Img ( SignalSample_5_Img_tb  ),
		.SignalSample_6_Real( SignalSample_6_Real_tb ),
		.SignalSample_6_Img ( SignalSample_6_Img_tb  ),
		.SignalSample_7_Real( SignalSample_7_Real_tb ),
		.SignalSample_7_Img ( SignalSample_7_Img_tb  ),
		
		.CLK( CLK_tb ) , //Clocking signal                      
		.RST( RST_tb ) , //Active high asynchronous reset signal
		       
		.Third_OUT00_Real( Third_OUT00_Real_tb ),
		.Third_OUT00_Img ( Third_OUT00_Img_tb  ),
		.Third_OUT01_Real( Third_OUT01_Real_tb ),
		.Third_OUT01_Img ( Third_OUT01_Img_tb  ),
		.Third_OUT10_Real( Third_OUT10_Real_tb ),
		.Third_OUT10_Img ( Third_OUT10_Img_tb  ),
		.Third_OUT11_Real( Third_OUT11_Real_tb ),
		.Third_OUT11_Img ( Third_OUT11_Img_tb  ),
		.Third_OUT20_Real( Third_OUT20_Real_tb ),
		.Third_OUT20_Img ( Third_OUT20_Img_tb  ),
		.Third_OUT21_Real( Third_OUT21_Real_tb ),
		.Third_OUT21_Img ( Third_OUT21_Img_tb  ),
		.Third_OUT30_Real( Third_OUT30_Real_tb ),
		.Third_OUT30_Img ( Third_OUT30_Img_tb  ),
		.Third_OUT31_Real( Third_OUT31_Real_tb ),
		.Third_OUT31_Img ( Third_OUT31_Img_tb  ) 
	);
	
	//Clock generation
	always begin
		CLK_tb = 1'b0;
		forever begin
			#(`CLOCK_PERIOD/2);
			CLK_tb = ~CLK_tb;
		end
	end
	
	task Reset_task;
		SignalSample_0_Real_tb = 'd1 ;
		SignalSample_1_Real_tb = 'd1 ;
		SignalSample_2_Real_tb = 'd1 ;
		SignalSample_3_Real_tb = 'd1 ;
		SignalSample_4_Real_tb = 'd1 ;
		SignalSample_5_Real_tb = 'd1 ;
		SignalSample_6_Real_tb = 'd1 ;
		SignalSample_7_Real_tb = 'd1 ;
		                              
		SignalSample_0_Img_tb = 'd1  ; 
		SignalSample_1_Img_tb = 'd1  ; 
		SignalSample_2_Img_tb = 'd1  ; 
		SignalSample_3_Img_tb = 'd1  ; 
		SignalSample_4_Img_tb = 'd1  ; 
		SignalSample_5_Img_tb = 'd1  ; 
		SignalSample_6_Img_tb = 'd1  ; 
		SignalSample_7_Img_tb = 'd1  ; 
		RST_tb                = 1'b1 ; 
		@(negedge CLK_tb);
		RST_tb                = 1'b0 ;
		
	endtask
	
	task Stimulus_Driver;
		begin
			SignalSample_0_Real_tb = Mem_IN[8*nseed + 0];
			SignalSample_1_Real_tb = Mem_IN[8*nseed + 1];
			SignalSample_2_Real_tb = Mem_IN[8*nseed + 2];
			SignalSample_3_Real_tb = Mem_IN[8*nseed + 3];
			SignalSample_4_Real_tb = Mem_IN[8*nseed + 4];
			SignalSample_5_Real_tb = Mem_IN[8*nseed + 5];
			SignalSample_6_Real_tb = Mem_IN[8*nseed + 6];
			SignalSample_7_Real_tb = Mem_IN[8*nseed + 7];
			
			SignalSample_0_Img_tb = 'd0;
			SignalSample_1_Img_tb = 'd0;
			SignalSample_2_Img_tb = 'd0;
			SignalSample_3_Img_tb = 'd0;
			SignalSample_4_Img_tb = 'd0;
			SignalSample_5_Img_tb = 'd0;
			SignalSample_6_Img_tb = 'd0;
			SignalSample_7_Img_tb = 'd0;
		end
	endtask
	
	function real abs_real (input real r);
		abs_real = (r < 0.0) ? -r : r;
	endfunction

	
	task ErrorCal;
		begin
			//Average error per seed variable initilization
			Error_Sum_real  = 0;
			Error_Sum_img   = 0;
		
			//Calculate and accumulate the error of each output
				// Convert fixed-point Q4.8 hardware outputs to real
			FFT_Verilog_OUT_real[0] = `Q4_8_TO_REAL(Third_OUT00_Real_tb);
			FFT_Verilog_OUT_real[1] = `Q4_8_TO_REAL(Third_OUT01_Real_tb);
			FFT_Verilog_OUT_real[2] = `Q4_8_TO_REAL(Third_OUT10_Real_tb);
			FFT_Verilog_OUT_real[3] = `Q4_8_TO_REAL(Third_OUT11_Real_tb);
			FFT_Verilog_OUT_real[4] = `Q4_8_TO_REAL(Third_OUT20_Real_tb);
			FFT_Verilog_OUT_real[5] = `Q4_8_TO_REAL(Third_OUT21_Real_tb);
			FFT_Verilog_OUT_real[6] = `Q4_8_TO_REAL(Third_OUT30_Real_tb);
			FFT_Verilog_OUT_real[7] = `Q4_8_TO_REAL(Third_OUT31_Real_tb);
			
			FFT_Verilog_OUT_img[0] = `Q4_8_TO_REAL(Third_OUT00_Img_tb);
			FFT_Verilog_OUT_img[1] = `Q4_8_TO_REAL(Third_OUT01_Img_tb);
			FFT_Verilog_OUT_img[2] = `Q4_8_TO_REAL(Third_OUT10_Img_tb);
			FFT_Verilog_OUT_img[3] = `Q4_8_TO_REAL(Third_OUT11_Img_tb);
			FFT_Verilog_OUT_img[4] = `Q4_8_TO_REAL(Third_OUT20_Img_tb);
			FFT_Verilog_OUT_img[5] = `Q4_8_TO_REAL(Third_OUT21_Img_tb);
			FFT_Verilog_OUT_img[6] = `Q4_8_TO_REAL(Third_OUT30_Img_tb);
			FFT_Verilog_OUT_img[7] = `Q4_8_TO_REAL(Third_OUT31_Img_tb);
			
			// Compute mean error: mean(Algo - Golden)
			for (count = 0; count < 8; count++) begin
				diff = (FFT_Verilog_OUT_real[count] - `Q4_8_TO_REAL(Mem_OUT_Real[8*Check_seed + count]));
				if (diff < 0) diff = -diff;
				Error_Sum_real += diff;
				diff = (FFT_Verilog_OUT_img[count] - `Q4_8_TO_REAL(Mem_OUT_Img[8*Check_seed + count]));
				if (diff < 0) diff = -diff;
				Error_Sum_img += diff;
			end
			
			Error_Sum_real/= 8.0;
			Error_Sum_img /= 8.0;
			
			Error_PerSeed = $sqrt(Error_Sum_real*Error_Sum_real + Error_Sum_img*Error_Sum_img);
			
			/*	// First output error
			First_Out_Real_Error   = abs_real(`Q4_8_TO_REAL(Third_OUT00_Real_tb) - `Q4_8_TO_REAL(Mem_OUT_Real[8*nseed + 0]));
			First_Out_Img_Error    = abs_real(`Q4_8_TO_REAL(Third_OUT00_Img_tb ) - `Q4_8_TO_REAL(Mem_OUT_Img [8*nseed + 0]));
			Error_Sum              = Error_Sum + ((First_Out_Real_Error + First_Out_Img_Error)/2);
			
				// Second output error
			Second_Out_Real_Error  = abs_real(`Q4_8_TO_REAL(Third_OUT01_Real_tb) - `Q4_8_TO_REAL(Mem_OUT_Real[8*nseed + 1]));
			Second_Out_Img_Error   = abs_real(`Q4_8_TO_REAL(Third_OUT01_Img_tb ) - `Q4_8_TO_REAL(Mem_OUT_Img [8*nseed + 1]));
			Error_Sum              = Error_Sum + ((Second_Out_Real_Error + Second_Out_Img_Error)/2);
			
				// Third output error
			Third_Out_Real_Error   = abs_real(`Q4_8_TO_REAL(Third_OUT10_Real_tb) - `Q4_8_TO_REAL(Mem_OUT_Real[8*nseed + 2]));
			Third_Out_Img_Error    = abs_real(`Q4_8_TO_REAL(Third_OUT10_Img_tb ) - `Q4_8_TO_REAL(Mem_OUT_Img [8*nseed + 2]));
			Error_Sum              = Error_Sum + ((Third_Out_Real_Error + Third_Out_Img_Error)/2);
			
				// Fourth output error
			Fourth_Out_Real_Error  = abs_real(`Q4_8_TO_REAL(Third_OUT11_Real_tb) - `Q4_8_TO_REAL(Mem_OUT_Real[8*nseed + 3]));
			Fourth_Out_Img_Error   = abs_real(`Q4_8_TO_REAL(Third_OUT11_Img_tb ) - `Q4_8_TO_REAL(Mem_OUT_Img [8*nseed + 3]));
			Error_Sum              = Error_Sum + ((Fourth_Out_Real_Error + Fourth_Out_Img_Error)/2);
			
				// Fifth output error
			Fifth_Out_Real_Error   = abs_real(`Q4_8_TO_REAL(Third_OUT20_Real_tb) - `Q4_8_TO_REAL(Mem_OUT_Real[8*nseed + 4]));
			Fifth_Out_Img_Error    = abs_real(`Q4_8_TO_REAL(Third_OUT20_Img_tb ) - `Q4_8_TO_REAL(Mem_OUT_Img [8*nseed + 4]));
			Error_Sum              = Error_Sum + ((Fifth_Out_Real_Error + Fifth_Out_Img_Error)/2);
			
				// Sixth output error
			Sixth_Out_Real_Error   = abs_real(`Q4_8_TO_REAL(Third_OUT21_Real_tb) - `Q4_8_TO_REAL(Mem_OUT_Real[8*nseed + 5]));
			Sixth_Out_Img_Error    = abs_real(`Q4_8_TO_REAL(Third_OUT21_Img_tb ) - `Q4_8_TO_REAL(Mem_OUT_Img [8*nseed + 5]));
			Error_Sum              = Error_Sum + ((Sixth_Out_Real_Error + Sixth_Out_Img_Error)/2);
			
				// Seventh output error
			Seventh_Out_Real_Error = abs_real(`Q4_8_TO_REAL(Third_OUT30_Real_tb) - `Q4_8_TO_REAL(Mem_OUT_Real[8*nseed + 6]));
			Seventh_Out_Img_Error  = abs_real(`Q4_8_TO_REAL(Third_OUT30_Img_tb ) - `Q4_8_TO_REAL(Mem_OUT_Img [8*nseed + 6]));
			Error_Sum              = Error_Sum + ((Seventh_Out_Real_Error + Seventh_Out_Img_Error)/2);
			
				// Eighth output error
			Eighth_Out_Real_Error  = abs_real(`Q4_8_TO_REAL(Third_OUT31_Real_tb) - `Q4_8_TO_REAL(Mem_OUT_Real[8*nseed + 7]));
			Eighth_Out_Img_Error   = abs_real(`Q4_8_TO_REAL(Third_OUT31_Img_tb ) - `Q4_8_TO_REAL(Mem_OUT_Img [8*nseed + 7]));
			//Error_Sum              = Error_Sum + ((Eighth_Out_Real_Error + Eighth_Out_Img_Error)/2);
			*/
			
			$display("Average Error for seed no. %d = %f", Check_seed, Error_PerSeed);
			
			Check_seed = Check_seed + 1;
			
			Average_Error_Sum = Average_Error_Sum + Error_PerSeed;
			
		end
	endtask
	
	initial begin
		$dumpfile("FFT_8_Point_Radix_2.vcd");  // waveforms in this file
		$dumpvars;				               // saves all waveforms
		
		$display("Test start");
		
		//Reading the input file which is extracted from the Matlab system modeling
		$readmemb("FFT_Golden_In_bin.txt", Mem_IN);
		
		//Reading the output files which are extracted from the Matlab system modeling
		$readmemb("FFT_Golden_Out_real_bin.txt", Mem_OUT_Real);
		$readmemb("FFT_Golden_Out_img_bin.txt", Mem_OUT_Img );
		
		//Initializing number of generated seeds
		nSeed = 100;
		
		//Initializing the input seeds counter
		nseed = 0;
		
		//Initializing the seed to be checked counter
		Check_seed = 0;
		
		//Average Error variable intialization
		Average_Error_Sum = 0;
				
		//Testcases
		Reset_task();
						//(nSeed+1) so that have an extra iteration without Stimulus_Driver and only checking for 8 successive clock cycles
		for( ;nseed < (nSeed+1); nseed = nseed + 1) begin
			@(negedge CLK_tb);
			if(nseed <= 'd99) begin
				Stimulus_Driver();
				//Start checking after 7 cycles of the first input samples until a valid output
				if(nseed >= 8) begin
					ErrorCal();
				end
			end
			else begin
				for(int i = 0; i <= 7; i = i + 1) begin
					ErrorCal();
					@(negedge CLK_tb);
				end
			end
		end
		$display("Total Average Error across simulation = %f", Average_Error_Sum/nSeed);
		$stop;
	end
	
endmodule