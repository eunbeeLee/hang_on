package kr.co.hangOn.lobby.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.hangOn.lobby.service.LobbyService;
import kr.co.hangOn.repository.domain.Room;
import kr.co.hangOn.repository.domain.RoomMember;
import kr.co.hangOn.repository.domain.User;

@Controller
@RequestMapping("/lobby")
public class LobbyController {
	
	@Autowired
	private LobbyService service;
	
	@RequestMapping("/view.do")
	public void lobbyView(Model model, HttpSession session) {
		User user = (User)session.getAttribute("user");
		if(user != null) {
			List<Room> room = service.roomList(user.getUserNo());
			model.addAttribute("room", room);
		}
	}
	
	// 방 생성
	@RequestMapping(value = "/roomRegist.do", method= {RequestMethod.POST})
	public String lobbyRoomRegist(Room room, RedirectAttributes attr, HttpSession session) {
		User user = (User)session.getAttribute("user");
		room.setUserNo(user.getUserNo());
		service.roomRegist(room);
		return "redirect:/room/"+ room.getRoomJoinCode() +"/view.do";
	}
	
	// 방 찾기
	@RequestMapping(value = "/roomFind.do", method= {RequestMethod.POST})
	public String lobbyRoomFind(Room room, RedirectAttributes attr, HttpSession session) {
		User user = (User)session.getAttribute("user");
		Room roomResult = service.roomFind(room);
		if(roomResult == null) {
			attr.addFlashAttribute("msg", "err1");
			return "redirect:view.do";
		}
		if (roomResult.getRoomDelState().equals("ba02")) {
			attr.addFlashAttribute("msg", "err2");
			return "redirect:view.do";
		}
		if (!room.getRoomPassword().equals(roomResult.getRoomPassword())) {
			attr.addFlashAttribute("msg", "err3");
			return "redirect:view.do";
		}
		// user 등록되어 있는지 확인하고 안되어있으면 등록
		RoomMember member = new RoomMember();
		member.setRoomNo(roomResult.getRoomNo());
		member.setUserNo(user.getUserNo());
		
		int result = service.roomFindUser(member);
		/*
		 * result 코드
		 * 1 : 사용자가 등록한 방인지 확인
		 * 2 : 방 참여인수가 6명 참여하고 있는지
		 */
		if(result == 1) {
			attr.addFlashAttribute("msg", "err4");
			return "redirect:view.do";
		} else if (result == 2) {
			attr.addFlashAttribute("msg", "err5");
			return "redirect:view.do";
		}
		// room 에 참여사람 등록
		return "redirect:/room/"+roomResult.getRoomJoinCode()+"/view.do";
	}
	
	@RequestMapping(value = "/leave.do", method= {RequestMethod.GET})
	public String roomLeave(int roomNo, HttpSession session) {
		User user = (User)session.getAttribute("user");
		
		RoomMember roomMember = new RoomMember();
		roomMember.setUserNo(user.getUserNo());
		roomMember.setRoomNo(roomNo);
		
		service.roomUserLeave(roomMember);
		return "redirect:view.do";
	}
	
	
}
