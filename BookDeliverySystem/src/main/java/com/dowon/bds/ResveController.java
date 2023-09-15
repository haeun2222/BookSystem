package com.dowon.bds;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dowon.bds.dto.ResveDto;
import com.dowon.bds.dto.UserDto;
import com.dowon.bds.model.service.IResveService;

import lombok.extern.slf4j.Slf4j;


/** 
 * @author 박하은
 * @since 2023.09.13
 * 도서 예약관련 Controller
 */
@Controller
@Slf4j
public class ResveController {

	@Autowired
	private IResveService service;

	
	@GetMapping("/userResveList.do")
	public String userResveList(@RequestParam("user_seq")int user_seq, Model model, HttpSession session){
		log.info("ResveController userResveList 회원의 마이페이지-예약조회 부분에 들어갈 페이지 컨트롤러");
		UserDto loginVo = (UserDto) session.getAttribute("loginVo");
		List<ResveDto> lists = service.selectStep(user_seq);
		model.addAttribute("lists",lists);
		model.addAttribute("loginVo",loginVo);
		return "userResveList";
	}
	
	
    @PostMapping("/resveBook.do")
    public ResponseEntity<String> resveBook(@RequestBody Map<String, Object> request) {
        try {
            int bookSeq = (int) request.get("book_seq");
            int userSeq = (int) request.get("user_seq");

            int result = service.resveBook(request);

            if (result > 0) {
                return ResponseEntity.ok("예약 신청이 완료되었습니다.");
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                        .body("예약 신청에 실패했습니다. 다시 시도해주세요.");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("예약 신청에 실패했습니다. 다시 시도해주세요.");
        }
    }
    
    
    
    
    
	@PostMapping("/cancelAndStepUpdate.do")
	@ResponseBody
	public String cancelAndStepUpdate(@RequestBody Map<String, Object> requestData) {
	    int resveSeq = (int) requestData.get("resveSeq");
	    int userSeq = (int) requestData.get("userSeq");
	    boolean success = service.cancelAndStepUpdate(resveSeq, userSeq);
	    
	    if (success) {
	        return "success";
	    } else {
	        return "failure";
	    }
	}
	
	
	
	@PostMapping("/updateStep.do")
	@ResponseBody
	public String updateStep(@RequestBody Map<String, Object> params) {
	    boolean updateSuccess = service.updateStep(params);
	    if (updateSuccess) {
	        return "success";
	    } else {
	        return "failure";
	    }
	}

    
    

}
