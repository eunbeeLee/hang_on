package kr.co.hangOn.repository.mapper;

import java.util.List;

import kr.co.hangOn.repository.domain.Notice;

public interface NoticeMapper {
	void insertnotice(Notice notice);
	List<Notice> selectNoticeList(int roomNo);
	void deleteNotice(int noticeNo);
	String selectNoticeUserName(int userNo);
}
