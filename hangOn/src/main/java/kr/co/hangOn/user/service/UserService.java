package kr.co.hangOn.user.service;

import kr.co.hangOn.repository.domain.User;

public interface UserService {
	public User login(String userEmail) throws Exception;
	public int emailCheck(String userEmail) throws Exception;
	public void stateCodeChangerLogin(String userEmail) throws Exception;
	public void stateCodeChangerLogout(String userEmail) throws Exception;
	public void register(User user) throws Exception;
}
