package com.dowon.bds;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * 
 * @author 김영진
 * @since 2023-09-13 일반회원가입 / 소셜회원가입 컨트롤러
 */

@Controller
public class RegistController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//일반회원가입 폼 이동
	@RequestMapping(value="/nomalRegistForm.do", method = RequestMethod.GET)
	public String nomalRegistForm() {
		logger.info("RegistController >> 일반회원가입폼 이동 ");
		return "nomalRegistForm";
	}
	
	//일반회원가입 처리 컨트롤러
	@RequestMapping(value="/nomalRegist.do", method = RequestMethod.POST)
	public String nomalRegist(){
		logger.info("nomalRegistForm >> nomalRegist ");
		
		return null;
	}
	
	
	//소셜회원가입 컨트롤러
	@RequestMapping(value="/socialRegistForm.do", method = RequestMethod.GET)
	public String socialRegistForm() {
		logger.info("RegistController >> 소셜회원가입 이동 ");
		return "socialRegistForm";
	}
}
