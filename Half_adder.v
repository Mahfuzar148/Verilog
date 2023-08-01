module Half_Adder12(a,b,s,c);
input a,b;
output s,c;
xor(s,a,b);
and(c,a,b);
endmodule

module tb_half_adder;
reg a,b;
wire s,c;
Half_Adder12 ckt(a,b,s,c);
initial
begin 
 a=0;
 b=0;
 #50
 a=1;
 b=0;
#50
a=0;
b=1;
#50
a=1;
b=1;
  
end
endmodule

