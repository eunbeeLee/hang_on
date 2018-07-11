package kr.co.hangOn.repository.domain;

import java.util.Date;

public class Room {
	private int roomNo;
	private String roomName;
	private Date roomCreateDate;
	private String roomInfo;
	private String roomPassword;
	private String roomJoinCode;
	private String roomDelState;
	private int userNo;
	
	
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
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public Date getRoomCreateDate() {
		return roomCreateDate;
	}
	public void setRoomCreateDate(Date roomCreateDate) {
		this.roomCreateDate = roomCreateDate;
	}
	public String getRoomInfo() {
		return roomInfo;
	}
	public void setRoomInfo(String roomInfo) {
		this.roomInfo = roomInfo;
	}
	public String getRoomPassword() {
		return roomPassword;
	}
	public void setRoomPassword(String roomPassword) {
		this.roomPassword = roomPassword;
	}
	public String getRoomJoinCode() {
		return roomJoinCode;
	}
	public void setRoomJoinCode(String roomJoinCode) {
		this.roomJoinCode = roomJoinCode;
	}
	public String getRoomDelState() {
		return roomDelState;
	}
	public void setRoomDelState(String roomDelState) {
		this.roomDelState = roomDelState;
	}
	
	
	
}
