module Single_Stage_FFT_8_2 #(
		//Inputs parameters (Naming convention: IN(MAC_ORDER)(INPUT_ORDER)_(REALorIMG)_WIDTH)
		parameter IN00_REAL_WIDTH = 4'd8,
				  IN00_IMG_WIDTH  = 4'd8,
				  IN01_REAL_WIDTH = 4'd8,
				  IN01_IMG_WIDTH  = 4'd8,
				  IN01_INT        = 'd0 ,
				  IN01_FRAC       = 'd0 ,
				  IN10_REAL_WIDTH = 4'd8,
				  IN10_IMG_WIDTH  = 4'd8,
				  IN11_REAL_WIDTH = 4'd8,
				  IN11_IMG_WIDTH  = 4'd8,
				  IN11_INT        = 'd0 ,
				  IN11_FRAC       = 'd0 ,
				  IN20_REAL_WIDTH = 4'd8,
				  IN20_IMG_WIDTH  = 4'd8,
				  IN21_REAL_WIDTH = 4'd8,
				  IN21_IMG_WIDTH  = 4'd8,
				  IN21_INT        = 4'd0,
				  IN21_FRAC       = 4'd0,
				  IN30_REAL_WIDTH = 4'd8,
				  IN30_IMG_WIDTH  = 4'd8,
				  IN31_REAL_WIDTH = 4'd8,
				  IN31_IMG_WIDTH  = 4'd8,
				  IN31_INT        = 'd0 ,
				  IN31_FRAC       = 'd0 ,
		//Multipliers parameters (Naming convention: MUTLI(MAC_ORDER)_(REALorIMG)_WIDTH)
		parameter MULTI0_REAL_WIDTH = 5'd16,
				  MULTI0_IMG_WIDTH  = 5'd16,
				  MULTI0_INT        = 'd0  ,
				  MULTI0_FRAC       = 'd0  ,
				  MULTI1_REAL_WIDTH = 5'd16,
				  MULTI1_IMG_WIDTH  = 5'd16,
				  MULTI1_INT        = 'd0  ,
				  MULTI1_FRAC       = 'd0  ,
				  MULTI2_REAL_WIDTH = 5'd16,
				  MULTI2_IMG_WIDTH  = 5'd16,
				  MULTI2_INT        = 'd0  ,
				  MULTI2_FRAC       = 'd0  ,
				  MULTI3_REAL_WIDTH = 5'd16,
				  MULTI3_IMG_WIDTH  = 5'd16,
				  MULTI3_INT        = 'd0  ,
				  MULTI3_FRAC       = 'd0  ,
		//Outputs parameters (Naming convention: OUT(MAC_ORDER)(INPUT_ORDER)_(REALorIMG)_WIDTH)
		parameter OUT00_REAL_WIDTH = 5'd10,
				  OUT00_IMG_WIDTH  = 5'd10,
				  OUT00_INT        = 'd0  ,
				  OUT01_REAL_WIDTH = 5'd10,
				  OUT01_IMG_WIDTH  = 5'd10,
				  OUT01_INT        = 'd0  ,
				  OUT10_REAL_WIDTH = 5'd10,
				  OUT10_IMG_WIDTH  = 5'd10,
				  OUT10_INT        = 'd0  ,
				  OUT11_REAL_WIDTH = 5'd10,
				  OUT11_IMG_WIDTH  = 5'd10,
				  OUT11_INT        = 'd0  ,
			      OUT20_REAL_WIDTH = 5'd10,
				  OUT20_IMG_WIDTH  = 5'd10,
				  OUT20_INT        = 'd0  ,
				  OUT21_REAL_WIDTH = 5'd10,
				  OUT21_IMG_WIDTH  = 5'd10,
				  OUT21_INT        = 'd0  ,
				  OUT30_REAL_WIDTH = 5'd10,
				  OUT30_IMG_WIDTH  = 5'd10,
				  OUT30_INT        = 'd0  ,
				  OUT31_REAL_WIDTH = 5'd10,
				  OUT31_IMG_WIDTH  = 5'd10,
				  OUT31_INT        = 'd0  
	)(
		input wire signed  [IN00_REAL_WIDTH-1:0] IN00_Real   ,
		input wire signed  [IN00_IMG_WIDTH -1:0] IN00_Img    ,
		input wire signed  [IN01_REAL_WIDTH-1:0] IN01_Real   ,
		input wire signed  [IN01_IMG_WIDTH -1:0] IN01_Img    ,
		input wire signed  [IN10_REAL_WIDTH-1:0] IN10_Real   ,
		input wire signed  [IN10_IMG_WIDTH -1:0] IN10_Img    ,
		input wire signed  [IN11_REAL_WIDTH-1:0] IN11_Real   ,
		input wire signed  [IN11_IMG_WIDTH -1:0] IN11_Img    ,
		input wire signed  [IN20_REAL_WIDTH-1:0] IN20_Real   ,
		input wire signed  [IN20_IMG_WIDTH -1:0] IN20_Img    ,
		input wire signed  [IN21_REAL_WIDTH-1:0] IN21_Real   ,
		input wire signed  [IN21_IMG_WIDTH -1:0] IN21_Img    ,
		input wire signed  [IN30_REAL_WIDTH-1:0] IN30_Real   ,
		input wire signed  [IN30_IMG_WIDTH -1:0] IN30_Img    ,
		input wire signed  [IN31_REAL_WIDTH-1:0] IN31_Real   ,
		input wire signed  [IN31_IMG_WIDTH -1:0] IN31_Img    ,
		                                                     
		input wire         [1:0]                 W8_0_Index  ,
		input wire         [1:0]                 W8_1_Index  ,
		input wire         [1:0]                 W8_2_Index  ,
		input wire         [1:0]                 W8_3_Index  ,
		                                                     
		input  wire                              CLK         , 
		input  wire                              RST         , 
		                                                     
		output wire signed [OUT00_REAL_WIDTH-1:0] OUT00_Real ,
		output wire signed [OUT00_IMG_WIDTH -1:0] OUT00_Img  ,
		output wire signed [OUT01_REAL_WIDTH-1:0] OUT01_Real ,
		output wire signed [OUT01_IMG_WIDTH -1:0] OUT01_Img  ,
		output wire signed [OUT10_REAL_WIDTH-1:0] OUT10_Real ,
		output wire signed [OUT10_IMG_WIDTH -1:0] OUT10_Img  ,
		output wire signed [OUT11_REAL_WIDTH-1:0] OUT11_Real ,
		output wire signed [OUT11_IMG_WIDTH -1:0] OUT11_Img  ,
		output wire signed [OUT20_REAL_WIDTH-1:0] OUT20_Real ,
		output wire signed [OUT20_IMG_WIDTH -1:0] OUT20_Img  ,
		output wire signed [OUT21_REAL_WIDTH-1:0] OUT21_Real ,
		output wire signed [OUT21_IMG_WIDTH -1:0] OUT21_Img  ,
		output wire signed [OUT30_REAL_WIDTH-1:0] OUT30_Real ,
		output wire signed [OUT30_IMG_WIDTH -1:0] OUT30_Img  ,
		output wire signed [OUT31_REAL_WIDTH-1:0] OUT31_Real ,
		output wire signed [OUT31_IMG_WIDTH -1:0] OUT31_Img  
	);
	
	//First MAC block, Order = 0
	MAC_Unit #(
		.IN0_REAL_WIDTH   ( IN00_REAL_WIDTH   ) ,
		.IN0_IMG_WIDTH    ( IN00_IMG_WIDTH    ) ,
		.IN1_REAL_WIDTH   ( IN01_REAL_WIDTH   ) ,
		.IN1_IMG_WIDTH    ( IN01_IMG_WIDTH    ) ,
		.IN1_INT          ( IN01_INT          ) ,
		.IN1_FRAC         ( IN01_FRAC         ) ,
		.MULTI_REAL_WIDTH ( MULTI0_REAL_WIDTH ) ,
		.MULTI_IMG_WIDTH  ( MULTI0_IMG_WIDTH  ) ,
		.MULTI_INT        ( MULTI0_INT        ) ,
		.MULTI_FRAC       ( MULTI0_FRAC       ) ,
		.OUT0_REAL_WIDTH  ( OUT00_REAL_WIDTH  ) ,
		.OUT0_IMG_WIDTH   ( OUT00_IMG_WIDTH   ) ,
		.OUT0_INT         ( OUT00_INT         ) ,
		.OUT1_REAL_WIDTH  ( OUT01_REAL_WIDTH  ) ,
		.OUT1_IMG_WIDTH   ( OUT01_IMG_WIDTH   ) ,
		.OUT1_INT         ( OUT01_INT         ) 
	) MAC_0(
		.IN0_Real  ( IN00_Real  ) , // Real      part of the first  input
		.IN0_Img   ( IN00_Img   ) , // Imaginary part of the first  input
		.IN1_Real  ( IN01_Real  ) , // Real      part of the second input
		.IN1_Img   ( IN01_Img   ) , // Imaginary part of the second input
		.W8_Index  ( W8_0_Index ) , // Real      part of the twiddle factor
		.CLK       ( CLK        ) , //Clocking signal                      
		.RST       ( RST        ) , //Active high asynchronous reset signal
		.OUT0_Real ( OUT00_Real ) , // Real      part of the first  output
		.OUT0_Img  ( OUT00_Img  ) , // Imaginary part of the first  output
		.OUT1_Real ( OUT01_Real ) , // Real      part of the second output
		.OUT1_Img  ( OUT01_Img  )   // Imaginary part of the second output
	);
	
	//First MAC block, Order = 1
	MAC_Unit #(
		.IN0_REAL_WIDTH   ( IN10_REAL_WIDTH   ) ,
		.IN0_IMG_WIDTH    ( IN10_IMG_WIDTH    ) ,
		.IN1_REAL_WIDTH   ( IN11_REAL_WIDTH   ) ,
		.IN1_IMG_WIDTH    ( IN11_IMG_WIDTH    ) ,
		.IN1_INT          ( IN11_INT          ) ,
		.IN1_FRAC         ( IN11_FRAC         ) ,
		.MULTI_REAL_WIDTH ( MULTI1_REAL_WIDTH ) ,
		.MULTI_IMG_WIDTH  ( MULTI1_IMG_WIDTH  ) ,
		.MULTI_INT        ( MULTI1_INT        ) ,
		.MULTI_FRAC       ( MULTI1_FRAC       ) ,
		.OUT0_REAL_WIDTH  ( OUT10_REAL_WIDTH  ) ,
		.OUT0_IMG_WIDTH   ( OUT10_IMG_WIDTH   ) ,
		.OUT0_INT         ( OUT10_INT         ) ,
		.OUT1_REAL_WIDTH  ( OUT11_REAL_WIDTH  ) ,
		.OUT1_IMG_WIDTH   ( OUT11_IMG_WIDTH   ) ,
		.OUT1_INT         ( OUT11_INT         )
	) MAC_1(
		.IN0_Real  ( IN10_Real  ) , // Real      part of the first  input
		.IN0_Img   ( IN10_Img   ) , // Imaginary part of the first  input
		.IN1_Real  ( IN11_Real  ) , // Real      part of the second input
		.IN1_Img   ( IN11_Img   ) , // Imaginary part of the second input
		.W8_Index  ( W8_1_Index ) , // Real      part of the twiddle factor
		.CLK       ( CLK        ) , //Clocking signal                      
		.RST       ( RST        ) , //Active high asynchronous reset signal
		.OUT0_Real ( OUT10_Real ) , // Real      part of the first  output
		.OUT0_Img  ( OUT10_Img  ) , // Imaginary part of the first  output
		.OUT1_Real ( OUT11_Real ) , // Real      part of the second output
		.OUT1_Img  ( OUT11_Img  )   // Imaginary part of the second output
	);
	
	//First MAC block, Order = 2
	MAC_Unit #(
		.IN0_REAL_WIDTH   ( IN20_REAL_WIDTH   ) ,
		.IN0_IMG_WIDTH    ( IN20_IMG_WIDTH    ) ,
		.IN1_REAL_WIDTH   ( IN21_REAL_WIDTH   ) ,
		.IN1_IMG_WIDTH    ( IN21_IMG_WIDTH    ) ,
		.IN1_INT          ( IN21_INT          ) ,
		.IN1_FRAC         ( IN21_FRAC         ) ,
		.MULTI_REAL_WIDTH ( MULTI2_REAL_WIDTH ) ,
		.MULTI_IMG_WIDTH  ( MULTI2_IMG_WIDTH  ) ,
		.MULTI_INT        ( MULTI2_INT        ) ,
		.MULTI_FRAC       ( MULTI2_FRAC       ) ,
		.OUT0_REAL_WIDTH  ( OUT20_REAL_WIDTH  ) ,
		.OUT0_IMG_WIDTH   ( OUT20_IMG_WIDTH   ) ,
		.OUT0_INT         ( OUT20_INT         ) ,
		.OUT1_REAL_WIDTH  ( OUT21_REAL_WIDTH  ) ,
		.OUT1_IMG_WIDTH   ( OUT21_IMG_WIDTH   ) ,
		.OUT1_INT         ( OUT21_INT         )
	) MAC_2(
		.IN0_Real  ( IN20_Real  ) , // Real      part of the first  input
		.IN0_Img   ( IN20_Img   ) , // Imaginary part of the first  input
		.IN1_Real  ( IN21_Real  ) , // Real      part of the second input
		.IN1_Img   ( IN21_Img   ) , // Imaginary part of the second input
		.W8_Index  ( W8_2_Index ) , // Real      part of the twiddle factor
		.CLK       ( CLK        ) , //Clocking signal                      
		.RST       ( RST        ) , //Active high asynchronous reset signal
		.OUT0_Real ( OUT20_Real ) , // Real      part of the first  output
		.OUT0_Img  ( OUT20_Img  ) , // Imaginary part of the first  output
		.OUT1_Real ( OUT21_Real ) , // Real      part of the second output
		.OUT1_Img  ( OUT21_Img  )   // Imaginary part of the second output
	);
	
	//First MAC block, Order = 3
	MAC_Unit #(
		.IN0_REAL_WIDTH   ( IN30_REAL_WIDTH   ) ,
		.IN0_IMG_WIDTH    ( IN30_IMG_WIDTH    ) ,
		.IN1_REAL_WIDTH   ( IN31_REAL_WIDTH   ) ,
		.IN1_IMG_WIDTH    ( IN31_IMG_WIDTH    ) ,
		.IN1_INT          ( IN31_INT          ) ,
		.IN1_FRAC         ( IN31_FRAC         ) ,
		.MULTI_REAL_WIDTH ( MULTI3_REAL_WIDTH ) ,
		.MULTI_IMG_WIDTH  ( MULTI3_IMG_WIDTH  ) ,
		.MULTI_INT        ( MULTI3_INT        ) ,
		.MULTI_FRAC       ( MULTI3_FRAC       ) ,
		.OUT0_REAL_WIDTH  ( OUT30_REAL_WIDTH  ) ,
		.OUT0_IMG_WIDTH   ( OUT30_IMG_WIDTH   ) ,
		.OUT0_INT         ( OUT30_INT         ) ,
		.OUT1_REAL_WIDTH  ( OUT31_REAL_WIDTH  ) ,
		.OUT1_IMG_WIDTH   ( OUT31_IMG_WIDTH   ) ,
		.OUT1_INT         ( OUT31_INT         )
	) MAC_3(
		.IN0_Real  ( IN30_Real  ) , // Real      part of the first  input
		.IN0_Img   ( IN30_Img   ) , // Imaginary part of the first  input
		.IN1_Real  ( IN31_Real  ) , // Real      part of the second input
		.IN1_Img   ( IN31_Img   ) , // Imaginary part of the second input
		.W8_Index  ( W8_3_Index ) , // Real      part of the twiddle factor
		.CLK       ( CLK        ) , //Clocking signal                      
		.RST       ( RST        ) , //Active high asynchronous reset signal
		.OUT0_Real ( OUT30_Real ) , // Real      part of the first  output
		.OUT0_Img  ( OUT30_Img  ) , // Imaginary part of the first  output
		.OUT1_Real ( OUT31_Real ) , // Real      part of the second output
		.OUT1_Img  ( OUT31_Img  )   // Imaginary part of the second output
	);
	
endmodule