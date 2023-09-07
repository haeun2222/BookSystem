package com.dowon.bds;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 
 * @author 박하은
 * 메인페이지 테스트 컨트롤러 입니다
 */

@Controller
public class HomeController {
	
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public String test(Model model) {
		model.addAttribute("test","test");
		return "test";
		
		
		//주석 지웠습니다11312321231123132312
	}

}
