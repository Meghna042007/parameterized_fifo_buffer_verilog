`timescale 1ns / 1ps
module fifo #(
parameter width=8,depth=16,c=4)
(input clk,rst,
input wr_en,rd_en,
input [width-1:0]data_in,
output reg [width-1:0]data_out,
output full,empty);
reg [width-1:0] mem [depth-1:0];
reg [c-1:0]wr_ptr,rd_ptr;
reg [c:0]count;
always @(posedge clk or posedge rst)
begin 
if(rst)
   begin
   wr_ptr<=0;
   count<=0;
   data_out<=0;
   end
else if(wr_en && ~full)
     begin
     mem[wr_ptr]<=data_in;
     wr_ptr<=wr_ptr+1;
     count<=count+1;
     end
end
always @(posedge clk or posedge rst)
begin 
if(rst)
   rd_ptr<=0;
else if(rd_en && ~empty)
     begin
     data_out<=mem[rd_ptr];
     rd_ptr<=rd_ptr+1;
     end
end
assign full=(count==depth);
assign empty=(count==0);

   
endmodule
