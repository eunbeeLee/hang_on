package kr.co.hangOn.chat.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.co.hangOn.repository.domain.Chat;
import kr.co.hangOn.repository.domain.User;

@Component("chat")
public class ChatSocketHandle extends TextWebSocketHandler {

	// 접속한 사용자에 대한 정보를 담을 map
	private Map<String, List<Chat>> roomInfo = new HashMap<>();
	private SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private SimpleDateFormat alarmTime = new SimpleDateFormat("HH:mm");
	
	// 서버 열리면서
	public ChatSocketHandle () {
	}
	
	// 사용자 접속시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId()+ "웹소켓세션 아이디 님이 서버 접속");
	}
	
	// 사용자 종료시
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//		debug(session.getId() + " 연결 종료됨");
		
		Map<String, Object> userData =  session.getAttributes();
		User seUser = (User)userData.get("user");
		Set<String> keys = roomInfo.keySet();
		
		// 퇴장한 유저를 찾기
		Chat removeUser = null;
		String userIncludeKey = "";
		for (String key : keys) {
			List<Chat> users = (List<Chat>) roomInfo.get(key);
			for(Chat user : users) {
				
				if(user.getSessioninfo().getId().equals(session.getId())) {
					removeUser = user;
					userIncludeKey = key;
					continue;
				}
			}
			
		}
		
		// 같은 방 사용자에게 퇴장 메세지를 전송한다.
		// 단, 퇴장하는 유저는 제외한다.
		// 메세지 전송 후 퇴장 유저를 방 목록에서 제거한다.
		List<Chat> users = roomInfo.get(userIncludeKey);
		for(Chat user : users) {
			if (user == removeUser) continue;
			
			WebSocketSession wSession = user.getSessioninfo();
			wSession.sendMessage(new TextMessage("condition:"+seUser.getUserName()+"님이 퇴장하셨습니다. ("+alarmTime.format(new Date())+")"));
		}
		users.remove(removeUser);
	}

	// 데이터가 왔을 때, 대화중
	@Override
	public void handleTextMessage(WebSocketSession wss, TextMessage message) throws Exception {
		// 세션에 있는 접속 유저
		Map<String, Object> userData =  wss.getAttributes();
		User seUser = (User)userData.get("user");
		
		debug("보낸 아이디 세션 아이디 - " + wss.getId());
		debug("보낸 메세지 - " + message.getPayload());
		
		String rcvMsg = message.getPayload();
		String sendMsg = "";
		
		String[] arr = rcvMsg.split(":");
		// 접속시 : connect / 메세지를 보내왔을때 : send
		String condition = arr[0];
		// 방코드
		String joinCode = arr[1];
		// 접속한 유저의 번호
		int userNo = Integer.parseInt(arr[2]);
		// 접속한 유저의 이름
		String userName = arr[3];
		// 메세지
		String content = arr[4];
		
		// 사용자가 방에 접속했을때
		if(condition.equals("connect")) {
			if(!roomInfo.containsKey(joinCode)){
				List<Chat> users = new ArrayList<>();
				
				Chat user = new Chat();
				user.setUserNo(userNo);
				user.setSessioninfo(wss);
				
				users.add(user);

				roomInfo.put(joinCode, users);
			} else {
				Chat user = new Chat();
				user.setUserNo(userNo);
				user.setSessioninfo(wss);
				
				List<Chat> users = (List<Chat>)roomInfo.get(joinCode);
				users.add(user);
			}
			sendMsg = "condition:"+userName + content + " ( " + alarmTime.format(new Date()) + " )";
		}
		else if(condition.equals("sendMsg")) {
			// 내가 보낸 메세지인지 남이 보낸 메세지인지 확인 후 전송
			// 회원 번호로 내용을 보내서 jsp에서 비교
			sendMsg = userNo +":"+ userName + ":" + content + ":" + alarmTime.format(new Date());
		}
		
		System.out.println("방접속정보 : " + roomInfo);

		Set<String> keys = roomInfo.keySet();
		
		// 메세지가 전송된 방 찾기
		List<Chat> roomLiveUser = null;
		for (String key : keys) {
			if(key.equals(joinCode)) {
				roomLiveUser = roomInfo.get(key);
			}
		}
		// 메세지가 전송된 방에만 메세지 뿌리기
		for(Chat user : roomLiveUser) {
			WebSocketSession wSession = user.getSessioninfo();
			wSession.sendMessage(new TextMessage(sendMsg));
		}
	}
	
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		debug(session.getId() + " 익셉션 발생 - " + exception.getMessage());
	}
	
	private void debug(String msg) {
		System.out.printf(this.getClass().getSimpleName() + "(%s) : %s\n", time.format(new Date()), msg);
	}


}
