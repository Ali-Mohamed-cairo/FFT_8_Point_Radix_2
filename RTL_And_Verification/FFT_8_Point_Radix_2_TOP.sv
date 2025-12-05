module FFT_8_Point_Radix_2_TOP #(
		//Inputs parameters (Naming convention: (STAGE_ORDER)_IN(MAC_ORDER)(INPUT_ORDER)_(REALorIMG)_WIDTH)
		parameter SIGNALSAMPLE_0_REAL_WIDTH = 4'd8, 
				  SIGNALSAMPLE_0_IMG_WIDTH  = 4'd8, 
				  SIGNALSAMPLE_1_REAL_WIDTH = 4'd8, 
				  SIGNALSAMPLE_1_IMG_WIDTH  = 4'd8, 
				  SIGNALSAMPLE_2_REAL_WIDTH = 4'd8, 
				  SIGNALSAMPLE_2_IMG_WIDTH  = 4'd8, 
				  SIGNALSAMPLE_3_REAL_WIDTH = 4'd8, 
				  SIGNALSAMPLE_3_IMG_WIDTH  = 4'd8, 
				  SIGNALSAMPLE_4_REAL_WIDTH = 4'd8, 
				  SIGNALSAMPLE_4_IMG_WIDTH  = 4'd8, 
				  SIGNALSAMPLE_5_REAL_WIDTH = 4'd8, 
				  SIGNALSAMPLE_5_IMG_WIDTH  = 4'd8, 
				  SIGNALSAMPLE_6_REAL_WIDTH = 4'd8, 
				  SIGNALSAMPLE_6_IMG_WIDTH  = 4'd8, 
				  SIGNALSAMPLE_7_REAL_WIDTH = 4'd8, 
				  SIGNALSAMPLE_7_IMG_WIDTH  = 4'd8, 
		//Multipliers parameters (Naming convention: (STAGE_ORDER)_MUTLI(MAC_ORDER)_(REALorIMG)_WIDTH)
		parameter FIRST_MULTI0_REAL_WIDTH = 5'd16, SECOND_MULTI0_REAL_WIDTH = 5'd16, THIRD_MULTI0_REAL_WIDTH = 5'd16,
				  FIRST_MULTI0_IMG_WIDTH  = 5'd16, SECOND_MULTI0_IMG_WIDTH  = 5'd16, THIRD_MULTI0_IMG_WIDTH  = 5'd16,
				  FIRST_MULTI1_REAL_WIDTH = 5'd16, SECOND_MULTI1_REAL_WIDTH = 5'd16, THIRD_MULTI1_REAL_WIDTH = 5'd16,
				  FIRST_MULTI1_IMG_WIDTH  = 5'd16, SECOND_MULTI1_IMG_WIDTH  = 5'd16, THIRD_MULTI1_IMG_WIDTH  = 5'd16,
				  FIRST_MULTI2_REAL_WIDTH = 5'd16, SECOND_MULTI2_REAL_WIDTH = 5'd16, THIRD_MULTI2_REAL_WIDTH = 5'd16,
				  FIRST_MULTI2_IMG_WIDTH  = 5'd16, SECOND_MULTI2_IMG_WIDTH  = 5'd16, THIRD_MULTI2_IMG_WIDTH  = 5'd16,
				  FIRST_MULTI3_REAL_WIDTH = 5'd16, SECOND_MULTI3_REAL_WIDTH = 5'd16, THIRD_MULTI3_REAL_WIDTH = 5'd16,
				  FIRST_MULTI3_IMG_WIDTH  = 5'd16, SECOND_MULTI3_IMG_WIDTH  = 5'd16, THIRD_MULTI3_IMG_WIDTH  = 5'd16,
		//Outputs parameters (Naming convention: (STAGE_ORDER)_OUT(MAC_ORDER)(INPUT_ORDER)_(REALorIMG)_WIDTH)
		parameter FIRST_OUT00_REAL_WIDTH = 5'd10, SECOND_OUT00_REAL_WIDTH = 5'd10, THIRD_OUT00_REAL_WIDTH = 5'd10,
				  FIRST_OUT00_IMG_WIDTH  = 5'd10, SECOND_OUT00_IMG_WIDTH  = 5'd10, THIRD_OUT00_IMG_WIDTH  = 5'd10,
				  FIRST_OUT01_REAL_WIDTH = 5'd10, SECOND_OUT01_REAL_WIDTH = 5'd10, THIRD_OUT01_REAL_WIDTH = 5'd10,
				  FIRST_OUT01_IMG_WIDTH  = 5'd10, SECOND_OUT01_IMG_WIDTH  = 5'd10, THIRD_OUT01_IMG_WIDTH  = 5'd10,
				  FIRST_OUT10_REAL_WIDTH = 5'd10, SECOND_OUT10_REAL_WIDTH = 5'd10, THIRD_OUT10_REAL_WIDTH = 5'd10,
				  FIRST_OUT10_IMG_WIDTH  = 5'd10, SECOND_OUT10_IMG_WIDTH  = 5'd10, THIRD_OUT10_IMG_WIDTH  = 5'd10,
				  FIRST_OUT11_REAL_WIDTH = 5'd10, SECOND_OUT11_REAL_WIDTH = 5'd10, THIRD_OUT11_REAL_WIDTH = 5'd10,
				  FIRST_OUT11_IMG_WIDTH  = 5'd10, SECOND_OUT11_IMG_WIDTH  = 5'd10, THIRD_OUT11_IMG_WIDTH  = 5'd10,
			      FIRST_OUT20_REAL_WIDTH = 5'd10, SECOND_OUT20_REAL_WIDTH = 5'd10, THIRD_OUT20_REAL_WIDTH = 5'd10,
				  FIRST_OUT20_IMG_WIDTH  = 5'd10, SECOND_OUT20_IMG_WIDTH  = 5'd10, THIRD_OUT20_IMG_WIDTH  = 5'd10,
				  FIRST_OUT21_REAL_WIDTH = 5'd10, SECOND_OUT21_REAL_WIDTH = 5'd10, THIRD_OUT21_REAL_WIDTH = 5'd10,
				  FIRST_OUT21_IMG_WIDTH  = 5'd10, SECOND_OUT21_IMG_WIDTH  = 5'd10, THIRD_OUT21_IMG_WIDTH  = 5'd10,
				  FIRST_OUT30_REAL_WIDTH = 5'd10, SECOND_OUT30_REAL_WIDTH = 5'd10, THIRD_OUT30_REAL_WIDTH = 5'd10,
				  FIRST_OUT30_IMG_WIDTH  = 5'd10, SECOND_OUT30_IMG_WIDTH  = 5'd10, THIRD_OUT30_IMG_WIDTH  = 5'd10,
				  FIRST_OUT31_REAL_WIDTH = 5'd10, SECOND_OUT31_REAL_WIDTH = 5'd10, THIRD_OUT31_REAL_WIDTH = 5'd10,
				  FIRST_OUT31_IMG_WIDTH  = 5'd10, SECOND_OUT31_IMG_WIDTH  = 5'd10, THIRD_OUT31_IMG_WIDTH  = 5'd10 
	)(
		input wire signed  [SIGNALSAMPLE_0_REAL_WIDTH-1:0] SignalSample_0_Real , //Signal sample 0 real part
		input wire signed  [SIGNALSAMPLE_0_IMG_WIDTH -1:0] SignalSample_0_Img  , //Signal sample 0 img part 
		input wire signed  [SIGNALSAMPLE_1_REAL_WIDTH-1:0] SignalSample_1_Real , //Signal sample 1 real part  
		input wire signed  [SIGNALSAMPLE_1_IMG_WIDTH -1:0] SignalSample_1_Img  , //Signal sample 1 img part 
		input wire signed  [SIGNALSAMPLE_2_REAL_WIDTH-1:0] SignalSample_2_Real , //Signal sample 2 real part
		input wire signed  [SIGNALSAMPLE_2_IMG_WIDTH -1:0] SignalSample_2_Img  , //Signal sample 2 img part 
		input wire signed  [SIGNALSAMPLE_3_REAL_WIDTH-1:0] SignalSample_3_Real , //Signal sample 3 real part
		input wire signed  [SIGNALSAMPLE_3_IMG_WIDTH -1:0] SignalSample_3_Img  , //Signal sample 3 img part 
		input wire signed  [SIGNALSAMPLE_4_REAL_WIDTH-1:0] SignalSample_4_Real , //Signal sample 4 real part
		input wire signed  [SIGNALSAMPLE_4_IMG_WIDTH -1:0] SignalSample_4_Img  , //Signal sample 4 img part 
		input wire signed  [SIGNALSAMPLE_5_REAL_WIDTH-1:0] SignalSample_5_Real , //Signal sample 5 real part
		input wire signed  [SIGNALSAMPLE_5_IMG_WIDTH -1:0] SignalSample_5_Img  , //Signal sample 5 img part 
		input wire signed  [SIGNALSAMPLE_6_REAL_WIDTH-1:0] SignalSample_6_Real , //Signal sample 6 real part
		input wire signed  [SIGNALSAMPLE_6_IMG_WIDTH -1:0] SignalSample_6_Img  , //Signal sample 6 img part 
		input wire signed  [SIGNALSAMPLE_7_REAL_WIDTH-1:0] SignalSample_7_Real , //Signal sample 7 real part
		input wire signed  [SIGNALSAMPLE_7_IMG_WIDTH -1:0] SignalSample_7_Img  , //Signal sample 7 img part 
		
		input  wire                                        CLK,                  //Clocking signal
		input  wire                                        RST,                  //Active high asynchronous reset signal
		                                                     
		output wire signed [THIRD_OUT00_REAL_WIDTH-1:0] Third_OUT00_Real ,
		output wire signed [THIRD_OUT00_IMG_WIDTH -1:0] Third_OUT00_Img  ,
		output wire signed [THIRD_OUT01_REAL_WIDTH-1:0] Third_OUT01_Real ,
		output wire signed [THIRD_OUT01_IMG_WIDTH -1:0] Third_OUT01_Img  ,
		output wire signed [THIRD_OUT10_REAL_WIDTH-1:0] Third_OUT10_Real ,
		output wire signed [THIRD_OUT10_IMG_WIDTH -1:0] Third_OUT10_Img  ,
		output wire signed [THIRD_OUT11_REAL_WIDTH-1:0] Third_OUT11_Real ,
		output wire signed [THIRD_OUT11_IMG_WIDTH -1:0] Third_OUT11_Img  ,
		output wire signed [THIRD_OUT20_REAL_WIDTH-1:0] Third_OUT20_Real ,
		output wire signed [THIRD_OUT20_IMG_WIDTH -1:0] Third_OUT20_Img  ,
		output wire signed [THIRD_OUT21_REAL_WIDTH-1:0] Third_OUT21_Real ,
		output wire signed [THIRD_OUT21_IMG_WIDTH -1:0] Third_OUT21_Img  ,
		output wire signed [THIRD_OUT30_REAL_WIDTH-1:0] Third_OUT30_Real ,
		output wire signed [THIRD_OUT30_IMG_WIDTH -1:0] Third_OUT30_Img  ,
		output wire signed [THIRD_OUT31_REAL_WIDTH-1:0] Third_OUT31_Real ,
		output wire signed [THIRD_OUT31_IMG_WIDTH -1:0] Third_OUT31_Img   
	);

	localparam W8_0 = 2'd0,
	           W8_1 = 2'd1,
	           W8_2 = 2'd2,
	           W8_3 = 2'd3;
	
	reg  signed [SIGNALSAMPLE_0_REAL_WIDTH-1:0] First_IN00_Real ;
	reg  signed [SIGNALSAMPLE_0_IMG_WIDTH -1:0] First_IN00_Img  ;
	reg  signed [SIGNALSAMPLE_1_REAL_WIDTH-1:0] First_IN01_Real ;
	reg  signed [SIGNALSAMPLE_1_IMG_WIDTH -1:0] First_IN01_Img  ;
	reg  signed [SIGNALSAMPLE_2_REAL_WIDTH-1:0] First_IN10_Real ;
	reg  signed [SIGNALSAMPLE_2_IMG_WIDTH -1:0] First_IN10_Img  ;
	reg  signed [SIGNALSAMPLE_3_REAL_WIDTH-1:0] First_IN11_Real ;
	reg  signed [SIGNALSAMPLE_3_IMG_WIDTH -1:0] First_IN11_Img  ;
	reg  signed [SIGNALSAMPLE_4_REAL_WIDTH-1:0] First_IN20_Real ;
	reg  signed [SIGNALSAMPLE_4_IMG_WIDTH -1:0] First_IN20_Img  ;
	reg  signed [SIGNALSAMPLE_5_REAL_WIDTH-1:0] First_IN21_Real ;
	reg  signed [SIGNALSAMPLE_5_IMG_WIDTH -1:0] First_IN21_Img  ;
	reg  signed [SIGNALSAMPLE_6_REAL_WIDTH-1:0] First_IN30_Real ;
	reg  signed [SIGNALSAMPLE_6_IMG_WIDTH -1:0] First_IN30_Img  ;
	reg  signed [SIGNALSAMPLE_7_REAL_WIDTH-1:0] First_IN31_Real ;
	reg  signed [SIGNALSAMPLE_7_IMG_WIDTH -1:0] First_IN31_Img  ;
	
	wire signed [FIRST_OUT00_REAL_WIDTH-1:0] First_OUT00_Real ;
	wire signed [FIRST_OUT00_IMG_WIDTH -1:0] First_OUT00_Img  ;
	wire signed [FIRST_OUT01_REAL_WIDTH-1:0] First_OUT01_Real ;
	wire signed [FIRST_OUT01_IMG_WIDTH -1:0] First_OUT01_Img  ;
	wire signed [FIRST_OUT10_REAL_WIDTH-1:0] First_OUT10_Real ;
	wire signed [FIRST_OUT10_IMG_WIDTH -1:0] First_OUT10_Img  ;
	wire signed [FIRST_OUT11_REAL_WIDTH-1:0] First_OUT11_Real ;
	wire signed [FIRST_OUT11_IMG_WIDTH -1:0] First_OUT11_Img  ;
	wire signed [FIRST_OUT20_REAL_WIDTH-1:0] First_OUT20_Real ;
	wire signed [FIRST_OUT20_IMG_WIDTH -1:0] First_OUT20_Img  ;
	wire signed [FIRST_OUT21_REAL_WIDTH-1:0] First_OUT21_Real ;
	wire signed [FIRST_OUT21_IMG_WIDTH -1:0] First_OUT21_Img  ;
	wire signed [FIRST_OUT30_REAL_WIDTH-1:0] First_OUT30_Real ;
	wire signed [FIRST_OUT30_IMG_WIDTH -1:0] First_OUT30_Img  ;
	wire signed [FIRST_OUT31_REAL_WIDTH-1:0] First_OUT31_Real ;
	wire signed [FIRST_OUT31_IMG_WIDTH -1:0] First_OUT31_Img  ;

	wire signed [SECOND_OUT00_REAL_WIDTH-1:0] Second_OUT00_Real ;
	wire signed [SECOND_OUT00_IMG_WIDTH -1:0] Second_OUT00_Img  ;
	wire signed [SECOND_OUT01_REAL_WIDTH-1:0] Second_OUT01_Real ;
	wire signed [SECOND_OUT01_IMG_WIDTH -1:0] Second_OUT01_Img  ;
	wire signed [SECOND_OUT10_REAL_WIDTH-1:0] Second_OUT10_Real ;
	wire signed [SECOND_OUT10_IMG_WIDTH -1:0] Second_OUT10_Img  ;
	wire signed [SECOND_OUT11_REAL_WIDTH-1:0] Second_OUT11_Real ;
	wire signed [SECOND_OUT11_IMG_WIDTH -1:0] Second_OUT11_Img  ;
	wire signed [SECOND_OUT20_REAL_WIDTH-1:0] Second_OUT20_Real ;
	wire signed [SECOND_OUT20_IMG_WIDTH -1:0] Second_OUT20_Img  ;
	wire signed [SECOND_OUT21_REAL_WIDTH-1:0] Second_OUT21_Real ;
	wire signed [SECOND_OUT21_IMG_WIDTH -1:0] Second_OUT21_Img  ;
	wire signed [SECOND_OUT30_REAL_WIDTH-1:0] Second_OUT30_Real ;
	wire signed [SECOND_OUT30_IMG_WIDTH -1:0] Second_OUT30_Img  ;
	wire signed [SECOND_OUT31_REAL_WIDTH-1:0] Second_OUT31_Real ;
	wire signed [SECOND_OUT31_IMG_WIDTH -1:0] Second_OUT31_Img  ;
	
	always @(posedge CLK or posedge RST) begin
		if(RST) begin
			First_IN00_Real <= 'd0;
			First_IN00_Img  <= 'd0;
			First_IN01_Real <= 'd0;
			First_IN01_Img  <= 'd0;
			First_IN10_Real <= 'd0;
			First_IN10_Img  <= 'd0;
			First_IN11_Real <= 'd0;
			First_IN11_Img  <= 'd0;
			First_IN20_Real <= 'd0;
			First_IN20_Img  <= 'd0;
			First_IN21_Real <= 'd0;
			First_IN21_Img  <= 'd0;
			First_IN30_Real <= 'd0;
			First_IN30_Img  <= 'd0;
			First_IN31_Real <= 'd0;
			First_IN31_Img  <= 'd0;
		end
		else begin
			//Bit reversal
			First_IN00_Real <= SignalSample_0_Real;
			First_IN00_Img  <= SignalSample_0_Img ;
			First_IN01_Real <= SignalSample_4_Real;
			First_IN01_Img  <= SignalSample_4_Img ;
			First_IN10_Real <= SignalSample_2_Real;
			First_IN10_Img  <= SignalSample_2_Img ;
			First_IN11_Real <= SignalSample_6_Real;
			First_IN11_Img  <= SignalSample_6_Img ;
			First_IN20_Real <= SignalSample_1_Real;
			First_IN20_Img  <= SignalSample_1_Img ;
			First_IN21_Real <= SignalSample_5_Real;
			First_IN21_Img  <= SignalSample_5_Img ;
			First_IN30_Real <= SignalSample_3_Real;
			First_IN30_Img  <= SignalSample_3_Img ;
			First_IN31_Real <= SignalSample_7_Real;
			First_IN31_Img  <= SignalSample_7_Img ;
		end
	end
	
	//First stage
	Single_Stage_FFT_8_2 #(
		//Inputs parameters
		.IN00_REAL_WIDTH   ( SIGNALSAMPLE_0_REAL_WIDTH ),
		.IN00_IMG_WIDTH    ( SIGNALSAMPLE_0_IMG_WIDTH  ),
		.IN01_REAL_WIDTH   ( SIGNALSAMPLE_4_REAL_WIDTH ),
		.IN01_IMG_WIDTH    ( SIGNALSAMPLE_4_IMG_WIDTH  ),
		.IN10_REAL_WIDTH   ( SIGNALSAMPLE_2_REAL_WIDTH ),
		.IN10_IMG_WIDTH    ( SIGNALSAMPLE_2_IMG_WIDTH  ),
		.IN11_REAL_WIDTH   ( SIGNALSAMPLE_6_REAL_WIDTH ),
		.IN11_IMG_WIDTH    ( SIGNALSAMPLE_6_IMG_WIDTH  ),
		.IN20_REAL_WIDTH   ( SIGNALSAMPLE_1_REAL_WIDTH ),
		.IN20_IMG_WIDTH    ( SIGNALSAMPLE_1_IMG_WIDTH  ),
		.IN21_REAL_WIDTH   ( SIGNALSAMPLE_5_REAL_WIDTH ),
		.IN21_IMG_WIDTH    ( SIGNALSAMPLE_5_IMG_WIDTH  ),
		.IN30_REAL_WIDTH   ( SIGNALSAMPLE_3_REAL_WIDTH ),
		.IN30_IMG_WIDTH    ( SIGNALSAMPLE_3_IMG_WIDTH  ),
		.IN31_REAL_WIDTH   ( SIGNALSAMPLE_7_REAL_WIDTH ),
		.IN31_IMG_WIDTH    ( SIGNALSAMPLE_7_IMG_WIDTH  ),
		.IN01_INT          ( 'd1                       ),
		.IN01_FRAC         ( 'd8                       ),
		.IN11_INT          ( 'd1                       ),
		.IN11_FRAC         ( 'd8                       ),
		.IN21_INT          ( 'd1                       ),
		.IN21_FRAC         ( 'd8                       ),
		.IN31_INT          ( 'd1                       ),
		.IN31_FRAC         ( 'd8                       ),
		
		//Multipliers parameters
		.MULTI0_REAL_WIDTH ( FIRST_MULTI0_REAL_WIDTH ),
		.MULTI0_IMG_WIDTH  ( FIRST_MULTI0_IMG_WIDTH  ),
		.MULTI1_REAL_WIDTH ( FIRST_MULTI1_REAL_WIDTH ),
		.MULTI1_IMG_WIDTH  ( FIRST_MULTI1_IMG_WIDTH  ),
		.MULTI2_REAL_WIDTH ( FIRST_MULTI2_REAL_WIDTH ),
		.MULTI2_IMG_WIDTH  ( FIRST_MULTI2_IMG_WIDTH  ),
		.MULTI3_REAL_WIDTH ( FIRST_MULTI3_REAL_WIDTH ),
		.MULTI3_IMG_WIDTH  ( FIRST_MULTI3_IMG_WIDTH  ),
		.MULTI0_INT        ( 'd1                     ),
		.MULTI0_FRAC       ( 'd8                     ),
		.MULTI1_INT        ( 'd1                     ),
		.MULTI1_FRAC       ( 'd8                     ),
		.MULTI2_INT        ( 'd1                     ),
		.MULTI2_FRAC       ( 'd8                     ),
		.MULTI3_INT        ( 'd1                     ),
		.MULTI3_FRAC       ( 'd8                     ),
		
		
		//Outputs parameters
		.OUT00_REAL_WIDTH  ( FIRST_OUT00_REAL_WIDTH ),
		.OUT00_IMG_WIDTH   ( FIRST_OUT00_IMG_WIDTH  ),
		.OUT01_REAL_WIDTH  ( FIRST_OUT01_REAL_WIDTH ),
		.OUT01_IMG_WIDTH   ( FIRST_OUT01_IMG_WIDTH  ),
		.OUT10_REAL_WIDTH  ( FIRST_OUT10_REAL_WIDTH ),
		.OUT10_IMG_WIDTH   ( FIRST_OUT10_IMG_WIDTH  ),
		.OUT11_REAL_WIDTH  ( FIRST_OUT11_REAL_WIDTH ),
		.OUT11_IMG_WIDTH   ( FIRST_OUT11_IMG_WIDTH  ),
		.OUT20_REAL_WIDTH  ( FIRST_OUT20_REAL_WIDTH ),
		.OUT20_IMG_WIDTH   ( FIRST_OUT20_IMG_WIDTH  ),
		.OUT21_REAL_WIDTH  ( FIRST_OUT21_REAL_WIDTH ),
		.OUT21_IMG_WIDTH   ( FIRST_OUT21_IMG_WIDTH  ),
		.OUT30_REAL_WIDTH  ( FIRST_OUT30_REAL_WIDTH ),
		.OUT30_IMG_WIDTH   ( FIRST_OUT30_IMG_WIDTH  ),
		.OUT31_REAL_WIDTH  ( FIRST_OUT31_REAL_WIDTH ),
		.OUT31_IMG_WIDTH   ( FIRST_OUT31_IMG_WIDTH  ),
		.OUT00_INT         ( 'd2                    ),
		.OUT01_INT         ( 'd1                    ),
		.OUT10_INT         ( 'd2                    ),
		.OUT11_INT         ( 'd1                    ),
		.OUT20_INT         ( 'd2                    ),
		.OUT21_INT         ( 'd1                    ),
		.OUT30_INT         ( 'd2                    ),
		.OUT31_INT         ( 'd1                    ) 
		
	) First_Stage(
		.IN00_Real  ( First_IN00_Real ) ,
		.IN00_Img   ( First_IN00_Img  ) ,
		.IN01_Real  ( First_IN01_Real ) ,
		.IN01_Img   ( First_IN01_Img  ) ,
		.IN10_Real  ( First_IN10_Real ) ,
		.IN10_Img   ( First_IN10_Img  ) ,
		.IN11_Real  ( First_IN11_Real ) ,
		.IN11_Img   ( First_IN11_Img  ) ,
		.IN20_Real  ( First_IN20_Real ) ,
		.IN20_Img   ( First_IN20_Img  ) ,
		.IN21_Real  ( First_IN21_Real ) ,
		.IN21_Img   ( First_IN21_Img  ) ,
		.IN30_Real  ( First_IN30_Real ) ,
		.IN30_Img   ( First_IN30_Img  ) ,
		.IN31_Real  ( First_IN31_Real ) ,
		.IN31_Img   ( First_IN31_Img  ) ,
		                                                     
		.W8_0_Index ( W8_0 ) ,
		.W8_1_Index ( W8_0 ) ,
		.W8_2_Index ( W8_0 ) ,
		.W8_3_Index ( W8_0 ) ,
		
		.CLK       ( CLK   ) , //Clocking signal                      
		.RST       ( RST   ) , //Active high asynchronous reset signal
		                                                     
		.OUT00_Real ( First_OUT00_Real ) ,
		.OUT00_Img  ( First_OUT00_Img  ) ,
		.OUT01_Real ( First_OUT01_Real ) ,
		.OUT01_Img  ( First_OUT01_Img  ) ,
		.OUT10_Real ( First_OUT10_Real ) ,
		.OUT10_Img  ( First_OUT10_Img  ) ,
		.OUT11_Real ( First_OUT11_Real ) ,
		.OUT11_Img  ( First_OUT11_Img  ) ,
		.OUT20_Real ( First_OUT20_Real ) ,
		.OUT20_Img  ( First_OUT20_Img  ) ,
		.OUT21_Real ( First_OUT21_Real ) ,
		.OUT21_Img  ( First_OUT21_Img  ) ,
		.OUT30_Real ( First_OUT30_Real ) ,
		.OUT30_Img  ( First_OUT30_Img  ) ,
		.OUT31_Real ( First_OUT31_Real ) ,
		.OUT31_Img  ( First_OUT31_Img  ) 
	);
	
	
	//Second stage
	Single_Stage_FFT_8_2 #(
		//Inputs parameters
		.IN00_REAL_WIDTH   ( FIRST_OUT00_REAL_WIDTH ),
		.IN00_IMG_WIDTH    ( FIRST_OUT00_IMG_WIDTH  ),
		.IN01_REAL_WIDTH   ( FIRST_OUT10_REAL_WIDTH ),
		.IN01_IMG_WIDTH    ( FIRST_OUT10_IMG_WIDTH  ),
		.IN10_REAL_WIDTH   ( FIRST_OUT01_REAL_WIDTH ),
		.IN10_IMG_WIDTH    ( FIRST_OUT01_IMG_WIDTH  ),
		.IN11_REAL_WIDTH   ( FIRST_OUT11_REAL_WIDTH ),
		.IN11_IMG_WIDTH    ( FIRST_OUT11_IMG_WIDTH  ),
		.IN20_REAL_WIDTH   ( FIRST_OUT20_REAL_WIDTH ),
		.IN20_IMG_WIDTH    ( FIRST_OUT20_IMG_WIDTH  ),
		.IN21_REAL_WIDTH   ( FIRST_OUT30_REAL_WIDTH ),
		.IN21_IMG_WIDTH    ( FIRST_OUT30_IMG_WIDTH  ),
		.IN30_REAL_WIDTH   ( FIRST_OUT21_REAL_WIDTH ),
		.IN30_IMG_WIDTH    ( FIRST_OUT21_IMG_WIDTH  ),
		.IN31_REAL_WIDTH   ( FIRST_OUT31_REAL_WIDTH ),
		.IN31_IMG_WIDTH    ( FIRST_OUT31_IMG_WIDTH  ),
		.IN01_INT          ( 'd2                    ),
		.IN01_FRAC         ( 'd8                    ),
		.IN11_INT          ( 'd1                    ),
		.IN11_FRAC         ( 'd8                    ),
		.IN21_INT          ( 'd2                    ),
		.IN21_FRAC         ( 'd8                    ),
		.IN31_INT          ( 'd1                    ),
		.IN31_FRAC         ( 'd8                    ),
		
		//Multipliers parameters
		.MULTI0_REAL_WIDTH ( SECOND_MULTI0_REAL_WIDTH ),
		.MULTI0_IMG_WIDTH  ( SECOND_MULTI0_IMG_WIDTH  ),
		.MULTI1_REAL_WIDTH ( SECOND_MULTI1_REAL_WIDTH ),
		.MULTI1_IMG_WIDTH  ( SECOND_MULTI1_IMG_WIDTH  ),
		.MULTI2_REAL_WIDTH ( SECOND_MULTI2_REAL_WIDTH ),
		.MULTI2_IMG_WIDTH  ( SECOND_MULTI2_IMG_WIDTH  ),
		.MULTI3_REAL_WIDTH ( SECOND_MULTI3_REAL_WIDTH ),
		.MULTI3_IMG_WIDTH  ( SECOND_MULTI3_IMG_WIDTH  ),
		.MULTI0_INT        ( 'd2                      ),
		.MULTI0_FRAC       ( 'd8                      ),
		.MULTI1_INT        ( 'd1                      ),
		.MULTI1_FRAC       ( 'd8                      ),
		.MULTI2_INT        ( 'd2                      ),
		.MULTI2_FRAC       ( 'd8                      ),
		.MULTI3_INT        ( 'd1                      ),
		.MULTI3_FRAC       ( 'd8                      ),
		
		//Outputs parameters
		.OUT00_REAL_WIDTH  ( SECOND_OUT00_REAL_WIDTH ),
		.OUT00_IMG_WIDTH   ( SECOND_OUT00_IMG_WIDTH  ),
		.OUT01_REAL_WIDTH  ( SECOND_OUT01_REAL_WIDTH ),
		.OUT01_IMG_WIDTH   ( SECOND_OUT01_IMG_WIDTH  ),
		.OUT10_REAL_WIDTH  ( SECOND_OUT10_REAL_WIDTH ),
		.OUT10_IMG_WIDTH   ( SECOND_OUT10_IMG_WIDTH  ),
		.OUT11_REAL_WIDTH  ( SECOND_OUT11_REAL_WIDTH ),
		.OUT11_IMG_WIDTH   ( SECOND_OUT11_IMG_WIDTH  ),
		.OUT20_REAL_WIDTH  ( SECOND_OUT20_REAL_WIDTH ),
		.OUT20_IMG_WIDTH   ( SECOND_OUT20_IMG_WIDTH  ),
		.OUT21_REAL_WIDTH  ( SECOND_OUT21_REAL_WIDTH ),
		.OUT21_IMG_WIDTH   ( SECOND_OUT21_IMG_WIDTH  ),
		.OUT30_REAL_WIDTH  ( SECOND_OUT30_REAL_WIDTH ),
		.OUT30_IMG_WIDTH   ( SECOND_OUT30_IMG_WIDTH  ),
		.OUT31_REAL_WIDTH  ( SECOND_OUT31_REAL_WIDTH ),
		.OUT31_IMG_WIDTH   ( SECOND_OUT31_IMG_WIDTH  ),
		.OUT00_INT         ( 'd3                     ),
		.OUT01_INT         ( 'd2                     ),
		.OUT10_INT         ( 'd1                     ),
		.OUT11_INT         ( 'd1                     ),
		.OUT20_INT         ( 'd3                     ),
		.OUT21_INT         ( 'd2                     ),
		.OUT30_INT         ( 'd1                     ),
		.OUT31_INT         ( 'd1                     ) 
		
	) Second_Stage(
		.IN00_Real  ( First_OUT00_Real ) ,
		.IN00_Img   ( First_OUT00_Img  ) ,
		.IN01_Real  ( First_OUT10_Real ) ,
		.IN01_Img   ( First_OUT10_Img  ) ,
		.IN10_Real  ( First_OUT01_Real ) ,
		.IN10_Img   ( First_OUT01_Img  ) ,
		.IN11_Real  ( First_OUT11_Real ) ,
		.IN11_Img   ( First_OUT11_Img  ) ,
		.IN20_Real  ( First_OUT20_Real ) ,
		.IN20_Img   ( First_OUT20_Img  ) ,
		.IN21_Real  ( First_OUT30_Real ) ,
		.IN21_Img   ( First_OUT30_Img  ) ,
		.IN30_Real  ( First_OUT21_Real ) ,
		.IN30_Img   ( First_OUT21_Img  ) ,
		.IN31_Real  ( First_OUT31_Real ) ,
		.IN31_Img   ( First_OUT31_Img  ) ,
		                                                     
		.W8_0_Index ( W8_0 ) ,
		.W8_1_Index ( W8_2 ) ,
		.W8_2_Index ( W8_0 ) ,
		.W8_3_Index ( W8_2 ) ,
		
		.CLK       ( CLK   ) , //Clocking signal                      
		.RST       ( RST   ) , //Active high asynchronous reset signal
		                                                     
		.OUT00_Real ( Second_OUT00_Real ) ,
		.OUT00_Img  ( Second_OUT00_Img  ) ,
		.OUT01_Real ( Second_OUT01_Real ) ,
		.OUT01_Img  ( Second_OUT01_Img  ) ,
		.OUT10_Real ( Second_OUT10_Real ) ,
		.OUT10_Img  ( Second_OUT10_Img  ) ,
		.OUT11_Real ( Second_OUT11_Real ) ,
		.OUT11_Img  ( Second_OUT11_Img  ) ,
		.OUT20_Real ( Second_OUT20_Real ) ,
		.OUT20_Img  ( Second_OUT20_Img  ) ,
		.OUT21_Real ( Second_OUT21_Real ) ,
		.OUT21_Img  ( Second_OUT21_Img  ) ,
		.OUT30_Real ( Second_OUT30_Real ) ,
		.OUT30_Img  ( Second_OUT30_Img  ) ,
		.OUT31_Real ( Second_OUT31_Real ) ,
		.OUT31_Img  ( Second_OUT31_Img  ) 
	);

	//Third stage
	Single_Stage_FFT_8_2 #(
		//Inputs parameters
		.IN00_REAL_WIDTH   ( SECOND_OUT00_REAL_WIDTH ),
		.IN00_IMG_WIDTH    ( SECOND_OUT00_IMG_WIDTH  ),
		.IN01_REAL_WIDTH   ( SECOND_OUT20_REAL_WIDTH ),
		.IN01_IMG_WIDTH    ( SECOND_OUT20_IMG_WIDTH  ),
		.IN10_REAL_WIDTH   ( SECOND_OUT01_REAL_WIDTH ),
		.IN10_IMG_WIDTH    ( SECOND_OUT01_IMG_WIDTH  ),
		.IN11_REAL_WIDTH   ( SECOND_OUT21_REAL_WIDTH ),
		.IN11_IMG_WIDTH    ( SECOND_OUT21_IMG_WIDTH  ),
		.IN20_REAL_WIDTH   ( SECOND_OUT10_REAL_WIDTH ),
		.IN20_IMG_WIDTH    ( SECOND_OUT10_IMG_WIDTH  ),
		.IN21_REAL_WIDTH   ( SECOND_OUT30_REAL_WIDTH ),
		.IN21_IMG_WIDTH    ( SECOND_OUT30_IMG_WIDTH  ),
		.IN30_REAL_WIDTH   ( SECOND_OUT11_REAL_WIDTH ),
		.IN30_IMG_WIDTH    ( SECOND_OUT11_IMG_WIDTH  ),
		.IN31_REAL_WIDTH   ( SECOND_OUT31_REAL_WIDTH ),
		.IN31_IMG_WIDTH    ( SECOND_OUT31_IMG_WIDTH  ),
		.IN01_INT          ( 'd3                    ),
		.IN01_FRAC         ( 'd8                    ),
		.IN11_INT          ( 'd2                    ),
		.IN11_FRAC         ( 'd8                    ),
		.IN21_INT          ( 'd1                    ),
		.IN21_FRAC         ( 'd8                    ),
		.IN31_INT          ( 'd1                    ),
		.IN31_FRAC         ( 'd8                    ),
		
		//Multipliers parameters
		.MULTI0_REAL_WIDTH ( THIRD_MULTI0_REAL_WIDTH ),
		.MULTI0_IMG_WIDTH  ( THIRD_MULTI0_IMG_WIDTH  ),
		.MULTI1_REAL_WIDTH ( THIRD_MULTI1_REAL_WIDTH ),
		.MULTI1_IMG_WIDTH  ( THIRD_MULTI1_IMG_WIDTH  ),
		.MULTI2_REAL_WIDTH ( THIRD_MULTI2_REAL_WIDTH ),
		.MULTI2_IMG_WIDTH  ( THIRD_MULTI2_IMG_WIDTH  ),
		.MULTI3_REAL_WIDTH ( THIRD_MULTI3_REAL_WIDTH ),
		.MULTI3_IMG_WIDTH  ( THIRD_MULTI3_IMG_WIDTH  ),
		.MULTI0_INT        ( 'd3                      ),
		.MULTI0_FRAC       ( 'd8                      ),
		.MULTI1_INT        ( 'd2                      ),
		.MULTI1_FRAC       ( 'd8                      ),
		.MULTI2_INT        ( 'd2                      ),
		.MULTI2_FRAC       ( 'd8                      ),
		.MULTI3_INT        ( 'd2                      ),
		.MULTI3_FRAC       ( 'd8                      ),
		
		//Outputs parameters
		.OUT00_REAL_WIDTH  ( THIRD_OUT00_REAL_WIDTH ),
		.OUT00_IMG_WIDTH   ( THIRD_OUT00_IMG_WIDTH  ),
		.OUT01_REAL_WIDTH  ( THIRD_OUT01_REAL_WIDTH ),
		.OUT01_IMG_WIDTH   ( THIRD_OUT01_IMG_WIDTH  ),
		.OUT10_REAL_WIDTH  ( THIRD_OUT10_REAL_WIDTH ),
		.OUT10_IMG_WIDTH   ( THIRD_OUT10_IMG_WIDTH  ),
		.OUT11_REAL_WIDTH  ( THIRD_OUT11_REAL_WIDTH ),
		.OUT11_IMG_WIDTH   ( THIRD_OUT11_IMG_WIDTH  ),
		.OUT20_REAL_WIDTH  ( THIRD_OUT20_REAL_WIDTH ),
		.OUT20_IMG_WIDTH   ( THIRD_OUT20_IMG_WIDTH  ),
		.OUT21_REAL_WIDTH  ( THIRD_OUT21_REAL_WIDTH ),
		.OUT21_IMG_WIDTH   ( THIRD_OUT21_IMG_WIDTH  ),
		.OUT30_REAL_WIDTH  ( THIRD_OUT30_REAL_WIDTH ),
		.OUT30_IMG_WIDTH   ( THIRD_OUT30_IMG_WIDTH  ),
		.OUT31_REAL_WIDTH  ( THIRD_OUT31_REAL_WIDTH ),
		.OUT31_IMG_WIDTH   ( THIRD_OUT31_IMG_WIDTH  ),
		.OUT00_INT         ( 'd4                    ),
		.OUT01_INT         ( 'd4                    ),
		.OUT10_INT         ( 'd4                    ),
		.OUT11_INT         ( 'd4                    ),
		.OUT20_INT         ( 'd4                    ),
		.OUT21_INT         ( 'd4                    ),
		.OUT30_INT         ( 'd4                    ),
		.OUT31_INT         ( 'd4                    ) 
		
	) Third_Stage(
		.IN00_Real  ( Second_OUT00_Real ) ,
		.IN00_Img   ( Second_OUT00_Img  ) ,
		.IN01_Real  ( Second_OUT20_Real ) ,
		.IN01_Img   ( Second_OUT20_Img  ) ,
		.IN10_Real  ( Second_OUT01_Real ) ,
		.IN10_Img   ( Second_OUT01_Img  ) ,
		.IN11_Real  ( Second_OUT21_Real ) ,
		.IN11_Img   ( Second_OUT21_Img  ) ,
		.IN20_Real  ( Second_OUT10_Real ) ,
		.IN20_Img   ( Second_OUT10_Img  ) ,
		.IN21_Real  ( Second_OUT30_Real ) ,
		.IN21_Img   ( Second_OUT30_Img  ) ,
		.IN30_Real  ( Second_OUT11_Real ) ,
		.IN30_Img   ( Second_OUT11_Img  ) ,
		.IN31_Real  ( Second_OUT31_Real ) ,
		.IN31_Img   ( Second_OUT31_Img  ) ,
		                                                     
		.W8_0_Index ( W8_0 ) ,
		.W8_1_Index ( W8_1 ) ,
		.W8_2_Index ( W8_2 ) ,
		.W8_3_Index ( W8_3 ) ,
		
		.CLK       ( CLK   ) , //Clocking signal                      
		.RST       ( RST   ) , //Active high asynchronous reset signal
		                                                     
		.OUT00_Real ( Third_OUT00_Real ) ,
		.OUT00_Img  ( Third_OUT00_Img  ) ,
		.OUT01_Real ( Third_OUT01_Real ) ,
		.OUT01_Img  ( Third_OUT01_Img  ) ,
		.OUT10_Real ( Third_OUT10_Real ) ,
		.OUT10_Img  ( Third_OUT10_Img  ) ,
		.OUT11_Real ( Third_OUT11_Real ) ,
		.OUT11_Img  ( Third_OUT11_Img  ) ,
		.OUT20_Real ( Third_OUT20_Real ) ,
		.OUT20_Img  ( Third_OUT20_Img  ) ,
		.OUT21_Real ( Third_OUT21_Real ) ,
		.OUT21_Img  ( Third_OUT21_Img  ) ,
		.OUT30_Real ( Third_OUT30_Real ) ,
		.OUT30_Img  ( Third_OUT30_Img  ) ,
		.OUT31_Real ( Third_OUT31_Real ) ,
		.OUT31_Img  ( Third_OUT31_Img  ) 
	);
	
endmodule