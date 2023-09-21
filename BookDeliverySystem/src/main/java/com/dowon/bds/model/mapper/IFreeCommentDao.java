package com.dowon.bds.model.mapper;

import java.util.List;

import com.dowon.bds.dto.FreeCommentDto;

public interface IFreeCommentDao {
	// 답글작성
	public int CommentInsert(FreeCommentDto fDto);
	
	// 해당게시글의 답글조회
	public List<FreeCommentDto> CommentAllList(int free_bseq);
}
