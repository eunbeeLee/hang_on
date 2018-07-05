package kr.co.hangOn.lobby.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/lobby")
public class LobbyController {
	@RequestMapping("/view.do")
	public String lobbyView() {
		System.out.println("로비 입장");
		return "lobby/view";
	}
}
