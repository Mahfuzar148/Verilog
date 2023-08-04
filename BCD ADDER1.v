module bcd_adder (output [3:0] s , output cout , input [3:0] a , b , input cin);

wire [4:1] c;
wire [3:0] s1;


full_adder f1(s1[0],c[1],a[0],b[0],cin);
full_adder f2(s1[1],c[2],a[1],b[1],c[1]);
full_adder f3(s1[2],c[3],a[2],b[2],c[2]);
full_adder f4(s1[3],c[4],a[3],b[3],c[3]);
 
wire [3:0] b1;
wire s3s2,s3s1;

and(s3s2,s1[3],s1[2]);
and(s3s1,s1[3],s1[1]);
or(cout,c[4],s3s2,s3s1);

and(b1[3],0);
buf(b1[2],cout);
buf(b1[1],cout);
and(b1[0],0);

wire [4:1] c1;

full_adder f5(s[0],c1[1],s1[0],b1[0],cin);
full_adder f6(s[1],c1[2],s1[1],b1[1],c1[1]);
full_adder f7(s[2],c1[3],s1[2],b1[2],c1[2]);
full_adder f8(s[3],c1[4],s1[3],b1[3],c1[3]);


endmodule

module bcd_adder_test;
 reg [3:0] a,b;
 reg cin;
 wire [3:0] s;
 wire cout;
 bcd_adder ba(.s(s), .cout(cout), .a(a) , .b(b), .cin(cin));

 initial
 begin
 a = 4'b0000 ; b = 4'b0000 ; cin=1'b0 ;
 #100;
 a = 4'b0001 ; b = 4'b0000 ; cin=1'b0 ;
 #100;
 a = 4'b0001 ; b = 4'b0001 ; cin=1'b0 ;
 #100;
  a = 4'b0001 ; b = 4'b0011 ; cin=1'b0 ;
 #100;
 a = 4'b0010 ; b = 4'b0010 ; cin=1'b0 ;
 #100;
 a = 4'b0010 ; b = 4'b0011 ; cin=1'b0 ;
 #100;
 a = 4'b0011 ; b = 4'b0011 ; cin=1'b0 ;
 #100;
  a = 4'b0100 ; b = 4'b0011 ; cin=1'b0 ;
 #100;
 a = 4'b0101 ; b = 4'b0011 ; cin=1'b0 ;
 #100;
 a = 4'b0101 ; b = 4'b0101 ; cin=1'b0 ;
 #100;
 a = 4'b0111 ; b = 4'b0001 ; cin=1'b0 ;
 #100;
 a = 4'b0111 ; b = 4'b1100 ; cin=1'b0 ;
 #100;
 end

endmodule




module full_adder(output s,cout,input a,b,cin);

wire w1,w2,w3;
half_adder h1(w1,w2,a,b);
half_adder h2(s,w3,cin,w1);
or(cout,w2,w3);

endmodule 


module half_adder(output s,cout,input a,b);

xor(s,a,b);
and(cout,a,b);

endmodule


