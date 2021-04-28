module mem_test;

reg clk,write;

reg [9:0]write_address,read_address;
reg [7:0]data_in;

wire [7:0]data_out;

memory memory ui(clk,data_in,write,write_address,data_out,read_address);
initial 
 begin
  clk = 0;
  forever #5 clk = ~clk;
 end 

initial 
 begin
  #2 write = 1;
  #3 write_address = 10'd3;
  
  #2 data_in = 8'd34;
   #10 write_address = 10'd4;
   #2 data_in = 8'd23;
  #10  write=0;
  #10 read_address = 10'd3;
   #20 read_address = 10'd4;
 end

initial 
 begin
  $dumpfile("meem.vcd");
  $dumpvars;
  #150 $finish;
 end

endmodule
