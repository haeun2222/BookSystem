package com.dowon.bds.model.mapper;

import java.util.List;

import com.dowon.bds.dto.AgeDto;
import com.dowon.bds.dto.GenderDto;

public interface IStatisticsDao {

	// 대출현황 TOP2 도서 이미지 (메인페이지에 띄워짐) 
		public List<GenderDto> imgSelect();
		// 대출현황 성별 통계 백분율
		public List<GenderDto> genderStatistics();
		// 대출현황 연령별 통계 백분율
		public List<AgeDto> AgeStatistics();
	
}
