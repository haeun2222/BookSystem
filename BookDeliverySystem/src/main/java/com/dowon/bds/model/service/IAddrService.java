package com.dowon.bds.model.service;

/** 
 * @author 김지인
 * @since 2023.09.14
 * 주소 입력관련 메소드를 정의한 Service Interface
 * @since 2023.09.19
 * 주소 입력후 상태 변경을 위한 메소드를 정의한 Service Interface
 * 
 */
import com.dowon.bds.dto.AddrDto;

public interface IAddrService {
	//배송지 주소 입력
	public int saveAddress(AddrDto addrDto);
	//수거요청지 주소 입력
	public int saveAddressReturn(AddrDto addrDto);
	
	//주소확인
	public AddrDto checkAddress(String delivery_seq);
	
	//유저, 주소 조인
	public AddrDto getAddrUserSeq(int user_seq);
	
	//도서 상태 업데이트
	public int deliRentStatus(int user_seq);

	
}
