package com.min.edu.dao;

import java.util.List;

import com.min.edu.dto.TestDto;

public interface IBoardDao {

	public List<TestDto> selectBoard();
	
	public int insertBoard(TestDto dto);
}
