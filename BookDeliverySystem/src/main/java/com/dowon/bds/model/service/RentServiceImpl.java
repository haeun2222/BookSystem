package com.dowon.bds.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dowon.bds.dto.BookDto;
import com.dowon.bds.model.mapper.IRentDao;

/** 
 * @author 박하은
 * @since 2023.09.13
 * 도서 대출관련 메소드를 구현한 Service Interface implements 클래스
 */
@Service
public class RentServiceImpl implements IRentService {

	@Autowired
	private IRentDao dao;
	
	@Override
	public int bookRent(Map<String, Object> map) {
		return dao.bookRent(map);
	}
	
	@Override
	public List<Map<String, Object>> rentCheck(int n) {
		return dao.rentCheck(n);
	}

	@Override
	public List<Map<String, Object>>  selectMyBookRent(int n) {
		return dao.selectMyBookRent(n);
	}

	@Override
	public List<Map<String, Object>> selectAdminRent() {
		return dao.selectAdminRent();
	}

	@Override
	public List<Map<String, Object>> selectRentImpossibility() {
		return dao.selectRentImpossibility();
	}
	
	
	
	

	@Override
	public int rentStatus(int n) {
		return dao.rentStatus(n);
	}

	
	
	@Override
	public BookDto bookDetail(int n) {
		return dao.bookDetail(n);
	}

	@Override
	public List<BookDto> bookAll() {
		return dao.bookAll();
	}

	
	
	@Override
	public List<String> selectFilteredBookSeqList() {
		
	    List<String> filteredBookSeqList = new ArrayList<>();
	    List<Map<String, Object>> rDto = dao.selectRentImpossibility();
	    
	    for (Map<String, Object> map : rDto) {
	        Object rentStatus = map.get("RENT_STATUS");
	        Object resveStatus = map.get("RESVE_STATUS");

	        String rentStatusOrDefault = (rentStatus != null) ? rentStatus.toString() : "";
	        String resveStatusOrDefault = (resveStatus != null) ? resveStatus.toString() : "";
	        
	        if ("Y".equals(rentStatusOrDefault) || "R".equals(resveStatusOrDefault)) {
	            String bookSeq = map.get("BOOK_SEQ").toString();
	            filteredBookSeqList.add(bookSeq);
	        }
	    }
	    return filteredBookSeqList;
	}

}
