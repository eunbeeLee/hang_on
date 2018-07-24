package kr.co.hangOn.admin.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangOn.repository.domain.DashBoard;
import kr.co.hangOn.repository.domain.History;
import kr.co.hangOn.repository.domain.Page;
import kr.co.hangOn.repository.domain.PageResult;
import kr.co.hangOn.repository.domain.Room;
import kr.co.hangOn.repository.domain.RoomMember;
import kr.co.hangOn.repository.mapper.DashBoadMapper;
import kr.co.hangOn.repository.mapper.HistoryMapper;
import kr.co.hangOn.repository.mapper.RoomMapper;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	public HistoryMapper hisMapper;
	@Autowired
	public RoomMapper roomMapper;
	@Autowired
	public DashBoadMapper dashMapper;

	@Override
	public Map<String , Object> historyPageInfo(History history) {
		int pageNo = history.getPageNo();
		Page search = new Page();
		search.setPageNo(pageNo != -1 ? pageNo : 1);
		
		history.setBegin(search.getBegin());
		history.setEnd(search.getEnd() );
		
		String endAddOneDay = "";
//		System.out.println(history.getEndDate());
		if(history.getEndDate() !=null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date endDate = sdf.parse(history.getEndDate());
				Calendar cal = Calendar.getInstance();
		        cal.setTime(endDate);
		        cal.add(Calendar.DATE, 1);
//		        System.out.println(cal.getTime());
//		        System.out.println(sdf.format(cal.getTime()));
		        endAddOneDay = sdf.format(cal.getTime());

			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		history.setEndDate(endAddOneDay);
		int count = hisMapper.selectHistoryCountByUser(history);
		List <History> hList = hisMapper.selectRecentPeriod(history);
		
		Map<String , Object> result = new HashMap<>();
		result.put("hList", hList);
		result.put("pageResult", new PageResult(search.getPageNo(), count));
		result.put("rDays", history.getrDays());
		result.put("startDate", history.getBeginDate());
		result.put("endDate", endAddOneDay);
		return result;
	}

	@Override
	public Map<String, Object> roomMgmPageInfo(Room room) {
//		System.out.println("방이름"+room.getRoomName());
		room.setRoomDelState("ba01");
		List<Room> rList = roomMapper.selectRoom(room);
		int roomCount = roomMapper.countRoomList(room.getRoomNo());
		
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

	@Override
	public Map<String, Object> pageInfoAfterRoomDel(Room room) {
		room.setRoomDelState("ba02");
		roomMapper.updateRoomDelState(room);
		return roomMgmPageInfo(room);
	}

	@Override
	//방 비밀번호 일치 여부 확인
	public int roomPassInfo(Room room) {
		return roomMapper.checkRoomPass(room);
	}

	@Override
	public void roomInfoUpdate(Room room) {
		String[] sArr = room.getSeveralUserNo().split(",");
		for(String s : sArr) {
			System.out.println(room.getUserNo());
			room.setUserNo(Integer.parseInt(s));
			System.out.println(room.getRoomNo());
			roomMapper.updateRoomMemberAuth(room);
//			System.out.println("사람 : "+s);
		}
//		System.out.println("방이름 : "+room.getRoomName());
//		System.out.println("방설명 : "+room.getRoomInfo());
//		System.out.println("방비번 : "+room.getRoomPassword());
		Room dRoom = roomMapper.searchRoomInfo(room.getRoomNo());
		if(room.getRoomInfo().equals("")) {
			room.setRoomInfo(dRoom.getRoomInfo());
		}
		if(room.getRoomName().equals("")) {
			room.setRoomName(dRoom.getRoomName());
		}
		if(room.getRoomPassword().equals("")) {
			room.setRoomPassword(dRoom.getRoomPassword());
		}
		roomMapper.updateRoomInfo(room);
	}

	@Override
	public void memberOut(RoomMember rm) {
//		System.out.println(rm.getRoomNo());
//		System.out.println(rm.getUserNo());
		rm.setRoomConnectCode("bb13");
		roomMapper.memberOut(rm);
	}

	@Override
	public int[] countRoomByMonth(DashBoard dashBoard) {
		int year = Calendar.getInstance().get(Calendar.YEAR);
		int mArr[] = new int[12];
		for(int i = 0; i <12; i++) {
			dashBoard.setSelectYear(year);
			dashBoard.setSelectMonth(i+1);
			mArr[i] =  dashMapper.countRoomByMonth(dashBoard);
		}
		return mArr;
	}

	@Override
	public int[] selectCallByUser(DashBoard dashBoard) {
		dashBoard.setActStartCode("da01");
		dashBoard.setActEndCode("da04");
		
		int maxDate = 31;
		int[] callArr = new int[maxDate];

		for(int i = 1; i<= maxDate; i++) {
			dashBoard.setSelectDay(i);
			List<History> hList = dashMapper.selectCallByUser(dashBoard);
//			System.out.println("리스트 사이즈" + hList.size());
			int hListSize = hList.size();
//			System.out.println(hListSize);
//			System.out.println("----------------------");
			//해당 날짜에 데이터가 없을 경우
			if( hListSize == 0) {
				callArr[i-1] =  0;
			}else {
				int callContent = 0;
				if(hListSize %2 !=0) {
					hListSize -= 1;
				}
				for(int j = 0; j < hListSize/2; j++) {
//					int start = (2*j);
//					int end = (2*j)+1;
//					System.out.println("시작"+start);
//					System.out.println("끝"+end);
//					System.out.println("통화 시작 : "+hList.get(2*j).getConnectTime());
//					System.out.println("통화 종료 : "+hList.get((2*j)+1).getConnectTime());
					Long start = hList.get(2*j).getConnectTime().getTime();
					Long end = hList.get( (2*j)+1).getConnectTime().getTime();
//					System.out.println((end - start)/1000);
					callContent +=((end - start)/1000/60);
				}
				callArr[i-1] = callContent;
			}
		}
		return callArr;
	}

	@Override
	public Map<String, List> conferenceTimeInfo(DashBoard dashBoard) {
		 Map<String, List> resultMap = new HashMap<>();
		List<Room> rList = dashMapper.selectRoomNoByUser(dashBoard.getUserNo());
//		Long[] conArr = new Long[rList.size()];
		Map<String, Long> conMap = new HashMap<>();
		for(int i = 0; i < rList.size(); i++) {
			Room r = rList.get(i);
			//방에 참여한 멤버
			List<RoomMember> rmList = dashMapper.roomMemberByRoom(r.getRoomNo());
//			System.out.println(r.getRoomNo()+"번방");
//			System.out.println("참여 멤버 수 :"+rmList.size());
			if(rmList.size() != 0 ) {
			for(RoomMember rm : rmList) {
				dashBoard.setUserNo(rm.getUserNo());//참여멤버 설정
				dashBoard.setRoomNo(r.getRoomNo());//방번호 설정
				List<History> hList = dashMapper.selectConferenceTime(dashBoard);
//				System.out.println("히스토리 사이즈 :"+hList.size());
				if(hList.size() != 0 ) {
					DashBoard db = new DashBoard();
					int hListSize = hList.size();
					if(hList.size() %2 !=0) {
						hListSize-=1;
					}
					for(int j = 0; j < hListSize; j++) {
						History h = hList.get(j);
	//					System.out.println("코드"+h.getActCode());
						db.setRoomNo(r.getRoomNo());
						db.setUserNo(dashBoard.getUserNo());
						if(h.getActCode().equals("da01")) {
							db.setConStart(h.getConnectTime());
//							System.out.println(dashBoard.getUserNo()+"입장 : "+h.getConnectTime());
						}
						if(h.getActCode().equals("da04")) {
							db.setConEnd(h.getConnectTime());
//							System.out.println(dashBoard.getUserNo()+"퇴장: "+h.getConnectTime());
						}
					}
					if(db.getConStart() != null && db.getConEnd() !=null) {
					dashMapper.insertConTimeByRoom(db);
					}
				}
				
				
			}
			}
			//회의시간 담는 변수
			Long conTime = (long)0;
			List<DashBoard> dbList = dashMapper.selectConInfoByRoom(dashBoard);
//			System.out.println("con에서 가져온 데이터 수"+dbList.size());
			Date min = null;
			Date max = null;
			if(dbList.size() !=0) {
				for(DashBoard db : dbList) {
//					System.out.println("시작 : "+db.getConStart());
//					System.out.println("종료 : "+db.getConEnd());
					if(min == null ) {
						min = db.getConStart();
					}
					if(max == null) {
						max = db.getConEnd();
						conTime += max.getTime() - min.getTime();
//						System.out.println("회의시간"+conTime/60000+"분");
					}
					if(db.getConStart().getTime() < max.getTime()) {
						if(db.getConEnd().getTime() >= max.getTime()) {
							max = db.getConEnd();
						} 
					}
					if(db.getConStart().getTime() > max.getTime()) {
						//회의 시간 계산
						//최소값 변경, 최대값 null
						conTime += max.getTime() - min.getTime();
//						System.out.println("회의시간"+conTime/60000+"분");
						max = null;
					}
				}
			}
			
			
			String roomName = dashMapper.selectRoomName(r.getRoomNo());
//			System.out.println(roomName);
			conMap.put(roomName, conTime/60000);
		}
		dashMapper.dropConferenceTable(); 

		//회의방결과 맵 오름차순 정렬
		 MyComparator comp=new MyComparator(conMap);
	    Map<String,Long> newMap = new TreeMap(comp);
	    newMap.putAll(conMap);
	    List<String> roomNameList = new ArrayList<>();
	    List<Long> conferList = new ArrayList<>();
	    
	    for( String key : newMap.keySet() ){
//            System.out.println( String.format("키 : %s, 값 : %s", key, newMap.get(key)) );
            roomNameList.add(key);
            conferList.add(newMap.get(key));
        }
	    resultMap.put("roomNameList", roomNameList);
	    resultMap.put("conferList", conferList);
		return resultMap;
	}
	
 }




//맵 오름차순 정렬하는 클래스
class MyComparator implements Comparator {
	Map map;
	public MyComparator(Map map) {
	    this.map = map;
	}
	public int compare(Object o1, Object o2) {
	    return ((Long) map.get(o2)).compareTo((Long) map.get(o1));
	}
};



