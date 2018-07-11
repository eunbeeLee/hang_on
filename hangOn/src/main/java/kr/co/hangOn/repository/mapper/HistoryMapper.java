package kr.co.hangOn.repository.mapper;

import java.util.List;

import kr.co.hangOn.repository.domain.History;
import kr.co.hangOn.repository.domain.Room;

public interface HistoryMapper {
	public List<History> selectHistoryByUser(int userNo);
}
