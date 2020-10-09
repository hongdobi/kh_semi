package com.fs.model.vo;

import java.sql.Date;

public class Inquiry {
	
	private int memberNo;
	private int inqNo;
	private String inqCategory;
	private String inqTitle;
	private String inqContent;
	private Date inqDate;
	private String inqYn;
	private String inqAnswer;
	private Date inqAnsDate;
	
	public Inquiry() {
		// TODO Auto-generated constructor stub
	}

	public Inquiry(int memberNo, int inqNo, String inqCategory, String inqTitle, String inqContent, Date inqDate,
			String inqYn, String inqAnswer, Date inqAnsDate) {
		super();
		this.memberNo = memberNo;
		this.inqNo = inqNo;
		this.inqCategory = inqCategory;
		this.inqTitle = inqTitle;
		this.inqContent = inqContent;
		this.inqDate = inqDate;
		this.inqYn = inqYn;
		this.inqAnswer = inqAnswer;
		this.inqAnsDate = inqAnsDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getInqNo() {
		return inqNo;
	}

	public void setInqNo(int inqNo) {
		this.inqNo = inqNo;
	}

	public String getInqCategory() {
		return inqCategory;
	}

	public void setInqCategory(String inqCategory) {
		this.inqCategory = inqCategory;
	}

	public String getInqTitle() {
		return inqTitle;
	}

	public void setInqTitle(String inqTitle) {
		this.inqTitle = inqTitle;
	}

	public String getInqContent() {
		return inqContent;
	}

	public void setInqContent(String inqContent) {
		this.inqContent = inqContent;
	}

	public Date getInqDate() {
		return inqDate;
	}

	public void setInqDate(Date inqDate) {
		this.inqDate = inqDate;
	}

	public String getInqYn() {
		return inqYn;
	}

	public void setInqYn(String inqYn) {
		this.inqYn = inqYn;
	}

	public String getInqAnswer() {
		return inqAnswer;
	}

	public void setInqAnswer(String inqAnswer) {
		this.inqAnswer = inqAnswer;
	}

	public Date getInqAnsDate() {
		return inqAnsDate;
	}

	public void setInqAnsDate(Date inqAnsDate) {
		this.inqAnsDate = inqAnsDate;
	}

	@Override
	public String toString() {
		return "Inquiry [memberNo=" + memberNo + ", inqNo=" + inqNo + ", inqCategory=" + inqCategory + ", inqTitle="
				+ inqTitle + ", inqContent=" + inqContent + ", inqDate=" + inqDate + ", inqYn=" + inqYn + ", inqAnswer="
				+ inqAnswer + ", inqAnsDate=" + inqAnsDate + "]";
	}

	
	
	

	

	
	
	

}
