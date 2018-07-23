package kr.co.hangOn.alter.service;

import javax.servlet.http.HttpServletRequest;

import kr.co.hangOn.repository.domain.User;

public interface AlterService {
	public void updateInfo(User user);
	public String updateProfile(User user,HttpServletRequest request) throws Exception;
}
