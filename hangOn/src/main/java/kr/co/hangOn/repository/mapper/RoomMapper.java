package kr.co.hangOn.repository.mapper;

import java.util.List;

import kr.co.hangOn.repository.domain.Room;
import kr.co.hangOn.repository.domain.RoomMember;

public interface RoomMapper {
	// 방에 입장시 정보 업데이트
	void updateRoomMember(RoomMember roomMember);	
	int roomByJoinCode(String roomNo);
	
	//관리자 페이지- 생성된 방 목록 선택
	List<Room> selectRoom(Room room);
	
	//방의 멤버 선택
	List<RoomMember> selectMemberByRoom(RoomMember roomMember);
	 
    //유저에 따른 방 갯수 조회
     int countRoomList(int userNo);
     
     //방 삭제코드 업데이트
     void updateRoomDelState(Room room);
     
 	//방 비밀번호 일치 여부 확인
 	public int checkRoomPass(Room room);
 	
 	//방정보 업데이트
 	public void updateRoomInfo(Room room);
 	
 	//방멤버 권한 정보 업데이트
 	public void updateRoomMemberAuth(Room room);
 	
 	//방정보 선택
 	public Room searchRoomInfo(int roomNo);
     
 	//회원 방 탈퇴
 	public void memberOut(RoomMember rm);
 	
 	// 방 이름 가져오기
 	public String selectRoomName(String roomJoinCode);
 	// 챗 소켓에서 유저접속시 상태정보 업데이트
 	public void updateRoomMemberConnect(RoomMember member);
}
	