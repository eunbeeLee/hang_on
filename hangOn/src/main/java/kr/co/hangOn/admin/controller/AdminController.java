package kr.co.hangOn.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hangOn.admin.service.AdminService123;
import kr.co.hangOn.repository.domain.History;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService123 service;
	
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
	
	@RequestMapping("/makeHistoryPage.json")
	@ResponseBody
	public Map<String, Object> historyPage(History history){
		return service.historyPageInfo(history);
	}
	
	@RequestMapping("/makeRoomList.json")
	@ResponseBody
	public Map<String, Object> roomMgmPage(int userNo){
//		System.out.println("넘어온 userNo"+userNo);
		return service.roomMgmPageInfo(userNo);
	}

}
