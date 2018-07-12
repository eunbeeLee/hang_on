package kr.co.hangOn.repository.domain;

public class RoomMember {
	private int roomNo;
	private int userNo;
	private String type;
	private String roomAuthCode;
	private String roomConnectCode;
	private String roomJoinCode;
	
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
