package com.fs.model.vo;

public class FAQ {
	
	private String faqTitle;
	private String faqContent;
	private String faqHashTag;
	
	public FAQ() {
		// TODO Auto-generated constructor stub
	}

	public FAQ(String faqTitle, String faqContent, String faqHashTag) {
		super();
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqHashTag = faqHashTag;
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
		return "FAQ [faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", faqHashTag=" + faqHashTag + "]";
	}
	
	
	

	
	
	

}
