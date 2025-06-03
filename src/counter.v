module counter_8_bit (
    input wire clk,
    input wire rst,
    input wire load_e,
    input wire out_e,
    input wire [7:0] load_val, // for progammability
    output wire [7:0] out_data
);

    reg [7:0] count;

    always @ (posedge clk) begin
        if (rst) begin
            count <= 8'b0;
        end else if (load_e) begin
            count <= load_val;
        end else begin
            count <= count + 1;
        end
    end

    assign out_data = out_e ? count : 8'b0;

endmodule