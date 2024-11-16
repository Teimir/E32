module register_file
#(parameter width_reg = 32)
(
   input [$log2(width_reg)-1:0]       select_a,
   input [$log2(width_reg)-1:0]       select_b,
   input [$log2(width_reg)-1:0]       select_w,
   input [31:0]                       data_write,
   input                              write,
   input                              clk,
   output logic [31:0]                data_a,
   output logic [31:0]                data_b
);

logic [31:0] file [32];

always_ff @( posedge clk ) begin
    if (write) file [select_w] <= data_write;
end

always_comb begin
    data_a = file [select_a];
    data_b = file [select_b];
end

 
    
endmodule