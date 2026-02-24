//module div2(input [11:0] x,
//            output[11:0] y);

//wire [10:0] x0and;

//assign x0and = {11{x[0]}} & 11'd1665;
//assign y     = x[11:1] + x0and;

//endmodule

module div2(input [11:0] x,
            output[11:0] y);

assign y = (x[0] == 1'b0) ? x[11:1] : x[11:1] + ({11{x[0]}} & 11'd1665);

endmodule