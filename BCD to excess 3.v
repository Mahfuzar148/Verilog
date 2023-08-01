module bcd_to_excess_3(input [3:0] b,output [3:0] e);
not(e[0],b[0]);
xnor(e[1],b[0],b[1]);
wire w1;
or(w1,b[0],b[1]);
xor(e[2],w1,b[2]);
wire w2;
and(w2,w1,b[2]);
or(e[3],w2,b[3]);
endmodule

module bcd_to_excess_3_tb;
reg [3:0] b;
wire [3:0] e;
bcd_to_excess_3 be(.b(b), .e(e));
initial begin
#100;
b = 4'b0000;
#100;
b = 4'b0001;
#100;
b = 4'b0010;
#100;
b = 4'b0011;
#100;
b = 4'b0100;
#100;
b = 4'b0101;
#100;
b = 4'b0110;
#100;
b = 4'b0111;
#100;
b = 4'b1000;
#100;
b = 4'b1001;
#100;
b = 4'b1010;
#100;
b = 4'b1011;
#100;

end
endmodule
