module binary_to_gray( output [3:0] g,input [3:0] b);
    buf (g[3], b[3]);
    xor (g[2], b[2], b[3]);
    xor (g[1], b[1], b[2]);
    xor (g[0], b[0], b[1]);
    
endmodule

module binary_to_gray_tb;
    reg [3:0] bn;
    wire [3:0] gr;

    binary_to_gray bg (.g(gr),.b(bn));

    initial begin
        // Test with some inputs
        $display("Time = %0t  Binary = %b  Gray = %b ",$time,b,g);
        b = 4'b0000;
        #100;
        b = 4'b0001;
        #100;
        b = 4'b0010;
        #100;
        b = 4'b0011;
        #100;
        b = 4'b0100;
        #100;
        b = 4'b0101;
        #100;
        b = 4'b0110;
        #100;
        b = 4'b1110;
        #100;
        b = 4'b1111;
        #100;
   
    end
endmodule
