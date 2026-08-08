`timescale 1ns/1ps

module tb_traffic_light_controller;

    reg clk;
    reg rst;

    wire ns_red;
    wire ns_yellow;
    wire ns_green;

    wire ew_red;
    wire ew_yellow;
    wire ew_green;

    traffic_light_controller uut (
        .clk(clk),
        .rst(rst),

        .ns_red(ns_red),
        .ns_yellow(ns_yellow),
        .ns_green(ns_green),

        .ew_red(ew_red),
        .ew_yellow(ew_yellow),
        .ew_green(ew_green)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        $dumpfile("traffic_light.vcd");
        $dumpvars(0, tb_traffic_light_controller);

        $monitor("Time=%0t | NS: R=%b Y=%b G=%b | EW: R=%b Y=%b G=%b",
                 $time,
                 ns_red, ns_yellow, ns_green,
                 ew_red, ew_yellow, ew_green);

        clk = 0;
        rst = 1;

        #12;
        rst = 0;

        // Allow controller to cycle through states
        #100;

        // Reset again
        rst = 1;
        #10;

        rst = 0;

        // Run another cycle
        #100;

        $finish;

    end

endmodule