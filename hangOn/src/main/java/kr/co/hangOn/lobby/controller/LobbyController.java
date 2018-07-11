package kr.co.hangOn.lobby.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String lobbyView(HttpServletRequest request, HttpSession session) {
		User user = (User)session.getAttribute("user");
		if(user != null) {
			List<Room> room = service.roomList(user.getUserNo());
			request.setAttribute("room", room);
		}
		return "lobby/view";
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
			attr.addFlashAttribute("msg", "room 찾기 오류: room 코드를 확인해주세요.");
			return "redirect:view.do";
		}
		else if (roomResult.getRoomDelState().equals("ba02")) {
			attr.addFlashAttribute("msg", "room 찾기 오류: 삭제된 room 입니다.");
			return "redirect:view.do";
		}
		else if (!room.getRoomPassword().equals(roomResult.getRoomPassword())) {
			attr.addFlashAttribute("msg", "room 찾기 오류: room 비밀번호를 확인해주세요.");
			return "redirect:view.do";
		} else {
			// user 등록되어 있는지 확인하고 안되어있으면 등록
			RoomMember member = new RoomMember();
			member.setRoomNo(roomResult.getRoomNo());
			member.setUserNo(user.getUserNo());
			int result = service.roomFindUser(member);
			if(result == 1) {
				attr.addFlashAttribute("msg", "오류: 이미 등록되어 있는 room 입니다.");
				return "redirect:view.do";
			} else if (result == 2) {
				attr.addFlashAttribute("msg", "오류: 최대 인원이 참여하고 있는 room 입니다.");
				return "redirect:view.do";
			}
			// room 에 참여사람 등록
			return "redirect:/room/"+roomResult.getRoomJoinCode()+"/view.do";
		}
		
	}
	
	
}
