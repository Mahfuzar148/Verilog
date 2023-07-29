module binary_to_gray(
    input b1,
    input b2,
    input b3,
    input b4,
    output g1,
    output g2,
    output g3,
    output g4
    );
buf(g1,b1);
xor (g2,b1,b2),(g3,b2,b3),(g4,b3,b4);
endmodule

module binary_to_gray_tb;
reg b1,b2,b3,b4;
wire g1,g2,g3,g4;
binary_to_gray bg(b1,b2,b3,b4,g1,g2,g3,g4);

initial 
begin
// Initialize Inputs
b1 = 0;b2 = 0;b3 = 0;b4 = 0;
// Wait 100 ns for global reset to finish
#100;
// Add stimulus here
#100;
b1 = 0;b2 = 0;b3 = 0;b4 = 1;
#100;
b1 = 0;b2 = 0;b3 = 1;b4 = 0;
#100;
b1 = 0;b2 = 0;b3 = 1;b4 = 1;
#100;
b1 = 0;b2 = 1;b3 = 0;b4 = 0;
#100;
b1 = 0;b2 = 1;b3 = 0;b4 = 1;
#100;
b1 = 0;b2 = 1;b3 = 1;b4 = 0;
#100;
b1 = 0;b2 = 1;b3 = 1;b4 = 1;
#100;
b1 = 1;b2 = 0;b3 = 0;b4 = 0;
#100;
b1 = 1;b2 = 0;b3 = 0;b4 = 1;
#100;
b1 = 1;b2 = 0;b3 = 1;b4 = 0;
#100;
b1 = 1;b2 = 0;b3 = 1;b4 = 1;
#100;
b1 = 1;b2 = 1;b3 = 0;b4 = 0;
#100;
b1 = 1;b2 = 1;b3 = 0;b4 = 1;
#100;
b1 = 1;b2 = 1;b3 = 1;b4 = 0;
#100;
b1 = 1;b2 = 1;b3 = 1;b4 = 1;
end
endmodule
