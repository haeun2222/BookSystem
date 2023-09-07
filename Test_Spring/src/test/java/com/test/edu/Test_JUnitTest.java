package com.test.edu;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.min.edu.dto.TestDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/appServlet/application-context.xml")
public class Test_JUnitTest {
	@Autowired
	private ApplicationContext context;
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
//	@Test
//	public void test() {
//		SqlSessionTemplate session = context.getBean("sqlSessionTemplate",org.mybatis.spring.SqlSessionTemplate.class);
//		System.out.println(session.toString());
//		assertNotNull(session);
//	}
	
	@Test
	public void mybatis_Test() {
		List<TestDto>lists = sqlSessionTemplate.selectList("com.min.edu.dao.TestDaoImpl.selectAll");
		System.out.println(lists);
		assertNotNull(lists);
	}
}
