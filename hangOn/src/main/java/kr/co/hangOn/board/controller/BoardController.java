package kr.co.hangOn.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hangOn.board.service.BoardService;
import kr.co.hangOn.repository.domain.Board;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/list.do")
	public String selectBoard(HttpSession session) {
		List<Board> list = service.selectBoard();
		session.setAttribute("list", list);
		return "board/list";
	}
	
	@RequestMapping("/detail.do")
	public String detail(int no, HttpSession session) throws Exception {
		Board board = service.selectBoardByNo(no);
		System.out.println(no);
		System.out.println(board.getBoardTitle());
		service.updateViewCnt(no);
		session.setAttribute("board", board);
		return "board/detail";
	}
	
	@RequestMapping("/writeForm.do")
	public String writeForm() {
		return "board/writeForm";
	}
	
	@RequestMapping("/write.do")
	public String write(Board board) throws Exception {
		service.insertBoard(board);
		return "redirect:list.do";
	}
	
	@RequestMapping("/updateForm.do")
	public String updateForm() {
		return "board/updateForm";
	}
	
	@RequestMapping("/update.do")
	public String update(Board board) throws Exception {
		System.out.println(board.getBoardNo());
		int no = board.getBoardNo();
		service.updateBoard(board);
		return "redirect:detail.do?no=" + no;
	}
	
	@RequestMapping("/delete.do")
	public String delete(int no) throws Exception {
		service.deleteBoard(no);
		return "redirect:list.do";
	}
	
	
	
}
