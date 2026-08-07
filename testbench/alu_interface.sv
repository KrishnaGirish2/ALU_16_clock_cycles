interface alu_if #(parameter DW=8,CW=4)(input bit CLK, input bit RST);

logic[DW-1:0]OPA;
logic[DW-1:0]OPB;
logic[1:0]INP_VALID;
logic[CW-1:0]CMD;
logic[DW+1:0]RES;
logic MODE,CE,CIN,ERR,OFLOW,COUT,G,E,L;
property reset;
@(posedge CLK) RST |-> (RES==0 && COUT==0 && OFLOW==0 && G==0 && E==0 && L==0 && ERR==0);
endproperty
reset_a: assert property(reset)
else
$error("Reset failed");

property ce_p;
@(posedge CLK) !CE |=> $stable(RES);
endproperty
ce_a: assert property(ce_p)
else
$error("CE failed");

property inp_0_p;
@(posedge CLK) (INP_VALID==2'b00) |=>$stable(RES);
endproperty
inp_0_a: assert property(inp_0_p)
else
$error("Input valid 0 failed");

property mode_p;
@(posedge CLK) MODE==0 && CMD inside {[0:13]};
endproperty
mode_p_a: assert property(mode_p)
else
$error("Mode failed");

property oflow_p;
@(posedge CLK) OFLOW |-> MODE
endproperty
oflow_a: assert property(oflow_p)
else
$error("Oflow failed");

property carry;
@(posedge CLK) COUT |-> MODE
endproperty
carry_a: assert property(carry)
else
$error("Carry failed");

property cmd_inp_valid;
@(posedge CLK) (INP_VALID==0) |=> $stable(CMD);
endproperty
cmd_inp_valid_a: assert property(cmd_inp_valid)
else
$error("Inp_valid 0 cmd  failed");

property clock_16;
@(posedge CLK) disable iff(RST)
(CE && INP_VALID==2'b01) |-> ##[1:16] (INP_VALID==2'b10 || INP_VALID==2'b11);
endproperty
clock_16_a: assert property(clock_16) 
else
$error("Operand B did not arrive within 16 clock cycle");

property clock_16_b;
@(posedge CLK) disable iff(RST)
(CE && INP_VALID==2'b10) |-> ##[1:16] (INP_VALID==2'b01 || INP_VALID==2'b11);
endproperty
clock_16_b_a: assert property(clock_16_b)
else
$error("Operand A did not arrive within 16 clock cycle");

property mul;
@(posedge CLK) disable iff(RST)
(CE && MODE && (CMD inside {4'b1001, 4'b1010}) && INP_VALID==2'b11) |=> ##1 ##1 $stable(RES) ##1 !$stable(RES);
endproperty
mul_a: assert property(mul)
else
$error("Multiplication is not 3 clock cycles");

clocking inp_dr_cb@(posedge CLK);
	default input #1 output;
	output OPA;
	output OPB;
	output INP_VALID;
	output CMD;
	output MODE,CIN,CE;
endclocking

clocking inp_mon_cb@(posedge CLK);
	default input #1 output #1;
	input OPA;
	input OPB;
	input INP_VALID;
	input CMD;
	input MODE,CIN,CE,RST;
endclocking


clocking out_mon_cb@(posedge CLK);
	default input #1 output #1;
        
//	input OPA;
//	input OPB;
//	input INP_VALID;
//	input CMD;
	input MODE,CIN,CE,RST;
	input ERR,RES,OFLOW,COUT,G,E,L;

endclocking 

modport INP_DRV(clocking inp_dr_cb);
modport INP_MON(clocking inp_mon_cb);
modport OUT_MON(clocking out_mon_cb);

endinterface


