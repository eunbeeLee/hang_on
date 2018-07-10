package kr.co.hangOn.lobby.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangOn.repository.domain.Room;
import kr.co.hangOn.repository.mapper.LobbyMapper;

@Service("lobbyService")
public class LobbyServiceImpl implements LobbyService {
	
	@Autowired
	private LobbyMapper mapper;

	@Override
	public int roomRegist(Room room) {
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
		return mapper.insertRoom(room);
	}

	@Override
	public Room roomFind(Room room) {
		return mapper.findRoom(room);
		
	}

	
}
