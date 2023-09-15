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
	public int stepMinus(Map<String, Object> map) {
		return session.update(NS+"stepMinus",map);
	}

	@Override
	public int resveBook(Map<String, Object> map) {
		return session.insert(NS+"resveBook",map);
	}

	@Override
	public int resveCancle(int n) {
		return session.update(NS+"resveCancle",n);
	}

	@Override
	public List<ResveDto> selectStep(int n) {
		return session.selectList(NS+"selectStep",n);
	}

	@Override
	public List<Map<String, Object>> userResveStatus(int n) {
		return session.selectList(NS+"userResveStatus",n);
	}

	@Override
	public boolean cancelReservation(int n) {
		int rowsAffected = session.update(NS+"resveCancle",n);
        return rowsAffected > 0;
	}

	@Override
	public boolean updateStep(Map<String, Object> map) {
		int rowsAffected = session.update("stepMinus", map);
        return rowsAffected > 0;
	}

	@Override
	public String getResveStatus(int n) {
		return session.selectOne(NS+"getResveStatus",n);
	}

	@Override
	public int getBookSeq(int n) {
		return session.selectOne(NS+"getBookSeq",n);
	}
}
