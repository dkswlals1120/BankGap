package com.dto;

import java.util.Date;

public class BoardDto {
	
	private int seq;
	private String writer;
	private String title;
	private String content;
	private String regdate;
	private int view;
	private String type;
	private int userno;
	private String filename;
	private String refilename;
	
	public BoardDto() {}
	
	//팁게시판 수정
	public BoardDto(int seq, int userno, String title, String content) {
		this.seq = seq;
		this.userno = userno;
		this.title = title;
		this.content = content;
	}
	
	//팁게시판 글쓰기
	public BoardDto(String writer, String title, String content, String type, int userno,String filename, String refilename) {
		super();
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.type = type;
		this.userno = userno;
		this.filename = filename;
		this.refilename = refilename;
	}
	
	//자유게시판 글쓰기
	public BoardDto(String writer, String title, String content, String type, int userno) {
		super();
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.type = type;
		this.userno = userno;
	}
	
	//생성자
	public BoardDto(int seq, String writer, String title, String content, String regdate, int view,
			String type, int userno) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.view = view;
		this.type = type;
		this.userno = userno;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getRefilename() {
		return refilename;
	}

	public void setRefilename(String refilename) {
		this.refilename = refilename;
	}
	
	
}
