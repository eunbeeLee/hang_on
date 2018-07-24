package kr.co.hangOn.board.service;

import java.util.List;

import kr.co.hangOn.repository.domain.Board;
import kr.co.hangOn.repository.domain.BoardPage;

public interface BoardService {
	public List<Board> selectBoard();
	public Board selectBoardByNo(int no) throws Exception;
	public void insertBoard(Board board) throws Exception;
	public void updateBoard(Board board) throws Exception;
	public void deleteBoard(int no) throws Exception;
	public void updateViewCnt(int no) throws Exception;
	public void insertReply(Board board) throws Exception;
	public void refNoUpdate(Board board) throws Exception;
	public void updateLevNo(int no) throws Exception;
	public int maxBoardNo();
	
	// 페이징
	public BoardPage boardResult(BoardPage boardPage);
}
