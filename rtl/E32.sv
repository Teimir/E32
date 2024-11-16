module E32(
   input clk,
   input reset,
   input enable,
	// ----------- bus ---------
   output [31:0] bus_addr,
   output [31:0] bus_data_o,
   output        bus_write,
   input  [31:0] bus_data_i,
   // ----------- memory ------
   output [31:0] mem_addr,
   output [31:0] mem_data_o,
   output        mem_write,
   input  [31:0] mem_data_i
);

wire  [4:0]  select_a, select_b, select_w;
wire  [31:0] data_write;
wire  [31:0] data_a, data_b;
logic [31:0] data_a_reg, data_b_reg;
wire         write_reg;

logic [31:0] instruction_pointer = 32'd0;
logic [31:0] flag_register       = 32'd0;

wire  [31:0] alu_flags;
wire         set_flgs;

register_file RF
(
   .select_a          (select_a),
   .select_b          (select_b),
   .select_w          (select_w),
   .data_write        (data_write),
   .write             (write_reg),
   .clk               (clk),
   .data_a            (data_a),
   .data_b            (data_b)
);

control_unit CU(
   .instr             (),
   .write_reg         (),
   .mem_write         (),
   .bus_write         (),
   .set_flgs          (set_flgs)
);


always_ff @( posedge clk ) begin
   data_a_reg <= data_a;
   data_b_reg <= data_b;
   if (set_flgs) flag_register <= alu_flags;
end




endmodule