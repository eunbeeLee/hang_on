package kr.co.hangOn.repository.mapper;

import java.util.List;

import kr.co.hangOn.repository.domain.DashBoard;
import kr.co.hangOn.repository.domain.History;
import kr.co.hangOn.repository.domain.Room;
import kr.co.hangOn.repository.domain.RoomMember;

public interface DashBoadMapper {
	int countRoomByMonth(DashBoard dashBoard);
	List<History> selectCallByUser(DashBoard dashBoard);
	
	List<Room> selectRoomNoByUser(int userNo);
	List<History> selectConferenceTime(DashBoard dashBoard);
	List<RoomMember> roomMemberByRoom(int roomNo);
	
	void insertConTimeByRoom(DashBoard dashBoard);
	List<DashBoard> selectConInfoByRoom(DashBoard dashBoard);
	
	void dropConferenceTable();
	String selectRoomName(int roomNo);
	
	
}
