package com.dowon.bds;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dowon.bds.dto.PayDto;
import com.dowon.bds.dto.UserDto;
import com.dowon.bds.model.service.IPaymentService;

@Controller
public class PayController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private IPaymentService paymentService;
//	@RequestMapping(value = "/payment.do", method = RequestMethod.GET)
//	public String payment(Locale locale, Model model) {
//		logger.info("Welcome! payment.do 실행");
//		logger.info("payment.jsp 이동");
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		String formattedDate = dateFormat.format(date);
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "payment";
//	}
	
	  @GetMapping("/payment.do")
	    public String payment(@RequestParam Map<String,Object>map, HttpSession session,Model model) {
	    	logger.info("Welcome! PayController payment 결제 실행을 위한 컨트롤러"); 
	    	UserDto loginVo = (UserDto) session.getAttribute("loginVo");
	    	model.addAttribute("loginVo",loginVo);
	    	return "payment";
	    }
	
    // 아임포트 결제 요청을 처리
    @PostMapping("/payment.do")
    public String payment(@RequestBody PayDto payDto, Map<String,Object>map, HttpSession session,Model model ) {
    	logger.info("payment 결제요청");
    	payDto.setUser_seq(0); // 나중에 로그인 정보로 대체 예정
    	paymentService.saveBookPayment(payDto); // 결제 정보를 처리하는 서비스 메서드 호출
    	UserDto loginVo = (UserDto) session.getAttribute("loginVo");
    	
    	model.addAttribute("loginVo", loginVo);
    	
    	return "userRentList";
}
	
	
	
}
