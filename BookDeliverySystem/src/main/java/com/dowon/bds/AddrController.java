package com.dowon.bds;
/** 
 * @author 김지인
 * @since 2023.09.14
 * 배송지 입력관련 Controller
 */

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
import org.springframework.web.bind.annotation.RequestParam;

import com.dowon.bds.dto.AddrDto;
import com.dowon.bds.dto.UserDto;
import com.dowon.bds.model.service.IAddrService;


@Controller
public class AddrController {
	
	private static final Logger logger = LoggerFactory.getLogger(AddrController.class);
	
	@Autowired
	private IAddrService service;
	
	@RequestMapping(value = "/addr.do", method = RequestMethod.GET)
	public String addr(Locale locale, Model model, @RequestParam("book_seq") int bookSeq) {
		logger.info("Welcome IAddrController! 주소입력 addr.do 실행");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("bookSeq",bookSeq);
		
		return "addr";
	}
	
	@RequestMapping(value ="/addr.do", method = RequestMethod.POST)
	public String addr(AddrDto addrDto , HttpSession session) {
		logger.info("Welcome! AddrController 주소입력{}", addrDto);
		addrDto.setUser_seq(((UserDto)session.getAttribute("loginVo")).getUser_seq());
		int n = service.saveAddress(addrDto);
		session.setAttribute("savedAddress", addrDto);
//		model.addAttribute("rentSeq",rentSeq);
//		return (n==1)?"redirect:/addrCheck.do":"redirect:/addr.do";
		//  @RequestParam("rent_seq") int rentSeq
		return "addrCheck";
	}
	
	
	
}
