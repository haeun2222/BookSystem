package com.dowon.bds;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dowon.bds.dto.AddrDto;
import com.dowon.bds.dto.UserDto;
import com.dowon.bds.model.service.IAddrService;


@Controller
public class AddrController {
	
	private static final Logger logger = LoggerFactory.getLogger(AddrController.class);
	
	@Autowired
	private IAddrService service;
	
	@RequestMapping(value = "/addr.do", method = RequestMethod.GET)
	public String addr(Locale locale, Model model) {
		logger.info("Welcome IAddrController! 주소입력 addr.do 실행");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		return "addr";
	}
	
	@RequestMapping(value ="/addr.do", method = RequestMethod.POST)
	public String addr(AddrDto addrDto , HttpSession session, Model model) {
		logger.info("Welcome! AddrController 주소입력{}", addrDto);
//		UserDto loginVo = (UserDto) session.getAttribute("loginVo");
		addrDto.setUser_seq(((UserDto)session.getAttribute("loginVo")).getUser_seq());
		int n = service.saveAddress(addrDto);
		session.setAttribute("savedAddress", addrDto);
		return (n==1)?"redirect:/addrCheck.do":"redirect:/addr.do";
//		return "addrCheck";
	}
	
	
	
}
