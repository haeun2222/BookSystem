
package com.dowon.bds.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dowon.bds.dto.ResveDto;
import com.dowon.bds.model.mapper.IResveDao;


/** 
 * @author 박하은
 * @since 2023.09.13
 * 도서 예약관련 메소드를 구현한 Service Interface implements 클래스
 */
@Service
public class ResveServiceImpl implements IResveService {

	@Autowired
	private IResveDao dao;
	
	@Override
	public int rentStandby(int n) {
		return dao.rentStandby(n);
	}


	@Override
	public int resveBook(Map<String, Object> map) {
		return dao.resveBook(map);
	}


	@Override
	public List<Map<String, Object>> selectStep(int n) {
		return dao.selectStep(n);
	}

	@Override
	public List<Map<String, Object>> userResveStatus(int n) {
		return dao.userResveStatus(n);
	}
	
	
	
	


	@Override
	public int stepUpdate(Map<String, Object> map) {
		return dao.stepUpdate(map);
	}
	
	@Override
	public int resveCancle(Map<String, Object> map) {
		return dao.resveCancle(map);
	}



	
}
