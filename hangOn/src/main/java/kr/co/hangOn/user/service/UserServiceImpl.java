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

}
