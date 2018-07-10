package kr.co.hangOn.repository.mapper;

import kr.co.hangOn.repository.domain.User;

public interface UserMapper {
	User login(String userEmail);
}
