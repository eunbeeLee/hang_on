package kr.co.hangOn.repository.domain;

import java.util.Date;

public class History {
	 private int userNo;
	 public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
    private int roomNo;
    
    public int getRoomNo() {
        return roomNo;
    }
    public void setRoomNo(int roomNo) {
        this.roomNo = roomNo;
    }

	private String actName;
	 private Date connectTime;
	 private String ipAddr;
	 private String roomName;
	 private String userName;
	 private String userEmail;
	 
	private int pageNo =1;
	private int begin;
	private int end;
	
	
	private String beginDate;
	private String endDate; 
	
	private int rDays;
	
	
	
	public int getrDays() {
		return rDays;
	}
	public void setrDays(int rDays) {
		this.rDays = rDays;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(String string) {
		this.beginDate = string;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getBegin() {
		return (pageNo -1) * 11 + 1;
	}
	public int getEnd() {
		return pageNo * 11;
	}
	
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getActName() {
		return actName;
	}
	public void setActName(String actName) {
		this.actName = actName;
	}
	public Date getConnectTime() {
		return connectTime;
	}
	public void setConnectTime(Date connectTime) {
		this.connectTime = connectTime;
	}
	public String getIpAddr() {
		return ipAddr;
	}
	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	

}
