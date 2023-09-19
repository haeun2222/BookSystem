package com.dowon.bds.model.service;
/** 
 * @author 김지인
 * @since 2023.09.19
 * 도서 결제관련 메소드를 구현한 Service Interface implements 클래스
 */
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dowon.bds.dto.PayDto;
import com.dowon.bds.model.mapper.IPaymentDao;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PaymentServiceImpl implements IPaymentService {

	@Autowired
	public IPaymentDao dao;
	
	@Override
	public void saveBookPayment(PayDto payDto) {
		System.out.println(payDto.toString());
		log.info("PaymentServiceImpl saveBookPayment 결제 실행 : {}",payDto);
		dao.saveBookPayment(payDto);

	}

	@Override
	public List<Map<String, Object>> selectMypayList(int n) {
		log.info("PaymentServiceImpl selectMypayList 회원결제리스트 : {}", n);
		return dao.selectMypayList(n);
	}

}
