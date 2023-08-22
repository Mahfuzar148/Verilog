

module master_jk(q, q_bar, j, k, clk, clr);
  output q, q_bar;
  input j, k, clk, clr;
  wire a, b, c, d, e,f, clk_bar;

  
 
  nand(a, j, clk, clr, q_bar);
  nand(b, k, clk, q);
  nand(c, a, d);
  nand(d, b, c, clr);

  not(clk_bar, clk);

  nand(e, c, clk_bar);
  nand(f, d, clk_bar);
  nand(q, e, q_bar);
  nand(q_bar, f, q, clr);
endmodule

module master_jk_test;
  reg j, k, clk, clr;
  wire q, q_bar;
  master_jk mjk(.q(q), .q_bar(q_bar), .j(j), .k(k), .clk(clk), .clr(clr));

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
