package com.dowon.bds;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dowon.bds.dto.UserDto;
import com.dowon.bds.model.service.IUserService;

@Controller
public class UserController {
	
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private IUserService service;
	
	@RequestMapping(value="/loginPage.do", method = RequestMethod.GET)
	public String loginPage() {
		return "loginPage";
	}
	
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public String login(@RequestParam Map<String,Object>map, HttpSession session, HttpServletResponse response) throws IOException {
		logger.info("로그인 처리 login {}",map);
		UserDto loginVo = service.login(map);
		
		if(loginVo == null) {
			logger.info("로그인실패 /test.do로 이동 {}",map);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 실패'); location.href='test.do';</script>");
			out.flush();
			return "";
		}else {
			logger.info("로그인성공 /mainTest.do로 이동 {}",map);
			session.setAttribute("loginVo", loginVo);
			return "mainTest";
		}
		
	}

}
