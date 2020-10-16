package com.fs.model.vo;

public class FAQ {
	
	private int FaqNo;
	private String faqTitle;
	private String faqContent;
	private String faqHashTag;
	
	
	public FAQ() {
		
		
	}

	
	

	public FAQ(int faqNo, String faqTitle, String faqContent, String faqHashTag) {
		super();
		FaqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqHashTag = faqHashTag;
	}




	public int getFaqNo() {
		return FaqNo;
	}


	public void setFaqNo(int faqNo) {
		FaqNo = faqNo;
	}


	public String getFaqTitle() {
		return faqTitle;
	}


	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}


	public String getFaqContent() {
		return faqContent;
	}


	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}


	public String getFaqHashTag() {
		return faqHashTag;
	}


	public void setFaqHashTag(String faqHashTag) {
		this.faqHashTag = faqHashTag;
	}


	@Override
	public String toString() {
		return "FAQ [FaqNo=" + FaqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", faqHashTag="
				+ faqHashTag + "]";
	}




	public void setFilePath(String filesystemName) {
		// TODO Auto-generated method stub
		
	}
	
	
	
	}