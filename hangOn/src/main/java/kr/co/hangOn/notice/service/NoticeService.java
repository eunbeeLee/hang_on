package kr.co.hangOn.notice.service;

import java.util.List;

import kr.co.hangOn.repository.domain.Notice;

public interface NoticeService {

	void noticeRegist(Notice notice);

	List<Notice> selectNoticeList(int roomNo);

	void deleteNotice(int noticeNo);

}
