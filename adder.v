// Adder circuit
`define AND and #50
`define OR or #50
`define XOR xor #50

module behavioralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);   
    wire axorb, ab, caxorb;
    `XOR AXORB(axorb, a, b);
    `AND AANDB(ab, a, b);
    `XOR SUM(sum, carryin, axorb);
    `AND CAXORB(caxorb, carryin, axorb);
    `OR  CARRYOUT(carryout, caxorb, ab);
endmodule

module FullAdder4bit
(
    output[3:0] sum,  // 2's complement sum of a and b
    output carryout,  // Carry out of the summation of a and b
    output overflow,  // True if the calculation resulted in an overflow
    input[3:0] a,     // First operand in 2's complement format
    input[3:0] b      // Second operand in 2's complement format
);
    wire cout0, cout1, cout2, atest, btest;
    structuralFullAdder adder0 (sum[0], cout0, a[0], b[0], 1'b0);       // least significant bit [0]
    structuralFullAdder adder1 (sum[1], cout1, a[1], b[1], cout0);      // [1]
    structuralFullAdder adder2 (sum[2], cout2, a[2], b[2], cout1);      // [2]
    structuralFullAdder adder3 (sum[3], carryout, a[3], b[3], cout2);   // most significant bit [3]
    // Determine overflow based on most significant bit. 
    // Overflow occurrs when a[3]=b[3]=0 and sum[3]=1. OR a[3]=b[3]=1 and sum[3]=0
    `XOR ATEST(atest, sum[3], a[3]);
    `XOR BTEST(btest, sum[3], b[3]);
    `AND OVERFLOW(overflow, atest, btest);
endmodule
