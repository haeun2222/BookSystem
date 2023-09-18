package com.dowon.bds.model.mapper;


import java.util.List;
import java.util.Map;

import com.dowon.bds.dto.UserDto;

public interface IUserDao {
	
	public UserDto login(Map<String, Object> map);
	public int nomalRegist(UserDto dto);
	public int checkEmail(String user_email);
	public List<UserDto> getAllUser();
}	
