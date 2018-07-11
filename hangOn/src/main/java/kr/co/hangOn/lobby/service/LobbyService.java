package kr.co.hangOn.lobby.service;

import java.util.List;

import kr.co.hangOn.repository.domain.Room;
import kr.co.hangOn.repository.domain.RoomMember;

public interface LobbyService {

	void roomRegist(Room room);

	Room roomFind(Room room);

	int roomFindUser(RoomMember member);

	List<Room> roomList(int userNo);

}
 