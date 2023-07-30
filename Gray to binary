

module gray_to_binary(output [3:0] b,input [3:0] g);

buf(b[3],g[3]);
xor(b[2],g[3],g[2]);
xor(b[1],g[3],g[2],g[1]);
xor(b[0],g[3],g[2],g[1],g[0]);

endmodule

module gray_to_binary_tb;
reg [3:0] gr;
wire [3:0] bn;
gray_to_binary gb(.b(bn),.g(gr));

initial 
begin
#100;
gr = 4'b0000;
#100;
gr = 4'b0001;
#100;
gr = 4'b0010;
#100;
gr = 4'b0011;
#100;
gr = 4'b0100;
#100;
gr = 4'b0101;
#100;
gr = 4'b0110;
#100;
gr = 4'b0111;
#100;
gr = 4'b1110;
#100;
gr = 4'b1111;
#100;

end
endmodule 
