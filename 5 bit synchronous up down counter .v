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
 
module synchronous_updown_counter(q,qbar,clk,clr,mode);
output [4:0] q,qbar;
input clk,clr,mode;
wire modebar;
wire and1,and2,and3,and4,and5,and6,and7,and8,or1,or2,or3,or4;
not(modebar,mode);
master_jk mjk1(q[0],qbar[0],1,1,clk,clr);


and(and1,q[0],modebar);
and(and2,qbar[0],mode);
or(or1,and1,and2);
master_jk mjk2(q[1],qbar[1],or1,or1,clk,clr);

and(and3,q[1],and1);
and(and4,qbar[1],and2);
or(or2,and3,and4);
master_jk mjk3(q[2],qbar[2],or2,or2,clk,clr);


and(and5,q[2],and3);
and(and6,qbar[2],and4);
or(or3,and5,and6);
master_jk mjk4(q[3],qbar[3],or3,or3,clk,clr);

and(and7,q[3],and5);
and(and8,qbar[3],and6);
or(or4,and7,and8);

master_jk mjk5(q[4],qbar[4],or4,or4,clk,clr);


endmodule
