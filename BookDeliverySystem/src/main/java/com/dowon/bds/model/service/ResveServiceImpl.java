
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
	public int stepMinus(Map<String, Object> map) {
		return dao.stepMinus(map);
	}

	@Override
	public int resveBook(Map<String, Object> map) {
		return dao.resveBook(map);
	}

	@Override
	public int resveCancle(int n) {
		return dao.resveCancle(n);
	}

	@Override
	public List<ResveDto> selectStep(int n) {
		return dao.selectStep(n);
	}

	@Override
	public List<Map<String, Object>> userResveStatus(int n) {
		return dao.userResveStatus(n);
	}
	
	

	@Override
	public boolean cancelReservation(int n) {
		return dao.cancelReservation(n);
	}

	@Override
	public boolean updateStep(Map<String, Object> map) {
		return dao.updateStep(map);
	}

	
	
	
	@Override
	 public boolean cancelAndStepUpdate(int resveSeq, int userSeq) {
	        // 예약 취소 메서드를 호출하고 성공 또는 실패 여부를 확인합니다.
	        boolean cancelSuccess = cancelReservation(resveSeq);

	        if (cancelSuccess) {
	            // 예약 취소가 성공한 경우, 해당 resve_seq의 resve_status를 확인합니다.
	            String resveStatus = dao.getResveStatus(resveSeq);

	            if ("N".equals(resveStatus)) {
	                // resve_status가 'N'인 경우, book_seq를 찾아서 스텝 업데이트 메서드를 호출합니다.
	                int bookSeq = dao.getBookSeq(resveSeq);
	                Map<String, Object> map = new HashMap<>();
	                map.put("book_seq", bookSeq);
	                map.put("user_seq", userSeq); // 추가된 부분
	                boolean stepUpdateSuccess = updateStep(map);

	                if (stepUpdateSuccess) {
	                    return true; // 예약 취소 및 스텝 업데이트 성공 시
	                }
	            }
	        }

	        return false; // 예약 취소 및 스텝 업데이트 실패 시
	    }

	



	
}
