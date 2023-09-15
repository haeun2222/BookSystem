package com.dowon.bds.model.mapper;

/** 
 * @author 김지인
 * @since 2023.09.13
 * 결제관련 메소드를 구현한 DAO Interface implements 클래스
 */

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.dowon.bds.dto.PayDto;

@Repository
public class PaymentDaoImpl implements IPaymentDao {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final String NS ="com.dowon.bds.model.mapper.PaymentDaoImpl.";
	
	private final SqlSession sqlSession;
	
	public PaymentDaoImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public int saveBookPayment(PayDto payDto) {
		logger.info("saveBookPayment 결제내역저장");
//		return  sqlSession.insert(NS+"saveBookPayment", payDto);
		int n = sqlSession.insert(NS+"saveBookPayment", payDto);
		return 0;
	}

}
