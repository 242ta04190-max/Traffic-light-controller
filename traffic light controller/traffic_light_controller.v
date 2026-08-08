module traffic_light_controller (
    input  wire clk,
    input  wire rst,

    output reg ns_red,
    output reg ns_yellow,
    output reg ns_green,

    output reg ew_red,
    output reg ew_yellow,
    output reg ew_green
);

    // State definitions
    localparam NS_GREEN  = 3'b000;
    localparam NS_YELLOW = 3'b001;
    localparam EW_GREEN  = 3'b010;
    localparam EW_YELLOW = 3'b011;

    reg [2:0] state;
    reg [2:0] next_state;

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= NS_GREEN;
        else
            state <= next_state;
    end

    // Next-state logic
    always @(*) begin

        case (state)

            NS_GREEN:
                next_state = NS_YELLOW;

            NS_YELLOW:
                next_state = EW_GREEN;

            EW_GREEN:
                next_state = EW_YELLOW;

            EW_YELLOW:
                next_state = NS_GREEN;

            default:
                next_state = NS_GREEN;

        endcase

    end

    // Output logic
    always @(*) begin

        // Default all lights OFF
        ns_red    = 1'b0;
        ns_yellow = 1'b0;
        ns_green  = 1'b0;

        ew_red    = 1'b0;
        ew_yellow = 1'b0;
        ew_green  = 1'b0;

        case (state)

            NS_GREEN: begin
                ns_green = 1'b1;
                ew_red   = 1'b1;
            end

            NS_YELLOW: begin
                ns_yellow = 1'b1;
                ew_red    = 1'b1;
            end

            EW_GREEN: begin
                ew_green = 1'b1;
                ns_red   = 1'b1;
            end

            EW_YELLOW: begin
                ew_yellow = 1'b1;
                ns_red    = 1'b1;
            end

            default: begin
                ns_red = 1'b1;
                ew_red = 1'b1;
            end

        endcase

    end

endmodule