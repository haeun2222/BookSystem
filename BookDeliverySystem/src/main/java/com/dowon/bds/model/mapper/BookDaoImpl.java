package com.dowon.bds.model.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dowon.bds.dto.BookDto;

@Repository
public class BookDaoImpl implements IBookDao {
	
	private final String NS = "com.dowon.bds.model.mapper.BookDaoImpl.";
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	
	@Override
	public List<BookDto> getAllBook() {
		return sqlSession.selectList(NS+"getAllBooks");
	}

}
