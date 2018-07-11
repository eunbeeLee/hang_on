package kr.co.hangOn.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hangOn.admin.service.adminService;
import kr.co.hangOn.repository.domain.History;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private adminService service;
	@RequestMapping("/dashBoard.do")
	public String dashBoardView() {
		return "admin/dashBoard";
	}
	@RequestMapping("/roomMgm.do")
	public String userMgmView() {
		return "admin/roomMgm";
	}
	@RequestMapping("/history.do")
	public String historyView() {
		return "admin/history";
	}
	
	@RequestMapping("/makeList.json")
	@ResponseBody
	public List<History> historyTable(int userNo) throws Exception{
		return service.selectHistoryByUser(userNo);
	}


}
