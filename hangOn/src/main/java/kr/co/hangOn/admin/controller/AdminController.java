package kr.co.hangOn.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hangOn.admin.service.adminService;
import kr.co.hangOn.repository.domain.History;
import kr.co.hangOn.repository.domain.Page;
import kr.co.hangOn.repository.domain.PageResult;

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

	@RequestMapping("/makeHistoryPage.json")
	@ResponseBody
	public Map<String, Object> historyPage(History history){
//		System.out.println("넘어온 페이지 번호 : "+history.getPageNo());
		
//		System.out.println("넘어온 회원번호 : "+history.getPageNo());
		int pageNo = history.getPageNo();
		Page search = new Page();
		search.setPageNo(pageNo != -1 ? pageNo : 1);
		history.setBegin(search.getBegin());
		history.setEnd(search.getEnd());
		List <History> hList = service.selectHistoryByAllPeriod(history);
		int count = service.selectHistoryCountByUser(history);
		Map<String , Object> result = new HashMap<>();
		result.put("hList", hList);
		result.put("pageResult", new PageResult(search.getPageNo(), count));
		
		return result;
	}
	
	@RequestMapping("/searchRecent.json")
	@ResponseBody
	public List<History> selectHistoryByPeriod(History history){
		System.out.println("넘어온 날짜 : "+history.getrDays());
		return service.selectRecentPeriod(history);
	}

}
