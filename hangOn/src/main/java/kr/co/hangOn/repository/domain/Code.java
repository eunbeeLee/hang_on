package kr.co.hangOn.repository.domain;

import java.util.Date;

public class Code {
	private String fristCode;
	private int codeNo;
	private String codeName;
	private String codeInfo;
	private Date codeCreatedTime;
	private Date codeUpdateTime;
	public String getFristCode() {
		return fristCode;
	}
	public void setFristCode(String fristCode) {
		this.fristCode = fristCode;
	}
	public int getCodeNo() {
		return codeNo;
	}
	public void setCodeNo(int codeNo) {
		this.codeNo = codeNo;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getCodeInfo() {
		return codeInfo;
	}
	public void setCodeInfo(String codeInfo) {
		this.codeInfo = codeInfo;
	}
	public Date getCodeCreatedTime() {
		return codeCreatedTime;
	}
	public void setCodeCreatedTime(Date codeCreatedTime) {
		this.codeCreatedTime = codeCreatedTime;
	}
	public Date getCodeUpdateTime() {
		return codeUpdateTime;
	}
	public void setCodeUpdateTime(Date codeUpdateTime) {
		this.codeUpdateTime = codeUpdateTime;
	}
}
