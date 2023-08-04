module bcd_ader(s,cout,a,b,cin);
input [3:0]a,b;
input cin;
output [3:0]s;
output cout;

wire [3:0]s1;
wire c1;
wire [3:0]complement;

xor(complement[0],b[0],cin);
xor(complement[1],b[1],cin);
xor(complement[2],b[2],cin);
xor(complement[3],b[3],cin);

wire [3:1]c2;

full_adder f1(s1[0],c2[1],a[0],complement[0],cin);
full_adder f2(s1[1],c2[2],a[1],complement[1],c2[1]);
full_adder f3(s1[2],c2[3],a[2],complement[2],c2[2]);
full_adder f4(s1[3],c1,a[3],complement[3],c2[3]);

wire ands1s3,ands2s3;

and(ands1s3,s1[1],s1[3]);
and(ands2s3,s1[2],s1[3]);
or(cout,c1,ands1s3,ands2s3);

wire [3:0]bb;
and(bb[0],0);
buf(bb[1],cout);
buf(bb[2],cout);
and(bb[3],0);

wire [4:1]cp;
full_adder f5(s[0],cp[1],s1[0],bb[0],cin);
full_adder f6(s[1],cp[2],s1[1],bb[1],cp[1]);
full_adder f7(s[2],cp[3],s1[2],bb[2],cp[2]);
full_adder f8(s[3],cp[4],s1[3],bb[3],cp[3]);
endmodule


module bcd_adder_tester;
reg [3:0]a,b;
reg cin;
wire [3:0]s;
wire cout;

bcd_ader bcd(s,cout,a,b,cin);
initial begin

#0  a=4'b0001;b=4'b0100;cin=0;
#100 a=4'b1010;b=4'b0001;cin=0;
#100 a=4'b0011;b=4'b0001;cin=0;
#100 a=4'b1100;b=4'b0010;cin=0;
#100 a=4'b1101;b=4'b0011;cin=1;
#100 a=4'b0110;b=4'b0010;cin=1;

end
endmodule
