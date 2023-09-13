package com.dowon.bds;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dowon.bds.dto.AgeDto;
import com.dowon.bds.dto.GenderDto;
import com.dowon.bds.model.service.IStatisticsService;


import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class Statistics_Controller {

	@Autowired
	private IStatisticsService service;
	

	
	@RequestMapping(value = "/chartGo.do", method = RequestMethod.GET)
	public String goChart() {
		log.info("페이지 이동");
		return "bdsHome";
	}
	
	
	@RequestMapping(value = "/top1Img.do", method = RequestMethod.GET)
	public String chart(Model model) {
		log.info("책이미지 뿌리기");
		List<GenderDto> imgTest = service.imgSelect();
		model.addAttribute("imgTest",imgTest);
		log.info("----------------imgTest{}",imgTest);
		return "chartView";
	}
	
	@RequestMapping(value = "/genderList.do", method = RequestMethod.GET)
	public String chartGender(Model model) {
		log.info("성별 통계");
		List<GenderDto> gender = service.genderStatistics();
		model.addAttribute("gender",gender);
		log.info("----------------gender{}",gender);
		return "imgSelect";
	}
	@RequestMapping(value = "/ageList.do", method = RequestMethod.GET)
	public String chartAge(Model model) {
		log.info("연령별 통계");
		List<AgeDto> age = service.AgeStatistics();
		model.addAttribute("age",age);
		log.info("---------------age{}",age);
		return "imgSelect";
	}

	
}
