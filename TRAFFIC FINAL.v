module traffic_lights_controller(clk,reset,button,A1, A2, B, C);

	input clk,reset,button;
	output reg A1, A2, B, C;

    reg [1:0] mode;
    reg [4:0] monitor;

    parameter MODE0 = 2'b00, MODE1 = 2'b01, MODE2 = 2'b10, MODE3 = 2'b11, DURATION_MODE1 = 15, DURATION_MODE2 = 5, DURATION_MODE3 = 10;

    always @(posedge clk or reset) begin
        if (reset) begin
            mode <= MODE1;
            monitor <= DURATION_MODE1;
        end
		
		else if (button && mode != MODE0) begin
            if (monitor == 0) begin
                mode <= MODE0;
                monitor <= DURATION_MODE1;
            end
			
			else begin
                monitor <= monitor - 1;
            end
			
        end
		
		else begin
            if (monitor == 0) begin
                case (mode)
                    MODE1: begin
                        mode <= MODE2;
                        monitor <= DURATION_MODE2;
                    end
					
                    MODE2: begin
                        mode <= MODE3;
                        monitor <= DURATION_MODE3;
                    end
					
                    MODE3: begin
                        mode <= MODE1;
                        monitor <= DURATION_MODE1;
                    end
					
                    MODE0: begin
                        mode <= MODE1;
                        monitor <= DURATION_MODE1;
                    end
					
                endcase
            end
			
			else begin
                monitor <= monitor - 1;
            end
        end
    end

    always @(mode) begin
        case (mode)
		
            MODE0: begin
                A1 = 0;A2 = 0; B = 0; C = 0;
            end
            MODE1: begin
                A1 = 1; A2 = 0; B = 0; C = 1;
            end
            MODE2: begin
                A1 = 1;A2 = 1; B = 0; C = 0;
            end
            MODE3: begin
                A1 = 0; A2 = 0; B = 1; C = 0;
            end
			
        endcase
    end
endmodule

module traffic_lights_controller_tb;

    reg clk,reset,button;
    wire A1,A2,B,C;

    traffic_lights_controller TEST(clk,reset,button,A1,A2,B,C);

    always #1 clk = ~clk; 

    initial begin

        clk = 0;
        reset = 1;
        button = 0;
        
        #2 reset = 0;
        #60 button = 1;
        #10 button = 0;
        #200;

        $finish;
    end

    initial begin
        $monitor("Time: %t | Mode: %d | A1: %b | A2: %b | B: %b | C: %b",$time, TEST.mode, A1, A2, B, C);
    end
endmodule

/*
	The test bench tests for the use of the button and also without,
	hence the only one test bench and not 2.
*/