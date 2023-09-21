package com.dowon.bds;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dowon.bds.dto.FreeBoardDto;
import com.dowon.bds.dto.FreeCommentDto;
import com.dowon.bds.dto.UserDto;
import com.dowon.bds.model.service.IFreeBoardService;
import com.dowon.bds.model.service.IFreeCommentService;
import com.dowon.bds.model.service.IUserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FreeBoardController {

	@Autowired
	private IFreeBoardService service;
	@Autowired
	private IFreeCommentService service2;

	@RequestMapping(value = "/home.do",method = RequestMethod.GET)
	public String home() {
		log.info("FreeBoardController home 메인화면으로 이동");
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value = "/freeBoardList.do",method = RequestMethod.GET)
	public String freeBoardList(Model model) {
		log.info("FreeBoardController freeBoardList 자유게시판 전체게시글 조회");
		List<FreeBoardDto> lists = service.freeBoardList();
		model.addAttribute("freeBoardList", lists);
		return "freeBoardMain";
	}

	
	@RequestMapping(value = "/freeBoardInsertView.do",method = RequestMethod.GET)
	public String freeBoardInsertView(HttpSession session) {
		log.info("FreeBoardController freeBoardInsertView 자유게시판 새글등록 화면 이동");
		UserDto loginDto = (UserDto) session.getAttribute("loginDto");
		if(loginDto == null) {
			return "redirect:/loginPage.do";
		}
		return "freeBoardInsert";
	}
	@RequestMapping(value = "/freeBoardInsert.do", method = RequestMethod.POST)
	public String freeBoardInsert(HttpSession session, FreeBoardDto dto) {
		log.info("FreeBoardController freeBoardInsert 자유게시판 새글등록{}",dto);
		UserDto loginDto = (UserDto) session.getAttribute("loginDto");
	    dto.setUser_seq(loginDto.getUser_seq());
		int n = service.freeBoardInsert(dto);
		if(n == 1) {
			return "redirect:/freeBoardList.do";
		}
		return "index";
	}
	
	
	@RequestMapping(value = "/freeBoardDetail.do",method = RequestMethod.GET)
	public String freeBoardDetail(@RequestParam("free_bseq")int free_bseq,Model model,HttpSession session) {
		log.info("FreeBoardController freeBoardDetail 자유게시판 상세조회");
		UserDto loginDto = (UserDto)session.getAttribute("loginDto");
		List<FreeCommentDto> CommentList = service2.CommentAllList(free_bseq);
		FreeBoardDto dto = service.freeBoardDetail(free_bseq);
		model.addAttribute("dto", dto);
		model.addAttribute("loginDto", loginDto);
		model.addAttribute("CommentAll", CommentList);
		return "freeBoardDetail";
	}
	@RequestMapping(value = "/freeBoardDel.do", method = RequestMethod.GET)
	public String freeBoardDel(@RequestParam("free_bseq")int free_bseq) {
		log.info("FreeBoardController freeBoardDel 자유게시판 게시글삭제");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("free_bseq", free_bseq);
		int n = service.freeBoardDel(map);
		if(n == 1) {
			return "redirect:/freeBoardList.do";
		}else {
			return "freeBoardDetail";
		}
	}
	@RequestMapping(value = "/updateBoard.do", method = RequestMethod.GET)
	public String updateBoardView(@RequestParam("free_bseq")int free_bseq,@RequestParam("free_title")String free_title,@RequestParam("free_content")String free_content, Model model,HttpSession session) {
		log.info("FreeBoardController updateBoard 자유게시판 글 수정 페이지로 이동");
		UserDto loginDto = (UserDto)session.getAttribute("loginDto");
		model.addAttribute("free_bseq",free_bseq);
		model.addAttribute("free_title",free_title);
		model.addAttribute("free_content",free_content);
		model.addAttribute("loginDto", loginDto);
		return "updateBoard";
	}
	@RequestMapping(value = "/freeBoardUpdate.do",method = RequestMethod.POST)
	public String updateBoard(@RequestParam("free_bseq")int free_bseq,@RequestParam("free_content")String free_content) {
		log.info("FreeBoardController updateBoard 자유게시판 글 수정");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("free_bseq", free_bseq);
		map.put("free_content", free_content);
 		 int n = service.updateBoard(map);
 		 if(n == 1) {
 			 return "redirect:/freeBoardList.do";
 		 }else {
 			 return "freeBoardDetail";
 		 }
	}
	
}
