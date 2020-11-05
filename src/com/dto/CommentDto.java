package com.dto;

public class CommentDto {
	private int comm_no;
	private String comm_writer;
	private String comm_content;
	private String comm_regdate;
	private int user_no;
	private String user_grade;
	private int board_no;
	private int comm_count;
	
	public CommentDto() {}
	
	//update
	public CommentDto(int comm_no, String comm_content) {
		super();
		this.comm_no = comm_no;
		this.comm_content = comm_content;
	}	
	
	//insert
	public CommentDto(String comm_writer, String comm_content, int user_no, int board_no) {
		super();
		this.comm_writer = comm_writer;
		this.comm_content = comm_content;
		this.user_no = user_no;
		this.board_no = board_no;
	}

	public CommentDto(int comm_no, String comm_writer, String comm_content, String comm_regdate,int comm_count,int user_no,
			String user_grade, int board_no) {
		super();
		this.comm_no = comm_no;
		this.comm_writer = comm_writer;
		this.comm_content = comm_content;
		this.comm_regdate = comm_regdate;
		this.user_no = user_no;
		this.user_grade = user_grade;
		this.board_no = board_no;
	}

	public int getComm_count() {
		return comm_count;
	}
	
	public int getComm_no() {
		return comm_no;
	}

	public void setComm_no(int comm_no) {
		this.comm_no = comm_no;
	}

	public String getComm_writer() {
		return comm_writer;
	}

	public void setComm_writer(String comm_writer) {
		this.comm_writer = comm_writer;
	}

	public String getComm_content() {
		return comm_content;
	}

	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}

	public String getComm_regdate() {
		return comm_regdate;
	}

	public void setComm_regdate(String comm_regdate) {
		this.comm_regdate = comm_regdate;
	}
	

	public void setComm_count(int comm_count) {
		this.comm_count = comm_count;
	}


	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_grade() {
		return user_grade;
	}

	public void setUser_grade(String user_grade) {
		this.user_grade = user_grade;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	
	
}
