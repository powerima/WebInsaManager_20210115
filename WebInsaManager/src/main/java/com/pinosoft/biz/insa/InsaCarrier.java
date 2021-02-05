package com.pinosoft.biz.insa;

public class InsaCarrier {
	private int sabun;
	private int seq;
	private String cmp_name_carrier;
	private String work_start;
	private String work_end;
	private String pos_gbn_code;
	private String respon_dept;
	private String work_contents;
	
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
	public String getCmp_name_carrier() {
		return cmp_name_carrier;
	}
	public void setCmp_name_carrier(String cmp_name_carrier) {
		this.cmp_name_carrier = cmp_name_carrier;
	}
	public String getWork_start() {
		return work_start;
	}
	public void setWork_start(String work_start) {
		this.work_start = work_start;
	}
	public String getWork_end() {
		return work_end;
	}
	public void setWork_end(String work_end) {
		this.work_end = work_end;
	}
	public String getPos_gbn_code() {
		return pos_gbn_code;
	}
	public void setPos_gbn_code(String pos_gbn_code) {
		this.pos_gbn_code = pos_gbn_code;
	}
	public String getRespon_dept() {
		return respon_dept;
	}
	public void setRespon_dept(String respon_dept) {
		this.respon_dept = respon_dept;
	}
	public String getWork_contents() {
		return work_contents;
	}
	public void setWork_contents(String work_contents) {
		this.work_contents = work_contents;
	}
	@Override
	public String toString() {
		return "InsaCarrier [sabun=" + sabun + ", seq=" + seq + ", cmp_name_carrier=" + cmp_name_carrier
				+ ", work_start=" + work_start + ", work_end=" + work_end + ", pos_gbn_code=" + pos_gbn_code
				+ ", respon_dept=" + respon_dept + ", work_contents=" + work_contents + "]";
	}
}
