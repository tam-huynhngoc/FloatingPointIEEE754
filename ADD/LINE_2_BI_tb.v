
module LINE_2_BI_tb();

reg [31:0] in;
wire [4:0]out;

LINE_2_BI aa(.in(in), .out(out));

initial begin
	in = 4;
	#10;
	in = 8;
	#10;
	in = 16;
	#10
	in = 2;
	#10
	in = 1;
	#10
	in = 32;
	#10
	in = 33554432;
end


endmodule 