package kr.co.hangOn.notice.service;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangOn.repository.domain.Notice;
import kr.co.hangOn.repository.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeMapper mapper;
	
	@Override
	public void noticeRegist(Notice notice) {
		mapper.insertnotice(notice);
	}

	@Override
	public List<Notice> selectNoticeList(int roomNo) {
		List<Notice> noticeList = mapper.selectNoticeList(roomNo);
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm");
		for(Notice n : noticeList) {
			n.setUserName(mapper.selectNoticeUserName(n.getUserNo()));
			n.setNoticeDatetoString((sdf.format(n.getNoticeDate())));
		}
		return noticeList;
	}

	@Override
	public void deleteNotice(int noticeNo) {
		mapper.deleteNotice(noticeNo);
	}

}
