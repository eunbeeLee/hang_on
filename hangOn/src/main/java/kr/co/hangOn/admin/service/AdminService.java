package kr.co.hangOn.admin.service;

import java.util.List;
import java.util.Map;

import kr.co.hangOn.repository.domain.DashBoard;
import kr.co.hangOn.repository.domain.History;
import kr.co.hangOn.repository.domain.Room;
import kr.co.hangOn.repository.domain.RoomMember;

public interface AdminService {
	public Map<String , Object> historyPageInfo(History history);
	public Map<String , Object> roomMgmPageInfo(Room room);
	public Map<String , Object> pageInfoAfterRoomDel(Room room);
	public int roomPassInfo(Room room);
	public void roomInfoUpdate(Room room);
	
	public void memberOut(RoomMember rm);
	public int[] countRoomByMonth(DashBoard dashBoard);
	public int[]  selectCallByUser(DashBoard dashBoard);
	public Map<String, List>  conferenceTimeInfo(DashBoard dashBoard);
}
 