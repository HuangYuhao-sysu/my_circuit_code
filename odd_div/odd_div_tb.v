// =============================================================================
// Project Name        : odd_div
// Email               : huangyh76@mail2.sysu.edu.cn
// Company             : Sun Yat-Sen University
// Create Time         : 2022/06/24
// File Name           : odd_div.v
// Module Name         : odd_div
// Designer            : Huangyh
// Editor              : vs code
//
// *****************************************************************************
// Abstract            : recuitment code training
//
// *****************************************************************************
//
// Modification History:
// Date                By              Version             Change Description
// -----------------------------------------------------------------------------
// 2022/06/24       Huangyh             1.0                         none
//
// =============================================================================

`timescale 1ns / 1ps

module odd_div_tb ();

// odd_div Parameters     
parameter DIV_NUM    = 3 ;
parameter CNT_WIDTH  = 16;

// odd_div Inputs
reg   clk;
reg   rst_n;

// odd_div Outputs
wire  odd_div_clk;

odd_div #(
    .DIV_NUM   ( 3  ),
    .CNT_WIDTH ( 16 ))
 u_odd_div (
    .clk                     ( clk           ),
    .rst_n                   ( rst_n         ),

    .odd_div_clk             ( odd_div_clk   )
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

endmodule