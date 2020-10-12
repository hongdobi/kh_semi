package com.fs.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class PerfSsn {
	private String nthPerf;
	private String perfNo;
	private Date dateTime;
	private int nthCount;
	
	
	public PerfSsn() {
		// TODO Auto-generated constructor stub
	}


	public PerfSsn(String nthPerf, String perfNo, Date dateTime, int nthCount) {
		super();
		this.nthPerf = nthPerf;
		this.perfNo = perfNo;
		this.dateTime = dateTime;
		this.nthCount = nthCount;
	}


	public String getNthPerf() {
		return nthPerf;
	}


	public void setNthPerf(String nthPerf) {
		this.nthPerf = nthPerf;
	}


	public String getPerfNo() {
		return perfNo;
	}


	public void setPerfNo(String perfNo) {
		this.perfNo = perfNo;
	}


	public Date getDateTime() {
		return dateTime;
	}


	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}


	public int getNthCount() {
		return nthCount;
	}


	public void setNthCount(int nthCount) {
		this.nthCount = nthCount;
	}


	@Override
	public String toString() {
		return "PerfSsn [nthPerf=" + nthPerf + ", perfNo=" + perfNo + ", dateTime=" + dateTime + ", nthCount="
				+ nthCount + "]";
	}


	public void setDateTime(Timestamp timestamp) {
		// TODO Auto-generated method stub
		
	}
	
	
	
}
