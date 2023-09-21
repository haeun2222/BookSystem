package com.dowon.bds.model.mapper;

import java.util.List;
import java.util.Map;

import com.dowon.bds.dto.FreeCommentDto;

public interface IFreeCommentDao {
	// 답글작성
	public int CommentInsert(FreeCommentDto fDto);
	
	// 해당게시글의 답글조회
	public List<FreeCommentDto> CommentAllList(int free_bseq);
	
	// 답글 삭제
	public int CommentDel(Map<String, Object>map);
}
