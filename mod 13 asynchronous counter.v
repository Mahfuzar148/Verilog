
module master_jk(q,qbar,j,k,clk,clr);
input j,k,clk,clr;
output q,qbar;
wire a,b,c,d,e,f;
nand(a,j,qbar,clk,clr);
nand(b,k,q,clk);
nand(c,a,d);
nand(d,b,c,clr);

wire clkbar;
not(clkbar,clk);

nand(e,c,clkbar);
nand(f,d,clkbar);
nand(q,e,qbar);
nand(qbar,f,q,clr);

endmodule
 
module mod_10ff(q,qbar,clk,clr);
input clk,clr;
output [3:0] q,qbar;

wire a;
nand(a,q[0],q[1],q[3]);
or(clr,a,0);
master_jk mjk1(q[0],qbar[0],1,1,clk,clr);
master_jk mjk2(q[1],qbar[1],1,1,q[0],clr);
master_jk mjk3(q[2],qbar[2],1,1,q[1],clr);
master_jk mjk4(q[3],qbar[3],1,1,q[2],clr);
endmodule
