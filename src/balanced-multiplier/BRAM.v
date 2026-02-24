

// read latency is 1 cc

module BRAM(input             clk,
            input             wen,
            input      [5:0]  waddr,
            input      [11:0] din,
            input      [5:0]  raddr,
            output reg [11:0] dout);
// bram
(* ram_style="block" *) reg [11:0] blockram [0:63];

// write operation
always @(posedge clk) begin
    if(wen)
        blockram[waddr] <= din;
end

// read operation
always @(posedge clk) begin
    dout <= blockram[raddr];
end

endmodule
