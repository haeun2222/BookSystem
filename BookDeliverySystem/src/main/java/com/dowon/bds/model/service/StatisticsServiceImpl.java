package com.dowon.bds.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dowon.bds.dto.AgeDto;
import com.dowon.bds.dto.GenderDto;
import com.dowon.bds.model.mapper.IStatisticsDao;


import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StatisticsServiceImpl implements IStatisticsService {

	@Autowired
	private IStatisticsDao dao;
	
	
	@Override
	public List<GenderDto> imgSelect() {
		log.info("imgSelect 실행");
		return dao.imgSelect();
	}


	@Override
	public List<GenderDto> genderStatistics() {
		log.info("genderStatistics 실행");
		return dao.genderStatistics();
	}


	@Override
	public List<AgeDto> AgeStatistics() {
		log.info("AgeStatistics 실행");
		return dao.AgeStatistics();
	}

}
