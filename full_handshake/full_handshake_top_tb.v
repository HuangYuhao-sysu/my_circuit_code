// =============================================================================
// Project Name         : full_handshake
// Email                : huangyh76@mail2.sysu.edu.cn
// Company              : Sun Yat-Sen University
// Create Time          : 2021/8/25
// File Name            : full_handshake_top_tb.v
// Module Name          : full_handshake_top_tb
// Designer             : Huangyh
// Editor               : sublime text 3
//
// ******************************************************************************
// Abstract             : tb of full handshake.
//
// ******************************************************************************
//
// Modification History:
// Date                By                Version                Change Description
// ------------------------------------------------------------------------------
// 2021/8/25        Huangyh                 1.0                         none
//
// ==============================================================================

module full_handshake_top_tb();

// ============================================================================== \
// ============================= Internal signals ===============================
// ============================================================================== /
reg         clk_t;
reg         clk_r;
reg         rst_n_t;
reg         rst_n_r;
reg         din_val;
reg [31:0]     din;
reg [2:0]    cnt;

wire         dout_val;
wire [31:0] dout;

// ============================================================================== \
// --------------------------------- Main Code ------------------------------------
// ============================================================================== /
full_handshake_top u_full_handshake_top (
    .clk_t   (clk_t   ),
    .rst_n_t (rst_n_t ),
    .clk_r   (clk_r   ),
    .rst_n_r (rst_n_r ),
    .din_val (din_val ),
    .din     (din     ),
    .dout_val(dout_val),
    .dout    (dout    )
);

always #5 clk_t = ~clk_t;
always #6 clk_r = ~clk_r;

always @(posedge clk_t or negedge rst_n_t) begin : proc_din
    if(~rst_n_t) begin
        din <= 0;
        din_val <= 0;
    end

    else if (cnt == 3'b111) begin
        din <= $random()%65535;
        din_val <= 1;
    end

    else begin
        din <= din;
        din_val <= din_val;
    end
end

always @(posedge clk_t or negedge rst_n_t) begin : proc_cnt
    if(~rst_n_t) begin
        cnt <= 0;
    end

    else begin
        cnt <= cnt+1;
    end
end

initial begin
    clk_t = 0;
    rst_n_t = 1;
    rst_n_r = 1;
    clk_r = 0;
    #10
    rst_n_t = 0;
    rst_n_r = 0;
    #40
    rst_n_t = 1;
    rst_n_r = 1;
    #1000
    $finish;
end
endmodule