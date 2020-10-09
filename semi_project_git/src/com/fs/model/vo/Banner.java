package com.fs.model.vo;

public class Banner {
	private String perfNo;
	private String banner1;
	private String banner2;
	private String src;
	
	public Banner() {
		// TODO Auto-generated constructor stub
	}

	public Banner(String perfNo, String banner1, String banner2, String src) {
		super();
		this.perfNo = perfNo;
		this.banner1 = banner1;
		this.banner2 = banner2;
		this.src = src;
	}

	public String getPerfNo() {
		return perfNo;
	}

	public void setPerfNo(String perfNo) {
		this.perfNo = perfNo;
	}

	public String getBanner1() {
		return banner1;
	}

	public void setBanner1(String banner1) {
		this.banner1 = banner1;
	}

	public String getBanner2() {
		return banner2;
	}

	public void setBanner2(String banner2) {
		this.banner2 = banner2;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	@Override
	public String toString() {
		return "Banner [perfNo=" + perfNo + ", banner1=" + banner1 + ", banner2=" + banner2 + ", src=" + src + "]";
	}
	
}
