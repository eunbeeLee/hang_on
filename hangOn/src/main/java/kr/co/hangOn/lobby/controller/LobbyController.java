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
		return "redirect: /hangOn/room/view.do?no="+ room.getRoomNo();
	}
	
	// 방 찾기
	@RequestMapping(value = "/roomFind.do", method= {RequestMethod.POST})
	public String lobbyRoomFind(Room room) {
		Room roomResult = service.roomFind(room);
//		System.out.println(roomResult.getRoomNo());
//		if(roomResult == null) {
//			return "redirect: view.do";
////			attr.addFlashAttribute("msg", "room 찾기 오류 : room 코드를 확인해주세요.");
//		}
//		else if (roomResult.getRoomDelState().equals("ba02")) {
////			attr.addFlashAttribute("msg", "room 찾기 오류 : 삭제된 room 입니다.");
//			return "redirect: view.do";
//		}
//		else if (room.getRoomPassword() != roomResult.getRoomPassword()) {
////			attr.addFlashAttribute("msg", "room 찾기 오류 : room 비밀번호를 확인해주세요.");
//			return "redirect: view.do";
//		} else {
			return "redirect: /hangOn/room/view.do?no="+ roomResult.getRoomNo();
//		}
	}
	
	
}
