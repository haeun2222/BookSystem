package com.dowon.bds.model.service;

import com.dowon.bds.dto.UserDto;

public interface ISocialService {
	
	public int checkNaverKey(UserDto dto);
	public int socialRegist(UserDto dto);
}
