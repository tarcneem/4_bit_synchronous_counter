

module synch_counter(up_down,clk,Data,Qout,reset,load);
input [3:0] Data;
input clk,up_down,reset,load;
output reg[3:0] Qout;

always@(posedge clk)
begin 
if (reset)
Qout <= 4'b0; //reset the counter
else if(load)   
Qout<=Data;    // load the data 
else if(up_down)
Qout <= Qout + 4'b0001;  // count up
else
Qout <= Qout - 4'b0001;  // count down
end




endmodule