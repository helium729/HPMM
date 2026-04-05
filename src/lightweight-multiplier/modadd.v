
// module modadd(input [11:0] A,B,
//               output[11:0] C);

// wire        [12:0] R;
// wire signed [13:0] Rq;

// assign R = A + B;
// assign Rq= R - 13'd3329;

// assign C = (Rq[13] == 0) ? Rq[11:0] : R[11:0];

// endmodule

module modadd #(
    parameter LOGQ       = 12,            // Bit width of input/output operands
    parameter [LOGQ:0] Q_VALUE = 13'd3329 // Fixed modulus 3329 stored in 13 bits
) (
    input  [LOGQ-1:0] a,   // Input a (12-bit when LOGQ=12)
    input  [LOGQ-1:0] b,   // Input b (12-bit when LOGQ=12)
    output [LOGQ-1:0] c    // Output c (12-bit when LOGQ=12)
);

// ------------------------------------------
// Combinational logic (no clock/register)
// ------------------------------------------
wire [LOGQ:0]   madd;      // Intermediate sum (13-bit)
wire signed [LOGQ+1:0] madd_q; // Sum minus modulus (signed 14-bit)

assign madd = a + b;                // Compute a + b
assign madd_q = madd - Q_VALUE;     // Subtract modulus 3329

// If madd_q is non-negative, use reduced value; otherwise keep raw sum
assign c = (madd_q[LOGQ+1] == 0) ? madd_q[LOGQ-1:0] : madd[LOGQ-1:0];

endmodule

//module modadd #(
//    parameter LOGQ       = 12,
//    parameter [LOGQ:0] Q_VALUE = 13'd3329
//) (
//    input  [LOGQ-1:0] a,
//    input  [LOGQ-1:0] b,
//    output [LOGQ-1:0] c
//);

//wire [LOGQ:0] madd = a + b;            // first adder
//wire [LOGQ:0] sub_result = (madd >= Q_VALUE) ? madd - Q_VALUE : madd;
//assign c = sub_result[LOGQ-1:0];       // take lower 12 bits

//endmodule
