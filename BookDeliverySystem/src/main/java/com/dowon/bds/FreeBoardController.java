package com.dowon.bds;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dowon.bds.dto.FreeBoardDto;
import com.dowon.bds.model.service.IFreeBoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FreeBoardController {

	@Autowired
	private IFreeBoardService service;
	
	@RequestMapping(value = "/freeBoardList.do",method = RequestMethod.GET)
	public String freeBoardList(Model model) {
		log.info("FreeBoardController freeBoardList 자유게시판 전체게시글 조회");
		List<FreeBoardDto> lists = service.freeBoardList();
		model.addAttribute("freeBoardList", lists);
		return "freeBoardMain";
	}
	
	@RequestMapping(value = "/freeBoardInsertView.do",method = RequestMethod.GET)
	public String freeBoardInsertView() {
		log.info("FreeBoardController freeBoardInsertView 자유게시판 새글등록 화면 이동");
		return "freeBoardInsert";
	}
//	@RequestMapping(value = "/freeBoardInsert.do", method = RequestMethod.POST)
//	public String freeBoardInsert(HttpSession session, FreeBoardDto dto) {
//		log.info("FreeBoardController freeBoardInsert 자유게시판 새글등록{}",dto);
//		
//	}
	
}
