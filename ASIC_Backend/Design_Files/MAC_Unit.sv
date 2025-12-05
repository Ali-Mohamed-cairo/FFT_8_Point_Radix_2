module MAC_Unit #(
		parameter IN0_REAL_WIDTH   = 4'd8  ,
				  IN0_IMG_WIDTH    = 4'd8  ,
				  IN1_REAL_WIDTH   = 4'd8  ,
				  IN1_IMG_WIDTH    = 4'd8  ,
				  IN1_INT          = 'd0   ,
				  IN1_FRAC         = 'd0   ,
				  MULTI_REAL_WIDTH = 5'd16 ,
				  MULTI_IMG_WIDTH  = 5'd16 ,
				  MULTI_INT        = 'd0   ,
				  MULTI_FRAC       = 'd0   ,
				  OUT0_REAL_WIDTH  = 4'd9  ,
				  OUT0_IMG_WIDTH   = 4'd9  ,
				  OUT0_INT         = 'd0   ,
				  OUT1_REAL_WIDTH  = 4'd9  ,
				  OUT1_IMG_WIDTH   = 4'd9  ,
				  OUT1_INT         = 'd0
	)(
		input  wire signed [IN0_REAL_WIDTH-1:0]  IN0_Real   , // Real      part of the first  input
		input  wire signed [IN0_IMG_WIDTH-1 :0]  IN0_Img    , // Imaginary part of the first  input
		input  wire signed [IN1_REAL_WIDTH-1:0]  IN1_Real   , // Real      part of the second input
		input  wire signed [IN1_IMG_WIDTH-1 :0]  IN1_Img    , // Imaginary part of the second input
		input  wire signed [1:0]                 W8_Index   , // Real      part of the twiddle factor
		input  wire                              CLK        , //Clocking signal                      
		input  wire                              RST        , //Active high asynchronous reset signal
		output reg  signed [OUT0_REAL_WIDTH-1:0] OUT0_Real  , // Real      part of the first  output
		output reg  signed [OUT0_IMG_WIDTH-1 :0] OUT0_Img   , // Imaginary part of the first  output
		output reg  signed [OUT1_REAL_WIDTH-1:0] OUT1_Real  , // Real      part of the second output
		output reg  signed [OUT1_IMG_WIDTH-1 :0] OUT1_Img     // Imaginary part of the second output
	);

	localparam ADDITION    = 1'b0,
			   SUBTRACTION = 1'b1;
			   
	wire [11:0] W8_Real, W8_Img;
	wire [MULTI_REAL_WIDTH-1:0] Multi_OUT_Real;
	wire [MULTI_IMG_WIDTH-1:0]  Multi_OUT_Img ;
	
	//Complex adder
	Complex_Add_Sub #(
		.IN0_REAL_WIDTH ( IN0_REAL_WIDTH   ),
		.IN0_IMG_WIDTH  ( IN0_IMG_WIDTH    ),
		.IN1_REAL_WIDTH ( MULTI_REAL_WIDTH ),
		.IN1_IMG_WIDTH  ( MULTI_IMG_WIDTH  ),
		.OUT_REAL_WIDTH ( OUT0_REAL_WIDTH  ),
		.OUT_IMG_WIDTH  ( OUT0_IMG_WIDTH   ),
		.OUT_INT        ( OUT0_INT         )
	) Cplx_Adder(
		.IN0_Real ( IN0_Real       ), // Real      part of the first  input
		.IN0_Img  ( IN0_Img        ), // Imaginary part of the first  input
		.IN1_Real ( Multi_OUT_Real ), // Real      part of the second input
		.IN1_Img  ( Multi_OUT_Img  ), // Imaginary part of the second input
		.OP_Sel   ( ADDITION       ), // Operation selection input [0 => ADDITION] and [1 => SUBTRACTION]
		.CLK      ( CLK            ),
		.RST      ( RST            ),
		.OUT_Real ( OUT0_Real      ), // Real      part of the output
		.OUT_Img  ( OUT0_Img       )  // Imaginary part of the output
	);

	Twiddle_LUT W8_LUT(
		.Index   ( W8_Index ), // The upper twiddle factor index [0, 1, 2, 3]
		.W8_Real ( W8_Real  ), // Real      part of the output
		.W8_Img  ( W8_Img   )  // Imaginary part of the output
	);
	
	//Complex multiplier
	Complex_Multi #(
		.IN0_REAL_WIDTH ( IN1_REAL_WIDTH   ),
		.IN0_IMG_WIDTH  ( IN1_IMG_WIDTH    ),
		.IN0_INT        ( IN1_INT          ),       
		.IN0_FRAC       ( IN1_FRAC         ),       
		.IN1_REAL_WIDTH ( 4'd12            ),
		.IN1_IMG_WIDTH  ( 4'd12            ),
		.OUT_REAL_WIDTH ( MULTI_REAL_WIDTH ),
		.OUT_IMG_WIDTH  ( MULTI_IMG_WIDTH  ),
		.OUT_INT        ( MULTI_INT        ),     
		.OUT_FRAC       ( MULTI_FRAC       )     
	) Cplx_Multiplier(
		.IN0_Real ( IN1_Real       ), // Real      part of the first  input
		.IN0_Img  ( IN1_Img        ), // Imaginary part of the first  input
		.IN1_Real ( W8_Real        ), // Real      part of the second input
		.IN1_Img  ( W8_Img         ), // Imaginary part of the second input
		.CLK      ( CLK            ) ,
		.RST      ( RST            ) ,
		.OUT_Real ( Multi_OUT_Real ), // Real      part of the output
		.OUT_Img  ( Multi_OUT_Img  )  // Imaginary part of the output
	);

	//Complex subtractor
	Complex_Add_Sub #(
		.IN0_REAL_WIDTH ( IN0_REAL_WIDTH   ),
		.IN0_IMG_WIDTH  ( IN0_IMG_WIDTH    ),
		.IN1_REAL_WIDTH ( MULTI_REAL_WIDTH ),
		.IN1_IMG_WIDTH  ( MULTI_IMG_WIDTH  ),
		.OUT_REAL_WIDTH ( OUT1_REAL_WIDTH  ),
		.OUT_IMG_WIDTH  ( OUT1_IMG_WIDTH   ),
		.OUT_INT        ( OUT1_INT         )
	) Cplx_Subtractor(
		.IN0_Real ( IN0_Real       ), // Real      part of the first  input
		.IN0_Img  ( IN0_Img        ), // Imaginary part of the first  input
		.IN1_Real ( Multi_OUT_Real ), // Real      part of the second input
		.IN1_Img  ( Multi_OUT_Img  ), // Imaginary part of the second input
		.OP_Sel   ( SUBTRACTION    ), // Operation selection input [0 => ADDITION] and [1 => SUBTRACTION]
		.CLK      ( CLK            ) ,
		.RST      ( RST            ) ,
		.OUT_Real ( OUT1_Real      ), // Real      part of the output
		.OUT_Img  ( OUT1_Img       )  // Imaginary part of the output
	);
	
endmodule