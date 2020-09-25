package com.fs.member.model.vo;

import java.sql.Date;

public class Member {
	
	private String memberId;
	private String memberPw;
	private String memberName;
	private String phone;
	private String email;
	private Date bday;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String memberId, String memberPw, String memberName, String phone, String email, Date bday) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.phone = phone;
		this.email = email;
		this.bday = bday;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBday() {
		return bday;
	}

	public void setBday(Date bday) {
		this.bday = bday;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName + ", phone="
				+ phone + ", email=" + email + ", bday=" + bday + "]";
	}
	
	
	
	
	
	
	
	

}
