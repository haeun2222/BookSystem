package com.dowon.bds.model.mapper;

import java.util.List;
import java.util.Map;

/** 
 * @author 김지인
 * @since 2023.09.13
 * 결제관련 메소드를 구현한 DAO Interface implements 클래스
 */

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dowon.bds.dto.PayDto;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class PaymentDaoImpl implements IPaymentDao {
	
	private final String NS ="com.dowon.bds.model.mapper.PaymentDaoImpl.";
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	
	
	
	@Override
	public int saveBookPayment(PayDto payDto) {
		log.info("saveBookPayment 결제내역저장");
		return  sqlSession.insert(NS+"saveBookPayment", payDto);

	}



	@Override
	public List<Map<String, Object>> selectMypayList(int n) {
		log.info("saveBookPayment 결제내역저장");
		return sqlSession.selectList(NS+"selectMypayList",n);
	}

}
