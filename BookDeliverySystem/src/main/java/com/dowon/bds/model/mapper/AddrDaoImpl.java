package com.dowon.bds.model.mapper;
/** 
 * @author 김지인
 * @since 2023.09.19
 * 도서 배송관련 메소드를 구현한 DAO Interface implements 클래스
 */
import java.util.Map;

/** 
 * @author 김지인
 * @since 2023.09.14
 * 배송지 입력 메소드를 구현한 DAO Interface implements 클래스
 */


import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dowon.bds.dto.AddrDto;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AddrDaoImpl implements IAddrDao {

	private final String NS = "com.dowon.bds.model.mapper.AddrDaoImpl.";
	
	@Autowired
	private final SqlSession sqlSession;
	
	@Autowired
	private SqlSessionTemplate session;
	
	 public AddrDaoImpl(SqlSession sqlSession) {
	        this.sqlSession = sqlSession;
	    }

	@Override
	public int saveAddress(AddrDto addrDto) {
		return sqlSession.insert(NS+"saveAddress", addrDto);
		}

	@Override
	public AddrDto checkAddress(String delivery_seq) {
		 return sqlSession.selectOne(NS + "checkAddress", delivery_seq);
	}

	@Override
	public AddrDto getAddrUserSeq(int user_seq) {
		return sqlSession.selectOne(NS + "getAddrUserSeq", user_seq);
	}

	@Override
	public boolean updateDeliveryNum(Map<String, Object> map) {
		log.info("updateDeliveryNum 운송장번호 등록"+map);
		int row = sqlSession.update(NS+"updateDeliveryNum", map);
		return row >0;
	}

	@Override
	public int deliRentStatus(int n) {
		
		return session.update(NS+"deliRentStatus",n);
	}



}
