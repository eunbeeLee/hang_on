package kr.co.hangOn.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangOn.repository.domain.User;
import kr.co.hangOn.repository.mapper.UserMapper;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper mapper;
	
	@Override
	public User login(String userEmail) throws Exception {
		return mapper.login(userEmail);
	}

	@Override
	public void stateCodeChangerLogin(String userEmail) {
		mapper.stateCodeChangerLogin(userEmail);
	}
	
	@Override
	public void stateCodeChangerLogout(String userEmail) {
		mapper.stateCodeChangerLogin(userEmail);
	}

	@Override
	public int emailCheck(String userEmail) {
		return mapper.emailCheck(userEmail);
	}

	@Override
	public void register(User user) {
		mapper.register(user);
	}

}
