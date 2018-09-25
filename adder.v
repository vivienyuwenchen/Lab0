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
    `XOR xorgate(axorb, a, b);
    `AND andgate(ab, a, b);
    `XOR xorgate(sum, carryin, axorb);
    `AND andgate(caxorb, carryin, axorb);
    `OR  orgate(carryout, caxorb, ab);
endmodule

module FullAdder4bit
(
    output[1:0] sum,  // 2's complement sum of a and b
    output carryout,  // Carry out of the summation of a and b
    output overflow,  // True if the calculation resulted in an overflow
    input[1:0] a,     // First operand in 2's complement format
    input[1:0] b      // Second operand in 2's complement format
);
    wire cout0;
    structuralFullAdder adder0 (sum[0], cout0, a[0], b[0], 1'b0);
    structuralFullAdder adder1 (sum[1], carryout, a[1], b[1], cout0);
    buf buf0(overflow, carryout);
endmodule
