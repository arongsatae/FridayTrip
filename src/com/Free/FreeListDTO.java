package com.Free;

import java.sql.Date;

public class FreeListDTO {

	private String seq;
	private String title;
	private String content;
	private Date regDate;
	private String pw;
	private String memseq;
	private String name;
	private int count; // 카운트
	private int commentcount; // 댓글 카운트
	
	// 답변글 달기
	private String thread;
	private String depth;
	private String depthSpan;	
	
	private String NewImg; // 새글
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
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
	public String getMemseq() {
		return memseq;
	}
	public void setMemseq(String memseq) {
		this.memseq = memseq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNewImg() {
		return NewImg;
	}
	public void setNewImg(String newImg) {
		NewImg = newImg;
	}
	public int getCommentcount() {
		return commentcount;
	}
	public void setCommentcount(int commentcount) {
		this.commentcount = commentcount;
	}
	public String getThread() {
		return thread;
	}
	public void setThread(String thread) {
		this.thread = thread;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
	public String getDepthSpan() {
		return depthSpan;
	}
	public void setDepthSpan(String depthSpan) {
		this.depthSpan = depthSpan;
	}

	
	
}
