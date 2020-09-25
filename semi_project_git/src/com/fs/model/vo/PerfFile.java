package com.fs.model.vo;

public class PerfFile {
	private String perfFileNo;
	private String perfNo;
	private String perfFileName;
	
	public PerfFile() {
		// TODO Auto-generated constructor stub
	}

	public PerfFile(String perfFileNo, String perfNo, String perfFileName) {
		super();
		this.perfFileNo = perfFileNo;
		this.perfNo = perfNo;
		this.perfFileName = perfFileName;
	}

	public String getPerfFileNo() {
		return perfFileNo;
	}

	public void setPerfFileNo(String perfFileNo) {
		this.perfFileNo = perfFileNo;
	}

	public String getPerfNo() {
		return perfNo;
	}

	public void setPerfNo(String perfNo) {
		this.perfNo = perfNo;
	}

	public String getPerfFileName() {
		return perfFileName;
	}

	public void setPerfFileName(String perfFileName) {
		this.perfFileName = perfFileName;
	}

	@Override
	public String toString() {
		return "PerfFile [perfFileNo=" + perfFileNo + ", perfNo=" + perfNo + ", perfFileName=" + perfFileName + "]";
	}
	
	
}
