package com.dowon.bds.model.service;

/** 
 * @author 김지인
 * @since 2023.09.14
 * 주소 입력관련 메소드를 정의한 Service Interface
 */
import com.dowon.bds.dto.AddrDto;

public interface IAddrService {
	//주소입력
	public int saveAddress(AddrDto addrVo);
	
	//주소확인
	public AddrDto checkAddress(String delivery_seq);

	
}
