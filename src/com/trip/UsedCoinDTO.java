package com.trip;

import java.util.Date;

public class UsedCoinDTO {
	private String seq;
	private Date regDate;
	private String coin;
	private String mSeq;
	private String appNum;
	private String travName;
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getCoin() {
		return coin;
	}
	public void setCoin(String coin) {
		this.coin = coin;
	}
	public String getmSeq() {
		return mSeq;
	}
	public void setmSeq(String mSeq) {
		this.mSeq = mSeq;
	}
	public String getAppNum() {
		return appNum;
	}
	public void setAppNum(String appNum) {
		this.appNum = appNum;
	}
	public String getTravName() {
		return travName;
	}
	public void setTravName(String travName) {
		this.travName = travName;
	}
	
	
}
