package kr.co.hangOn.repository.domain;

import org.springframework.web.socket.WebSocketSession;

public class Chat {
	private int userNo;
	private WebSocketSession sessioninfo;
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
