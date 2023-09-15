package com.dowon.bds.model.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dowon.bds.dto.ResveDto;

/** 
 * @author 박하은
 * @since 2023.09.13
 * 도서 예약관련 메소드를 구현한 DAO Interface implements 클래스
 */
@Repository
public class ResveDaoImpl implements IResveDao {

	private final String NS = "com.dowon.bds.model.mapper.ResveDaoImpl.";

	@Autowired
	private SqlSessionTemplate session;
	

	@Override
	public int rentStandby(int n) {
		return session.update(NS+"rentStandby",n);
	}


	@Override
	public int resveBook(Map<String, Object> map) {
		return session.insert(NS+"resveBook",map);
	}


	@Override
	public List<Map<String, Object>> selectStep(int n) {
		return session.selectList(NS+"selectStep",n);
	}

	@Override
	public List<Map<String, Object>> userResveStatus(int n) {
		return session.selectList(NS+"userResveStatus",n);
	}


	
	
	@Override
	public int stepUpdate(Map<String, Object> map) {
		return session.update(NS+"stepUpdate",map);
	}
	
	
	@Override
	public int resveCancle(Map<String, Object> map) {
		return session.delete(NS+"resveCancle",map);
	}






}
