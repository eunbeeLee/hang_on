package kr.co.hangOn.lobby.service;

import kr.co.hangOn.repository.domain.Room;

public interface LobbyService {

	int roomRegist(Room room);

	Room roomFind(Room room);

}
 