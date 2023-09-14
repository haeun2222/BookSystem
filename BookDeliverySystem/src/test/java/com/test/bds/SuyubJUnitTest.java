package com.test.bds;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dowon.bds.dto.AgeDto;
import com.dowon.bds.dto.GenderDto;
import com.dowon.bds.model.mapper.IStatisticsDao;
import com.dowon.bds.model.service.IStatisticsService;


import lombok.extern.slf4j.Slf4j;

/**
 * @author 김수엽
 * @since 2023.09.14 DAO와 Service 테스트를 위한 JUnit
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@Slf4j
public class SuyubJUnitTest {

	
	
	@Autowired
	private IStatisticsService service;
	@Autowired
	private IStatisticsDao dao;
	
	

	
	
//	@Test
//	public void img_test() {
//		List<GenderDto> lists = dao.imgSelect();
//		assertNotNull(lists);
//	}
//	@Test
//	public void test() {
//		List<GenderDto> lists = service.imgSelect();
//		log.info("imgselect 실행테스트{}",lists);
//		assertNotNull(lists);
//	}

//	@Test
	public void gender_test() {
		List<GenderDto> lists = dao.genderStatistics();
		log.info("SuyubJUnitTest gender_test {}",lists);
		assertNotNull(lists);
	}
	@Test
	public void age_test() {
		List<AgeDto> lists = service.AgeStatistics();
		log.info("SuyubJUnitTest age_test {}", lists);
		assertNotNull(lists);

	}

	
}
