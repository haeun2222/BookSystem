package com.dowon.bds.model.mapper;

import java.util.List;

import com.dowon.bds.dto.BookDto;

public interface IBookDao {
	
	public List<BookDto> getAllBook();
	public BookDto detailBook(int seq);
	public int registBook(BookDto dto);
	public int checkIsbn(String isbn);
	public List<BookDto> searchBooks(String keyword);
	public int updateBook(String isbn, BookDto bookDto);

}

