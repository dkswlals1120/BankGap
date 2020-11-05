package com.dto;

public class MyPageDto {
	private int user_no;
	private int payno;
	private String category;
	private String place;
	private int amount;
	private String usedate;

	public MyPageDto() {
		super();
	}
	
	public MyPageDto(int user_no, int payno, String category, String place, int amount, String usedate) {
		super();
		this.user_no = user_no;
		this.payno = payno;
		this.category = category;
		this.place = place;
		this.amount = amount;
		this.usedate = usedate;
	}
	
	public MyPageDto(int user_no, String category, String place, int amount, String usedate) {
		this.user_no = user_no;
		this.category = category;
		this.place = place;
		this.amount = amount;
		this.usedate = usedate;
	}

	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getPayno() {
		return payno;
	}
	public void setPayno(int payno) {
		this.payno = payno;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getUsedate() {
		return usedate;
	}
	public void setUsedate(String usedate) {
		this.usedate = usedate;
	}

	@Override
	public String toString() {
		return "MyPageDto [user_no=" + user_no + ", payno=" + payno + ", category=" + category + ", place=" + place
				+ ", amount=" + amount + ", usedate=" + usedate + "]";
	}
	
	
}
