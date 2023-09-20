package com.dowon.bds.model.service;

import java.util.List;
import java.util.Map;

import com.dowon.bds.dto.FreeBoardDto;

public interface IFreeBoardService {

	public List<FreeBoardDto> freeBoardList();
	public int freeBoardInsert(FreeBoardDto dto);
	public FreeBoardDto freeBoardDetail(int free_bseq);
	public int freeBoardDel(Map<String, Object>map);
}
