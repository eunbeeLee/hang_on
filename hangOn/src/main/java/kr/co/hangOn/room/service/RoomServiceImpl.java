package kr.co.hangOn.room.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangOn.repository.domain.RoomMember;
import kr.co.hangOn.repository.mapper.RoomMapper;

@Service("roomService")
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	private RoomMapper mapper;
	
	@Override
	public void roomMemberUpdate(RoomMember roomMember) {
		roomMember.setRoomNo(mapper.roomByJoinCode(roomMember.getRoomJoinCode())); 
		mapper.updateRoomMember(roomMember);
	}
	
}
