// =============================================================================
// Project Name        : rr_abiter
// Email               : huangyh76@mail2.sysu.edu.cn
// Company             : Sun Yat-Sen University
// Create Time         : 2022/06/25
// File Name           : priority_arbiter_tb.v
// Module Name         : priority_arbiter_tb
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
// 2022/06/25       Huangyh             1.0                         none
//
// =============================================================================

`timescale 1ns / 1ps

module rr_arbiter_tb ();

// priority_arbiter Parameters
parameter REQ_WIDTH  = 8;     

// priority_arbiter Inputs
reg   [REQ_WIDTH-1:0]  req;

// priority_arbiter Outputs
wire  [REQ_WIDTH-1:0]  gnt;

priority_arbiter #(
    .REQ_WIDTH ( 8 ))
 u_priority_arbiter (
    .req                     ( req   ),

    .gnt                     ( gnt   )
);

localparam CYCLE = 20;

initial begin
    req =   0;
    forever
    #(CYCLE/2)
    req =   $random;
end

endmodule