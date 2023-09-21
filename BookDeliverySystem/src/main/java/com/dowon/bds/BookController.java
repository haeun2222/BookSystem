package com.dowon.bds;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dowon.bds.dto.BookDto;
import com.dowon.bds.dto.UserDto;
import com.dowon.bds.model.service.IBookService;
import com.dowon.bds.model.service.IRentService;
import com.dowon.bds.model.service.IResveService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

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
	
	//2023.09.18 박하은- 도서 상세페이지에서 대출/예약 기능을 위한 서비스 메소드 선언
	@Autowired
	private IRentService rentService;
	
	@Autowired
	private IResveService resveService;

	@RequestMapping(value="/getAllBooks.do", method = RequestMethod.GET)
	@ResponseBody
	public List<BookDto> getAllBooks() {
		log.info("관리자 getAllBooks 모든책정보 가져오기");
		List<BookDto> getAllBooks = service.getAllBook();
		return getAllBooks;
	}
	
	@GetMapping(value="/userBookList.do")
	public String userBookList(Model model){
		log.info("사용자 userBookList 모든책정보 가져오기");
		List<BookDto> userBookList = service.getAllBook();
		model.addAttribute("userBookList",userBookList);
		return "userBookList";
	}
	
	//도서상세보기
	/** 
	 * @author 박하은
	 * @since 2023.09.20
	 * 도서 상세페이지에 대출/예약관련 기능 메소드 추가
	 */
	@RequestMapping(value="/getDetailBook.do", method = RequestMethod.GET)
	public String detailBook(@RequestParam("book_seq")int seq, Model model, HttpSession session) {
		log.info("detailBook 도서 상세 보기");
		log.info("★★★★★★★seq? : {}",seq);
		BookDto dto = service.detailBook(seq);
		UserDto loginDto = (UserDto) session.getAttribute("loginDto");
		
		if (loginDto == null) {

		} else {
			int userSeq = loginDto.getUser_seq();
			
			List<Map<String, Object>> rentData = rentService.rentCheck(userSeq);
			List<Map<String, Object>> resveData = resveService.userResveStatus(userSeq);
			
			model.addAttribute("loginDto", loginDto);
			model.addAttribute("rentData", rentData);
			model.addAttribute("resveData", resveData);
		}
		List<String> filteredBookSeqList = rentService.selectFilteredBookSeqList();
		List<String> rentYBookSeqList = rentService.rentStatusYBookSeq();
		model.addAttribute("filteredBookSeqList", filteredBookSeqList);
		model.addAttribute("rentYBookSeqList", rentYBookSeqList);
		
		model.addAttribute("detailBook",dto);
		return "detailBook";
		
	}
	


	//도서등록컨트롤러(GET)
	@GetMapping(value="/registBook.do")
	public String registbookForm(@RequestParam("data")String jsonBookData, Model model) throws JsonMappingException, JsonProcessingException, ParseException {
			log.info("Welcome registbookForm를 통해 JSON으로 값 전달 받고 등록상세에 데이터 전달");
			log.info("jsonBookData: {}", jsonBookData); // 추가: JSON 데이터 확인
			ObjectMapper objectMapper = new ObjectMapper();
			BookDto	bookInfo = objectMapper.readValue(jsonBookData, BookDto.class);
			
			//ISBN 13자리만 가져오기
			String[] isbn = bookInfo.getBook_isbn().split(" ");
			String realIsbn = isbn[isbn.length-1];
			
			bookInfo.setBook_isbn(realIsbn);
			model.addAttribute("registBook",bookInfo);
		return "registBook";
	}
	
	@PostMapping(value = "/registbutton.do")
	public String registBook(@ModelAttribute BookDto dto) {
	    log.info("date 값 확인 : {}", dto.getBook_published_date());

	   

	    log.info("★★ 확인 : {}", dto.getBook_published_date().getClass().getTypeName());
	    int n = service.registBook(dto);

	    log.info("check : {}", n);
	    return (n == 1) ? "success" : "false";
	}
}





