package com.dowon.bds.model.service;

import java.util.List;

import com.dowon.bds.dto.FreeCommentDto;

public interface IFreeCommentService {

	public int CommentInsert(FreeCommentDto fDto);
	public List<FreeCommentDto> CommentAllList(int free_bseq);
}
