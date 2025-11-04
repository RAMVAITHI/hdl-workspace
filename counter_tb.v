`timescale 1ns/1ps

module counter_tb;
    reg clk;
    reg rst;
    wire [3:0] count;
    
    counter uut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, counter_tb);
        
        rst = 1;
        #10 rst = 0;
        
        #100 $finish;
    end
    
    initial begin
        $monitor("Time=%0t Counter=%b", $time, count);
    end
endmodule