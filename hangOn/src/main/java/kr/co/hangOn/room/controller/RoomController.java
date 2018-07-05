package kr.co.hangOn.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/room")
public class RoomController {
	@RequestMapping("/view.do")
	public String view() {
		System.out.println("로비 입장");
		return "room/view";
	}
	@RequestMapping("/{downNo}/down.do")
	public String down() {
		System.out.println("로비 입장");
		return "room/view";
	}
}
