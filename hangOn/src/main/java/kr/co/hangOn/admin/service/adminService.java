package kr.co.hangOn.admin.service;

import java.util.Map;

import kr.co.hangOn.repository.domain.History;

public interface AdminService {
	public Map<String , Object> historyPageInfo(History history);
	public Map<String , Object> roomMgmPageInfo(int userNo);
}
 