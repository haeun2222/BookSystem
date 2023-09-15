package com.dowon.bds.model.mapper;
/** 
 * @author 김지인
 * @since 2023.09.13
 * 결제관련 메소드를 정의한 DAO Interface
 */
import com.dowon.bds.dto.PayDto;

public interface IPaymentDao {

	//결제정보 테이블 값 저장
	public int saveBookPayment(PayDto payDto);
	
	//user_seq 기준으로 현재 충전 마일리지 합산 값
	//Integer selectSumPoint(Integer user_seq);
}
