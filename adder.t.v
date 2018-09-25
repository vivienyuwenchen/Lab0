// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg a[1:0], b[1:0];
    wire sum[1:0], carryout, overflow;

    //behavioralFullAdder adder (sum, carryout, a, b, carryin);
    //structuralFullAdder adder (sum, carryout, a, b, carryin);
    FullAdder4bit adder (sum[0], carryout, overflow, a[0:1], b[0:1]);

    initial begin
        // Your test code here
 //       $dumpfile("adder.vcd");
  //      $dumpvars(0, a, b, carryout, sum);
        $display("A B | Cout Sum Over | Expected Cout, Sum");
        a[0]=0;a[1]=1;b[0]=0;b[1]=1; #1000
        $display("%b %b   |    %b   %b    %b |             0    0", a[0:1], b[0:1], carryout, sum[0:1], overflow);
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
