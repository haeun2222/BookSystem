package com.dowon.bds;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dowon.bds.dto.BookDto;
import com.dowon.bds.dto.UserDto;
import com.dowon.bds.model.service.IRentService;
import com.dowon.bds.model.service.IResveService;

import lombok.extern.slf4j.Slf4j;


/** 
 * @author 박하은
 * @since 2023.09.13
 * 도서 대출관련 Controller
 */
@Controller
@Slf4j
public class RentController {

	
	@Autowired
	private IRentService service;
	
	@Autowired
	private IResveService service2;

	@GetMapping("/bookListHaeun.do")
	public String bookListHaeun(@RequestParam Map<String,Object>map, HttpSession session,Model model) {
		log.info("RentController bookListHaeun 테스트를 위한 도서 전체목록 페이지 컨트롤러");
		UserDto loginVo = (UserDto) session.getAttribute("loginVo");
		List<BookDto> lists = service.bookAll();
		
		model.addAttribute("loginVo",loginVo);
		model.addAttribute("books",lists);
		
		return "bookListHaeun";
	}
	
	@GetMapping("/userRentList.do")
	public String userRentList(HttpSession session, Model model, HttpServletResponse response) {
		log.info("RentController userRentList 회원의 마이페이지-대출도서목록에 들어갈 페이지 컨트롤러");
		UserDto loginVo = (UserDto) session.getAttribute("loginVo");
	    if (loginVo != null) {
	        int user_seq = loginVo.getUser_seq();
	        List<Map<String, Object>> lists = service.selectMyBookRent(user_seq);
	        model.addAttribute("userRentList", lists);
	        model.addAttribute("seq", user_seq);
	        return "userRentList";
	    } else {
	        return "redirect:/loginPage.do";
	    }
	}

	
	@GetMapping("/adminRentList.do")
	public String adminRentList(Model model) {
		log.info("RentController adminRentList 관리자페이지-회원도서대출목록 에 들어갈 페이지 컨트롤러");
		List<Map<String, Object>> lists = service.selectAdminRent();
		model.addAttribute("lists",lists);
		return "adminRentList";
	}
	
	
	
	 @PostMapping("/confirmReturn.do")
	 @ResponseBody
	 public String confirmReturn(@RequestParam("rentSeq") int rentSeq, Model model) {
	     log.info("RentController RentController 관리자의 도서대출 반납처리를 위한 Ajax 컨트롤러"); 
		 try {
	         int rowsAffected = service.rentStatus(rentSeq);
	            
	         if (rowsAffected > 0) {
	              return "success";
	         }else {
	            return "error";
	           }
	        }catch (Exception e) {
	            e.printStackTrace();
	            return "error";
	        }
	    }
	
	
	@GetMapping("/bookDetailHaeun.do")
	public String bookDetail(@RequestParam("seq") int bookSeq, Model model, HttpSession session) {
		log.info("RentController bookDetail 도서 상세화면 테스트를 위한 페이지 컨트롤러");
		System.out.println("bookSeq: " + bookSeq); 
		
		UserDto loginVo = (UserDto) session.getAttribute("loginVo");
		int userSeq = loginVo.getUser_seq();
	    
		BookDto dto = service.bookDetail(bookSeq);
	    List<String> filteredBookSeqList = service.selectFilteredBookSeqList();
	    List<Map<String, Object>> rentData = service.rentCheck(userSeq);
	    List<Map<String, Object>> resveData = service2.userResveStatus(userSeq);
	    
	    model.addAttribute("resveData",resveData);
	    model.addAttribute("rentData", rentData);
	    model.addAttribute("loginVo",loginVo);
	    model.addAttribute("dto", dto);
        model.addAttribute("filteredBookSeqList", filteredBookSeqList);
        
        System.out.println("@@@@@@@@@@@@@"+filteredBookSeqList);
        
        return "bookDetailHaeun";
	}
	

}
