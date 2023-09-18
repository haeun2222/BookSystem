package com.dowon.bds.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dowon.bds.dto.BookDto;
import com.dowon.bds.model.mapper.IBookDao;

@Service
public class BookServiceImpl implements IBookService {
	
	private static final Logger log = LoggerFactory.getLogger(BookServiceImpl.class);
	
	@Autowired
	public IBookDao dao;

	@Override
	public List<BookDto> getAllBook() {
		log.info("BookServiceImpl getAllBook 모든책리스트가져오기 : ");
		return dao.getAllBook();
	}

}
