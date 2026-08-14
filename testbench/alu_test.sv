class test extends uvm_test;
        `uvm_component_utils(test)

 env env_h;
 alu_config m_cfg;

 function new(string name="test",uvm_component parent);
        super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
        super.build_phase(phase);

  m_cfg=alu_config::type_id::create("m_cfg");

  if(!uvm_config_db#(virtual alu_if)::get(this,"","alu_if",m_cfg.vif))
        `uvm_fatal(get_type_name(),"Can't get the interface")
  m_cfg.is_active=UVM_ACTIVE;
m_cfg.output_agent_is_active=UVM_PASSIVE;
  uvm_config_db#(alu_config)::set(this,"*","alu_config",m_cfg);

  env_h=env::type_id::create("env_h",this);

 endfunction

 function void end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
   uvm_top.print_topology();
endfunction



endclass


class test1 extends test;
	`uvm_component_utils(test1)
	seq s1;
seq_1 s2;
seq_2 s3;
seq_3 s4;
seq_4 s5;
seq_5 s6;
seq_6 s7;
seq_7 s8;
seq_8 s9;
seq_9 s10;

seq_10 s11;
seq_11 s12;
seq_12 s13;
seq_13 s14;
seq_14 s15;
seq_15 s16;
seq_16 s17;
seq_17 s18;
seq_18 s19;
seq_19 s20;
seq_20 s21;
seq_21 s22;
seq_22 s23;
seq_23 s24;
seq_24 s25;
seq_25 s26;
seq_26 s27;
seq_27 s28;
seq_28 s29;
seq_29 s30;
seq_30 s31;
seq_31 s32;
seq_32 s33;
seq_33 s34;
seq_34 s35;
seq_35 s36;
seq_36 s37;
seq_37 s38;
seq_38 s39;
//seq_39 s40;
seq_40 s41;
seq_41 s42;
seq_42 s43;
seq_43 s44;
seq_44 s45;
//cmd_11 c1;
cmd_2 c2;
cmd_4 c3;
cmd_5 c4;
cmd_7 c5;
seq_45 s46;
seq_46 s47;
seq_47 s48;
seq_48 s49;
seq_49 s50;
seq_50 s51;
seq_51 s52;
seq_52 s53;
seq_53 s54;
seq_54 s55;
seq_55 s56;
seq_56 s57;
seq_57 s58;
seq_58 s59;
seq_59 s60;
rst_seq s0;
seq_60 s61;
seq_61 s62;
seq_62 s63;
seq_63 s64;
seq_64 s65;
seq_65 s66;
 function new(string name="test1",uvm_component parent);
	super.new(name,parent);
 endfunction


 function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 endfunction


 task run_phase(uvm_phase phase);

	phase.raise_objection(this);
s0=rst_seq::type_id::create("s0");
	s1=seq::type_id::create("s1");
	s2=seq_1::type_id::create("s2");
	s3=seq_2::type_id::create("s3");
s4=seq_3::type_id::create("s4");
s5=seq_4::type_id::create("s5");
s6=seq_5::type_id::create("s6");
s7=seq_6::type_id::create("s7");
s8=seq_7::type_id::create("s8");
s9=seq_8::type_id::create("s9");
s10=seq_9::type_id::create("s10");

s11=seq_10::type_id::create("s11");
s12=seq_11::type_id::create("s12");
s13=seq_12::type_id::create("s13");
s14=seq_13::type_id::create("s14");
s15=seq_14::type_id::create("s15");
s16=seq_15::type_id::create("s16");
s17=seq_16::type_id::create("s17");
s18=seq_17::type_id::create("s18");
s19=seq_18::type_id::create("s19");
s20=seq_19::type_id::create("s20");
s21=seq_20::type_id::create("s21");
s22=seq_21::type_id::create("s22");
s23=seq_22::type_id::create("s23");
s24=seq_23::type_id::create("s24");
s25=seq_24::type_id::create("s25");
s26=seq_25::type_id::create("s26");
s27=seq_26::type_id::create("s27");
s28=seq_27::type_id::create("s28");
s29=seq_28::type_id::create("s29");
s30=seq_29::type_id::create("s30");
s31=seq_30::type_id::create("s31");
s32=seq_31::type_id::create("s32");
s33=seq_32::type_id::create("s33");
s34=seq_33::type_id::create("s34");
s35=seq_34::type_id::create("s35");
s36=seq_35::type_id::create("s36");
s37=seq_36::type_id::create("s37");
s38=seq_37::type_id::create("s38");
s39=seq_38::type_id::create("s39");
//s40=seq_39::type_id::create("s40");
s41=seq_40::type_id::create("s41");
s42=seq_41::type_id::create("s42");
s43=seq_42::type_id::create("s43");
s44=seq_43::type_id::create("s44");
s45=seq_44::type_id::create("s45");
//c1=cmd_11::type_id::create("c1");
c2=cmd_2::type_id::create("c2");
c3=cmd_4::type_id::create("c3");
c4=cmd_5::type_id::create("c4");
c5=cmd_7::type_id::create("c5");
s46=seq_45::type_id::create("s46");
s47=seq_46::type_id::create("s47");
s48=seq_47::type_id::create("s48");
s49=seq_48::type_id::create("s49");
s50=seq_49::type_id::create("s50");
s51=seq_50::type_id::create("s51");
s52=seq_51::type_id::create("s52");
s53=seq_52::type_id::create("s53");
s54=seq_53::type_id::create("s54");
s55=seq_54::type_id::create("s55");
s56=seq_55::type_id::create("s56");
s57=seq_56::type_id::create("s57");
s58=seq_57::type_id::create("s58");
s59=seq_58::type_id::create("s59");
s60=seq_59::type_id::create("s60");
s61=seq_60::type_id::create("s61");
s62=seq_61::type_id::create("s62");
s63=seq_62::type_id::create("s63");
s64=seq_63::type_id::create("s64");
s65=seq_64::type_id::create("s65");
s66=seq_65::type_id::create("s66");
	begin
//repeat(5) s0.start(env_h.agt_h.seqr_h);
s61.start(env_h.agt_h.seqr_h);

repeat(16) s63.start(env_h.agt_h.seqr_h);

s62.start(env_h.agt_h.seqr_h);
s64.start(env_h.agt_h.seqr_h);
@(m_cfg.vif.inp_dr_cb);
repeat(5)
s62.start(env_h.agt_h.seqr_h);

repeat(18) s63.start(env_h.agt_h.seqr_h);

s61.start(env_h.agt_h.seqr_h);
s62.start(env_h.agt_h.seqr_h);
	s1.start(env_h.agt_h.seqr_h);
	s2.start(env_h.agt_h.seqr_h);
	s3.start(env_h.agt_h.seqr_h);
//repeat(2)
	s4.start(env_h.agt_h.seqr_h);
s5.start(env_h.agt_h.seqr_h);
s4.start(env_h.agt_h.seqr_h);


	s6.start(env_h.agt_h.seqr_h);
	s7.start(env_h.agt_h.seqr_h);
	s8.start(env_h.agt_h.seqr_h);
s9.start(env_h.agt_h.seqr_h);
	s10.start(env_h.agt_h.seqr_h);

	s11.start(env_h.agt_h.seqr_h);
repeat(2)  @(m_cfg.vif.inp_dr_cb);
	s12.start(env_h.agt_h.seqr_h);
repeat(2)  @(m_cfg.vif.inp_dr_cb);

s13.start(env_h.agt_h.seqr_h);
	s14.start(env_h.agt_h.seqr_h);
	s15.start(env_h.agt_h.seqr_h);
	s16.start(env_h.agt_h.seqr_h);
s17.start(env_h.agt_h.seqr_h);
	s18.start(env_h.agt_h.seqr_h);
	s19.start(env_h.agt_h.seqr_h);
	s20.start(env_h.agt_h.seqr_h);
	s21.start(env_h.agt_h.seqr_h);
repeat(16) begin
 @(m_cfg.vif.inp_dr_cb);
s22.start(env_h.agt_h.seqr_h);
end

s23.start(env_h.agt_h.seqr_h);
repeat(3) begin
@(m_cfg.vif.inp_dr_cb);
s24.start(env_h.agt_h.seqr_h);
end
s25.start(env_h.agt_h.seqr_h);
s26.start(env_h.agt_h.seqr_h);
s27.start(env_h.agt_h.seqr_h);
s28.start(env_h.agt_h.seqr_h);
s29.start(env_h.agt_h.seqr_h);
s30.start(env_h.agt_h.seqr_h);
s31.start(env_h.agt_h.seqr_h);
s32.start(env_h.agt_h.seqr_h);
s33.start(env_h.agt_h.seqr_h);
s34.start(env_h.agt_h.seqr_h);
s35.start(env_h.agt_h.seqr_h);
s36.start(env_h.agt_h.seqr_h);
s37.start(env_h.agt_h.seqr_h);
@(m_cfg.vif.inp_dr_cb);
@(m_cfg.vif.inp_dr_cb);

s38.start(env_h.agt_h.seqr_h);
s39.start(env_h.agt_h.seqr_h);
//s40.start(env_h.agt_h.seqr_h);
repeat(3) @(m_cfg.vif.inp_dr_cb);
s41.start(env_h.agt_h.seqr_h);
s42.start(env_h.agt_h.seqr_h);
s43.start(env_h.agt_h.seqr_h);
s44.start(env_h.agt_h.seqr_h);
s45.start(env_h.agt_h.seqr_h);
//c1.start(env_h.agt_h.seqr_h);
c2.start(env_h.agt_h.seqr_h);
repeat(3) c3.start(env_h.agt_h.seqr_h);
c4.start(env_h.agt_h.seqr_h);
repeat(3) c5.start(env_h.agt_h.seqr_h);
s46.start(env_h.agt_h.seqr_h);
s47.start(env_h.agt_h.seqr_h);
s48.start(env_h.agt_h.seqr_h);
s49.start(env_h.agt_h.seqr_h);
s50.start(env_h.agt_h.seqr_h);
s51.start(env_h.agt_h.seqr_h);
s52.start(env_h.agt_h.seqr_h);
repeat(3) s53.start(env_h.agt_h.seqr_h);
s54.start(env_h.agt_h.seqr_h);
repeat(5) s55.start(env_h.agt_h.seqr_h);
repeat(2) s56.start(env_h.agt_h.seqr_h);
s57.start(env_h.agt_h.seqr_h);
repeat(5) s58.start(env_h.agt_h.seqr_h);
s59.start(env_h.agt_h.seqr_h);
s60.start(env_h.agt_h.seqr_h);

repeat(5) s65.start(env_h.agt_h.seqr_h);
s66.start(env_h.agt_h.seqr_h);
#50;	
	phase.drop_objection(this);

end
 endtask

endclass
 


