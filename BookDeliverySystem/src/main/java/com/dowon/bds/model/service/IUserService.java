package com.dowon.bds.model.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.dowon.bds.dto.UserDto;

public interface IUserService {
	
	public UserDto login(Map<String, Object> map);
	public int nomalRegist(UserDto dto);

}
