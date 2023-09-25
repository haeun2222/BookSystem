package com.dowon.bds;
/** 
 * @author 김지인
 * @since 2023.09.14
 * 배송지 입력관련 Controller
 * 
 * @author 김지인
 * @since 2023.09.18
 * 배송지 join으로 Controller 수정
 */

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dowon.bds.dto.AddrDto;
import com.dowon.bds.dto.UserDto;
import com.dowon.bds.model.service.IAddrService;


@Controller
public class AddrController {
	
	private static final Logger logger = LoggerFactory.getLogger(AddrController.class);
	
	@Autowired
	private IAddrService service;
	
	//book_seq때문에 addr 페이지로 돌아갈수 없음 23.09.18	
	@RequestMapping(value = "/addr.do", method = RequestMethod.GET)
	public String addr(Locale locale, Model model, AddrDto addrDto, @RequestParam("book_seq") int bookSeq, HttpSession session)  {
		logger.info("Welcome IAddrController! 주소입력 addr.do 실행");
		addrDto.setUser_seq(((UserDto)session.getAttribute("loginDto")).getUser_seq());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("bookSeq",bookSeq);
		
		return "addr";
	}
	

	@RequestMapping(value ="/addrCheck.do", method = RequestMethod.POST)
	public String addrCheck(AddrDto addrDto , HttpSession session, Model model, @RequestParam("book_seq") int bookSeq) {
		logger.info("Welcome! AddrController 주소입력{}", addrDto);
		addrDto.setUser_seq(((UserDto)session.getAttribute("loginDto")).getUser_seq());
		int n = service.saveAddress(addrDto);
		session.setAttribute("savedAddress", addrDto);
		
		model.addAttribute("bookSeq",bookSeq);
		
		return "addrCheck";
	}
	
	@RequestMapping(value = "/returnAddr.do", method = RequestMethod.GET)
	public String returnAddr(Locale locale, Model model, AddrDto addrDto, @RequestParam("book_seq") int bookSeq, HttpSession session)  {
		logger.info("Welcome IAddrController! 주소입력 returnAddr.do 실행");
		addrDto.setUser_seq(((UserDto)session.getAttribute("loginDto")).getUser_seq());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("bookSeq",bookSeq);
		
		return "returnAddr";
	}
	
	
	
	@RequestMapping(value ="/returnAddrCheck.do", method = RequestMethod.POST)
	public String returnAddrCheck(AddrDto addrDto , HttpSession session, Model model, @RequestParam("book_seq") int bookSeq) {
		logger.info("Welcome! AddrController 수거요청 입력 returnAddrCheck {}", addrDto);
		addrDto.setUser_seq(((UserDto)session.getAttribute("loginDto")).getUser_seq());
		int n = service.saveAddressReturn(addrDto);
		session.setAttribute("saveAddressReturn", addrDto);
		
		model.addAttribute("bookSeq",bookSeq);
		
		return "returnAddrCheck";
	
	}
	
	
	@RequestMapping(value = "/updateDeliveryNum.do", method = RequestMethod.GET)
	public String updateDeliveryNum(@RequestParam("user_seq") int user_seq, @RequestParam("delivery_num") int delivery_num, Model model, HttpSession session) {
		logger.info("Welcome! AddrController 수거요청 입력 returnAddrCheck");
		UserDto loginDto = (UserDto)session.getAttribute("loginDto");
		model.addAttribute("loginDto", loginDto);
		model.addAttribute("user_seq", user_seq);
		model.addAttribute("delivery_num",delivery_num);
		return "updateDeliveryNum";
	}
	
	@PostMapping("/updateDeliveryNum.do")
	@ResponseBody
	public ResponseEntity<String> updateDeliveryNum(@RequestParam("user_seq") int userSeq, @RequestParam("delivery_num") String deliveryNum) {
	    try {
	        // 운송장 번호를 사용하여 DB에서 해당 사용자의 delivery_num을 업데이트합니다.
	        Map<String, Object> map = new HashMap<>();
	        map.put("user_seq", userSeq);
	        map.put("delivery_num", deliveryNum);
	        service.updateDeliveryNum(map);
	        return ResponseEntity.ok("운송장 번호가 업데이트되었습니다.");
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("운송장 번호 업데이트 중 오류가 발생했습니다.");
	    }
	}

	

	
}
