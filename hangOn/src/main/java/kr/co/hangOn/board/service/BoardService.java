package kr.co.hangOn.board.service;

import java.util.List;

import kr.co.hangOn.repository.domain.Board;

public interface BoardService {
	public List<Board> selectBoard();
	public Board selectBoardByNo(int no) throws Exception;
	public void insertBoard(Board board) throws Exception;
	public void updateBoard(Board board) throws Exception;
	public void deleteBoard(int no) throws Exception;
	public void updateViewCnt(int no) throws Exception;
}
