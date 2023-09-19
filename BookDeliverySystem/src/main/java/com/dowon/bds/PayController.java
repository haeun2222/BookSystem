package com.dowon.bds;

/** 
 * 
 * @author 김지인
 * @since 2023.09.18
 * 결제 관련 Controller
 * 
 */

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dowon.bds.dto.AddrDto;
import com.dowon.bds.dto.PayDto;
import com.dowon.bds.dto.UserDto;
import com.dowon.bds.model.service.IAddrService;
import com.dowon.bds.model.service.IPaymentService;
import com.dowon.bds.model.service.IRentService;
import com.dowon.bds.model.service.IResveService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PayController {

	
	@Autowired
	private IPaymentService paymentService;
	
	@Autowired
	private IAddrService addrService;
	
	@Autowired
	private IRentService rentService;
	
	@Autowired
	private IResveService resveService;

	
	  @GetMapping("/payment.do")
	    public String payment(@RequestParam Map<String,Object>map, HttpSession session,Model model, @RequestParam("book_seq") int bookSeq) {
	    	log.info("Welcome! PayController payment 결제 실행을 위한 컨트롤러"); 
	    	UserDto loginDto = (UserDto) session.getAttribute("loginDto");
	    	
	    	
	    	 // 여기서 유저의 배송지 정보를 가져옵니다.
	        if (loginDto != null) {
	            AddrDto addrDto = addrService.getAddrUserSeq(loginDto.getUser_seq());
	            model.addAttribute("loginDto", loginDto);
	            model.addAttribute("addrDto", addrDto); // 주소 정보를 Model에 추가
	            model.addAttribute("bookSeq",bookSeq);
	            return "payment";
	        } else {
	             return "redirect:/loginPage.do";
	        }
	    }
	    	

    // 아임포트 결제 요청을 처리
    @PostMapping("/payment.do")
    @ResponseBody
    public String payment(@RequestBody PayDto payDto, Map<String,Object>map, HttpSession session, Model model, @RequestParam("book_seq") int bookSeq) {
    	UserDto loginDto = (UserDto) session.getAttribute("loginDto"); 
    	AddrDto addrDto = (AddrDto) session.getAttribute("addrDto");
    	log.info("payment 결제요청");
        if (loginDto != null) {
            // 로그인 정보가 있을 때만 이름을 PayDto에 설정
            payDto.setUser_seq(loginDto.getUser_seq());
            paymentService.saveBookPayment(payDto); // 결제 정보를 처리하는 서비스 메서드 호출
            model.addAttribute("loginDto", loginDto);
            model.addAttribute("addrDto",addrDto);
            model.addAttribute("bookSeq",bookSeq);
            
            
            return "success";
        } else {
        	 return "failure";
        }
           
    }
    
    @GetMapping("/paymentList.do")
    public String paymentList(HttpSession session, Model model, HttpServletResponse response) {
    	log.info("Welcome PayController paymentList 회원의 결제내역 컨트롤러");
    	UserDto loginDto = (UserDto)session.getAttribute("loginDto");
    		if (loginDto != null) {
				int user_seq =loginDto.getUser_seq();
				List<Map<String, Object>> lists = paymentService.selectMypayList(user_seq);
				model.addAttribute("paymentList",lists);
				model.addAttribute("seq",user_seq);
				return "paymentList";
			}else {
				 return "redirect:/loginPage.do";
			}
	}
    
	/**
	 * 
	 * @author 박하은
	 * @since 2023.09.19
	 * 결제 승인시 대출 완료 처리 Controller / 대출 완료시 동일 도서 예약 대출대기->진행완료 처리 Controller
	 */
    // 대출 요청을 처리하는 컨트롤러 메서드
    @PostMapping("/rentBook.do")
    @ResponseBody
    public String rentBook(@RequestBody Map<String, Object> params, HttpSession session) {
    	log.info("Welcome PayController rentBook 대출요청 처리 AJAX Controller");
    	try {
        	int bookSeq = Integer.parseInt(params.get("book_seq").toString());
        	int userSeq = Integer.parseInt(params.get("user_seq").toString());
            
            int success = rentService.bookRent(params);
            
            if (success > 0) {
                return "success";
            } else {
                return "failure";
            }
        } catch (Exception e) {
            log.error("대출 요청 오류: " + e.getMessage(), e);
            return "failure";
        }
    }

    // 예약 대출대기 처리하는 컨트롤러 메서드
    @PostMapping("/reserveBook.do")
    @ResponseBody
    public String reserveBook(@RequestBody Map<String, Integer> data) {
    	log.info("Welcome PayController reserveBook 예약상태 대출대기->진행완료 처리 AJAX Controller");
        try {
        	int bookSeq = Integer.parseInt(data.get("book_seq").toString());
            // 예약 로직을 수행하고 성공 여부를 반환
            int success = resveService.resveAsRent(bookSeq);
            if (success > 0) {
                return "success";
            } else {
                return "failure";
            }
        } catch (Exception e) {
            log.error("예약 요청 오류: " + e.getMessage(), e);
            return "failure";
        }
    }

	
	
}
