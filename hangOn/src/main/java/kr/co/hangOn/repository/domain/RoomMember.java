package kr.co.hangOn.repository.domain;

public class RoomMember {
	private int roonNo;
	private int userNo;
	private String roomAuthCode;
	private String roomConnectCode;
	public int getRoonNo() {
		return roonNo;
	}
	public void setRoonNo(int roonNo) {
		this.roonNo = roonNo;
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
