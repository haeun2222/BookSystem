package com.dowon.bds;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dowon.bds.dto.AgeDto;
import com.dowon.bds.dto.GenderDto;
import com.dowon.bds.model.service.IStatisticsService;


import lombok.extern.slf4j.Slf4j;



	@RestController
	@Slf4j
	public class RestStatistics_Controller {

		@Autowired
		private IStatisticsService service;
		
		
		@GetMapping("/genderChart.do")
		public List<GenderDto> getGender(){
			List<GenderDto> genderData = service.genderStatistics();
			log.info("genderData{}",genderData);
			return genderData;
		}
		@GetMapping("/ageChart.do")
		public List<AgeDto> getAge(){
			List<AgeDto> ageData = service.AgeStatistics();
			log.info("ageData {}",ageData);
			return ageData;
		}

		
	}
	

