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

	@Override
	public BookDto detailBook(int seq) {
		return sqlSession.selectOne(NS+"getDetailBook",seq);
	}

	@Override
	public int registBook(BookDto dto) {
		return sqlSession.insert(NS+"registBook",dto);
	}

	@Override
	public int checkIsbn(String isbn) {
		return sqlSession.selectOne(NS+"checkIsbn",isbn);
	}

	@Override
	public List<BookDto> searchBooks(String keyword) {
		return sqlSession.selectList(NS+"searchBooks",keyword);
	}

	@Override
	public int updateBook(String isbn, BookDto bookDto) {
		return sqlSession.update(NS+"updateBook",isbn);
	}

}
