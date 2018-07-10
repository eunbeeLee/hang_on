package kr.co.hangOn.repository.mapper;

import kr.co.hangOn.repository.domain.Room;

public interface LobbyMapper {
	// 방 생성
	int insertRoom(Room room);
	// 방 찾기
	Room findRoom(Room room);
	// 난수 중복 검사
	int selectJoinCodeByRandomNum(String randomNum);
}
