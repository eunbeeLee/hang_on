package kr.co.hangOn.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@RequestMapping("/dashBoard.do")
	public String dashBoardView() {
		return "admin/dashBoard";
	}
	@RequestMapping("/userMgm.do")
	public String userMgmView() {
		return "admin/userMgm";
	}

}
