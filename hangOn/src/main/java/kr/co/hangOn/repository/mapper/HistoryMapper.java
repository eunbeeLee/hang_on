package kr.co.hangOn.repository.mapper;

import java.util.List;

import kr.co.hangOn.repository.domain.History;
import kr.co.hangOn.repository.domain.Page;
import kr.co.hangOn.repository.domain.Room;

public interface HistoryMapper {
	List<History> selectHistoryByUser(int userNo);
	
	//사용자별 히스토리 글 갯수
	int selectHistoryCountByUser(History history);
	
	//사용자별 히스토리 기간 조회
	List<History> selectHistoryByPeriod(History history);
	
}
