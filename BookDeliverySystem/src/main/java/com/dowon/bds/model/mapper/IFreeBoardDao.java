package com.dowon.bds.model.mapper;

import java.util.List;
import java.util.Map;

import com.dowon.bds.dto.FreeBoardDto;

public interface IFreeBoardDao {

	// 자유게시판 전체글 조회
	public List<FreeBoardDto> freeBoardList();
	
	// 자유게시판 새글등록
	public int freeBoardInsert(FreeBoardDto dto);
	
	// 자유게시판 게시글 상세조회
	public FreeBoardDto freeBoardDetail(int free_bseq);
	
	// 자유게시판 게시글 삭제
	public int freeBoardDel(Map<String, Object>map);
	
	// 자유게시판 게시글 수정
	public int updateBoard(Map<String, Object>map);
}
