module t_ff (input logic clk, reset,
             output logic myclock
            );
    logic q;
    assign myclock = q;            
        always_ff @(posedge clk or posedge reset)
        begin
            if (reset)
                q <= 0;
            else
                q <= !q;
        end
endmodule