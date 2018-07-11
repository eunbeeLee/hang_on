package kr.co.hangOn.admin.service;

import java.util.List;

import kr.co.hangOn.repository.domain.History;
import kr.co.hangOn.repository.domain.Room;

public interface adminService {
	public List<History> selectHistoryByUser(int userNo);
	int selectHistoryCountByUser(History history);
	List<History> selectHistoryByPeriod(History history);
}
 