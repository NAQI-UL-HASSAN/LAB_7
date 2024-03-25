module myclockdelay (input logic clk, reset,
                    output logic myclock
                    );
    logic wire0,wire1,wire2,wire3,wire4,wire5,wire6,wire7,wire8,wire9,wire10,wire11,wire12,wire13,wire14,wire15;
    t_ff flipflop0(
        .reset(reset),
        .clk(clk),
        .myclock(wire0)
    );
    t_ff flipflop1(
        .reset(reset),
        .clk(wire0),
        .myclock(wire1)
    );
    t_ff flipflop2(
        .reset(reset),
        .clk(wire1),
        .myclock(wire2)
    );
    t_ff flipflop3(
        .reset(reset),
        .clk(wire2),
        .myclock(wire3)
    );
    t_ff flipflop4(
        .reset(reset),
        .clk(wire3),
        .myclock(wire4)
    );
    t_ff flipflop5(
        .reset(reset),
        .clk(wire4),
        .myclock(wire5)
    );
    t_ff flipflop6(
        .reset(reset),
        .clk(wire5),
        .myclock(wire6)
    );
    t_ff flipflop7(
        .reset(reset),
        .clk(wire6),
        .myclock(wire7)
    );
    t_ff flipflop8(
        .reset(reset),
        .clk(wire7),
        .myclock(wire8)
    );
    t_ff flipflop9(
        .reset(reset),
        .clk(wire8),
        .myclock(wire9)
    );
    t_ff flipflop10(
        .reset(reset),
        .clk(wire9),
        .myclock(wire10)
    );
    t_ff flipflop11(
        .reset(reset),
        .clk(wire10),
        .myclock(wire11)
    );
    t_ff flipflop12(
        .reset(reset),
        .clk(wire11),
        .myclock(wire12)
    );
    t_ff flipflop13(
        .reset(reset),
        .clk(wire12),
        .myclock(wire13)
    );
    t_ff flipflop14(
        .reset(reset),
        .clk(wire13),
        .myclock(wire14)
    );
    t_ff flipflop15(
        .reset(reset),
        .clk(wire14),
        .myclock(wire15)
    );
    t_ff flipflop16(
        .reset(reset),
        .clk(wire15),
        .myclock(myclock)
    );
endmodule