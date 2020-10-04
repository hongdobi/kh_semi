package com.fs.model.vo;

public class Inquiry {
	
	private int memberNo;
	private int inqNo;
	private String inqCategory;
	private String inqTitle;
	private String inqContent;
	private String inqYn;
	private String inqAnswer;
	
	public Inquiry() {
		// TODO Auto-generated constructor stub
	}

	public Inquiry(int memberNo, int inqNo, String inqCategory, String inqTitle, String inqContent, String inqYn,
			String inqAnswer) {
		super();
		this.memberNo = memberNo;
		this.inqNo = inqNo;
		this.inqCategory = inqCategory;
		this.inqTitle = inqTitle;
		this.inqContent = inqContent;
		this.inqYn = inqYn;
		this.inqAnswer = inqAnswer;
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

	@Override
	public String toString() {
		return "Inquiry [memberNo=" + memberNo + ", inqNo=" + inqNo + ", inqCategory=" + inqCategory + ", inqTitle="
				+ inqTitle + ", inqContent=" + inqContent + ", inqYn=" + inqYn + ", inqAnswer=" + inqAnswer + "]";
	}
	
	

	

	
	
	

}
