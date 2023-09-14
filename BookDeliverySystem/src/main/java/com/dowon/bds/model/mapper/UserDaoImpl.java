package com.dowon.bds.model.mapper;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dowon.bds.dto.UserDto;

@Repository
public class UserDaoImpl implements IUserDao {
	
	private final String NS = "com.dowon.bds.model.mapper.UserDaoImpl.";

	@Autowired
	public SqlSessionTemplate sqlSession;
	
	
	@Override
	public UserDto login(Map<String, Object> map) {
		return sqlSession.selectOne(NS+"login",map);
	}


	@Override
	public int nomalRegist(UserDto dto) {
		return sqlSession.insert(NS+"nomalRegist",dto);
	}


	@Override
	public int checkEmail(String email) {
		return sqlSession.selectOne(NS+"checkEmail",email);
	}



}
