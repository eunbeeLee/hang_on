package kr.co.hangOn.repository.domain;

import org.springframework.web.multipart.MultipartFile;

public class User {
	private int userNo;
	private String userName;
	private String userEmail;
	private String userPw;
	private String userStateCode;
	private String userExistCode;
	private String userAuthCode;
	private String userProfilePath;
	private MultipartFile file;
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserStateCode() {
		return userStateCode;
	}
	public void setUserStateCode(String userStateCode) {
		this.userStateCode = userStateCode;
	}
	public String getUserExistCode() {
		return userExistCode;
	}
	public void setUserExistCode(String userExistCode) {
		this.userExistCode = userExistCode;
	}
	public String getUserAuthCode() {
		return userAuthCode;
	}
	public void setUserAuthCode(String userAuthCode) {
		this.userAuthCode = userAuthCode;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserProfilePath() {
		return userProfilePath;
	}
	public void setUserProfilePath(String userProfilePath) {
		this.userProfilePath = userProfilePath;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
}
