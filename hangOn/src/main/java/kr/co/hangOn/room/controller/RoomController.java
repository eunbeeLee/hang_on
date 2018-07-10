package kr.co.hangOn.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/room")
public class RoomController {
	@RequestMapping("/{roomNo}/view.do")
	public String view() {
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
