package com.dowon.bds;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dowon.bds.dto.BookDto;
import com.dowon.bds.model.service.IBookService;

/**
 * 
 * @author 김영진
 * @since 2023-09-18 도서관리(등록,검색)을 위한 컨트롤러
 */

@Controller
public class BookController {
	
	private static final Logger log = LoggerFactory.getLogger(BookController.class);
	
	@Autowired
	public IBookService service;
	
	
	@RequestMapping(value="/getAllBooks.do", method = RequestMethod.GET)
	@ResponseBody
	public List<BookDto> getAllBooks() {
		log.info("getAllBooks 모든책정보 가져오기");
		List<BookDto> getAllBooks = service.getAllBook();
		return getAllBooks;
	}

}
