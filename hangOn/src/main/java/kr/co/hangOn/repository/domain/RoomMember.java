package kr.co.hangOn.repository.domain;

public class RoomMember {
	private int roomNo;
	private int userNo;
	private String roomAuthCode;
	private String roomConnectCode;
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
