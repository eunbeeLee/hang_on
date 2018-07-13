package kr.co.hangOn.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangOn.repository.domain.History;
import kr.co.hangOn.repository.domain.Page;
import kr.co.hangOn.repository.domain.PageResult;
import kr.co.hangOn.repository.mapper.HistoryMapper;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	public HistoryMapper mapper;

	@Override
	public Map<String , Object> historyPageInfo(History history) {
		int pageNo = history.getPageNo();
		Page search = new Page();
		search.setPageNo(pageNo != -1 ? pageNo : 1);
		
		history.setBegin(search.getBegin());
		history.setEnd(search.getEnd() );
		
		List <History> hList = mapper.selectRecentPeriod(history);
		int count = mapper.selectHistoryCountByUser(history);
		
		Map<String , Object> result = new HashMap<>();
		result.put("hList", hList);
		result.put("pageResult", new PageResult(search.getPageNo(), count));
		result.put("rDays", history.getrDays());
		result.put("startDate", history.getBeginDate());
		result.put("endDate", history.getEndDate());
		return result;
	}

}
