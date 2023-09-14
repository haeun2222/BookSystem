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
	
	private static final Logger log = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private IUserDao dao;
	
	@Override
	public UserDto login(Map<String, Object> map) {
		log.info("UserServiceImpl login 로그인 : {}",map);
		return dao.login(map);
	}

	@Override
	public int nomalRegist(UserDto dto) {
		log.info("UserServiceImpl nomalRegist 일반회원가입 : {}",dto);
		return dao.nomalRegist(dto);
	}

	@Override
	public int checkEmail(String email) {
		log.info("UserServiceImpl checkEmail 이메일중복검사 : {}",email);
		return dao.checkEmail(email);
	}
	
}
