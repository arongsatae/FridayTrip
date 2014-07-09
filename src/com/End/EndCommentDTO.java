package com.End;

import java.sql.Date;


public class EndCommentDTO {	
	
	private String seq; // 번호
	private String content; // 내용
	private Date regDate; // 날짜
	private String pw; // 암호
	private String memSeq; // 회원번호
	private String boardSeq; // 글번호
	private String name; // 이름
	private String count; // 댓글 카운트
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
