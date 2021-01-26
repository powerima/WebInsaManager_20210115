create table insa(
	sabun number primary key not null,
	join_day date,
	retire_day date,
	put_yn varchar2(100),
	name varchar2(100) not null,
	reg_no varchar2(100) not null,
	eng_name varchar2(100),
	phone varchar2(100),
	hp varchar2(100) not null,
	pos_gbn_code varchar2(100),
	cmp_reg_no varchar2(100),
	cmp_reg_image varchar2(100),
	sex varchar2(100),
	years number,
	email varchar2(100),
	zip varchar2(100),
	addr1 varchar2(100),
	addr2 varchar2(100),
	dep_code varchar2(100),
	join_gbn_code varchar2(100),
	id varchar2(100) not null,
	pwd varchar2(100) not null,
	salary number,
	kosa_reg_yn varchar2(100),
	kosa_class_code varchar2(100),
	mil_yn varchar2(100),
	mil_type varchar2(100),
	mil_level varchar2(100),
	mil_startdate date,
	mil_enddate date,
	job_type varchar2(100),
	gart_level varchar2(100),
	self_intro clob,
	crm_name varchar2(100),    
	profile_image varchar2(100),
    carrier_image varchar2(100)
);



create table insa_com(
	gubun varchar2(20) not null,
	code varchar2(20) not null,
	name varchar2(100),
	note varchar2(100),
	constraint insa_com_pk primary key(gubun, code)
);


	
drop table insa;
