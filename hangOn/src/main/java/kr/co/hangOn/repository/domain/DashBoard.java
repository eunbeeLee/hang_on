package kr.co.hangOn.repository.domain;

import java.util.Date;

public class DashBoard {
	private int countRoom;
	private int userNo;
	private int selectDay;
	private int selectMonth;
	private int selectYear;
	private String actStartCode;
	private String actEndCode;
	private int roomNo;
	
	private Date conStart;
	private Date conEnd;
	
	
	public Date getConStart() {
		return conStart;
	}
	public void setConStart(Date conStart) {
		this.conStart = conStart;
	}
	public Date getConEnd() {
		return conEnd;
	}
	public void setConEnd(Date conEnd) {
		this.conEnd = conEnd;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public int getSelectDay() {
		return selectDay;
	}
	public void setSelectDay(int selectDay) {
		this.selectDay = selectDay;
	}
	public String getActStartCode() {
		return actStartCode;
	}
	public void setActStartCode(String actStartCode) {
		this.actStartCode = actStartCode;
	}
	public String getActEndCode() {
		return actEndCode;
	}
	public void setActEndCode(String actEndCode) {
		this.actEndCode = actEndCode;
	}
	public int getSelectYear() {
		return selectYear;
	}
	public void setSelectYear(int selectYear) {
		this.selectYear = selectYear;
	}
	public int getCountRoom() {
		return countRoom;
	}
	public void setCountRoom(int countRoom) {
		this.countRoom = countRoom;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getSelectMonth() {
		return selectMonth;
	}
	public void setSelectMonth(int selectMonth) {
		this.selectMonth = selectMonth;
	}
	
}
