package com.min.edu;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.min.edu.dao.IBoardService;
import com.min.edu.dto.TestDto;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private IBoardService service;
	
	@RequestMapping(value = "/selectBoard.do",method = RequestMethod.GET)
	public String selectBoard(Model model) {
		logger.info("welcome BoardController selectBoard");
		List<TestDto> lists = service.selectBoard();
		model.addAttribute("lists",lists);
		return "boardList";
	}
	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
	public String insertBoard(TestDto dto) {
		int n = service.insertBoard(dto);
		if(n>0) {
			return "redirect:/selectBoard.do";
		}else {
			return "error";
		}
		// 주석 추가합니다
	}
}
