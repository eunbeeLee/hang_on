package kr.co.hangOn.lobby.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.hangOn.lobby.service.LobbyService;
import kr.co.hangOn.repository.domain.Room;

@Controller
@RequestMapping("/lobby")
public class LobbyController {
	
	@Autowired
	private LobbyService service;
	
	@RequestMapping("/view.do")
	public String lobbyView() {
		System.out.println("로비 입장");
		return "lobby/view";
	}
	
	// 방 생성
	@RequestMapping(value = "/roomRegist.do", method= {RequestMethod.POST})
	public String lobbyRoomRegist(Room room, RedirectAttributes attr) {
		service.roomRegist(room);
		return "redirect:/room/"+ room.getRoomJoinCode() +"/view.do";
	}
	
	// 방 찾기
	@RequestMapping(value = "/roomFind.do", method= {RequestMethod.POST})
	public String lobbyRoomFind(Room room, RedirectAttributes attr) {
		Room roomResult = service.roomFind(room);
		if(roomResult == null) {
			attr.addFlashAttribute("msg", "room 찾기 오류: room 코드를 확인해주세요.");
			return "redirect:view.do";
		}
		else if (roomResult.getRoomDelState().equals("ba02")) {
			attr.addFlashAttribute("msg", "room 찾기 오류: 삭제된 room 입니다.");
			return "redirect:view.do";
		}
		else if (!room.getRoomPassword().equals(roomResult.getRoomPassword())) {
			attr.addFlashAttribute("msg", "room 찾기 오류: room 비밀번호가 다릅니다.");
			return "redirect:view.do";
		} else {
			// room 에 참여사람 등록
			return "redirect:/room/"+roomResult.getRoomJoinCode()+"/view.do";
		}
	}
	
	
}
