package com.dowon.bds.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.dowon.bds.dto.UserDto;

public interface IUserService {
	
	public UserDto login(Map<String, Object> map);
	public int nomalRegist(UserDto dto);
	public int checkEmail(String email);
	public List<UserDto> getAllUser();
	public Map<String, Object> getUserStatus(int user_seq);
}
