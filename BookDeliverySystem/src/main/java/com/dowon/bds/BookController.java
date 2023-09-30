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

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 김영진
 * @since 2023-09-18 도서관리(등록,검색)을 위한 컨트롤러
 */

@Controller
@Slf4j
public class BookController {
	
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
		log.info("Welcome BookController detailBook 도서 상세페이지 컨트롤러");
		log.info("Welcome BookController detailBook book_seq확인 : {}",seq);
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
	public String registBook(@ModelAttribute BookDto dto, Model model) {
	    log.info("★★★★date 값 확인 : {}", dto.getBook_published_dateStr());

	    // 컨트롤러에서 클라이언트에서 받은 문자열을 Date로 변환하는 코드
	    try {
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        Date parsedDate = dateFormat.parse(dto.getBook_published_dateStr()); // 이 때, dto에서 book_published_dateStr 필드를 추가해주세요.
	        dto.setBook_published_date(parsedDate);
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }
	    
	    int n = service.registBook(dto);
	    if(n==1) {
	    	log.info("Welcome registBook 도서 등록 성공");
	    	model.addAttribute("result", "도서 등록 성공!");
	    }else {
	    	log.info("Welcome registBook 도서 등록 실패");
	    	model.addAttribute("result", "도서 등록 실패ㅜㅜ");
	    }
	    return "redirect:addBook.do";
	}
	
	@GetMapping(value="/searchBooks.do")
	public String searchBooks(@RequestParam String keyword, Model model){
		List<BookDto> lists = service.searchBooks(keyword);
		model.addAttribute("searchResults",lists);
		return "searchBooks";
	}
	
	@GetMapping(value="/updateBookForm.do")
	public String updateBookForm(@RequestParam("book_seq") int book_seq, Model model) {
		log.info("book_seq의 값 : {}",book_seq);
		BookDto bookInfo = service.detailBook(book_seq);
		model.addAttribute("updateBook",bookInfo);
		return "updateBook";
	}
}





