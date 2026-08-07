class rst_seq extends uvm_sequence #(trans);
        `uvm_object_utils(rst_seq)
trans req;

 function new(string name="rst_seq");
        super.new(name);
 endfunction

 task body();
       req=trans::type_id::create("req");
        begin
            repeat(5) begin
                   start_item(req);
                   assert(req.randomize() with {CE==1;});
                   finish_item(req);
             end
        end
 endtask

 endclass


class seq extends uvm_sequence #(trans);
	`uvm_object_utils(seq) 
trans req;

 function new(string name="seq");
	super.new(name);
 endfunction

 task body();
       req=trans::type_id::create("req");
	begin 
            repeat(20) begin
		   start_item(req);
		   assert(req.randomize());
		   finish_item(req);
	     end
        end
 endtask

 endclass

class seq_1 extends uvm_sequence #(trans);
	`uvm_object_utils(seq_1) 
trans req;
 function new(string name="seq_1");
	super.new(name);
 endfunction

 task body();
       req=trans::type_id::create("req");
begin
	repeat(10) begin
		   start_item(req);
		   assert(req.randomize() with {MODE==1'b1; CMD inside {[0:10]};});
		   finish_item(req);
	end
end
 endtask

 endclass

class seq_2 extends uvm_sequence #(trans);
	`uvm_object_utils(seq_2) 
