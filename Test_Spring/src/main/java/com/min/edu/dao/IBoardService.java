package com.min.edu.dao;

import java.util.List;

import com.min.edu.dto.TestDto;

public interface IBoardService {

	public List<TestDto> selectBoard();
	
	public int insertBoard(TestDto dto);
}
