package com.dto;

public class ProMyPageDto {
	private int user_no;
	private String history;
	private int seq;
	private String history_date;
	
	public ProMyPageDto() {
		super();
	}

	public ProMyPageDto(int user_no, String history, int seq, String history_date) {
		super();
		this.user_no = user_no;
		this.history = history;
		this.seq = seq;
		this.history_date = history_date;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getHistory() {
		return history;
	}

	public void setHistory(String history) {
		this.history = history;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getHistory_date() {
		return history_date;
	}

	public void setHistory_date(String history_date) {
		this.history_date = history_date;
	}
	
}
