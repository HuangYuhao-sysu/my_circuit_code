// =============================================================================
// Project Name        : bitstream_detector
// Email               : huangyh76@mail2.sysu.edu.cn
// Company             : Sun Yat-Sen University
// Create Time         : 2022/06/23
// File Name           : bitsteam_detector_tb.v
// Module Name         : bitsteam_detector_tb
// Designer            : Huangyh
// Editor              : vs code
//
// *****************************************************************************
// Abstract            : recruitment code training, detect 10010
//
// *****************************************************************************
//
// Modification History:
// Date                By              Version             Change Description
// -----------------------------------------------------------------------------
// 2022/06/23       Huangyh             1.0                         none
//
// =============================================================================

`timescale 1ns / 1ps

module bitsteam_detector_tb ();

// bitsteam_detector Inputs
reg   clk;
reg   rst_n;
reg   din;

// bitsteam_detector Outputs
wire  flag;

bitsteam_detector  u_bitsteam_detector (
    .clk                     ( clk     ),
    .rst_n                   ( rst_n   ),
    .din                     ( din     ),

    .flag                    ( flag    )
);

// =========================================================================== \
// --------------------------------- Main Code ---------------------------------
// =========================================================================== /
initial begin
    clk         = 0;
    rst_n       = 1;
    #3
    rst_n       = 0;
    #3
    rst_n       = 1;
end

always # 10 clk = ~clk;

always @(posedge clk or negedge rst_n) begin
    if (rst_n == 1'b0) begin
        // reset
        din <= 0;
    end

    else begin
        din <= $random;
    end
end

endmodule