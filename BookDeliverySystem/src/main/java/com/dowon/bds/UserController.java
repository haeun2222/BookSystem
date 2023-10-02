package com.dowon.bds;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@Autowired
    protected JavaMailSender gmailMailSender;
	
	
	@RequestMapping(value="/loginPage.do", method = RequestMethod.GET)
	public String loginPage() {
		return "loginPage";
	}
	
	
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public String login(@RequestParam Map<String,Object> map, HttpSession session, HttpServletResponse response, Model model) throws IOException {
	    log.info("로그인 처리 login {}", map);
	    UserDto loginDto = service.login(map);
	    log.info("loginDto정보 {}", loginDto);
	    
	    if (loginDto == null) {
	        log.info("로그인 실패 {}", map);
	        return "loginPage"; // 로그인 실패 시 로그인 페이지로 이동
	    }
	    
	    if (loginDto.getUser_auth().equals("U")) {
	        log.info(loginDto.getUser_auth());
	        Map<String, Object> userStatus = service.getUserStatus(loginDto.getUser_seq());
	        session.setAttribute("loginDto", loginDto);
	        session.setAttribute("userStatus",userStatus);
	        log.info("userStatus의 값 체크 : {}",userStatus); //삭제할것
	        return "redirect:/index.jsp";
	    } else {
	        log.info("어드민 로그인성공 {}", map);
	        session.setAttribute("loginDto", loginDto);
	        return "adminPage";
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
	
	@RequestMapping(value="/searchForm.do", method = RequestMethod.GET)
	public String searchID() {
		log.info("searchForm 사용자 : 회원정보 찾기");
		return "searchID";
	}
	
	@GetMapping(value="/moveAdminPage.do")
	public String moveAdmin(){
		return "adminPage";
	}
	
	@PostMapping(value = "/checkEmail.do")
	@ResponseBody
	public int checkEmail(@RequestParam String user_email) {
		log.info("UserController checkEmail 이메일 중복 검사");
		int n = service.checkEmail(user_email);
		
		if(n==1) {
			return 1;
		}else {
			return 0;
		}
	}
	
	@PostMapping(value = "/checkPhone.do")
	@ResponseBody
	public int checkPhone(@RequestParam String user_phone) {
		log.info("UserController checkPhone 번호 중복 검사");
		int n = service.checkPhone(user_phone);
		log.info("n의값 : {}",n);
		if(n==1) {
			return 1;
		}else {
			return 0;
		}
	}
	
	@PostMapping(value = "/findEmail.do")
	public String findEmail(@RequestParam("user_name") String userName, @RequestParam("formatted_phone") String userPhone, Model model) {
		log.info("UserController findEmail 이메일 찾기");
		Map<String, Object> map = new HashMap<>();
		map.put("user_name", userName);
		map.put("user_phone", userPhone);
		String email = service.findEmail(map);
		model.addAttribute("resultEmail",email);
		return "resultEmail";
	}
	
	@GetMapping(value="/moveSearchID.do")
	public String moveSearchID() {
		
		return "searchID";
	}
	
	@GetMapping(value="/moveSearchPW.do")
	public String moveSearchPW() {
			
		return "searchPW";
		}
	
	@PostMapping(value="/findPW.do")
	public String findPW(
						@RequestParam("user_email")String user_email,
						@RequestParam("formatted_phone")String user_phone,
						Model model
			) throws MessagingException {
		int leftLimit = 48; // 
	    int rightLimit = 122; //
	    int targetStringLength = 6;
		Random random = new Random();
		String newPW = random.ints(leftLimit, rightLimit + 1)
                .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
                .limit(targetStringLength)
                .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                .toString();
		
            MimeMessage mail = gmailMailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");
            mailHelper.setTo(user_email);    // 받는 사람 셋팅
            mailHelper.setSubject("비대면 도서 대출 시스템 임시비밀번호 발송");            // 제목 셋팅
            mailHelper.setText(
            					
            					"임시 비밀번호는 : "+newPW+"입니다"
            				);               // 내용 셋팅
 
            // 메일 전송
            gmailMailSender.send(mail);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("user_email", user_email);
            map.put("user_phone", user_phone);
            map.put("user_password", newPW);
            
            int n = service.findPW(map);
            
		
		if(n==1) {
			log.info("UserController findPW 임시비밀번호 발급완료");
			model.addAttribute("newPassword","임시비밀번호가 재발급 되었습니다. 메일을 확인해주세요.");
			return "redirect:/loginPage.do";
		}else {
			log.info("UserController findPW 임시비밀번호 발급실패");
			model.addAttribute("failPassword","임시비밀번호 재발급 실패.");
			return "redirect:/moveSearchPW.do";
		}
	}
	
	@GetMapping(value="/myPage.do")
	public String myPage() {
		
		return "myPage";
	}
	
}
