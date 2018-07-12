package kr.co.hangOn.repository.mapper;

import java.util.List;

import kr.co.hangOn.repository.domain.Room;
import kr.co.hangOn.repository.domain.RoomMember;

public interface LobbyMapper {
	// 방 생성
	void insertRoom(Room room);
	// 방 찾기
	Room findRoom(Room room);
	// 난수 중복 검사
	int selectJoinCodeByRandomNum(String randomNum);
	// 방 멤버 생성 - 방생성시
	void insertNewRoomMember(RoomMember member);
	// 방 멤버 생성 - 방찾을시
	void insertFindRoomMember(RoomMember member);
	// 방 찾고 중복 사람 검색
	int selectFindUserCount(RoomMember member);
	// 로비에서 룸리스트 불러오기
	List<Room> selectLobbyList(int userNo);
	// 방 참여인수가 6명이하 인지 확인 
	int selectRoomCount(int roomNo);
	// 방에 접속중인 유저 수
	int selectRoomConnectCnt(int roomNo);
	// 방에 접속 안한 유저 수
	int selectRoomNoConnectCnt(int roomNo);
	// 방 탈퇴
	void updateUserRoomLeave(RoomMember member);
	// 탈퇴한 회원이 방에 재가입
	void updateUserRoomRegist(RoomMember member);
	// 그방에 탈퇴한 회원인지 아닌지 확인
	int selectUserLeaveCount(RoomMember member);
}
