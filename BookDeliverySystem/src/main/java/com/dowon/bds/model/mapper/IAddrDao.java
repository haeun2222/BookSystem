package com.dowon.bds.model.mapper;
/** 
 * @author 김지인
 * @since 2023.09.14
 * 배송지 입력을 위한 메소드를 정의한 DAO Interface
 */

import org.apache.ibatis.annotations.Mapper;

import com.dowon.bds.dto.AddrDto;

@Mapper
public interface IAddrDao {
	public int saveAddress(AddrDto addrDto);
	public AddrDto checkAddress(String delivery_seq);
	
}
