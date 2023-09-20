package com.test.bds;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dowon.bds.dto.AgeDto;
import com.dowon.bds.dto.BookDto;
import com.dowon.bds.dto.FreeBoardDto;
import com.dowon.bds.dto.GenderDto;
import com.dowon.bds.model.mapper.IFreeBoardDao;
import com.dowon.bds.model.mapper.IStatisticsDao;
import com.dowon.bds.model.service.IFreeBoardService;
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
	@Autowired
	private IFreeBoardService service2;
	@Autowired
	private IFreeBoardDao dao2;


	
	
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
//	@Test
	public void age_test() {
		List<AgeDto> lists = service.AgeStatistics();
		log.info("SuyubJUnitTest age_test {}", lists);
		assertNotNull(lists);

	}
//	@Test
	public void book_test() {
		BookDto dto = dao.bookSearch(5);
		log.info("SuyubJUnitTest book_test {}", dto);
		assertNotNull(dto);
	}
//	@Test
	public void freeBoardList() {
		List<FreeBoardDto> lists = dao2.freeBoardList();
		log.info("SuyubJUnitTest freeBoardList{}",lists);
		assertNotNull(lists);
	}
	
//	@Test
//	public void freeBoardInsert() {
//		FreeBoardDto dto = new FreeBoardDto(0, 0, "책 업데이트", "책 업데이트가 좀 느린것 같은데 어디에 문의해보신분?", null, null);
//		int n = dao2.freeBoardInsert(dto);
//		log.info("SuyubJUnitTest freeBoardInsert{}",dto);
//		assertEquals(1, n);
//	}
//	@Test
	public void freeBoardDetail() {
		FreeBoardDto dto = dao2.freeBoardDetail(2);
		log.info("SuyubJUnitTest freeBoardDetail{}",dto);
		assertNotNull(dto);
	}
	@Test
	public void freeBoardDel() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("free_bseq", 2);
		int n = dao2.freeBoardDel(map);
		log.info("SuyubJUnitTest freeBoardDel {}",map);
		assertEquals(1, n);
	}
}
