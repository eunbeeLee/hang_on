package kr.co.hangOn.user.service;

import kr.co.hangOn.repository.domain.User;

public interface UserService {
	public User login(String userEmail) throws Exception;
	public void stateCodeChanger(String userEmail) throws Exception;
}