trans req;
 function new(string name="seq_2");
	super.new(name);
 endfunction

 task body();
       req=trans::type_id::create("req");
	begin repeat(10) begin
		   start_item(req);
		   assert(req.randomize() with {MODE==1'b0;CMD inside {[0:13]};});
		   finish_item(req);
	end
end
 endtask

 endclass

class seq_3 extends uvm_sequence #(trans);
	`uvm_object_utils(seq_3)
trans req;
 function new(string name="seq_3");
	super.new(name);
 endfunction

 task body();
       req=trans::type_id::create("req");
	begin
		   start_item(req);
		   assert(req.randomize() with {INP_VALID==2'd3;OPA==8'b1; OPB==8'b1;MODE==1'b1;CMD==4'b0000;CE==1;});
		   finish_item(req);
	end
 endtask
 endclass

class seq_4 extends uvm_sequence #(trans);
	`uvm_object_utils(seq_4)
trans req;
 function new(string name="seq_4");
	super.new(name);
 endfunction

 task body();
       req=trans::type_id::create("req");
	begin
		   start_item(req);
		   assert(req.randomize() with {MODE==1'b1;CMD==4'b0001;});
		   finish_item(req);
	end
 endtask

 endclass

class seq_5 extends uvm_sequence #(trans);
	`uvm_object_utils(seq_5)
trans req;
 function new(string name="seq_5");
	super.new(name);
 endfunction

 task body();
       req=trans::type_id::create("req");
	begin
		   start_item(req);
		   assert(req.randomize() with {MODE==1'b1;CMD==4'b0010;CIN==1;});
		   finish_item(req);
	end
 endtask

 endclass

class seq_6 extends uvm_sequence #(trans);
`uvm_object_utils(seq_6)
trans req;
 function new(string name="seq_6");
super.new(name);
 endfunction

 task body();
       req=trans::type_id::create("req");
	begin
		   start_item(req);
		   assert(req.randomize() with {MODE==1'b1;CMD==4'b0011;CIN==1;});
		   finish_item(req);
	end
 endtask

 endclass

class seq_7 extends uvm_sequence #(trans);
	`uvm_object_utils(seq_7) 
trans req;
 function new(string name="seq_7");
	super.new(name);
 endfunction

 task body();
       req=trans::type_id::create("req");
	begin
		   start_item(req);
		   assert(req.randomize() with {MODE==1; CMD==4'd8; OPA>OPB;});
		   finish_item(req);
	end
 endtask
endclass
class seq_8 extends uvm_sequence #(trans);
	`uvm_object_utils(seq_8) 
trans req;
 function new(string name="seq_8");
	super.new(name);
 endfunction

 task body();
       req=trans::type_id::create("req");
	begin
		   start_item(req);
		   assert(req.randomize() with {MODE==1'b1; CMD==4'd8; OPA<OPB;});
		   finish_item(req);
	end
 endtask
endclass

class seq_9 extends uvm_sequence #(trans);
	`uvm_object_utils(seq_9) 
trans req;
 function new(string name="seq_9");
	super.new(name);
 endfunction

 task body();
       req=trans::type_id::create("req");
	begin
		   start_item(req);
		   assert(req.randomize() with {MODE==1'b1; CMD==4'd8; OPA==OPB;});
		   finish_item(req);
	end
 endtask
 endclass

class seq_10 extends uvm_sequence #(trans);
	`uvm_object_utils(seq_10)
trans req;
 function new(string name="seq_10");
	super.new(name);
 endfunction

 task body();
       req=trans::type_id::create("req");
	begin
		   start_item(req);
		   assert(req.randomize() with {MODE==1'b1;CMD==4'b1001;});
		   finish_item(req);
	end
 endtask

 endclass

class seq_11 extends uvm_sequence #(trans);
	`uvm_object_utils(seq_11)
trans req;
 function new(string name="seq_11");
	super.new(name);
 endfunction

 task body();
       req=trans::type_id::create("req");
	begin
		   start_item(req);
		   assert(req.randomize() with {CE==1;MODE==1'b1;CMD==4'b1010;});
		   finish_item(req);
	end
 endtask

 endclass

class seq_12 extends uvm_sequence #(trans);
	`uvm_object_utils(seq_12)
trans req;
 function new(string name="seq_12");
	super.new(name);
 endfunction

 task body();
       req=trans::type_id::create("req");
	begin
		   start_item(req);
		   assert(req.randomize() with {MODE==1'b0;CMD==4'b1100;OPB[7:4]==0;});
		   finish_item(req);
	end
 endtask

 endclass
class cmd_11 extends uvm_sequence #(trans);
`uvm_object_utils(cmd_11)
trans req;
function new(string name="cmd_11");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with {MODE==1'b1;CMD==4'b1011;});
finish_item(req);
end
endtask
endclass

class cmd_2 extends uvm_sequence #(trans);
`uvm_object_utils(cmd_2)
trans req;
function new(string name="cmd_2");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with {MODE==1'b1;CMD==4'b0010;});
finish_item(req);
end
endtask
endclass

class cmd_4 extends uvm_sequence #(trans);
`uvm_object_utils(cmd_4)
trans req;
function new(string name="cmd_4");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with {INP_VALID==2'b11;MODE==1'b1;CMD==4'b0100;});
finish_item(req);
end
endtask
endclass

class cmd_5 extends uvm_sequence #(trans);
`uvm_object_utils(cmd_5)
trans req;
function new(string name="cmd_5");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with {MODE==1'b1;CMD==4'b0101;});
finish_item(req);
end
endtask
endclass

class cmd_7 extends uvm_sequence #(trans);
`uvm_object_utils(cmd_7)
trans req;
function new(string name="cmd_7");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with {MODE==1'b1;CMD==4'b0111;});
finish_item(req);
end
endtask
endclass

class seq_13 extends uvm_sequence #(trans);
	`uvm_object_utils(seq_13)
trans req;
 function new(string name="seq_13");
	super.new(name);
 endfunction

 task body();
       req=trans::type_id::create("req");
	begin
		   start_item(req);
		   assert(req.randomize() with {MODE==1'b0;CMD==4'b1101;OPB[7:4]==0;});
		   finish_item(req);
	end
 endtask

 endclass


class seq_14 extends uvm_sequence #(trans);
	`uvm_object_utils(seq_14)
trans req;
 function new(string name="seq_14");
	super.new(name);
 endfunction

 task body();
       req=trans::type_id::create("req");
	begin
		   start_item(req);
		   assert(req.randomize() with {MODE==1'b0;CMD==4'b1100;OPB[7:4]!=0;});
		   finish_item(req);
	end
 endtask

 endclass
class seq_15 extends uvm_sequence #(trans);
	`uvm_object_utils(seq_15)
