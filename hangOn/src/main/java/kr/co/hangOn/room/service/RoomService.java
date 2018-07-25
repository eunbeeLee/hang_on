package kr.co.hangOn.room.service;

import kr.co.hangOn.repository.domain.History;
import kr.co.hangOn.repository.domain.RoomMember;

public interface RoomService {
	void roomMemberUpdate(RoomMember roomMember);
	void historyInsert(History history,String roomJoinCode);
	String selectRoomName(String roomJoinCode);
	int selectRoomNo(String joinCode);
	void updateRoomMemberConnect(RoomMember member);
}
 