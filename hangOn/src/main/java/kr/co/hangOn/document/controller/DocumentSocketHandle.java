package kr.co.hangOn.document.controller;



import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import kr.co.hangOn.repository.domain.DocumentSocket;



@Component("docview")
public class DocumentSocketHandle extends TextWebSocketHandler {
	private Map<String,List<String>> roomInfo = new HashMap<>();
	private Map<String,String> pdfInfo = new HashMap<>();
	private Map<String,Integer> pageInfo = new HashMap<>();
	private Map<String,String> docView = new HashMap<>();
	private List<String> docInfo = new ArrayList<>();
	private Map<Integer,DocumentSocket> socketInfo = new HashMap<>();
	
	public DocumentSocketHandle () {}

	public void conn(WebSocketSession wss, String data) throws Exception {
		String[] arr = data.split(";");
		int userNo = Integer.parseInt(arr[0]);
		socketInfo.put(userNo,new DocumentSocket().setCode(arr[1]).setSessioninfo(wss));
		DocumentSocket ds = socketInfo.get(userNo);
		wss.sendMessage(new TextMessage("conn::"+pdfInfo.get(arr[1])));
		wss.sendMessage(new TextMessage("docView::"+docView.get(arr[1])));
	}
	
	public void pdfLoad(String data) throws Exception {
		String arr[] = data.split(";");
		pdfInfo.put(arr[1], arr[2]);
		Set<Integer> keys = socketInfo.keySet();
		for(int key : keys) {
			DocumentSocket ds = socketInfo.get(key);
			if(ds.getCode().equals(arr[1])) {
				pageInfo.put(arr[1], 1);
				ds.getSessioninfo().sendMessage(new TextMessage("load::"+arr[2]));
			}
		}
	}
	
	public void start(String data) throws Exception {
		Set<Integer> keys = socketInfo.keySet();
		for(int key : keys) {
			DocumentSocket ds = socketInfo.get(key);
			if(ds.getCode().equals(data)) ds.getSessioninfo().sendMessage(new TextMessage("start"));
		}
	}
	
	public void canvas(String data) throws Exception {
		
	}
	
	public void pageMove(String data) throws Exception {
		String arr[] = data.split(";");
		String result = "";
		switch (arr[0]) {
		case "list": result = "list;"; break;
		case "keyup": result = "keyup;"; break;
		case "btn": result = "btn;"; break;
		}
		Set<Integer> keys = socketInfo.keySet();
		for(int key : keys) {
			DocumentSocket ds = socketInfo.get(key);
			if(ds.getCode().equals(arr[1]))ds.getSessioninfo().sendMessage(new TextMessage("pageMove::"+result+arr[2]));
		}
	}
	
	public void viewPage(WebSocketSession wss, String data) throws Exception {
		String arr[] = data.split(";");
		if(arr[0].equals("set")) {
			if(pageInfo.get(arr[1]) ==  Integer.parseInt(arr[2])) return;
			pageInfo.put(arr[1],Integer.parseInt(arr[2]));
			return;
		}
		wss.sendMessage(new TextMessage("viewPage::"+pageInfo.get(arr[1])));
	}
	
	public void docView(String data) throws Exception {
		String arr[] = data.split(";");
		docView.put(arr[0], arr[1]);
		Set<Integer> keys = socketInfo.keySet();
		for(int key : keys) {
			DocumentSocket ds = socketInfo.get(key);
			if(ds.getCode().equals(arr[0]))ds.getSessioninfo().sendMessage(new TextMessage("docView::"+arr[1]));
		}
	}
	
	@Override
	public void handleTextMessage(WebSocketSession wss, TextMessage message) throws Exception {
		String arr[] = message.getPayload().split("::");
		switch (arr[0]) {
		case "conn": conn(wss,arr[1]); break;
		case "start": start(arr[1]); break;
		case "pdfLoad": pdfLoad(arr[1]); break;
		case "canvas": canvas(arr[1]); break;
		case "pageMove": pageMove(arr[1]); break;
		case "viewPage": viewPage(wss,arr[1]); break;
		case "docView": docView(arr[1]); break;
		}
	}
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Set<Integer> keys = socketInfo.keySet();
		for(int key : keys) {
			DocumentSocket ds = socketInfo.get(key);
			if(ds.getSessioninfo().getId().equals(session.getId())) {
				socketInfo.remove(key);
				return;
			}
		}
	}


}
