module Complex_Multi #(
		parameter IN0_REAL_WIDTH = 4'd8 ,
				  IN0_IMG_WIDTH  = 4'd8 ,
				  IN0_INT        = 'd0  ,
				  IN0_FRAC       = 'd0  ,
				  IN1_REAL_WIDTH = 4'd8 ,
				  IN1_IMG_WIDTH  = 4'd8 ,
				  OUT_REAL_WIDTH = 5'd16,
				  OUT_IMG_WIDTH  = 5'd16,
				  OUT_INT        = 'd0  ,
				  OUT_FRAC       = 'd0  
	)(
		input  wire signed [IN0_REAL_WIDTH-1:0] IN0_Real , // Real      part of the first  input
		input  wire signed [IN0_IMG_WIDTH-1 :0] IN0_Img  , // Imaginary part of the first  input
		input  wire signed [IN1_REAL_WIDTH-1:0] IN1_Real , // Real      part of the second input
		input  wire signed [IN1_IMG_WIDTH-1 :0] IN1_Img  , // Imaginary part of the second input
		input  wire                             CLK      ,
		input  wire                             RST      ,
		output reg  signed [OUT_REAL_WIDTH-1:0] OUT_Real , // Real      part of the output
		output reg  signed [OUT_IMG_WIDTH-1 :0] OUT_Img    // Imaginary part of the output
	);
	
	//It's assumed that the IN1 signal always of Q2.10. IN0 is to be of Qx.8 (x = IN0_INT)
	//Therefore the product signal must always be of Qy.18 (y = x + 2). Therefore the width of Product_x signal must be of (20+y+ 1(for sign)) bits.
	localparam POSITION_BEFORE_VIRTUAL_DECIMAL_POINT = 'd17;
	localparam FULL_PRECISION_WIDTH                  = IN0_INT + 'd2 +'d18 + 'd1;
	
	reg signed [FULL_PRECISION_WIDTH-1:0] Product_Real_Part_1; 
	reg signed [FULL_PRECISION_WIDTH-1:0] Product_Real_Part_2;
	reg signed [FULL_PRECISION_WIDTH-1:0] Product_Real_Final ;
	reg signed [FULL_PRECISION_WIDTH-1:0] Product_Img_Part_1 ;
	reg signed [FULL_PRECISION_WIDTH-1:0] Product_Img_Part_2 ;
	reg signed [FULL_PRECISION_WIDTH-1:0] Product_Img_Final  ;
	
	reg  signed [OUT_REAL_WIDTH-1:0] OUT_Real_Comb;
	reg  signed [OUT_IMG_WIDTH-1 :0] OUT_Img_Comb ;
	
	always @(*) begin
		Product_Real_Part_1 = (IN0_Real * IN1_Real);  
		Product_Real_Part_2 = (IN0_Img * IN1_Img ) ;
		Product_Real_Final  = Product_Real_Part_1 - Product_Real_Part_2   ;
		Product_Img_Part_1  = (IN0_Real * IN1_Img ); 
		Product_Img_Part_2  = (IN0_Img * IN1_Real) ;
		Product_Img_Final   = Product_Img_Part_1 + Product_Img_Part_2      ;
		OUT_Real_Comb       = Product_Real_Final[POSITION_BEFORE_VIRTUAL_DECIMAL_POINT + OUT_INT: POSITION_BEFORE_VIRTUAL_DECIMAL_POINT - OUT_FRAC + 1];
		OUT_Img_Comb        = Product_Img_Final[POSITION_BEFORE_VIRTUAL_DECIMAL_POINT + OUT_INT: POSITION_BEFORE_VIRTUAL_DECIMAL_POINT - OUT_FRAC + 1];
	end

	always @(posedge CLK or posedge RST) begin
		if(RST) begin
			OUT_Real <= 'd0;
			OUT_Img  <= 'd0;
		end
		else begin
			OUT_Real <= OUT_Real_Comb;
		    OUT_Img  <= OUT_Img_Comb ;
		end
	end
	
endmodule