package com.dowon.bds.model.service;

import java.util.List;
import java.util.Map;

import com.dowon.bds.dto.BookDto;


public interface IBookService {
	
	public List<BookDto> getAllBook();
	public BookDto detailBook(int seq);
	public int registBook(BookDto dto);
	public List<BookDto> searchBooks(String keyword);
	public int updateBook(Map<String, Object>map);
}
