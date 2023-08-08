
module master_jk_flip_flop(q, qbar, j, k, clr, clk);
input j,k,clk,clr;
output q,qbar;
wire a,b,c,d,e,f;
nand(a,j,clk,qbar,clr);
nand(b,k,q,clk);
nand(c,d,a);
nand(d,b,c,clr);
wire c_bar;
not(c_bar,clk);
nand(e,c,c_bar);
nand(f,d,c_bar);
nand(q,e,qbar);
nand(qbar,q,f,clr);
endmodule


module mod_10(q,q_bar,clk,clr);
output [3:0] q,q_bar;
input clk,clr;
//wire clr;
nand(clr,q[1],q[3]);

master_jk_flip_flop mjk0(q[0],q_bar[0],1,1,clr,clk);
master_jk_flip_flop mjk1(q[1],q_bar[1],1,1,clr,q[0]);
master_jk_flip_flop mjk2(q[2],q_bar[2],1,1,clr,q[1]);
master_jk_flip_flop mjk3(q[3],q_bar[3],1,1,clr,q[2]);

endmodule 

