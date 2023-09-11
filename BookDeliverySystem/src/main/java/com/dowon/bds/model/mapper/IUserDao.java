package com.dowon.bds.model.mapper;


import java.util.Map;

import com.dowon.bds.dto.UserDto;

public interface IUserDao {
	
	public UserDto login(Map<String, Object> map);

}
