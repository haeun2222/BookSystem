package com.dowon.bds.model.service;

import java.util.List;

import com.dowon.bds.dto.AgeDto;
import com.dowon.bds.dto.GenderDto;


public interface IStatisticsService {

	public List<GenderDto> imgSelect();
	public List<GenderDto> genderStatistics();
	public List<AgeDto> AgeStatistics();
	
}
