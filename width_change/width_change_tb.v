// =============================================================================
// Project Name        : width change
// Email               : huangyh76@mail2.sysu.edu.cn
// Company             : Sun Yat-Sen University
// Create Time         : 2022/07/02
// File Name           : width_change_tb.v
// Module Name         : width_change_tb
// Designer            : Huangyh
// Editor              : vs code
//
// *****************************************************************************
// Abstract            : recruitment code training
//
// *****************************************************************************
//
// Modification History:
// Date                By              Version             Change Description
// -----------------------------------------------------------------------------
// 2022/07/02       Huangyh             1.0                         none
//
// =============================================================================

`timescale 1ns / 1ps

module width_change_tb ();

// width_change Parameters
parameter WIDTH  = 8;

// width_change Inputs
reg   clk;
reg   rst_n;
reg   [WIDTH-1:0]  din;
reg   din_vld;

// width_change Outputs
wire  [WIDTH*2-1:0]  dout;
wire  dout_vld;

width_change #(
    .WIDTH ( 8 ))
 u_width_change (
    .clk                     ( clk        ),
    .rst_n                   ( rst_n      ),
    .din                     ( din        ),
    .din_vld                 ( din_vld    ),

    .dout                    ( dout       ),
    .dout_vld                ( dout_vld   )
);

localparam CYCLE = 20;
//时钟周期，单位为ns，可在此修改时钟周期。
//生成本地时钟50M
initial begin
    clk = 0;
    forever
    #(CYCLE/2)
    clk=~clk;
end
//产生复位信号
initial begin
    rst_n = 1;
    #2;
    rst_n = 0;
    #(CYCLE*3);
    rst_n = 1;
end

always @(posedge clk or negedge rst_n) begin
    if (rst_n == 1'b0) begin
        // reset
        din <= 0;
    end

    else begin
        din <= $random;
    end
end

always @(posedge clk or negedge rst_n) begin
    if (rst_n == 1'b0) begin
        // reset
        din_vld <= 0;
    end

    else begin
        din_vld <= $random;
    end
end

endmodule