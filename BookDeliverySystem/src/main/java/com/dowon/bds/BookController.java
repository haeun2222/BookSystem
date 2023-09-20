package com.dowon.bds;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dowon.bds.dto.BookDto;
import com.dowon.bds.dto.UserDto;
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
	
	//도서상세보기
	@RequestMapping(value="/getDetailBook.do", method = RequestMethod.GET)
	public String detailBook(@RequestParam("book_seq")int seq, Model model) {
		log.info("detailBook 도서 상세 보기");
		log.info("★★★★★★★seq? : {}",seq);
		BookDto dto = service.detailBook(seq);
		model.addAttribute("detailBook",dto);
		return "detailBook";
	}
	
	@RequestMapping(value="//registBook.do", method = RequestMethod.POST)
	public String regitstBook() {
		log.info("regitstBook 도서 등록하기");
		return "";
	}
	
	
	//하은 테스트버튼
	@GetMapping("/check.do")
	public String check(HttpSession session) {
		UserDto loginDto = (UserDto) session.getAttribute("loginDto");
		if(loginDto == null) {
			//얼럿창 jsp추가
				return "redirect:/loginPage.do";
		}else {
				return "redirect:/bookDetailHaeun.do";
		}
	}
}





