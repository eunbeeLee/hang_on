package kr.co.hangOn.repository.mapper;

import java.util.List;

import kr.co.hangOn.repository.domain.Board;
import kr.co.hangOn.repository.domain.BoardPage;

public interface BoardMapper {
	List<Board> selectBoard();
	Board selectBoardByNo(int no);
	void insertBoard(Board board);
	void updateBoard(Board board);
	void deleteBoard(int no);
	void updateBoardViewCnt(int no);
	void insertReply(Board board);
	void refNoUpdate(Board board);
	void updateLevNo(int no);
	int maxBoardNo();
	
	// 전체 게시글 개수
	List<Board> paging(int pageNo);
	int selectBoardCount();
	
	
}
