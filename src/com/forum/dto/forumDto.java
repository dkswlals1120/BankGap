package com.forum.dto;

import java.util.Date;

public class forumDto {
		private int seq;
		private String writer;
		private String title;
		private String content;
		private Date regdate;
		private int view;
		private int coment;
		private String type;
		private int userno;
		
		public forumDto() {
			super();
		}

		public forumDto(String writer, String title, String content, String type, int userno) {
			super();
			this.writer = writer;
			this.title = title;
			this.content = content;
			this.type = type;
			this.userno = userno;
		}

		public forumDto(String writer, String title, String content) {
			super();
			this.writer = writer;
			this.title = title;
			this.content = content;
		}

		public forumDto(int seq, String title, String content) {
			super();
			this.seq = seq;
			this.title = title;
			this.content = content;
		}

		public forumDto(int seq, String writer, String title, String content, Date regdate, int view, int coment,
				String type, int userno) {
			super();
			this.seq = seq;
			this.writer = writer;
			this.title = title;
			this.content = content;
			this.regdate = regdate;
			this.view = view;
			this.coment = coment;
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

		public Date getRegdate() {
			return regdate;
		}

		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}

		public int getView() {
			return view;
		}

		public void setView(int view) {
			this.view = view;
		}

		public int getComent() {
			return coment;
		}

		public void setComent(int coment) {
			this.coment = coment;
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

		
		
}
