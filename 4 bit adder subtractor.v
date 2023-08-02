/**
module four_bit_adder_subtractor(s,cout, a,b, mode);
input [3:0] a,b;
input mode;
output [3:0] s;
output cout;
wire c1,c2,c3;
full_adder f1(s[0],c1,a[0],(b[0]^mode),mode);
full_adder f2(s[1],c2,a[1],(b[1]^mode),c1);
full_adder f3(s[2],c3,a[2],(b[2]^mode),c2);
full_adder f4(s[3],cout,a[3],(b[3]^mode),c3);

endmodule 

module four_bit_adder_subtractor_tb;
reg [3:0] a,b;
reg mode;
wire [3:0] s;
wire cout;
four_bit_adder_subtractor as(.s(s),.cout(cout),.a(a),.b(b), .mode(mode));
initial begin
#100; a = 4'b1000;b=4'b0010;mode = 0;

#100; a = 4'b1000;b=4'b1000;mode = 0;

#100; a = 4'b0010;b=4'b1000;mode = 0;

#100; a = 4'b0001;b=4'b0111;mode = 0;

#100; a = 4'b1010;b=4'b1011;mode = 0;

#100; a = 4'b1110;b=4'b1111;mode = 0;

#100; a = 4'b1010;b=4'b1101;mode = 0;
end

endmodule

module full_adder(output s,cout,input a,b,cin);

wire w1,w2,w3;
half_adder h1(w1,w2,a,b);
half_adder h2(s,w3,cin,w1);
or(cout,w2,w3);

endmodule 

module half_adder(output s,c,input a,b);

xor(s,a,b);
and(c,a,b);

endmodule
*/

module four_bit_adder_subtractor(
  output [3:0] s,
  output cout,
  input [3:0] a,
  input [3:0] b,
  input mode
);

  wire c1, c2, c3;
  full_adder f1(s[0], c1, a[0], (b[0]^mode), mode);
  full_adder f2(s[1], c2, a[1], (b[1]^mode), c1);
  full_adder f3(s[2], c3, a[2], (b[2]^mode), c2);
  full_adder f4(s[3], cout, a[3], (b[3]^mode), c3);

endmodule

module four_bit_adder_subtractor_tb;
  reg [3:0] a, b;
  reg mode;
  wire [3:0] s;
  wire cout;
  four_bit_adder_subtractor as(s, cout, a, b, mode);

  initial begin
   
     a = 4'b1000; b = 4'b0010; mode = 1;
    #100; 
    a = 4'b1000; b = 4'b1000; mode = 1;
    #100;
    a = 4'b0010; b = 4'b1000; mode = 1;
    #100; 
    a = 4'b0001; b = 4'b0111; mode = 1;

    #100; 
    a = 4'b1010; b = 4'b1011; mode = 1;
    #100;
    a = 4'b1110; b = 4'b1111; mode = 1;
    #100; 
    a = 4'b1010; b = 4'b1101; mode = 1;
    #100; 
    a = 4'b0101; b = 4'b0101; mode = 1; 
    #100; 
    a = 4'b0011; b = 4'b0100; mode = 1; 
    #100;
  end

  

endmodule

module full_adder(
  output s,
  output cout,
  input a,
  input b,
  input cin
);

  wire w1, w2, w3;
  half_adder h1(w1, w2, a, b);
  half_adder h2(s, w3, cin, w1);
  or(cout, w2, w3);

endmodule

module half_adder(
  output s,
  output c,
  input a,
  input b
);

  xor(s, a, b);
  and(c, a, b);

endmodule


