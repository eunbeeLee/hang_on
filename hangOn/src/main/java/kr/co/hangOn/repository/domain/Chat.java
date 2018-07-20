package kr.co.hangOn.repository.domain;

import java.util.Date;

import org.springframework.web.socket.WebSocketSession;

public class Chat {
	private int userNo;
	private WebSocketSession sessioninfo;
	private Date date;
	private String userName;
	
	
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public WebSocketSession getSessioninfo() {
		return sessioninfo;
	}
	public void setSessioninfo(WebSocketSession sessioninfo) {
		this.sessioninfo = sessioninfo;
	}
	
	
}
