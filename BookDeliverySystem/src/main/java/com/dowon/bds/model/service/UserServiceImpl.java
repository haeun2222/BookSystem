package com.dowon.bds.model.service;


import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dowon.bds.dto.UserDto;
import com.dowon.bds.model.mapper.IUserDao;

@Service
public class UserServiceImpl implements IUserService {
	
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private IUserDao dao;
	
	@Override
	public UserDto login(Map<String, Object> map) {
		logger.info("login실행 {}",map);
		return dao.login(map);
	}
	
}
