package com.dowon.bds;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dowon.bds.dto.FreeCommentDto;
import com.dowon.bds.dto.UserDto;
import com.dowon.bds.model.service.IFreeCommentService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FreeCommentController {

	@Autowired
	private IFreeCommentService service;
	
	@RequestMapping(value = "/CommentInsert.do", method = RequestMethod.POST)
	public String Comment(@RequestParam("free_bseq")int free_bseq,HttpSession session, FreeCommentDto fDto,HttpServletResponse resp) throws IOException{
		log.info("FreeCommentController Comment 답글작성");
		UserDto loginDto = (UserDto)session.getAttribute("loginDto");
		fDto.setUser_seq(loginDto.getUser_seq());
		int n = service.CommentInsert(fDto);
		if(loginDto != null && n == 1) {
			return "redirect:/freeBoardDetail.do?free_bseq=" + free_bseq;
		}
		return null;
	}
//	@RequestMapping(value = "/CommentList.do", method = RequestMethod.GET)
//	public String CommentList(@RequestParam("free_bseq")int free_bseq, Model model) {
//		List<FreeCommentDto> CommentList = service.CommentAllList(free_bseq);
//		log.info("FreeCommentController CommentList 답글리스트 조회{}",CommentList);
//		model.addAttribute("CommentAll", CommentList);
//		return "freeBoardDetail";
//	}
//	
}
