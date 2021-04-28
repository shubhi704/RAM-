module memory(clk,data_in,write,write_address,data_out,read_address);
input clk,write;
input [7:0] data_in;

input [9:0] write_address,read_address;
output reg [7:0]data_out;

reg [7:0] mem[0:511] ;


always @(posedge clk)
begin
    if (write == 1) // write data to address 'addr_wr'
        mem[write_address] <= data_in;
     else
      begin
       data_out <= mem[read_address];
       $monitor("data_in : %d , read_address: %d , data_out: %d",data_in,read_address,data_out); end
end

endmodule