package kr.co.hangOn.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hangOn.board.service.BoardService;
import kr.co.hangOn.repository.domain.Board;
import kr.co.hangOn.repository.domain.BoardPage;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/list.do")
	public String selectBoard(BoardPage boardPage, Model model) throws Exception {
		boardPage = service.boardResult(boardPage);
		model.addAttribute("boardResult", boardPage);
		model.addAttribute("boardList", boardPage.getBoard());
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
		int no = service.maxBoardNo(); // 제일 최신 글번호를 불러온다.
		Board b = service.selectBoardByNo(no); // 최신 글 정보를 불러온다.
		b.setRefNo(no); // refNo 를 글번호로 업뎃한다.
		System.out.println(b.getBoardNo());
		System.out.println(no);
		service.refNoUpdate(b); //db에 저장
		return "redirect:list.do";
	}
	
	@RequestMapping("/replyForm.do")
	public String replyForm(int no, HttpSession session) throws Exception {
		Board board = service.selectBoardByNo(no);
		session.setAttribute("board", board);
		return "board/replyForm";
	}
	
	@RequestMapping("/reply.do")
	public String reply(Board board) throws Exception {
		int depthNo = board.getDepthNo();
		board.setDepthNo(depthNo + 1);
		System.out.println(board.getRefNo());
		int refNo = board.getRefNo();
		service.insertReply(board);
		service.updateLevNo(refNo);
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
