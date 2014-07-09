package com.trip;

import java.util.Date;

public class TripDTO {
	private String seq;
	private String name;
	private String lv;
	private String content;
	private String subcontent;
	private String days;
	private Date starts;
	private Date ends;
	private int coin;
	private Date appstart;
	private Date appends;
	private String img;
	private int count;
	private int total;
	private String mcnt;
	private String wcnt;
	
	
	public String getMcnt() {
		return mcnt;
	}
	public void setMcnt(String mcnt) {
		this.mcnt = mcnt;
	}
	public String getWcnt() {
		return wcnt;
	}
	public void setWcnt(String wcnt) {
		this.wcnt = wcnt;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSubcontent() {
		return subcontent;
	}
	public void setSubcontent(String subcontent) {
		this.subcontent = subcontent;
	}
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	public Date getStarts() {
		return starts;
	}
	public void setStarts(Date starts) {
		this.starts = starts;
	}
	public int getCoin() {
		return coin;
	}
	public void setCoin(int coin) {
		this.coin = coin;
	}
	public Date getAppstart() {
		return appstart;
	}
	public void setAppstart(Date appstart) {
		this.appstart = appstart;
	}
	public Date getAppends() {
		return appends;
	}
	public void setAppends(Date appends) {
		this.appends = appends;
	}
	public Date getEnds() {
		return ends;
	}
	public void setEnds(Date ends) {
		this.ends = ends;
	}
	public String getLv() {
		return lv;
	}
	public void setLv(String lv) {
		this.lv = lv;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}

	
	
}