trans req;
 function new(string name="seq_15");
	super.new(name);
 endfunction

 task body();
       req=trans::type_id::create("req");
	begin
		   start_item(req);
		   assert(req.randomize() with {MODE==1'b0;CMD==4'b1101;OPB[7:4]!=0;});
		   finish_item(req);
	end
 endtask

 endclass
class seq_16 extends uvm_sequence #(trans);
	`uvm_object_utils(seq_16)
trans req;
 function new(string name="seq_16");
	super.new(name);
 endfunction

 task body();
       req=trans::type_id::create("req");
	begin
		   start_item(req);
		   assert(req.randomize() with {MODE==1'b1;CMD inside {4'b0000,4'b0010}; OPA==255; OPB==255;});
		   finish_item(req);
	end
 endtask

 endclass
class seq_17 extends uvm_sequence #(trans);
	`uvm_object_utils(seq_17)
trans req;
 function new(string name="seq_17");
	super.new(name);
 endfunction

 task body();
       req=trans::type_id::create("req");
	begin
		   start_item(req);
		   assert(req.randomize() with {MODE==1'b1;CMD inside {4'b0001,4'b0011}; OPA<OPB;});
		   finish_item(req);
	end
 endtask
 endclass

class seq_18 extends uvm_sequence #(trans);
	`uvm_object_utils(seq_18)
trans req;
 function new(string name="seq_18");
	super.new(name);
 endfunction

 task body();
       req=trans::type_id::create("req");
	begin
		   start_item(req);
		   assert(req.randomize() with {MODE==1'b1;CMD inside {[4:7]};});
		   finish_item(req);
	end
 endtask
 endclass

class seq_19 extends uvm_sequence #(trans);
	`uvm_object_utils(seq_19)
trans req;
 function new(string name="seq_19");
	super.new(name);
 endfunction

 task body();
       req=trans::type_id::create("req");
	begin
		   start_item(req);
		   assert(req.randomize() with {MODE==1'b0;CMD inside {[8:11]};});
		   finish_item(req);
	end
 endtask

 endclass

class seq_20 extends uvm_sequence #(trans);
`uvm_object_utils(seq_20)
trans req;
function new(string name="seq_20");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
if (!req.randomize() with { CE==0; MODE==1; })
  `uvm_fatal("RAND","Randomization failed");
finish_item(req);
end

endtask
endclass

class seq_21 extends uvm_sequence #(trans);
`uvm_object_utils(seq_21)
trans req;
function new(string name="seq_21");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with {CE==1; INP_VALID==2'b01; OPA==8'b1; OPB==8'b1;CMD==4'b0;MODE==1'b0;});
finish_item(req);
end
endtask
endclass

class seq_22 extends uvm_sequence #(trans);
`uvm_object_utils(seq_22)
trans req;
function new(string name="seq_22");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with {CE==1; INP_VALID==2'b10; OPA==8'b1; OPB==8'd2;CMD==4'b0;MODE==1'b0;});
finish_item(req);
end
endtask
endclass

class seq_23 extends uvm_sequence #(trans);
`uvm_object_utils(seq_23)
trans req;
function new(string name="seq_23");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with {CE==1; INP_VALID==2'b00; OPA==8'b1; OPB==8'b1;CMD==4'b1;MODE==1'b1;});
finish_item(req);
end
endtask
endclass

class seq_24 extends uvm_sequence #(trans);
`uvm_object_utils(seq_24)
trans req;
function new(string name="seq_24");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with {INP_VALID==2'b10; OPA==8'b1; OPB==8'd2;CMD==4'b1;MODE==1'b1;});
finish_item(req);
end
endtask
endclass
class seq_25 extends uvm_sequence #(trans);
`uvm_object_utils(seq_25)
trans req;
function new(string name="seq_25");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with {CE==1; INP_VALID==2'b01;CMD==4'b0;MODE==1'b1;});
finish_item(req);
repeat(17) begin
req=trans::type_id::create("req");
start_item(req);
assert(req.randomize() with { MODE==1; CMD==0; INP_VALID==2'b00;CE==1;});
finish_item(req);
end
req=trans::type_id::create("req");
start_item(req);
assert(req.randomize() with { MODE==1; CMD==0; INP_VALID==2'b10;CE==1;});
finish_item(req);

end
endtask
endclass

class seq_26 extends uvm_sequence #(trans);
`uvm_object_utils(seq_26)
trans req;
function new(string name="seq_26");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'h10;CMD==4'd12;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_27 extends uvm_sequence #(trans);
`uvm_object_utils(seq_27)
trans req;
function new(string name="seq_27");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'h20;CMD==4'd12;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_28 extends uvm_sequence #(trans);
`uvm_object_utils(seq_28)
trans req;
function new(string name="seq_28");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'h40;CMD==4'd12;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_29 extends uvm_sequence #(trans);
`uvm_object_utils(seq_29)
trans req;
function new(string name="seq_29");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'h80;CMD==4'd12;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_30 extends uvm_sequence #(trans);
`uvm_object_utils(seq_30)
trans req;
function new(string name="seq_30");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'h01;CMD==4'd12;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass


class seq_31 extends uvm_sequence #(trans);
`uvm_object_utils(seq_31)
trans req;
function new(string name="seq_31");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'h10;CMD==4'd13;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_32 extends uvm_sequence #(trans);
`uvm_object_utils(seq_32)
trans req;
function new(string name="seq_32");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'h20;CMD==4'd13;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_33 extends uvm_sequence #(trans);
`uvm_object_utils(seq_33)
trans req;
function new(string name="seq_33");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'h40;CMD==4'd13;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_34 extends uvm_sequence #(trans);
`uvm_object_utils(seq_34)
trans req;
function new(string name="seq_34");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'h80;CMD==4'd13;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass
class seq_35 extends uvm_sequence #(trans);
`uvm_object_utils(seq_35)
trans req;
function new(string name="seq_35");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'h80;CMD==4'd14;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass
class seq_36 extends uvm_sequence #(trans);
`uvm_object_utils(seq_36)
trans req;
function new(string name="seq_36");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'b1;CMD==4'd9;MODE==1'b1;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_37 extends uvm_sequence #(trans);
`uvm_object_utils(seq_37)
trans req;
function new(string name="seq_37");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'b1;CMD==4'd8;MODE==1'b1;CE==1;});
finish_item(req);
end
endtask
endclass


class seq_38 extends uvm_sequence #(trans);
`uvm_object_utils(seq_38)
trans req;
function new(string name="seq_38");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'b00001111;CMD==4'd13;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_39 extends uvm_sequence #(trans);
`uvm_object_utils(seq_39)
trans req;
function new(string name="seq_39");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'b1;CMD==4'd9;MODE==1'b1;CE==1;});
finish_item(req);
end
endtask
endclass


class seq_40 extends uvm_sequence #(trans);
`uvm_object_utils(seq_40)
trans req;
function new(string name="seq_40");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'b00001111;CMD==4'd13;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_41 extends uvm_sequence #(trans);
`uvm_object_utils(seq_41)
trans req;
function new(string name="seq_41");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'b1;CMD==4'd8;MODE==1'b1;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_42 extends uvm_sequence #(trans);
`uvm_object_utils(seq_42)
trans req;
function new(string name="seq_42");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'b00001111;CMD==4'd12;MODE==1'b1;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_43 extends uvm_sequence #(trans);
`uvm_object_utils(seq_43)
trans req;
function new(string name="seq_43");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'b1;CMD==4'd9;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_44 extends uvm_sequence #(trans);
`uvm_object_utils(seq_44)
trans req;
function new(string name="seq_44");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'b1;CMD==4'd14;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_45 extends uvm_sequence #(trans);
`uvm_object_utils(seq_45)
trans req;
function new(string name="seq_45");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'b1;CMD==4'd1;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_46 extends uvm_sequence #(trans);
`uvm_object_utils(seq_46)
trans req;
function new(string name="seq_46");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'b1;CMD==4'd2;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_47 extends uvm_sequence #(trans);
`uvm_object_utils(seq_47)
trans req;
function new(string name="seq_47");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'b1;CMD==4'd4;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_48 extends uvm_sequence #(trans);
`uvm_object_utils(seq_48)
trans req;
function new(string name="seq_48");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'b1;CMD==4'd6;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_49 extends uvm_sequence #(trans);
`uvm_object_utils(seq_49)
trans req;
function new(string name="seq_49");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'b1;CMD==4'd7;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_50 extends uvm_sequence #(trans);
`uvm_object_utils(seq_50)
trans req;
function new(string name="seq_50");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'b1;CMD==4'd11;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_51 extends uvm_sequence #(trans);
`uvm_object_utils(seq_51)
trans req;
function new(string name="seq_51");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'b1;CMD==4'd14;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_52 extends uvm_sequence #(trans);
`uvm_object_utils(seq_52)
trans req;
function new(string name="seq_52");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'b00000111;CMD==4'd12;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_53 extends uvm_sequence #(trans);
`uvm_object_utils(seq_53)
trans req;
function new(string name="seq_53");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'b1; OPB==8'b00000111;CMD==4'd4;MODE==1'b1;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_54 extends uvm_sequence #(trans);
`uvm_object_utils(seq_54)
trans req;
function new(string name="seq_54");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'd255; OPB==8'd255;CMD==4'd2;MODE==1'b1;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_55 extends uvm_sequence #(trans);
`uvm_object_utils(seq_55)
trans req;
function new(string name="seq_55");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'd3; OPB==8'd1;CMD==4'd3;MODE==1'b1;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_56 extends uvm_sequence #(trans);
`uvm_object_utils(seq_56)
trans req;
function new(string name="seq_56");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'd255; OPB==8'd255;CMD==4'd0;MODE==1'b1;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_57 extends uvm_sequence #(trans);
`uvm_object_utils(seq_57)
trans req;
function new(string name="seq_57");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'd3; OPB==8'd1;CMD==4'd1;MODE==1'b1;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_58 extends uvm_sequence #(trans);
`uvm_object_utils(seq_58)
trans req;
function new(string name="seq_58");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'd3; OPB==8'd3;CMD==4'd8;MODE==1'b1;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_59 extends uvm_sequence #(trans);
`uvm_object_utils(seq_59)
trans req;
function new(string name="seq_59");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'd3; OPB==8'd1;CMD==4'd8;MODE==1'b1;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_60 extends uvm_sequence #(trans);
`uvm_object_utils(seq_60)
trans req;
function new(string name="seq_60");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b01; OPA==8'd3; OPB==8'd1;CMD==4'd8;MODE==1'b1;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_61 extends uvm_sequence #(trans);
`uvm_object_utils(seq_61)
trans req;
function new(string name="seq_61");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b10; OPA==8'd3; OPB==8'd1;CMD==4'd8;MODE==1'b1;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_62 extends uvm_sequence #(trans);
`uvm_object_utils(seq_62)
trans req;
function new(string name="seq_62");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b00; OPA==8'd3; OPB==8'd1;CMD==4'd8;MODE==1'b1;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_63 extends uvm_sequence #(trans);
`uvm_object_utils(seq_63)
trans req;
function new(string name="seq_63");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b01; OPA==8'd3; OPB==8'd1;CMD==4'd8;MODE==1'b1;CE==1;});
finish_item(req);
end
endtask
endclass


class seq_64 extends uvm_sequence #(trans);
`uvm_object_utils(seq_64)
trans req;
function new(string name="seq_64");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b00; OPA==8'd3; OPB==8'd1;CMD==4'd8;MODE==1'b0;CE==1;});
finish_item(req);
end
endtask
endclass

class seq_65 extends uvm_sequence #(trans);
`uvm_object_utils(seq_65)
trans req;
function new(string name="seq_65");
super.new(name);
endfunction
task body();
req=trans::type_id::create("req");
begin
start_item(req);
assert(req.randomize() with { INP_VALID==2'b11; OPA==8'd1; OPB==8'd3;CMD==4'd3;MODE==1'b1;CE==1;});
finish_item(req);
end
endtask
endclass

