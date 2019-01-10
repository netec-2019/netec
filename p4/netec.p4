// AutoGen
// NetEC data field count: 8
// data width: 32

#define TCP_OPTION_MSS_COMPENSATE 0x02040026 /* MSS 38 */


header_type netec_t{
	fields {
		type_ : 16;
		index : 32;

		data_0 : 32;
		data_1 : 32;
		data_2 : 32;
		data_3 : 32;
		data_4 : 32;
		data_5 : 32;
		data_6 : 32;
		data_7 : 32;

	}
}
header netec_t netec;


field_list l4_with_netec_list_udp {
	ipv4.srcAddr;
	ipv4.dstAddr;
	//TOFINO: A bug about alignments, the eight zeroes seem not working. We comment out the protocol field (often unchanged) to get around this bug. The TCP checksum now works fine.
	//8'0;
	//ipv4.protocol;
	meta.l4_proto;
	udp.srcPort;
	udp.dstPort;
	udp.length_;
	netec.index;
	netec.type_;

	netec.data_0;
	netec.data_1;
	netec.data_2;
	netec.data_3;
	netec.data_4;
	netec.data_5;
	netec.data_6;
	netec.data_7;
	meta.cksum_compensate;
}

field_list l4_with_netec_list_tcp {
	ipv4.srcAddr;
	ipv4.dstAddr;
	meta.l4_proto;
	meta.tcpLength;
	tcp.srcPort;
	tcp.dstPort;
	tcp.seqNo;
	tcp.ackNo;
	tcp.dataOffset;
	tcp.res;
	tcp.flags;
	tcp.window;
	tcp.urgentPtr;
	sack1.nop1;
	sack1.sack_l;
	sack1.sack_r;
	sack2.sack_l;
	sack2.sack_r;
	sack3.sack_l;
	sack3.sack_r;
	netec.index;
	netec.type_;
	netec.data_0;
	netec.data_1;
	netec.data_2;
	netec.data_3;
	netec.data_4;
	netec.data_5;
	netec.data_6;
	netec.data_7;

}

field_list_calculation l4_with_netec_checksum {
    input {
        l4_with_netec_list_tcp;
    }
    algorithm : csum16;
    output_width : 16;
}

calculated_field tcp.checksum  {
	update l4_with_netec_checksum;
	verify l4_with_netec_checksum;
}

// AUTOGEN
register r_xor_0{
	width : 32;
	instance_count : 32768;
}
blackbox stateful_alu s_xor_0{
	reg : r_xor_0;
    condition_lo : meta.flag_finish == 1;
    update_lo_1_predicate : condition_lo; /* the third packet */
	update_lo_1_value : 0;
    update_lo_1_predicate : not condition_lo; /* the first/second packet */
	update_lo_1_value : register_lo ^ netec.data_0;

    update_hi_1_value : register_lo ^ netec.data_0;
	output_value : alu_hi;
	output_dst : netec.data_0;
}
@pragma stage 9
table t_xor_0{
	actions{a_xor_0;}
	default_action : a_xor_0();
    size : 1;
}
action a_xor_0(){
	s_xor_0.execute_stateful_alu(netec.index);
}

// AUTOGEN
register r_xor_1{
	width : 32;
	instance_count : 32768;
}
blackbox stateful_alu s_xor_1{
	reg : r_xor_1;
    condition_lo : meta.flag_finish == 1;
    update_lo_1_predicate : condition_lo; /* the third packet */
	update_lo_1_value : 0;
    update_lo_1_predicate : not condition_lo; /* the first/second packet */
	update_lo_1_value : register_lo ^ netec.data_1;

    update_hi_1_value : register_lo ^ netec.data_1;
	output_value : alu_hi;
	output_dst : netec.data_1;
}
@pragma stage 10
table t_xor_1{
	actions{a_xor_1;}
	default_action : a_xor_1();
    size : 1;
}
action a_xor_1(){
	s_xor_1.execute_stateful_alu(netec.index);
}

// AUTOGEN
register r_xor_2{
	width : 32;
	instance_count : 32768;
}
blackbox stateful_alu s_xor_2{
	reg : r_xor_2;
    condition_lo : meta.flag_finish == 1;
    update_lo_1_predicate : condition_lo; /* the third packet */
	update_lo_1_value : 0;
    update_lo_1_predicate : not condition_lo; /* the first/second packet */
	update_lo_1_value : register_lo ^ netec.data_2;

    update_hi_1_value : register_lo ^ netec.data_2;
	output_value : alu_hi;
	output_dst : netec.data_2;
}
@pragma stage 10
table t_xor_2{
	actions{a_xor_2;}
	default_action : a_xor_2();
    size : 1;
}
action a_xor_2(){
	s_xor_2.execute_stateful_alu(netec.index);
}

