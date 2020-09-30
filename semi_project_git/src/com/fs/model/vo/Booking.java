package com.fs.model.vo;

import java.sql.Date;

public class Booking {
	private String bookNo;
	private int memberNo;
	private String perfNo;
	private String nthPerf;
	private int buyTicket;
	private int totalPrice;
	private Date bookDate;
	private String bookYn;
	private String memberId;
	private Date perfDate;//관람일자 멤버변수 추가
	
	
	public Booking() {
		// TODO Auto-generated constructor stub
	}


	public Booking(String bookNo, int memberNo, String perfNo, String nthPerf, int buyTicket, int totalPrice,
			Date bookDate, String bookYn, String memberId, Date perfDate) {
		super();
		this.bookNo = bookNo;
		this.memberNo = memberNo;
		this.perfNo = perfNo;
		this.nthPerf = nthPerf;
		this.buyTicket = buyTicket;
		this.totalPrice = totalPrice;
		this.bookDate = bookDate;
		this.bookYn = bookYn;
		this.memberId = memberId;
		this.perfDate = perfDate;
	}


	public String getBookNo() {
		return bookNo;
	}


	public void setBookNo(String bookNo) {
		this.bookNo = bookNo;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getPerfNo() {
		return perfNo;
	}


	public void setPerfNo(String perfNo) {
		this.perfNo = perfNo;
	}


	public String getNthPerf() {
		return nthPerf;
	}


	public void setNthPerf(String nthPerf) {
		this.nthPerf = nthPerf;
	}


	public int getBuyTicket() {
		return buyTicket;
	}


	public void setBuyTicket(int buyTicket) {
		this.buyTicket = buyTicket;
	}


	public int getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}


	public Date getBookDate() {
		return bookDate;
	}


	public void setBookDate(Date bookDate) {
		this.bookDate = bookDate;
	}


	public String getBookYn() {
		return bookYn;
	}


	public void setBookYn(String bookYn) {
		this.bookYn = bookYn;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public Date getPerfDate() {
		return perfDate;
	}


	public void setPerfDate(Date perfDate) {
		this.perfDate = perfDate;
	}


	@Override
	public String toString() {
		return "Booking [bookNo=" + bookNo + ", memberNo=" + memberNo + ", perfNo=" + perfNo + ", nthPerf=" + nthPerf
				+ ", buyTicket=" + buyTicket + ", totalPrice=" + totalPrice + ", bookDate=" + bookDate + ", bookYn="
				+ bookYn + ", memberId=" + memberId + ", perfDate=" + perfDate + "]";
	}

	
}
