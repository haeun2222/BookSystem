package com.dowon.bds.model.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dowon.bds.dto.AgeDto;
import com.dowon.bds.dto.GenderDto;


import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class StatisticsDaoImpl implements IStatisticsDao {

	private final static String NS ="com.min.edu.dao.ImgDaoImpl.";
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<GenderDto> imgSelect() {
		log.info("ImgDaoImpl imgSelect top2책 이미지");
		return session.selectList(NS+"imgSelect");
	}

	@Override
	public List<GenderDto> genderStatistics() {
		log.info("ImgDaoImpl genderStatistics 성별통계");
		return session.selectList(NS+"genderStatistics");
	}

	@Override
	public List<AgeDto> AgeStatistics() {
		log.info("ImgDaoImpl AgeStatistics 연령별통계");
		return session.selectList(NS+"AgeStatistics");
	}

}
