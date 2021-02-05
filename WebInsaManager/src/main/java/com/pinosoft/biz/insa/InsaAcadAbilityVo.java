package com.pinosoft.biz.insa;

public class InsaAcadAbilityVo {
	private int sabun;
	private int seq;
	private String majar_stud_gbn;
	private int gart_year;
	private int gart_month;
	private String school_name;
	public int getSabun() {
		return sabun;
	}
	public void setSabun(int sabun) {
		this.sabun = sabun;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getMajar_stud_gbn() {
		return majar_stud_gbn;
	}
	public void setMajar_stud_gbn(String majar_stud_gbn) {
		this.majar_stud_gbn = majar_stud_gbn;
	}
	public int getGart_year() {
		return gart_year;
	}
	public void setGart_year(int gart_year) {
		this.gart_year = gart_year;
	}
	public int getGart_month() {
		return gart_month;
	}
	public void setGart_month(int gart_month) {
		this.gart_month = gart_month;
	}
	public String getSchool_name() {
		return school_name;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	@Override
	public String toString() {
		return "InsaAcadAbilityVo [sabun=" + sabun + ", seq=" + seq + ", majar_stud_gbn=" + majar_stud_gbn
				+ ", gart_year=" + gart_year + ", gart_month=" + gart_month + ", school_name=" + school_name + "]";
	}
	
}
