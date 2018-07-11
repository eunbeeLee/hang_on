package kr.co.hangOn.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangOn.repository.domain.History;
import kr.co.hangOn.repository.mapper.HistoryMapper;

@Service("adminService")
public class adminServiceImpl implements adminService {
	@Autowired
	public HistoryMapper mapper;

	@Override
	public List<History> selectHistoryByUser(int userNo) {
		return mapper.selectHistoryByUser(userNo);
	}

	@Override
	public int selectHistoryCountByUser(History history) {
		return mapper.selectHistoryCountByUser(history);
	}

	@Override
	public List<History> selectHistoryByPeriod(History history) {
		return mapper.selectHistoryByPeriod(history);
	}
	
	
}
