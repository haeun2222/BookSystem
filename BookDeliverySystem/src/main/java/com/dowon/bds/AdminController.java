package com.dowon.bds;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dowon.bds.dto.BookDto;
import com.dowon.bds.dto.UserDto;
import com.dowon.bds.model.service.IBookService;
import com.dowon.bds.model.service.IUserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IBookService bookService;
	
//	어드민페이지 이동흐름에 관련된 컨트롤러들
	
	@GetMapping(value="/userList.do")
	public String userList(Model model){
		log.info("Welcome userList로 이동");
		List<UserDto> lists = userService.getAllUser();
		model.addAttribute("getAllUsers",lists);
		return "userList";
	}
	
	@GetMapping(value="/bookMagagement.do")
	public String bookList(Model model) {
		log.info("Welcome bookList로 이동");
		List<BookDto> bookLists = bookService.getAllBook();
		model.addAttribute("getAllBooks",bookLists);
		return "bookManagement";
	}
	
	@GetMapping(value="/addBook.do")
	public String addBook() {
		log.info("Welcome addBook으로 이동");
		return "addBook";
	}
	

}
