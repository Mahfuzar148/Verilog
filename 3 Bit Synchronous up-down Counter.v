/* Dependencies: JK Flip-Flop, T Flip-Flop */
/* During wave simulation in ModelSim,
Set the variable Clk as the clock signal.
Force the value of Clr to 0 only for the first simulation run.
After the first run, set the value of Clr to 1 for proper circuit operation. 
*/


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


/*Synchronous Up/Down Counter using master Slave JK flip-flop*/


module synchronous_up_down_counter(q, q_bar, clr, clk, mode);
    output [2:0] q, q_bar;
    input clr, clk, mode;
    wire mode_bar, and1, and2, and3, and4, or1, or2;
    not(mode_bar, mode);

    master_jk_flip_flop mjk0(q[0], q_bar[0], 1, 1, clr, clk);

    and(and1, q[0], mode_bar);
    and(and2, q_bar[0], mode);
    or(or1, and1, and2);

    master_jk_flip_flop mjk1(q[1], q_bar[1], or1, or1, clr, clk);

    and(and3, and1, q[1]);
    and(and4, and2, q_bar[1]);
    or(or2, and3, and4);

    master_jk_flip_flop mjk2(q[2], q_bar[2], or2, or2, clr, clk);
endmodule

