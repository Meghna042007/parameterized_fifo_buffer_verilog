`timescale 1ns / 1ps
module fifo_tsb();
reg clk,rst;
reg wr_en,rd_en;
reg [7:0] data_in;
wire [7:0] data_out;
wire full,empty;
fifo dut(.clk(clk),.rst(rst),.wr_en(wr_en),.rd_en(rd_en),.data_in(data_in),.data_out(data_out),.full(full),.empty(empty));
always #10 clk=~clk;
integer i;
initial
begin
clk=0;
i=0;
rst=1;
data_in=0;
wr_en=0;
rd_en=0;#10;
rst=0;

wr_en=1;
for(i=0;i<16;i=i+1)begin
    data_in=$random;
    @(posedge clk);
 end
#10 wr_en=0;
#10;
rd_en=1;
for(i=0;i<16;i=i+1)begin
    @(posedge clk);
end
rd_en=0;
#30 $finish;

end
endmodule
