package com.dowon.bds;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.support.SessionStatus;

import com.dowon.bds.dto.UserDto;
import com.dowon.bds.model.service.IUserService;

/**
 * 
 * @author 김영진
 * @since 2023-09-13 일반 회원 로그인 컨트롤러
 */

@Controller
public class UserController {
	
	private Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private IUserService service;
	
	@RequestMapping(value="/loginPage.do", method = RequestMethod.GET)
	public String loginPage() {
		return "loginPage";
	}
	
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public String login(@RequestParam Map<String,Object>map, HttpSession session, HttpServletResponse response) throws IOException {
		log.info("로그인 처리 login {}",map);
		UserDto loginDto = service.login(map);
		log.info("loginDto정보 {}",loginDto);
		
		if(loginDto == null) {
			log.info("로그인실패 /test.do로 이동 {}",map);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 실패'); location.href='history.back(-1)';</script>");
			out.flush();
			return "";
		
		}else{
			if(loginDto.getUser_auth().equals("U")) {
			log.info(loginDto.getUser_auth());
			log.info("유저 로그인성공  이동 {}",map);
			session.setAttribute("loginDto", loginDto);
			return "redirect:/index.jsp";
			}
			else {
			log.info("어드민 로그인성공 {}",map);
			session.setAttribute("loginDto", loginDto);
			return "adminPage";
			}
		}
		
	}
	
	@GetMapping(value="/logout.do")
	public String logout(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		log.info("로그아웃 실행");
	    // 세션 무효화
	    session.invalidate();

	    // 브라우저 캐시 제어
	    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	    response.setHeader("Pragma", "no-cache");
	    response.setHeader("Expires", "0");

	    return "redirect:/index.jsp"; // 로그인 페이지 또는 다른 페이지로 리다이렉트
	}
	
	
	@RequestMapping(value="/getAllUser.do",method = RequestMethod.GET)
	@ResponseBody
	public List<UserDto> getAlluser() {
		log.info("getAlluser 모든회원정보 가져오기");
		List<UserDto> getAllusers = service.getAllUser();
		return getAllusers;
	}

}
