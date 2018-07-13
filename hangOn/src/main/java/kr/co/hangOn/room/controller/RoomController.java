package kr.co.hangOn.room.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hangOn.repository.domain.History;
import kr.co.hangOn.repository.domain.RoomMember;
import kr.co.hangOn.repository.domain.User;
import kr.co.hangOn.room.service.RoomService;

@Controller
@RequestMapping("/room")
public class RoomController {
	
	@Autowired
	private RoomService service;
	@RequestMapping("/{roomNo}/view.do")
	public String view(HttpSession session, HttpServletRequest req) {
		RoomMember roomMember = new RoomMember();
		String joinCode=req.getRequestURI().split("/")[3];
		roomMember.setRoomJoinCode(joinCode);
		int userNo = ((User)session.getAttribute("user")).getUserNo();
		roomMember.setUserNo(userNo);
		roomMember.setType("in");
		service.roomMemberUpdate(roomMember);
		History history = new History();
		history.setUserNo(userNo);
		history.setIpAddr(req.getRemoteAddr());
		history.setActName("da01");
		service.historyInsert(history ,joinCode);
		return "room/view";
	}
	
	@RequestMapping("/{roomNo}/test.do")
	public String test() {
		return "room/test";
	}
	@RequestMapping("/{downNo}/down.do")
	public String down() {
		return "room/view";
	}
}
