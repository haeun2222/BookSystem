package com.min.edu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.dto.TestDto;

@Service
public class IBoardServiceImpl implements IBoardService {

	@Autowired
	private IBoardDao dao;

	@Override
	public List<TestDto> selectBoard() {
		return dao.selectBoard();
	}

	@Override
	public int insertBoard(TestDto dto) {
		return dao.insertBoard(dto);
	}
	
}
