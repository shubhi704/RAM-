module ram(data_out, data_in,addr,wr,cs);


parameter ddr_size = 10, word_size = 8, memory_size = 1024;

input [9:0]addr;
input wr,cs;
input [7:0] data_in;

output [7:0]data_out;
reg [7:0] mem [1023:0];

assign data_out = mem[addr];

always @(wr,cs)
 if(wr) mem[addr] = data_in;

endmodule