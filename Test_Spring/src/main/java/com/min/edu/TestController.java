package com.min.edu;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {

	private Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@RequestMapping(value = "/home.do",method = RequestMethod.GET)
	public String home(String name,HttpServletRequest req, Model model) {
		logger.info("전달받은 param", name);
		
		String redirectValue = (String)req.getAttribute("name");
		String str = "가장 좋아하는 과일은?"+name;
		model.addAttribute("str", str);
		return "home";
	}
	
	@RequestMapping(value = "/home.do", method = RequestMethod.POST)
	public String home2(String name,Model model) {
		logger.info("Post방식으로 요청받은 값 {}:",name);
		String str = "두번째로 좋아하는 돼지"+name;
		model.addAttribute("str",str);
		return "home";
	}
	
	@RequestMapping(value = "/info.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String info(String name,int age, Model model) {
		logger.info("info.do로 모두 처리");
		String msg = name+"/"+age;
		model.addAttribute("info",msg);
		return "info";
	}
	
	@RequestMapping(value = "/redirect.do", method = RequestMethod.GET)
	public String redirect(String name, Model model) {
		logger.info("redirect 요청받은 값:"+name);
		model.addAttribute("name",name);
		return "redirect:/home.do?name=redirect";
	}
}
