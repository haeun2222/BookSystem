package com.dowon.bds.model.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dowon.bds.dto.PayDto;
import com.dowon.bds.model.mapper.IPaymentDao;

@Service
public class PaymentServiceImpl implements IPaymentService {

	private static final Logger logger = LoggerFactory.getLogger(AddrServiceImpl.class); 
	
	@Autowired
	public IPaymentDao dao;
	
	@Override
	public void saveBookPayment(PayDto payDto) {
		System.out.println("");
		logger.info("배송지 주소입력 saveAddress");
		dao.saveBookPayment(payDto);

	}

}
