module Complex_Add_Sub #(
		parameter IN0_REAL_WIDTH = 4'd8,
				  IN0_IMG_WIDTH  = 4'd8,
				  IN1_REAL_WIDTH = 4'd8,
				  IN1_IMG_WIDTH  = 4'd8,
				  OUT_REAL_WIDTH = 4'd9,
				  OUT_IMG_WIDTH  = 4'd9,
				  OUT_INT        = 'd0 
	)(
		input  wire signed [IN0_REAL_WIDTH-1:0] IN0_Real , // Real      part of the first  input
		input  wire signed [IN0_IMG_WIDTH-1 :0] IN0_Img  , // Imaginary part of the first  input
		input  wire signed [IN1_REAL_WIDTH-1:0] IN1_Real , // Real      part of the second input
		input  wire signed [IN1_IMG_WIDTH-1 :0] IN1_Img  , // Imaginary part of the second input
		input  wire                             OP_Sel   , // Operation selection input [0 => ADDITION] and [1 => SUBTRACTION]
		input  wire                             CLK      ,
		input  wire                             RST      ,
		output reg  signed [OUT_REAL_WIDTH-1:0] OUT_Real , // Real      part of the output
		output reg  signed [OUT_IMG_WIDTH-1 :0] OUT_Img    // Imaginary part of the output
	);
	//According to modelling results the maximum needed INT part for output from the adder/subtractor is 5 bits with Q5.8. No need for decimal point alignment because all input signals are of 8 fraction bits.
	//Therefore the part which needed to be truncated from this 13-bits output is ['d7+OUT_INT:0] 
	
	localparam ADDITION         = 1'b0,
			   SUBTRACTION      = 1'b1,
			   MAX_RESULT_WIDTH = 'd13,
			   POSITION_BEFORE_VIRTUAL_DECIMAL_POINT = 'd7;
			   
	reg signed [MAX_RESULT_WIDTH-1:0] Result_Real; // Not (IN0_REAL_WIDTH+1) because it holds result of add or subtraction so it needs (IN0_REAL_WIDTH)
	reg signed [MAX_RESULT_WIDTH-1:0] Result_Img;  //Same as Result_Real
	
	reg  signed [OUT_REAL_WIDTH-1:0] OUT_Real_Comb;
	reg  signed [OUT_IMG_WIDTH-1 :0] OUT_Img_Comb ;  
	
	always @(*) begin
		case(OP_Sel)
			ADDITION: begin
				Result_Real = IN0_Real + IN1_Real;
				Result_Img  = IN0_Img  + IN1_Img ;
			end
			SUBTRACTION: begin
				Result_Real = IN0_Real - IN1_Real;
				Result_Img  = IN0_Img  - IN1_Img ;
			end
			default: begin
				OUT_Real_Comb = {OUT_REAL_WIDTH{1'b0}};
				OUT_Img_Comb  = {OUT_IMG_WIDTH{1'b0} };
			end
		endcase
		OUT_Real_Comb = Result_Real[POSITION_BEFORE_VIRTUAL_DECIMAL_POINT+OUT_INT:0];
		OUT_Img_Comb  = Result_Img[POSITION_BEFORE_VIRTUAL_DECIMAL_POINT+OUT_INT:0] ;
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