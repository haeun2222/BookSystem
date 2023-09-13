package com.dowon.bds.model.mapper;

import com.dowon.bds.dto.UserDto;

public interface ISocialDao {
	
	public int checkEmail(UserDto dto);

}
