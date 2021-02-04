create table insa2(
	sabun number primary key not null,
	join_day date,
	retire_day date,
	join_yn varchar2(100),
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
	dept_code varchar2(100),
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
    carrier_image varchar2(100),
    regdate date,
    modifieddate date
);

 INSERT INTO INSA (SABUN, NAME, REG_NO,
		HP, ID, PWD, ENG_NAME, PHONE, AGE, EMAIL,
		JOIN_GBN_CODE, SEX, ZIP, ADDR1, ADDR2, POS_GBN_CODE,
		DEPT_CODE, SALARY, GART_LEVEL, PUT_YN, MIL_YN, 
		MIL_TYPE, MIL_LEVEL, MIL_STARTDATE, MIL_ENDDATE,
		KOSA_REG_YN, KOSA_CLASS_CODE, JOIN_DAY, RETIRE_DAY, 
		CMP_REG_NO, CRM_NAME, CMP_REG_IMAGE, CARRIER_IMAGE, 
		PROFILE_IMAGE, SELF_INTRO, JOIN_YN)
VALUES((SELECT NVL(MAX(SABUN), 10000) + 1 FROM INSA), 
		'name', '54545-454', '010-1231-1231', 'idk', '123',
	'engname', '010-1111-1111', '23', 'we@mail.to', '',
	'남자', '1232', '서울시 마포구', '123', 'y', 
	'영업', '123213', '고등학교', 'y',
	'y', NVL(null, 'nvl  null'), '', 
	'', '', 
	'n', '', 
	'2001-02-02', '2004-09-09', '123-23-12334', 'compony',
	'', '', '', '안녕하세요', 'y');
					


create table insa_com(
	gubun varchar2(20) not null,
	code varchar2(20) not null,
	name varchar2(100),
	note varchar2(100),
	constraint insa_com_pk primary key(gubun, code)
);


-- 공통 코드 예시 
insert into insa_com(gubun, code, name, note)
values('pos_gbn_code','10001', '사원', '직위 사원');
insert into insa_com(gubun, code, name, note)
values('pos_gbn_code','10002', '주임', '직위 주임');
insert into insa_com(gubun, code, name, note)
values('pos_gbn_code','10003', '대리', '직위 대리');
insert into insa_com(gubun, code, name, note)
values('pos_gbn_code','10004', '과장', '직위 과장');
insert into insa_com(gubun, code, name, note)
values('pos_gbn_code','10005', '차장', '직위 차장');
insert into insa_com(gubun, code, name, note)
values('pos_gbn_code','10006', '부장', '직위 부장');
insert into insa_com(gubun, code, name, note)
values('pos_gbn_code','10007', '이사', '직위 이사');
insert into insa_com(gubun, code, name, note)
values('pos_gbn_code','10008', '상무', '직위 상무');
insert into insa_com(gubun, code, name, note)
values('pos_gbn_code','10009', '전무', '직위 전무');
insert into insa_com(gubun, code, name, note)
values('pos_gbn_code','10010', '부사장', '직위 부사장');
insert into insa_com(gubun, code, name, note)
values('pos_gbn_code','10011', '사장', '직위 사장');


insert into insa_com(gubun, code, name, note)
values('dept_code', '20001', 'SI사업부', '부서 SI사업부');
insert into insa_com(gubun, code, name, note)
values('dept_code', '20002', '영업부', '부서 영업부');
insert into insa_com(gubun, code, name, note)
values('dept_code', '20003', '개발부', '부서 개발부');
insert into insa_com(gubun, code, name, note)
values('dept_code', '20004', '연구소', '부서 연구소');
insert into insa_com(gubun, code, name, note)
values('dept_code', '20005', '회계부', '부서 회계부');

insert into insa_com(gubun, code, name, note)
values('gart_level', '30001', '중학교 졸업', '등급 중학교 졸업');
insert into insa_com(gubun, code, name, note)
values('gart_level', '30002', '고등학교 졸업', '등급 고등학교 졸업');
insert into insa_com(gubun, code, name, note)
values('gart_level', '30003', '대학교 졸업', '등급 대학교 졸업');
insert into insa_com(gubun, code, name, note)
values('gart_level', '30004', '전문대학 졸업', '등급 전문대학 졸업');
insert into insa_com(gubun, code, name, note)
values('gart_level', '30005', '대학원 졸업', '등급 대학원 졸업');


insert into insa_com(gubun, code, name, note)
values('mil_type', '40001', '육군', '군별 육군');
insert into insa_com(gubun, code, name, note)
values('mil_type', '40002', '해군', '군별 해군');
insert into insa_com(gubun, code, name, note)
values('mil_type', '40003', '공군', '군별 공군');
insert into insa_com(gubun, code, name, note)
values('mil_type', '40004', '의경', '군별 의경');

insert into insa_com(gubun, code, name, note)
values('mil_level', '50001', '이병', '계급 이병');
insert into insa_com(gubun, code, name, note)
values('mil_level', '50002', '일병', '계급 일병');
insert into insa_com(gubun, code, name, note)
values('mil_level', '50003', '상병', '계급 상병');
insert into insa_com(gubun, code, name, note)
values('mil_level', '50004', '병장', '계급 병장');
insert into insa_com(gubun, code, name, note)
values('mil_level', '50005', '부사관', '계급 부사관');
insert into insa_com(gubun, code, name, note)
values('mil_level', '50006', '장교', '계급 장교');

insert into insa_com(gubun, code, name, note)
values('kosa_class_code', '60001', '초급', 'KOSA등급 초급');
insert into insa_com(gubun, code, name, note)
values('kosa_class_code', '60002', '중급', 'KOSA등급 중급');
insert into insa_com(gubun, code, name, note)
values('kosa_class_code', '60003', '고급', 'KOSA등급 고급');

insert into insa_com(gubun, code, name, note)
values('join_gbn_code', '70001', '영업', '직종 영업');
insert into insa_com(gubun, code, name, note)
values('join_gbn_code', '70002', '개발', '직종 개발');
insert into insa_com(gubun, code, name, note)
values('join_gbn_code', '70003', '지원', '직종 지원');
insert into insa_com(gubun, code, name, note)
values('join_gbn_code', '70004', '인사', '직종 인사');
insert into insa_com(gubun, code, name, note)
values('join_gbn_code', '70005', '경영', '직종 경영');
insert into insa_com(gubun, code, name, note)
values('join_gbn_code', '70006', '회계', '직종 회계');


insert into insa_com(gubun, code, name, note)
values('email_domain1', '80001', 'naver.com', 'email 도메인');
insert into insa_com(gubun, code, name, note)
values('email_domain1', '80002', 'hanmail.net', 'email 도메인');
insert into insa_com(gubun, code, name, note)
values('email_domain1', '80003', 'gmail.com', 'email 도메인');
insert into insa_com(gubun, code, name, note)
values('email_domain1', '80004', 'nate.com', 'email 도메인');

drop table insa;
