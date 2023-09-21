package com.dowon.bds.model.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dowon.bds.dto.FreeCommentDto;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class FreeBoardCommentImpl implements IFreeCommentDao {

	@Autowired
	private SqlSessionTemplate session;
	
	private final String NS = "com.dowon.bds.model.mapper.FreeBoardCommentImpl.";
	
	@Override
	public int CommentInsert(FreeCommentDto fDto) {
		log.info("FreeBoardCommentImpl CommentInsert 자유게시판 답글 작성");
		return session.insert(NS+"CommentInsert",fDto);
	}

	@Override
	public List<FreeCommentDto> CommentAllList(int free_bseq) {
		log.info("FreeBoardCommentImpl CommentAllList 해당게시글의 답글 조회");
		return session.selectList(NS+"CommentAllList",free_bseq);
	}

}
