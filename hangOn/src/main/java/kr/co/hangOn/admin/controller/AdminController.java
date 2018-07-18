package kr.co.hangOn.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hangOn.admin.service.AdminService;
import kr.co.hangOn.repository.domain.History;
import kr.co.hangOn.repository.domain.Room;
import kr.co.hangOn.repository.domain.RoomMember;

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
	
	@RequestMapping("/makeRoomList.json")
	@ResponseBody
	public Map<String, Object> roomMgmPage(Room room){
//		System.out.println("넘어온 userNo"+userNo);
		return service.roomMgmPageInfo(room);
	}
	
	@RequestMapping("/delRoom.json")
	@ResponseBody
	public Map<String, Object> delRoomInfo(Room room){
		return service.pageInfoAfterRoomDel(room);
	}
	@RequestMapping("/roomPassCount.json")
	@ResponseBody
	public int roomPassInfo(Room room) {
		return service.roomPassInfo(room);
	}
	@RequestMapping("/roomUpdate.json")
	@ResponseBody
	public void roomInfoUpdate(Room room) {
		service.roomInfoUpdate(room);
	}
	
	@RequestMapping("/memberOut.json")
	@ResponseBody
	public void memberOut(RoomMember rm) {
		service.memberOut(rm);
	}
	
	
	
	
	
	
}
