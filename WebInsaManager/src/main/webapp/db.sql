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
	age number,
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


-- ���� �ڵ� ���� 
insert into insa_com(gubun, code, name, note)
values('post_gbn_code','10001', '���', '���� ���');
insert into insa_com(gubun, code, name, note)
values('post_gbn_code','10002', '����', '���� ����');
insert into insa_com(gubun, code, name, note)
values('post_gbn_code','10003', '�븮', '���� �븮');
insert into insa_com(gubun, code, name, note)
values('post_gbn_code','10004', '����', '���� ����');
insert into insa_com(gubun, code, name, note)
values('post_gbn_code','10005', '����', '���� ����');
insert into insa_com(gubun, code, name, note)
values('post_gbn_code','10006', '����', '���� ����');
insert into insa_com(gubun, code, name, note)
values('post_gbn_code','10007', '�̻�', '���� �̻�');
insert into insa_com(gubun, code, name, note)
values('post_gbn_code','10008', '��', '���� ��');
insert into insa_com(gubun, code, name, note)
values('post_gbn_code','10009', '����', '���� ����');
insert into insa_com(gubun, code, name, note)
values('post_gbn_code','10010', '�λ���', '���� �λ���');
insert into insa_com(gubun, code, name, note)
values('post_gbn_code','10011', '����', '���� ����');


insert into insa_com(gubun, code, name, note)
values('dept_code', '20001', 'SI�����', '�μ� SI�����');
insert into insa_com(gubun, code, name, note)
values('dept_code', '20002', '������', '�μ� ������');
insert into insa_com(gubun, code, name, note)
values('dept_code', '20003', '���ߺ�', '�μ� ���ߺ�');
insert into insa_com(gubun, code, name, note)
values('dept_code', '20004', '������', '�μ� ������');
insert into insa_com(gubun, code, name, note)
values('dept_code', '20005', 'ȸ���', '�μ� ȸ���');

insert into insa_com(gubun, code, name, note)
values('gart_level', '30001', '���б� ����', '��� ���б� ����');
insert into insa_com(gubun, code, name, note)
values('gart_level', '30002', '����б� ����', '��� ����б� ����');
insert into insa_com(gubun, code, name, note)
values('gart_level', '30003', '���б� ����', '��� ���б� ����');
insert into insa_com(gubun, code, name, note)
values('gart_level', '30004', '�������� ����', '��� �������� ����');
insert into insa_com(gubun, code, name, note)
values('gart_level', '30005', '���п� ����', '��� ���п� ����');


insert into insa_com(gubun, code, name, note)
values('mil_type', '40001', '����', '���� ����');
insert into insa_com(gubun, code, name, note)
values('mil_type', '40002', '�ر�', '���� �ر�');
insert into insa_com(gubun, code, name, note)
values('mil_type', '40003', '����', '���� ����');
insert into insa_com(gubun, code, name, note)
values('mil_type', '40004', '�ǰ�', '���� �ǰ�');

insert into insa_com(gubun, code, name, note)
values('mil_level', '50001', '�̺�', '��� �̺�');
insert into insa_com(gubun, code, name, note)
values('mil_level', '50002', '�Ϻ�', '��� �Ϻ�');
insert into insa_com(gubun, code, name, note)
values('mil_level', '50003', '��', '��� ��');
insert into insa_com(gubun, code, name, note)
values('mil_level', '50004', '����', '��� ����');
insert into insa_com(gubun, code, name, note)
values('mil_level', '50005', '�λ��', '��� �λ��');
insert into insa_com(gubun, code, name, note)
values('mil_level', '50006', '�屳', '��� �屳');

insert into insa_com(gubun, code, name, note)
values('kosa_class_code', '60001', '�ʱ�', 'KOSA��� �ʱ�');
insert into insa_com(gubun, code, name, note)
values('kosa_class_code', '60002', '�߱�', 'KOSA��� �߱�');
insert into insa_com(gubun, code, name, note)
values('kosa_class_code', '60003', '���', 'KOSA��� ���');

	
drop table insa;
