package com.dowon.bds;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dowon.bds.dto.NoticeBoardDto;
import com.dowon.bds.dto.UserDto;
import com.dowon.bds.model.service.INoticeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class NoticeBoardController {
	
	@Autowired
	private INoticeService noticeService;
	
	@GetMapping(value="/noticeBoardList.do")
	public String noticeBoardList(Model model) {
		log.info("Welcome noticeBoardList로 이동 및 전체조회");
		List<NoticeBoardDto> lists = noticeService.noticeeBoardList();
		log.info("test :{} ",lists);
		model.addAttribute("noticeList",lists);
		return "noticeBoardMain";
	}
	
	@GetMapping(value="/noticeBoardInsertForm.do")
	public String noticeInsertForm(HttpSession session) {
		log.info("Welcome NoticeBoardController noticeInsert 공지사항 새글작성화면 이동");
		UserDto loginDto =  (UserDto)session.getAttribute("loginDto");
		if(loginDto == null) {
			return "redirect:/loginPage.do";
		}else if(!loginDto.getUser_auth().equals("A")) {
			return "errorPage";
		}else {
			return "noticeBoardInsert";
		}
	}
	
	@PostMapping(value="/noticeBoardInsert.do")
	public String noticeBoardInsert(HttpSession session, NoticeBoardDto dto) {
		log.info("Welcome NoticeBoardController noticeBoardInsert 공지사항 새글등록");
		UserDto loginDto =  (UserDto)session.getAttribute("loginDto");
		dto.setUser_seq(loginDto.getUser_seq());
		int n = noticeService.noticeBoardInsert(dto);
		
		if(n==1) {
			return "redirect:/noticeBoardList.do";
		}
		return "redirect:/noticeBoardInsertForm.do";
	}
	
	@GetMapping(value="/noticeBoardDetail.do")
	public String noticeBoardDetail(@RequestParam("notice_bseq")int notice_besq, Model model, HttpSession session) {
		log.info("NoticeBoardController noticeBoardDetail 공지사항 상세조회");
		UserDto loginDto = (UserDto)session.getAttribute("loginDto");
		NoticeBoardDto dto = noticeService.noticeBoardDetail(notice_besq);
		model.addAttribute("dto", dto);
		model.addAttribute("loginDto", loginDto);
		return "noticeBoardDetail";
	}
	
	@GetMapping(value="noticeDel.do")
	public String noticeDel(@RequestParam("notice_bseq")int notice_bseq) {
		log.info("NoticeBoardController noticeDel 공지사항 삭제");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notice_bseq", notice_bseq);
		int n = noticeService.noticeBoardDel(map);
		if(n == 1) {
			return "redirect:/noticeBoardList.do";
		}
		return "noticeBoardDetail";
	}
	
	@GetMapping(value="/updateNoticeView.do")
	public String updateNoticeView(@RequestParam("notice_bseq")int notice_bseq,@RequestParam("notice_title")String notice_title,@RequestParam("notice_content")String notice_content,Model model,HttpSession session) {
		log.info("NoticeBoardController noticeBoardDetail 공지사항 수정 페이지로 이동");
		UserDto loginDto = (UserDto)session.getAttribute("loginDto");
		model.addAttribute("notice_bseq",notice_bseq);
		model.addAttribute("notice_title",notice_title);
		model.addAttribute("notice_content",notice_content);
		model.addAttribute("loginDto", loginDto);
		return "updateNoticeBoard";
	}
	
	@PostMapping(value="/updateNoticeBoard.do")
	public String updateNoticeBoard(@RequestParam("notice_bseq")int notice_bseq,@RequestParam("notice_content")String notice_content) {
		log.info("FreeBoardController updateBoard 공지사항 글 수정");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notice_bseq", notice_bseq);
		map.put("notice_content", notice_content);
		int n = noticeService.updateBoard(map);
		if(n==1) {
			return "redirect:/noticeBoardList.do";		
		}else {
			return "noticeBoardDetail";
		}
	}
}
