// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg [1:0] a, b;
    wire [1:0] sum;
    wire carryout, overflow;

    //behavioralFullAdder adder (sum, carryout, a, b, carryin);
    //structuralFullAdder adder (sum, carryout, a, b, carryin);
    FullAdder4bit adder (sum, carryout, overflow, a, b);

    initial begin
        // Your test code here
 //       $dumpfile("adder.vcd");
  //      $dumpvars(0, a, b, carryout, sum);
        $display("A B | Cout Sum Over | Expected Cout, Sum");
        a=2'b00;b=2'b01; #1000
        $display("%b %b   |    %b   %b    %b |             0    0", a, b, carryout, sum, overflow);
        // a=0;b=0;carryin=1; #1000
        // $display("%b %b %b   |    %b   %b |             0    1", a, b, carryin, carryout, sum);
        // a=0;b=1;carryin=0; #1000
        // $display("%b %b %b   |    %b   %b |             0    1", a, b, carryin, carryout, sum);
        // a=0;b=1;carryin=1; #1000
        // $display("%b %b %b   |    %b   %b |             1    0", a, b, carryin, carryout, sum);
        // a=1;b=0;carryin=0; #1000
        // $display("%b %b %b   |    %b   %b |             0    1", a, b, carryin, carryout, sum);
        // a=1;b=0;carryin=1; #1000
        // $display("%b %b %b   |    %b   %b |             1    0", a, b, carryin, carryout, sum);
        // a=1;b=1;carryin=0; #1000
        // $display("%b %b %b   |    %b   %b |             1    0", a, b, carryin, carryout, sum);
        // a=1;b=1;carryin=1; #1000
        // $display("%b %b %b   |    %b   %b |             1    1", a, b, carryin, carryout, sum);
  //      $finish();
    end
endmodule
