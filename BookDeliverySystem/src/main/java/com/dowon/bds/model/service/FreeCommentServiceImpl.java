package com.dowon.bds.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dowon.bds.dto.FreeCommentDto;
import com.dowon.bds.model.mapper.IFreeCommentDao;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FreeCommentServiceImpl implements IFreeCommentService {

	@Autowired
	private IFreeCommentDao dao;
	
	@Override
	public int CommentInsert(FreeCommentDto fDto) {
		log.info("FreeCommentServiceImpl CommentInsert 자유게시판 답글 작성");
		return dao.CommentInsert(fDto);
	}

	@Override
	public List<FreeCommentDto> CommentAllList(int free_bseq) {
		log.info("FreeCommentServiceImpl CommentAllList 해당게시글의 답글 조회");
		return dao.CommentAllList(free_bseq);
	}

}
