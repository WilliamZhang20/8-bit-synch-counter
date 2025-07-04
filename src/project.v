/*
 * Copyright (c) 2025 William
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_8bit_counter (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  wire [7:0] counter_data;

  counter_8_bit counter_inst (
    .clk(clk),
    .rst(~rst_n),
    .load_e(uio_in[0]),
    .out_e(uio_in[1]),
    .load_val(ui_in),
    .out_data(counter_data)
  );

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out  = 0;
  assign uio_out = counter_data; 
  assign uio_oe  = {8{uio_in[1]}};

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, uio_in[7:2]};

endmodule
