package com.pinosoft.biz.insa;

import org.springframework.web.multipart.MultipartFile;

public class InsaVo {
	private int sabun;
	private String join_day;
	private String retire_day;
	private String join_yn;
	private String put_yn;
	private String name;
	private String reg_no;
	private String reg_no1;
	private String reg_no2;
	private String reg_no3;
	private String eng_name;	
	private String phone;
	private String hp;
	private String pos_gbn_code;
	private String cmp_reg_no;
	private String cmp_reg_image;
	private MultipartFile upload_cmp_reg_image;
	private String sex;
	private int age;
	private String email;
	private String email_id;
	private String email_domain1;
	private String email_domain2;
	private String zip;
	private String addr1;
	private String addr2;
	private String dept_code;
	private String join_gbn_code;
	private String id;
	private String pwd;
	private int salary;
	private String salary_str;
	private String kosa_reg_yn;
	private String kosa_class_code;
	private String mil_yn;
	private String mil_type;
	private String mil_level;
	private String mil_startdate;
	private String mil_enddate;
	private String gart_level;
	private String self_intro;
	private String crm_name;
	private String profile_image;
	private String carrier_image;
	private MultipartFile upload_profile_image;
	private MultipartFile upload_carrier_image;
	
	public int getSabun() {
		return sabun;
	}
	public void setSabun(int sabun) {
		this.sabun = sabun;
	}
	public String getJoin_day() {
		return join_day;
	}
	public void setJoin_day(String join_day) {
		this.join_day = join_day;
	}
	public String getRetire_day() {
		return retire_day;
	}
	public void setRetire_day(String retire_day) {
		this.retire_day = retire_day;
	}
	public String getJoin_yn() {
		return join_yn;
	}
	public void setJoin_yn(String join_yn) {
		this.join_yn = join_yn;
	}
	public String getPut_yn() {
		return put_yn;
	}
	public void setPut_yn(String put_yn) {
		this.put_yn = put_yn;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getReg_no() {
		return reg_no;
	}
	public void setReg_no(String reg_no) {
		this.reg_no = reg_no;
	}
	public String getReg_no1() {
		return reg_no1;
	}
	public void setReg_no1(String reg_no1) {
		this.reg_no1 = reg_no1;
	}
	public String getReg_no2() {
		return reg_no2;
	}
	public void setReg_no2(String reg_no2) {
		this.reg_no2 = reg_no2;
	}
	public String getReg_no3() {
		return reg_no3;
	}
	public void setReg_no3(String reg_no3) {
		this.reg_no3 = reg_no3;
	}
	public String getEng_name() {
		return eng_name;
	}
	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getPos_gbn_code() {
		return pos_gbn_code;
	}
	public void setPos_gbn_code(String pos_gbn_code) {
		this.pos_gbn_code = pos_gbn_code;
	}
	public String getCmp_reg_no() {
		return cmp_reg_no;
	}
	public void setCmp_reg_no(String cmp_reg_no) {
		this.cmp_reg_no = cmp_reg_no;
	}
	public String getCmp_reg_image() {
		return cmp_reg_image;
	}
	public void setCmp_reg_image(String cmp_reg_image) {
		this.cmp_reg_image = cmp_reg_image;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getEmail_domain1() {
		return email_domain1;
	}
	public void setEmail_domain1(String email_domain1) {
		this.email_domain1 = email_domain1;
	}
	public String getEmail_domain2() {
		return email_domain2;
	}
	public void setEmail_domain2(String email_domain2) {
		this.email_domain2 = email_domain2;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getDept_code() {
		return dept_code;
	}
	public void setDept_code(String dept_code) {
		this.dept_code = dept_code;
	}
	public String getJoin_gbn_code() {
		return join_gbn_code;
	}
	public void setJoin_gbn_code(String join_gbn_code) {
		this.join_gbn_code = join_gbn_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getSalary_str() {
		return salary_str;
	}
	public void setSalary_str(String salary_str) {
		this.salary_str = salary_str;
	}
	public String getKosa_reg_yn() {
		return kosa_reg_yn;
	}
	public void setKosa_reg_yn(String kosa_reg_yn) {
		this.kosa_reg_yn = kosa_reg_yn;
	}
	public String getKosa_class_code() {
		return kosa_class_code;
	}
	public void setKosa_class_code(String kosa_class_code) {
		this.kosa_class_code = kosa_class_code;
	}
	public String getMil_yn() {
		return mil_yn;
	}
	public void setMil_yn(String mil_yn) {
		this.mil_yn = mil_yn;
	}
	public String getMil_type() {
		return mil_type;
	}
	public void setMil_type(String mil_type) {
		this.mil_type = mil_type;
	}
	public String getMil_level() {
		return mil_level;
	}
	public void setMil_level(String mil_level) {
		this.mil_level = mil_level;
	}
	public String getMil_startdate() {
		return mil_startdate;
	}
	public void setMil_startdate(String mil_startdate) {
		this.mil_startdate = mil_startdate;
	}
	public String getMil_enddate() {
		return mil_enddate;
	}
	public void setMil_enddate(String mil_enddate) {
		this.mil_enddate = mil_enddate;
	}
	public String getGart_level() {
		return gart_level;
	}
	public void setGart_level(String gart_level) {
		this.gart_level = gart_level;
	}
	public String getSelf_intro() {
		return self_intro;
	}
	public void setSelf_intro(String self_intro) {
		this.self_intro = self_intro;
	}
	public String getCrm_name() {
		return crm_name;
	}
	public void setCrm_name(String crm_name) {
		this.crm_name = crm_name;
	}
	public String getProfile_image() {
		return profile_image;
	}
	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}
	public String getCarrier_image() {
		return carrier_image;
	}
	public void setCarrier_image(String carrier_image) {
		this.carrier_image = carrier_image;
	}
	public MultipartFile getUpload_cmp_reg_image() {
		return upload_cmp_reg_image;
	}
	public void setUpload_cmp_reg_image(MultipartFile upload_cmp_reg_image) {
		this.upload_cmp_reg_image = upload_cmp_reg_image;
	}
	public MultipartFile getUpload_profile_image() {
		return upload_profile_image;
	}
	public void setUpload_profile_image(MultipartFile upload_profile_image) {
		this.upload_profile_image = upload_profile_image;
	}
	public MultipartFile getUpload_carrier_image() {
		return upload_carrier_image;
	}
	public void setUpload_carrier_image(MultipartFile upload_carrier_image) {
		this.upload_carrier_image = upload_carrier_image;
	}
	@Override
	public String toString() {
		return "InsaVo [sabun=" + sabun + ", join_day=" + join_day + ", retire_day=" + retire_day + ", join_yn="
				+ join_yn + ", put_yn=" + put_yn + ", name=" + name + ", reg_no=" + reg_no + ", reg_no1=" + reg_no1
				+ ", reg_no2=" + reg_no2 + ", reg_no3=" + reg_no3 + ", eng_name=" + eng_name + ", phone=" + phone
				+ ", hp=" + hp + ", pos_gbn_code=" + pos_gbn_code + ", cmp_reg_no=" + cmp_reg_no + ", cmp_reg_image="
				+ cmp_reg_image + ", upload_cmp_reg_image=" + upload_cmp_reg_image + ", sex=" + sex + ", age=" + age
				+ ", email=" + email + ", email_id=" + email_id + ", email_domain1=" + email_domain1
				+ ", email_domain2=" + email_domain2 + ", zip=" + zip + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", dept_code=" + dept_code + ", join_gbn_code=" + join_gbn_code + ", id=" + id + ", pwd=" + pwd
				+ ", salary=" + salary + ", salary_str=" + salary_str + ", kosa_reg_yn=" + kosa_reg_yn
				+ ", kosa_class_code=" + kosa_class_code + ", mil_yn=" + mil_yn + ", mil_type=" + mil_type
				+ ", mil_level=" + mil_level + ", mil_startdate=" + mil_startdate + ", mil_enddate=" + mil_enddate
				+ ", gart_level=" + gart_level + ", self_intro=" + self_intro + ", crm_name=" + crm_name
				+ ", profile_image=" + profile_image + ", carrier_image=" + carrier_image + ", upload_profile_image="
				+ upload_profile_image + ", upload_carrier_image=" + upload_carrier_image + "]";
	}
}
