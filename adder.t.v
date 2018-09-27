// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg [3:0] a, b;
    wire [3:0] sum;
    wire carryout, overflow;

    FullAdder4bit adder (sum, carryout, overflow, a, b);

    initial begin
        $dumpfile("adder.vcd");
        $dumpvars();
        $display("A    B    | Cout Sum   Over  | Ecout Esum   Eover");
        // Set 16 test cases and output results to compare with expected results
        a=4'b0000;b=4'b0000; #1000
        $display("%b %b |  %b   %b   %b    | 0     0000   0", a, b, carryout, sum, overflow);
        a=4'b0010;b=4'b0100; #1000
        $display("%b %b |  %b   %b   %b    | 0     0110   0", a, b, carryout, sum, overflow);
        a=4'b0010;b=4'b1100; #1000
        $display("%b %b |  %b   %b   %b    | 0     1110   0", a, b, carryout, sum, overflow);
        a=4'b0000;b=4'b0111; #1000
        $display("%b %b |  %b   %b   %b    | 0     0111   0", a, b, carryout, sum, overflow);
        a=4'b1110;b=4'b1010; #1000
        $display("%b %b |  %b   %b   %b    | 1     1000   0", a, b, carryout, sum, overflow);
        a=4'b1110;b=4'b1100; #1000
        $display("%b %b |  %b   %b   %b    | 1     1010   0", a, b, carryout, sum, overflow);
        a=4'b1110;b=4'b0100; #1000
        $display("%b %b |  %b   %b   %b    | 1     0010   0", a, b, carryout, sum, overflow);
        a=4'b0101;b=4'b0010; #1000
        $display("%b %b |  %b   %b   %b    | 0     0111   0", a, b, carryout, sum, overflow);
        a=4'b1101;b=4'b1011; #1000
        $display("%b %b |  %b   %b   %b    | 1     1000   0", a, b, carryout, sum, overflow);
        a=4'b0101;b=4'b0011; #1000
        $display("%b %b |  %b   %b   %b    | 0     1000   1", a, b, carryout, sum, overflow);
        a=4'b1001;b=4'b1110; #1000
        $display("%b %b |  %b   %b   %b    | 1     0111   1", a, b, carryout, sum, overflow);
        a=4'b0001;b=4'b1111; #1000
        $display("%b %b |  %b   %b   %b    | 1     0000   0", a, b, carryout, sum, overflow);
        a=4'b1111;b=4'b0001; #1000
        $display("%b %b |  %b   %b   %b    | 1     0000   0", a, b, carryout, sum, overflow);
        a=4'b1111;b=4'b1111; #1000
        $display("%b %b |  %b   %b   %b    | 1     1110   0", a, b, carryout, sum, overflow);
        a=4'b1101;b=4'b1000; #1000
        $display("%b %b |  %b   %b   %b    | 1     0101   1", a, b, carryout, sum, overflow);
        a=4'b0101;b=4'b0110; #1000
        $display("%b %b |  %b   %b   %b    | 0     1011   1", a, b, carryout, sum, overflow);
        $finish();
    end
endmodule
