package com.dowon.bds.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dowon.bds.dto.UserDto;
import com.dowon.bds.model.mapper.ISocialDao;

@Service
public class SocialServiceImpl implements ISocialService {

	
	@Autowired
	private ISocialDao dao;

	@Override
	public int checkEmail(UserDto dto) {
		return dao.checkEmail(dto);
	}

}
