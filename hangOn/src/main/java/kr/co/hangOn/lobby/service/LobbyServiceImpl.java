package kr.co.hangOn.lobby.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangOn.repository.domain.Room;
import kr.co.hangOn.repository.domain.RoomMember;
import kr.co.hangOn.repository.mapper.LobbyMapper;

@Service("lobbyService")
public class LobbyServiceImpl implements LobbyService {
	
	@Autowired
	private LobbyMapper mapper;

	@Override
	public void roomRegist(Room room) {
		String randomNum = "";
		while(true) {
			// 난수 생성
			Random r = new Random();
			StringBuffer buf =new StringBuffer();
			for(int i = 0 ; i < 6 ; i++){
				if(r.nextBoolean()){
					buf.append((char)((int)(r.nextInt(26))+65));
				}else{
					buf.append((r.nextInt(10)));
				}
			}
			randomNum = String.valueOf(buf);
			// 난수 중복 검사
			int result = mapper.selectJoinCodeByRandomNum(randomNum);
			if(result == 1) continue;
			break;
		}
    	// 방 접속 경로 코드
    	room.setRoomJoinCode(randomNum);
    	// db에 새로운 room 저장
    	mapper.insertRoom(room);
    	
//    	 방 멤버 생성
    	RoomMember member = new RoomMember();
    	member.setRoomNo(room.getRoomNo());
    	member.setUserNo(room.getUserNo());
    	member.setRoomAuthCode("bb03");
    	// db 방 멤버 저장
    	mapper.insertNewRoomMember(member);
	}

	@Override
	public Room roomFind(Room room) {
		Room newRoom = mapper.findRoom(room);
		return newRoom;
	}

	@Override
	public int roomFindUser(RoomMember member) {
		// 사용자가 등록한 방인지 확인
		int userCount = mapper.selectFindUserCount(member);
		// 방 참여인수가 6명인지 확인
		int roomCount = mapper.selectRoomCount(member.getRoomNo());
		if(userCount == 1) {
			return 1;
		} else if(roomCount == 6) {
			return 2;
		}
		else {
			mapper.insertFindRoomMember(member);
			return 0;
		}
	}

	@Override
	public List<Room> roomList(int userNo) {
		List<Room> resultRoom = mapper.selectLobbyList(userNo);
		for(Room r : resultRoom) {
			// 접속 중인 유저
			r.setRoomConnectUserCount(mapper.selectRoomConnectCnt(r.getRoomNo()));
			// 방에 등록되어 있는 유저
			r.setRoomNoConnectUserCount(mapper.selectRoomNoConnectCnt(r.getRoomNo()));
		}
		return resultRoom;
	}

	
}
