package com.fs.model.vo;

public class Seat {
	
	private String bookNo;
	private String seatChoice;
	private String seatRank;
	private String seatPrice;
	
	public Seat() {
		// TODO Auto-generated constructor stub
	}

	public Seat(String bookNo, String seatChoice, String seatRank, String seatPrice) {
		super();
		this.bookNo = bookNo;
		this.seatChoice = seatChoice;
		this.seatRank = seatRank;
		this.seatPrice = seatPrice;
	}

	public String getBookNo() {
		return bookNo;
	}

	public void setBookNo(String bookNo) {
		this.bookNo = bookNo;
	}

	public String getSeatChoice() {
		return seatChoice;
	}

	public void setSeatChoice(String seatChoice) {
		this.seatChoice = seatChoice;
	}

	public String getSeatRank() {
		return seatRank;
	}

	public void setSeatRank(String seatRank) {
		this.seatRank = seatRank;
	}

	public String getSeatPrice() {
		return seatPrice;
	}

	public void setSeatPrice(String seatPrice) {
		this.seatPrice = seatPrice;
	}

	@Override
	public String toString() {
		return "Seat [bookNo=" + bookNo + ", seatChoice=" + seatChoice + ", seatRank=" + seatRank + ", seatPrice="
				+ seatPrice + "]";
	}

	
	

}
