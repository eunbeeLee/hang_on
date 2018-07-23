package kr.co.hangOn.repository.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class DocumentGroup {
	private int docGroupNo;
	private String docOriPath;
	private String docOriName;
	private String docImgPath;
	private int roomNo;
	private int userNo;
	private MultipartFile file;
	private List<Document> document;
	
	public int getDocGroupNo() {
		return docGroupNo;
	}
	public DocumentGroup setDocGroupNo(int docGroupNo) {
		this.docGroupNo = docGroupNo;
		return this;
	}
	public String getDocOriPath() {
		return docOriPath;
	}
	public DocumentGroup setDocOriPath(String docOriPath) {
		this.docOriPath = docOriPath;
		return this;
	}
	public String getDocOriName() {
		return docOriName;
	}
	public DocumentGroup setDocOriName(String docOriName) {
		this.docOriName = docOriName;
		return this;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public DocumentGroup setRoomNo(int roomNo) {
		this.roomNo = roomNo;
		return this;
	}
	public MultipartFile getFile() {
		return file;
	}
	public DocumentGroup setFile(MultipartFile file) {
		this.file = file;
		return this;
	}
	public String getDocImgPath() {
		return docImgPath;
	}
	public DocumentGroup setDocImgPath(String docImgPath) {
		this.docImgPath = docImgPath;
		return this;
	}
	public List<Document> getDocument() {
		return document;
	}
	public DocumentGroup setDocument(List<Document> document) {
		this.document = document;
		return this;
	}
	public int getUserNo() {
		return userNo;
	}
	public DocumentGroup setUserNo(int userNo) {
		this.userNo = userNo;
		return this;
	}
	
}
