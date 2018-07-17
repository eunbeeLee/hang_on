package kr.co.hangOn.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangOn.repository.domain.Board;
import kr.co.hangOn.repository.mapper.BoardMapper;

@Service("BoardService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public List<Board> selectBoard() {
		return mapper.selectBoard();
	}

	@Override
	public Board selectBoardByNo(int no) throws Exception {
		return mapper.selectBoardByNo(no);
	}

	@Override
	public void insertBoard(Board board) throws Exception {
		mapper.insertBoard(board);
	}

	@Override
	public void updateBoard(Board board) throws Exception {
		mapper.updateBoard(board);
	}

	@Override
	public void deleteBoard(int no) throws Exception {
		mapper.deleteBoard(no);
	}

	@Override
	public void updateViewCnt(int no) throws Exception {
		mapper.updateBoardViewCnt(no);
	}

}
