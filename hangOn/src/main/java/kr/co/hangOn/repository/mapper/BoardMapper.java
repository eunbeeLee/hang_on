package kr.co.hangOn.repository.mapper;

import java.util.List;

import kr.co.hangOn.repository.domain.Board;

public interface BoardMapper {
	List<Board> selectBoard();
	Board selectBoardByNo(int no);
	void insertBoard(Board board);
	void updateBoard(Board board);
	void deleteBoard(int no);
	void updateBoardViewCnt(int no);
}
