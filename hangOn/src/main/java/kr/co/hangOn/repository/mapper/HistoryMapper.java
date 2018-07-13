package kr.co.hangOn.repository.mapper;

import java.util.List;

import kr.co.hangOn.repository.domain.History;
import kr.co.hangOn.repository.domain.Page;
import kr.co.hangOn.repository.domain.Room;

public interface HistoryMapper {
	List<History> selectHistoryByUser(int userNo);
	
	//사용자별 히스토리 글 갯수
	int selectHistoryCountByUser(History history);
	
	//사용자별 히스토리 전체기간 조회
	List<History> selectHistoryByAllPeriod(History history);
	
	//사용자별 히스토리 최근일자 조회
	List<History> selectRecentPeriod(History history);
	
	//최근 일자 히스토리 갯수
	int selectRecentHistoryCount(History history);
	
	//히스토리 입력
	void insertHistory(History history);
}
