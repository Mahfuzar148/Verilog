module half_adder(s,c,a,b);
input a,b;
output s,c;
xor(s,a,b);
and(c,a,b);
endmodule
 
module full_adder(S,Co,A,B,Cin);
input A,B,Cin;
output S,Co;
wire w1,w2,w3;
half_adder h1(w1,w2,A,B);
half_adder h2(S,w3,w1,Cin);
or(Co,w2,w3);
endmodule 
module TB_full_adder();
reg A,B,Cin;
wire S,Co;
full_adder F1(S,Co,A,B,Cin);
initial 
begin
A=0;B=0;Cin=0;
#100

A=0;B=0;Cin=1;
#100

A=0;B=1;Cin=0;
#100

A=0;B=1;Cin=1;
#100

A=1;B=0;Cin=0;
#100

A=1;B=0;Cin=1;
#100

A=1;B=1;Cin=0;
#100

A=1;B=1;Cin=1;

end 
endmodule
