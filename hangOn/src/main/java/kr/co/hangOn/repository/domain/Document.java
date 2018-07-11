package kr.co.hangOn.repository.domain;

public class Document {
	private int docPageNo;
	private String docPath;
	private int docGroupNo;
	
	public int getDocPageNo() {
		return docPageNo;
	}
	public Document setDocPageNo(int docPageNo) {
		this.docPageNo = docPageNo;
		return this;
	}
	public String getDocPath() {
		return docPath;
	}
	public Document setDocPath(String docPath) {
		this.docPath = docPath;
		return this;
	}
	public int getDocGroupNo() {
		return docGroupNo;
	}
	public Document setDocGroupNo(int docGroupNo) {
		this.docGroupNo = docGroupNo;
		return this;
	}
}
