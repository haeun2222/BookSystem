package com.dowon.bds.model.service;


import java.util.List;
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
	public int checkEmail(String user_email) {
		log.info("UserServiceImpl checkEmail 이메일중복검사 : {}",user_email);
		return dao.checkEmail(user_email);
	}

	@Override
	public List<UserDto> getAllUser() {
		log.info("UserServiceImpl getAllUser 모든회원리스트 : {}");
		return dao.getAllUser();
	}

	@Override
	public Map<String, Object> getUserStatus(int user_seq) {
		log.info("UserServiceImpl userStatus 유저의 대출,예약상태 확인 : {}",user_seq);
		return dao.getUserStatus(user_seq);
	}

	@Override
	public String findEmail(Map<String, Object> map) {
		log.info("UserServiceImpl findEmail 이메일찾기 : {}",map);
		return dao.findEmail(map);
	}

	@Override
	public int checkPhone(String user_phone) {
		log.info("UserServiceImpl checkPhone 전화번호검사 : {}",user_phone);
		return dao.checkPhone(user_phone);
	}

	@Override
	public int findPW(Map<String, Object> map) {
		log.info("UserServiceImpl findPW 임시비밀번호 발급 : {}",map);
		return dao.findPW(map);
	}

	@Override
	public int findPwCheck(UserDto dto) {
		log.info("UserServiceImpl findPW 임시비밀번호 유효성 체크 : {}",dto);
		return dao.findPwCheck(dto);
	}
	
}
