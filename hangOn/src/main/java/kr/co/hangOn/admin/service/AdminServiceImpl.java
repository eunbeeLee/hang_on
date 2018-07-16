package kr.co.hangOn.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangOn.repository.domain.History;
import kr.co.hangOn.repository.domain.Page;
import kr.co.hangOn.repository.domain.PageResult;
import kr.co.hangOn.repository.domain.Room;
import kr.co.hangOn.repository.domain.RoomMember;
import kr.co.hangOn.repository.mapper.HistoryMapper;
import kr.co.hangOn.repository.mapper.RoomMapper;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	public HistoryMapper hisMapper;
	@Autowired
	public RoomMapper roomMapper;

	@Override
	public Map<String , Object> historyPageInfo(History history) {
		int pageNo = history.getPageNo();
		Page search = new Page();
		search.setPageNo(pageNo != -1 ? pageNo : 1);
		
		history.setBegin(search.getBegin());
		history.setEnd(search.getEnd() );
		
		List <History> hList = hisMapper.selectRecentPeriod(history);
		int count = hisMapper.selectHistoryCountByUser(history);
		
		Map<String , Object> result = new HashMap<>();
		result.put("hList", hList);
		result.put("pageResult", new PageResult(search.getPageNo(), count));
		result.put("rDays", history.getrDays());
		result.put("startDate", history.getBeginDate());
		result.put("endDate", history.getEndDate());
		return result;
	}

	@Override
	public Map<String, Object> roomMgmPageInfo(int userNo) {
		List<Room> rList = roomMapper.selectRoomByUser(userNo);
		int roomCount = roomMapper.countRoomList(userNo);
		
		List<RoomMember> rmList;
		Map<Integer,Object> rmMap = new HashMap<>();
		
		for(Room r : rList) {
			RoomMember rm = new RoomMember();
			rm.setActCode("da04");
			rm.setRoomAuthCode("bb03");
			rm.setRoomConnectCode("bb13");
			rm.setRoomNo(r.getRoomNo());
			rmList = roomMapper.selectMemberByRoom(rm);
			rmMap.put(r.getRoomNo(), rmList);
		}
		Map<String, Object> result = new HashMap<>();
		result.put("rList", rList);
		result.put("rmMap", rmMap);
		result.put("roomCount", roomCount);
		return result;
	}

}








