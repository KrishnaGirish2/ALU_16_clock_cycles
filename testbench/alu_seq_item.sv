class trans extends uvm_sequence_item;
	`uvm_object_utils(trans)

	rand bit[7:0]OPA;
 	rand bit[7:0]OPB;
 	rand bit[1:0]INP_VALID;
 	rand bit[3:0]CMD;
 	rand bit MODE,CIN,CE;
 	logic [9:0]RES;
 	logic RST,ERR,OFLOW,COUT,G,E,L;
 constraint c0{CE inside {0,1};}
 constraint c1{OPA inside {[0:255]};}
 constraint c2{OPB inside {[0:255]};}
 constraint c3{INP_VALID inside {[0:3]};}
 constraint c4{MODE inside {0,1};}
 constraint c5{if(MODE==1)
		CMD<11;
		else
		CMD<=14;}
// constraint c5{CMD dist{4'b1001:=10};}
 constraint c6{CIN dist{1:=5,0:=5};}


 function new(string name="trans");
	super.new(name);
 endfunction


virtual function void do_print(uvm_printer printer);
	super.do_print(printer);
	printer.print_field("Clock Enable",this.CE,1,UVM_DEC);
	printer.print_field("INPUT_A",this.OPA,8,UVM_DEC);
	printer.print_field("INPUT_B",this.OPB,8,UVM_DEC);
	printer.print_field("INPUT_VALID",this.INP_VALID,2,UVM_DEC);
	printer.print_field("COMMAND",this.CMD,4,UVM_DEC);
	printer.print_field("MODE",this.MODE,1,UVM_DEC);
	printer.print_field("CIN",this.CIN,1,UVM_DEC);
        printer.print_field("RST",this.RST,1,UVM_DEC);
	printer.print_field("RESULT",this.RES,10,UVM_DEC);
	printer.print_field("ERROR",this.ERR,1,UVM_DEC);
	printer.print_field("OFLOW",this.OFLOW,1,UVM_DEC);
	printer.print_field("COUT",this.COUT,1,UVM_DEC);
	printer.print_field("GREATER",this.G,1,UVM_DEC);
	printer.print_field("EQUALITY",this.E,1,UVM_DEC);
	printer.print_field("LESSER",this.L,1,UVM_DEC);
endfunction

 endclass 