// AUTOGEN
register r_xor_3{
	width : 32;
	instance_count : 32768;
}
blackbox stateful_alu s_xor_3{
	reg : r_xor_3;
    condition_lo : meta.flag_finish == 1;
    update_lo_1_predicate : condition_lo; /* the third packet */
	update_lo_1_value : 0;
    update_lo_1_predicate : not condition_lo; /* the first/second packet */
	update_lo_1_value : register_lo ^ netec.data_3;

    update_hi_1_value : register_lo ^ netec.data_3;
	output_value : alu_hi;
	output_dst : netec.data_3;
}
@pragma stage 10
table t_xor_3{
	actions{a_xor_3;}
	default_action : a_xor_3();
    size : 1;
}
action a_xor_3(){
	s_xor_3.execute_stateful_alu(netec.index);
}

// AUTOGEN
register r_xor_4{
	width : 32;
	instance_count : 32768;
}
blackbox stateful_alu s_xor_4{
	reg : r_xor_4;
    condition_lo : meta.flag_finish == 1;
    update_lo_1_predicate : condition_lo; /* the third packet */
	update_lo_1_value : 0;
    update_lo_1_predicate : not condition_lo; /* the first/second packet */
	update_lo_1_value : register_lo ^ netec.data_4;

    update_hi_1_value : register_lo ^ netec.data_4;
	output_value : alu_hi;
	output_dst : netec.data_4;
}
@pragma stage 10
table t_xor_4{
	actions{a_xor_4;}
	default_action : a_xor_4();
    size : 1;
}
action a_xor_4(){
	s_xor_4.execute_stateful_alu(netec.index);
}

// AUTOGEN
register r_xor_5{
	width : 32;
	instance_count : 32768;
}
blackbox stateful_alu s_xor_5{
	reg : r_xor_5;
    condition_lo : meta.flag_finish == 1;
    update_lo_1_predicate : condition_lo; /* the third packet */
	update_lo_1_value : 0;
    update_lo_1_predicate : not condition_lo; /* the first/second packet */
	update_lo_1_value : register_lo ^ netec.data_5;

    update_hi_1_value : register_lo ^ netec.data_5;
	output_value : alu_hi;
	output_dst : netec.data_5;
}
@pragma stage 11
table t_xor_5{
	actions{a_xor_5;}
	default_action : a_xor_5();
    size : 1;
}
action a_xor_5(){
	s_xor_5.execute_stateful_alu(netec.index);
}

// AUTOGEN
register r_xor_6{
	width : 32;
	instance_count : 32768;
}
blackbox stateful_alu s_xor_6{
	reg : r_xor_6;
    condition_lo : meta.flag_finish == 1;
    update_lo_1_predicate : condition_lo; /* the third packet */
	update_lo_1_value : 0;
    update_lo_1_predicate : not condition_lo; /* the first/second packet */
	update_lo_1_value : register_lo ^ netec.data_6;

    update_hi_1_value : register_lo ^ netec.data_6;
	output_value : alu_hi;
	output_dst : netec.data_6;
}
@pragma stage 11
table t_xor_6{
	actions{a_xor_6;}
	default_action : a_xor_6();
    size : 1;
}
action a_xor_6(){
	s_xor_6.execute_stateful_alu(netec.index);
}

// AUTOGEN
register r_xor_7{
	width : 32;
	instance_count : 32768;
}
blackbox stateful_alu s_xor_7{
	reg : r_xor_7;
    condition_lo : meta.flag_finish == 1;
    update_lo_1_predicate : condition_lo; /* the third packet */
	update_lo_1_value : 0;
    update_lo_1_predicate : not condition_lo; /* the first/second packet */
	update_lo_1_value : register_lo ^ netec.data_7;

    update_hi_1_value : register_lo ^ netec.data_7;
	output_value : alu_hi;
	output_dst : netec.data_7;
}
@pragma stage 11
table t_xor_7{
	actions{a_xor_7;}
	default_action : a_xor_7();
    size : 1;
}
action a_xor_7(){
	s_xor_7.execute_stateful_alu(netec.index);
}

control xor {

	apply(t_xor_0);
	apply(t_xor_1);
	apply(t_xor_2);
	apply(t_xor_3);
	apply(t_xor_4);
	apply(t_xor_5);
	apply(t_xor_6);
	apply(t_xor_7);

}
