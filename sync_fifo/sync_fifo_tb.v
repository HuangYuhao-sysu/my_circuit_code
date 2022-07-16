`timescale 1ns /1ns 

module test();

// sync_fifo Parameters   
parameter DATA_WIDTH  = 32;
parameter ADDR_WIDTH  = 4 ;
parameter DEPTH       = 16;

// sync_fifo Inputs
reg   clk;
reg   rst_n;
reg   wen;
reg   ren;
reg   [DATA_WIDTH-1:0]  wdata;

// sync_fifo Outputs
wire  [DATA_WIDTH-1:0]  rdata;
wire  wfull;
wire  rempty;

sync_fifo #(
    .DATA_WIDTH ( 32 ),
    .ADDR_WIDTH ( 4  ),
    .DEPTH      ( 16 ))
 u_sync_fifo (
    .clk                     ( clk      ),
    .rst_n                   ( rst_n    ),
    .wen                     ( wen      ),
    .ren                     ( ren      ),
    .wdata                   ( wdata    ),

    .rdata                   ( rdata    ),
    .wfull                   ( wfull    ),
    .rempty                  ( rempty   )
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

            always  @(posedge clk or negedge rst_n)begin
                if(rst_n==1'b0)begin
                    wen <= 0;
                    ren <= 0;
                end
                else begin
                    wen <= $random;
                    ren <= $random;
                end
            end
always@(*)begin
  if(wen == 1)
    wdata= $random ;
  else
    wdata = 0;
end  
endmodule