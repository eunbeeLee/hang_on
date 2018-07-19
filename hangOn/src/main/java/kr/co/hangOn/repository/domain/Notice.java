package kr.co.hangOn.repository.domain;

import java.util.Date;

public class Notice {
	private int noticeNo;
	private int userNo;
	private int roomNo;
	private String userName;
	private String noticeContent;
	private Date noticeDate;
	private String noticeDatetoString;
	
	
	public String getNoticeDatetoString() {
		return noticeDatetoString;
	}
	public void setNoticeDatetoString(String noticeDatetoString) {
		this.noticeDatetoString = noticeDatetoString;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	
	
}
