
module TAYLOR_EXP(
	in,
	out
);
input [31:0]in;
output [31:0]out;

// x_i: x^i
wire [31:0]  x_2, x_3, x_4, x_5, x_6, x_7, x_8, x_9, x_10;

MUL X_A_2(.in1(in[31:0]), .in2(in[31:0]), .out(x_2[31:0]));
MUL X_A_3(.in1(in[31:0]), .in2(x_2[31:0]), .out(x_3[31:0]));
MUL X_A_4(.in1(in[31:0]), .in2(x_3[31:0]), .out(x_4[31:0]));
MUL X_A_5(.in1(in[31:0]), .in2(x_4[31:0]), .out(x_5[31:0]));
MUL X_A_6(.in1(in[31:0]), .in2(x_5[31:0]), .out(x_6[31:0]));
MUL X_A_7(.in1(in[31:0]), .in2(x_6[31:0]), .out(x_7[31:0]));
MUL X_A_8(.in1(in[31:0]), .in2(x_7[31:0]), .out(x_8[31:0]));
MUL X_A_9(.in1(in[31:0]), .in2(x_8[31:0]), .out(x_9[31:0]));
MUL X_A_10(.in1(in[31:0]), .in2(x_9[31:0]), .out(x_10[31:0]));

// x__i : x^i/i!
wire [31:0] x__2, x__3, x__4, x__5, x__6, x__7, x__8, x__9, x__10;

DIV X_A_A__2(.in1(x_2[31:0]), .in2(32'b01000000000000000000000000000000), .out(x__2[31:0]));
DIV X_A_A__3(.in1(x_3[31:0]), .in2(32'b01000000110000000000000000000000), .out(x__3[31:0]));
DIV X_A_A__4(.in1(x_4[31:0]), .in2(32'b01000001110000000000000000000000), .out(x__4[31:0]));
DIV X_A_A__5(.in1(x_5[31:0]), .in2(32'b01000010111100000000000000000000), .out(x__5[31:0]));
DIV X_A_A__6(.in1(x_6[31:0]), .in2(32'b01000100001101000000000000000000), .out(x__6[31:0]));
DIV X_A_A__7(.in1(x_7[31:0]), .in2(32'b01000101100111011000000000000000), .out(x__7[31:0]));
DIV X_A_A__8(.in1(x_8[31:0]), .in2(32'b01000111000111011000000000000000), .out(x__8[31:0]));
DIV X_A_A__9(.in1(x_9[31:0]), .in2(32'b01001000101100010011000000000000), .out(x__9[31:0]));
DIV X_A_A__10(.in1(x_10[31:0]), .in2(32'b01001010010111010111110000000000), .out(x__10[31:0]));


// sum_i = taylor(i)
wire [31:0] sum_1, sum_2,sum_3,sum_4,sum_5,sum_6, sum_7, sum_8, sum_9, sum_10;
ADD SUM_1 (.a(32'b00111111100000000000000000000000), .b(in[31:0]), .symbol(1'b0), .out(sum_1[31:0])  );
ADD SUM_2 (.a(sum_1[31:0]), .b(x__2[31:0]), .symbol(1'b0), .out(sum_2[31:0])  );
ADD SUM_3 (.a(sum_2[31:0]), .b(x__3[31:0]), .symbol(1'b0), .out(sum_3[31:0])  );
ADD SUM_4 (.a(sum_3[31:0]), .b(x__4[31:0]), .symbol(1'b0), .out(sum_4[31:0])  );
ADD SUM_5 (.a(sum_4[31:0]), .b(x__5[31:0]), .symbol(1'b0), .out(sum_5[31:0])  );
ADD SUM_6 (.a(sum_5[31:0]), .b(x__6[31:0]), .symbol(1'b0), .out(sum_6[31:0])  );
ADD SUM_7 (.a(sum_6[31:0]), .b(x__7[31:0]), .symbol(1'b0), .out(sum_7[31:0])  );
ADD SUM_8 (.a(sum_7[31:0]), .b(x__8[31:0]), .symbol(1'b0), .out(sum_8[31:0])  );
ADD SUM_9 (.a(sum_8[31:0]), .b(x__9[31:0]), .symbol(1'b0), .out(sum_9[31:0])  );
ADD SUM_10 (.a(sum_9[31:0]), .b(x__10[31:0]), .symbol(1'b0), .out(sum_10[31:0])  );

assign  out[31:0] = sum_10[31:0];

endmodule