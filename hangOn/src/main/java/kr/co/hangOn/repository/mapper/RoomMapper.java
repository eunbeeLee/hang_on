package kr.co.hangOn.repository.mapper;

import java.util.List;

import kr.co.hangOn.repository.domain.Room;
import kr.co.hangOn.repository.domain.RoomMember;

public interface RoomMapper {
	// 방에 입장시 정보 업데이트
	void updateRoomMember(RoomMember roomMember);	
	int roomByJoinCode(String roomNo);
	
	//관리자 페이지- 생성된 방 목록 선택
	List<Room> selectRoomByUser(int userNo);
	
	//방의 멤버 선택
	List<RoomMember> selectMemberByRoom(RoomMember roomMember);
	 
    //유저에 따른 방 갯수 조회
     int countRoomList(int userNo);
    
}
	