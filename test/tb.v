`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a VCD file. You can view it with gtkwave.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:
  reg clk;
  reg rst_n;
  reg start;
  reg  ui_in_count;
  wire uo_out_timer_reached;


   module tt_um_timer (
    input  wire [3:0] ui_in_count,    // Dedicated inputs
    output wire uo_out_timer_reached,   // Dedicated outputs
    input  wire       start,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
      

  // Replace tt_um_example with your module name:
  tt_um_timer tt_um_timer (

      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(1'b1),
      .VGND(1'b0),
`endif

      .ui_in_count  (ui_in_count),    // Dedicated inputs
      .uo_out_timer_reached (uo_out_timer_reached),   // Dedicated outputs
      .start    (start),      // enable - goes high when design is selected
      .clk    (clk),      // clock
      .rst_n  (rst_n)     // not reset
  );

endmodule
