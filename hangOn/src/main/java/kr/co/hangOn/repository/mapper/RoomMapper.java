package kr.co.hangOn.repository.mapper;

import kr.co.hangOn.repository.domain.RoomMember;

public interface RoomMapper {
	// 방에 입장시 정보 업데이트
	void updateRoomMember(RoomMember roomMember);	
	int roomByJoinCode(String roomNo);
}
