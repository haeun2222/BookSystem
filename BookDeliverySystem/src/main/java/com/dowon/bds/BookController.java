package com.dowon.bds;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
			session.setAttribute("loginDto", new UserDto(0, null, null, null, null, null, null, null, null, null));
			model.addAttribute("rentData", rentService.rentCheck(0));
		    model.addAttribute("resveData", resveService.userResveStatus(0));
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
	public String registbookForm(
			@RequestParam("book_title") String bookTitle,
			@RequestParam("book_writer") String bookWriter,
			@RequestParam("book_img") String bookImg,
			@RequestParam("book_isbn") String bookIsbn,
			@RequestParam("book_publisher") String bookPublisher,
			@RequestParam("book_intro") String bookIntro,
//			@RequestParam("book_book_published_date") Date bookPublishedDate,
			Model model) {
		
			String[] isbn = bookIsbn.split(" ");
			String realIsbn = isbn[isbn.length-1];
			
			BookDto dto = new BookDto();
			dto.setBook_title(bookTitle);
			dto.setBook_writer(bookWriter);
			dto.setBook_img(bookImg);
			dto.setBook_isbn(realIsbn);
			dto.setBook_publisher(bookPublisher);
			dto.setBook_intro(bookIntro);
//			dto.setBook_published_date(bookPublishedDate);
		log.info("registForm 실행");
		model.addAttribute("registBook",dto);
		return "registBook";
	}
	
	@PostMapping(value="/registBook.do")
	public String registBook(BookDto dto) {
		
		int n = service.registBook(dto);
		
		return (n == 1) ? "success" : "false";
	}
	
	

	
}





