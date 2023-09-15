package com.dowon.bds.model.mapper;

import java.util.List;
import java.util.Map;

import com.dowon.bds.dto.ResveDto;

/** 
 * @author 박하은
 * @since 2023.09.13
 * 도서 예약관련 메소드를 정의한 DAO Interface
 */
public interface IResveDao {

	
public int rentStandby(int n);
	
	public int stepMinus(Map<String, Object> map);
	
	public int resveBook(Map<String, Object> map);
	
	public int resveCancle(int n);
	
	public List<ResveDto> selectStep(int n);
	
	public List<Map<String, Object>> userResveStatus(int n);
	
	
	public boolean cancelReservation(int n);
	
	public boolean updateStep(Map<String, Object> map);
	
	
	public String getResveStatus(int n);
	public int getBookSeq(int n);
	
}
