// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
    parameter A = 0;
    parameter B = 1;

    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin
            present_state <= B;
        end
        else begin
            present_state <= next_state;
        end
    end

    always @( *) begin
        case (present_state)
            A: if (in) begin
                next_state <= A;
            end
            else begin
                next_state <= B;
            end
            B: if (in) begin
                next_state <= B;
            end
            else begin
                next_state <= A;
            end
        endcase
    end

    always @( *) begin
        if (present_state == A) begin
            out <= 0;
        end
        else begin
            out <= 1;
        end
    end

endmodule
