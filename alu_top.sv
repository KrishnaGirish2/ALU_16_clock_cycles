`include "test_pkg.sv"
`include "alu_interface.sv"
`include "alu.sv"

 module top();       
       import uvm_pkg::*;
import test_pkg::*;
	bit CLK, RST;

	alu_if DUV_IF(CLK,RST);

 ALU_DESIGN #(.DW(8), .CW(4))DUV(.OPA(DUV_IF.OPA),.OPB(DUV_IF.OPB),.CLK(CLK),.RST(DUV_IF.RST),.CE(DUV_IF.CE),.MODE(DUV_IF.MODE),.CIN(DUV_IF.CIN),.CMD(DUV_IF.CMD),.INP_VALID(DUV_IF.INP_VALID),.RES(DUV_IF.RES),.COUT(DUV_IF.COUT),.OFLOW(DUV_IF.OFLOW),.G(DUV_IF.G),.E(DUV_IF.E),.L(DUV_IF.L),.ERR(DUV_IF.ERR));


 	initial
	begin
		uvm_config_db#(virtual alu_if #(8,4))::set(null,"*","alu_if",DUV_IF);
		$dumpfile("waves.fsdb");
		  $dumpvars;

	        run_test("test1");
		
	end


	
	initial
	begin
		CLK=1'b0;
		forever 
		   #5 CLK=~CLK;
	end
initial begin
//RST=1'b1;
RST=1'b0;
#8 RST=1'b0;
//#10 RST=1'b0;
//#15 RST=1'b0;
#187 RST=1'b1;
#20 RST=1'b0;
#1710 RST=1'b1;
#20 RST=1'b0;
end
endmodule

