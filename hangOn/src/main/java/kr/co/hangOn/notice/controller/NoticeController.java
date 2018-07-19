package kr.co.hangOn.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hangOn.notice.service.NoticeService;
import kr.co.hangOn.repository.domain.Notice;

@Controller
@RequestMapping("/room")
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	@RequestMapping("/noticeRegist.json")
	@ResponseBody
	public void noticeRegist(Notice notice) {
		service.noticeRegist(notice);
	}

	@RequestMapping("/noticeList.json")
	@ResponseBody
	public List<Notice> selectNoticeList(int roomNo) {
		return service.selectNoticeList(roomNo);
	}
	
	@RequestMapping("/noticeDelete.json")
	@ResponseBody
	public List<Notice> deleteNotice(int noticeNo, int roomNo) {
		service.deleteNotice(noticeNo);
		return service.selectNoticeList(roomNo);
		}
}
