package kr.co.hangOn.repository.domain;

import java.util.Date;

public class RoomMember {
	private int roomNo;
	private int userNo;
	private String type;
	private String roomAuthCode;
	private String roomConnectCode;
	private String roomJoinCode;
	
	private String userName;
	private String userEmail;
	private Date lastConnetTime;
	private String authInfo;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public Date getLastConnetTime() {
		return lastConnetTime;
	}
	public void setLastConnetTime(Date lastConnetTime) {
		this.lastConnetTime = lastConnetTime;
	}
	public String getAuthInfo() {
		return authInfo;
	}
	public void setAuthInfo(String authInfo) {
		this.authInfo = authInfo;
	}
	private String actCode;
	public String getActCode() {
		return actCode;
	}
	public void setActCode(String actCode) {
		this.actCode = actCode;
	}
	public String getRoomJoinCode() {
		return roomJoinCode;
	}
	public void setRoomJoinCode(String roomJoinCode) {
		this.roomJoinCode = roomJoinCode;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getRoomAuthCode() {
		return roomAuthCode;
	}
	public void setRoomAuthCode(String roomAuthCode) {
		this.roomAuthCode = roomAuthCode;
	}
	public String getRoomConnectCode() {
		return roomConnectCode;
	}
	public void setRoomConnectCode(String roomConnectCode) {
		this.roomConnectCode = roomConnectCode;
	}
	
}
