package kr.co.hangOn.user.service;

import kr.co.hangOn.repository.domain.User;

public interface UserService {
	public User login(String userEmail) throws Exception;
	public int emailCheck(String userEmail);
	public void stateCodeChangerLogin(String userEmail);
	public void stateCodeChangerLogout(String userEmail);
	public void register(User user);
}
