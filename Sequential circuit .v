//0,8,12,14,15,7,3,1,0 ......

module master_jk(q, q_bar, j, k, clk, clr);
  output q, q_bar;
  input j, k, clk, clr;
  wire a, b, c, d, e,f, clk_bar;

  
 
  nand(a, j, clk,q_bar,clr);
  nand(b, k,q,clk);
  nand(c, a, d);
  nand(d, b, c, clr);

  not(clk_bar, clk);

  nand(e, c, clk_bar);
  nand(f, d, clk_bar);
  nand(q, e, q_bar);
  nand(q_bar, f, q, clr);
endmodule

module sequential_counter(q,q_bar,clk,clr);
output [3:0] q,q_bar;
input clk,clr;

master_jk jk1(q[0],q_bar[0],q[1],q_bar[1],clk,clr);
master_jk jk2(q[1],q_bar[1],q[2],q_bar[2],clk,clr);
master_jk jk3(q[2],q_bar[2],q[3],q_bar[3],clk,clr);
master_jk jk4(q[3],q_bar[3],q_bar[0],q[0],clk,clr);

endmodule
