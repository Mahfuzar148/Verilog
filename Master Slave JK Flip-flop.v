
module master_jk_flip_flop(q, q_bar, j, k, clk, clr);
  output q, q_bar;
  input j, k, clk, clr;
  wire a, b, c, d, y, y_bar, clk_bar;

  not(y_bar, y);
  not(clk_bar, clk);

  nand(a, j, clk, clr, q_bar);
  nand(b, k, clk, clr, q);
  nand(y, a, y_bar);
  nand(y_bar, b, y, clr);
  nand(c, y, clk_bar);
  nand(d, y_bar, clk_bar);
  nand(q, c, q_bar, clr);
  nand(q_bar, d, q, clr);
endmodule

module master_jk_test;
  reg j, k, clk, clr;
  wire q, q_bar;
  master_jk_flip_flop mjk(.q(q), .q_bar(q_bar), .j(j), .k(k), .clk(clk), .clr(clr));

  initial begin
    j = 1'b0;
    k = 1'b0;
    clk = 1'b0;
    clr = 1'b0;

    #10;
    
    // Reset the circuit
    clr = 1'b1;
    #10;
    clr = 1'b0;

    // Test different scenarios
    j = 1'b1;
    k = 1'b1;
    #10;
    j = 1'b0;
    #10;
    j = 1'b1;
    #10;
    k = 1'b0;
    #10;
  end
endmodule
