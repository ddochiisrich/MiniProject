package com.second.miniproject.domain;

import java.sql.Timestamp;

public class Community {
	private int no;
	private String content;
	private String title;
	private String id;
	private Timestamp regDate;
	private int readCount;
	private String file5;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Community() {
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public String getFile5() {
		return file5;
	}

	public void setFile5(String file5) {
		this.file5 = file5;
	}

	public Community(int no, String content, String title, String id, Timestamp regDate, int readCount, String file5) {
		super();
		this.no = no;
		this.content = content;
		this.title = title;
		this.id = id;
		this.regDate = regDate;
		this.readCount = readCount;
		this.file5 = file5;
	}

	

	

}
