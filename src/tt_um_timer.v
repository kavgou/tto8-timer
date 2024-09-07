/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_timer (
    input  wire [3:0] ui_in_count,    // Dedicated inputs
    output wire uo_out_timer_reached,   // Dedicated outputs
    input  wire       start,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    reg [3:0]  my_count;
    reg        my_timer_reached;
    
  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out_timer_reached  = my_timer_reached;

    always @(posedge clk) begin
        if(rst_n==1'b0) begin
            my_count            <= 4'd0;
            my_timer_reached    <= 1'd0;
        end else begin
            if(start == 1'b1) begin
                my_count            <= (my_count == ui_in_count) ? my_count : my_count + 4'd1;
                my_timer_reached    <= (my_count == ui_in_count) ? 1'b1 : 1'd0;                
            end else begin
                my_count            <= 4'd0;
                my_timer_reached    <= 1'd0;
            end       
        end
    end

endmodule
