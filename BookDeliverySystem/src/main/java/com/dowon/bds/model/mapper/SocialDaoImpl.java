package com.dowon.bds.model.mapper;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dowon.bds.dto.UserDto;

@Repository
public class SocialDaoImpl implements ISocialDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String NS = "com.dowon.bds.model.mapper.SocialDaoImpl.";
	
	@Override
	public int checkNaverKey(UserDto dto) {
		return sqlSession.selectOne(NS+"checkNaverKey",dto);
	}
	
	

}
