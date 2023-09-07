package com.min.edu.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.dto.TestDto;

@Repository
public class IBoardDaoImpl implements IBoardDao {

	private static final Logger logger = LoggerFactory.getLogger(IBoardDaoImpl.class);
	private final String NS = "com.min.edu.dao.IBoardDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<TestDto> selectBoard() {
		logger.info("사용자 로거{}","selectBoard");
		return session.selectList(NS+"selectBoard");
	}

	@Override
	public int insertBoard(TestDto dto) {
		logger.info("사용자 로거{}","insertBoard",dto);
		return session.insert(NS+"insertBoard",dto);
	}
	
}
