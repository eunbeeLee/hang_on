package kr.co.hangOn.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hangOn.admin.service.AdminService;
import kr.co.hangOn.repository.domain.History;
import kr.co.hangOn.repository.domain.Page;
import kr.co.hangOn.repository.domain.PageResult;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService service;
	
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
	

}
