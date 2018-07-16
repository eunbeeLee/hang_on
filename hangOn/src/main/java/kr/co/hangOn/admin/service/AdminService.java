package kr.co.hangOn.admin.service;

import java.util.List;
import java.util.Map;

import kr.co.hangOn.repository.domain.History;
import kr.co.hangOn.repository.domain.Room;

public interface AdminService {
	public Map<String , Object> historyPageInfo(History history);
	public Map<String , Object> roomMgmPageInfo(Room room);
}
 