package com.dowon.bds;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dowon.bds.dto.UserDto;
import com.dowon.bds.model.service.IResveService;

import lombok.extern.slf4j.Slf4j;


/** 
 * @author 박하은
 * @since 2023.09.13
 * 도서 예약관련 Controller
 */
@Controller
@Slf4j
public class ResveController {

	@Autowired
	private IResveService service;

	
	@GetMapping("/userResveList.do")
	public String userResveList(@RequestParam("user_seq")int user_seq, Model model, HttpSession session){
		log.info("ResveController userResveList 회원의 마이페이지-예약조회 부분에 들어갈 페이지 컨트롤러");
		UserDto loginVo = (UserDto) session.getAttribute("loginVo");
		List<Map<String, Object>> lists = service.selectStep(user_seq);
		model.addAttribute("lists",lists);
		model.addAttribute("loginVo",loginVo);
		return "userResveList";
	}
}
