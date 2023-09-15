package com.dowon.bds.model.service;

import java.util.List;
import java.util.Map;

import com.dowon.bds.dto.ResveDto;

/** 
 * @author 박하은
 * @since 2023.09.13
 * 도서 예약관련 메소드를 정의한 Service Interface
 */
public interface IResveService {

	public int rentStandby(int n);
	
	public int stepMinus(Map<String, Object> map);
	
	public int resveBook(Map<String, Object> map);
	
	public int resveCancle(int n);
	
	public List<ResveDto> selectStep(int n);
	
	public List<Map<String, Object>> userResveStatus(int n);
	
	
	public boolean cancelReservation(int n);
	
	public boolean updateStep(Map<String, Object> map);
	
	public boolean cancelAndStepUpdate(int resveSeq, int userSeq);
	
	
//	public String getResveStatus(int n);
//	public int getBookSeq(int n);
	
	
}
