package com.fs.model.vo;

import java.sql.Date;

public class Performance {

	private String perfNo;
	private String perfName;
	private int perfRuntime;
	private Date perfStart;
	private Date perfEnd;
	private int perfPg;
	private String perfLocation;
	private String perfAddress;
	private int perfCapacity;
	private String perfPoster;
	private String perfTimeInfo;
	private String perfPriceInfo;
	
	public Performance() {
		// TODO Auto-generated constructor stub
	}

	public Performance(String perfNo, String perfName, int perfRuntime, Date perfStart, Date perfEnd, int perfPg,
			String perfLocation, String perfAddress, int perfCapacity, String perfPoster, String perfTimeInfo,
			String perfPriceInfo) {
		super();
		this.perfNo = perfNo;
		this.perfName = perfName;
		this.perfRuntime = perfRuntime;
		this.perfStart = perfStart;
		this.perfEnd = perfEnd;
		this.perfPg = perfPg;
		this.perfLocation = perfLocation;
		this.perfAddress = perfAddress;
		this.perfCapacity = perfCapacity;
		this.perfPoster = perfPoster;
		this.perfTimeInfo = perfTimeInfo;
		this.perfPriceInfo = perfPriceInfo;
	}

	public String getPerfNo() {
		return perfNo;
	}

	public void setPerfNo(String perfNo) {
		this.perfNo = perfNo;
	}

	public String getPerfName() {
		return perfName;
	}

	public void setPerfName(String perfName) {
		this.perfName = perfName;
	}

	public int getPerfRuntime() {
		return perfRuntime;
	}

	public void setPerfRuntime(int perfRuntime) {
		this.perfRuntime = perfRuntime;
	}

	public Date getPerfStart() {
		return perfStart;
	}

	public void setPerfStart(Date perfStart) {
		this.perfStart = perfStart;
	}

	public Date getPerfEnd() {
		return perfEnd;
	}

	public void setPerfEnd(Date perfEnd) {
		this.perfEnd = perfEnd;
	}

	public int getPerfPg() {
		return perfPg;
	}

	public void setPerfPg(int perfPg) {
		this.perfPg = perfPg;
	}

	public String getPerfLocation() {
		return perfLocation;
	}

	public void setPerfLocation(String perfLocation) {
		this.perfLocation = perfLocation;
	}

	public String getPerfAddress() {
		return perfAddress;
	}

	public void setPerfAddress(String perfAddress) {
		this.perfAddress = perfAddress;
	}

	public int getPerfCapacity() {
		return perfCapacity;
	}

	public void setPerfCapacity(int perfCapacity) {
		this.perfCapacity = perfCapacity;
	}

	public String getPerfPoster() {
		return perfPoster;
	}

	public void setPerfPoster(String perfPoster) {
		this.perfPoster = perfPoster;
	}

	public String getPerfTimeInfo() {
		return perfTimeInfo;
	}

	public void setPerfTimeInfo(String perfTimeInfo) {
		this.perfTimeInfo = perfTimeInfo;
	}

	public String getPerfPriceInfo() {
		return perfPriceInfo;
	}

	public void setPerfPriceInfo(String perfPriceInfo) {
		this.perfPriceInfo = perfPriceInfo;
	}

	@Override
	public String toString() {
		return "Performance [perfNo=" + perfNo + ", perfName=" + perfName + ", perfRuntime=" + perfRuntime
				+ ", perfStart=" + perfStart + ", perfEnd=" + perfEnd + ", perfPg=" + perfPg + ", perfLocation="
				+ perfLocation + ", perfAddress=" + perfAddress + ", perfCapacity=" + perfCapacity + ", perfPoster="
				+ perfPoster + ", perfTimeInfo=" + perfTimeInfo + ", perfPriceInfo=" + perfPriceInfo + "]";
	}
	
	
}
