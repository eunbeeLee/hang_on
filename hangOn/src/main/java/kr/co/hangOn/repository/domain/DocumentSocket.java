package kr.co.hangOn.repository.domain;

import org.springframework.web.socket.WebSocketSession;

public class DocumentSocket {
	private String code;
	private WebSocketSession sessioninfo;
	public String getCode() {
		return code;
	}
	public DocumentSocket setCode(String code) {
		this.code = code;
		return this;
	}
	public WebSocketSession getSessioninfo() {
		return sessioninfo;
	}
	public DocumentSocket setSessioninfo(WebSocketSession sessioninfo) {
		this.sessioninfo = sessioninfo;
		return this;
	}
}
