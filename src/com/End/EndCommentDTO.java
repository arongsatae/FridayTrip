package com.End;

import java.sql.Date;


public class EndCommentDTO {	
	
	private String seq; // ��ȣ
	private String content; // ����
	private Date regDate; // ��¥
	private String pw; // ��ȣ
	private String memSeq; // ȸ����ȣ
	private String boardSeq; // �۹�ȣ
	private String name; // �̸�
	private String count; // ��� ī��Ʈ
	private String txtSeq; 
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getMemSeq() {
		return memSeq;
	}
	public void setMemSeq(String memSeq) {
		this.memSeq = memSeq;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(String boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getTxtSeq() {
		return txtSeq;
	}
	public void setTxtSeq(String txtSeq) {
		this.txtSeq = txtSeq;
	}
	
	
	
	
	
}
