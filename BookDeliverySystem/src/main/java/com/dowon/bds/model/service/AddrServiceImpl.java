package com.dowon.bds.model.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dowon.bds.dto.AddrDto;
import com.dowon.bds.model.mapper.IAddrDao;

@Service
public class AddrServiceImpl implements IAddrService {
	
	private static final Logger logger = LoggerFactory.getLogger(AddrServiceImpl.class); 
	
	@Autowired
	private IAddrDao dao;

	@Override
	public int saveAddress(AddrDto addrVo) {
		logger.info("배송지 주소입력 saveAddress");
		return dao.saveAddress(addrVo);
	}

	@Override
	public AddrDto checkAddress(String delivery_seq) {
		logger.info("배송지 주소 확인 checkAddress");
		return dao.checkAddress(delivery_seq);
	}

}
