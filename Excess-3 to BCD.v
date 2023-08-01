
module excess_3_to_bcd(input [3:0] e, output [3:0] b);
  not(b[0], e[0]);
  xor(b[1], e[1], e[0]);
  wire w1, w2, w3;
  and(w1, e[0], e[1]);
  xnor(b[2], w1, e[2]);
  and(w2, e[0], e[1], e[3]);
  and(w3, e[2], e[3]);
  or(b[3], w2, w3);
endmodule

module excess_3_to_bcd_tb;
  reg [3:0] e;
  wire [3:0] b;
  excess_3_to_bcd eb(.e(e), .b(b));

  initial begin
    
    #100;
    e = 4'b0011;
    #100;
    e = 4'b0100;
    #100;
    e = 4'b0101; 
    #100;
    
    e = 4'b0110;
    #100;
    e = 4'b0111;
    #100;
    e = 4'b1000;
    #100;
    e = 4'b1001;
    #100;
    e = 4'b1010;
    #100;
    e = 4'b1011;
    #100;
    e = 4'b1100;
    #100;
    e = 4'b1101;
    #100;
    e = 4'b1110;
    #100;
    e = 4'b1111;
    #100;
  end
endmodule




