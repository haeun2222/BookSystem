package com.dowon.bds.model.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dowon.bds.dto.FreeBoardDto;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class IFreeBoardDaoImpl implements IFreeBoardDao {

	private final String NS = "com.dowon.bds.model.mapper.IFreeBoardDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<FreeBoardDto> freeBoardList() {
		log.info("IFreeBoardDaoImpl freeBoardList 자유게시판 전체글 조회");
		return session.selectList(NS+"freeBoardList");
	}

	@Override
	public int freeBoardInsert(FreeBoardDto dto) {
		log.info("IFreeBoardDaoImpl freeBoardInsert 자유게시판 새글 등록");
		return session.insert(NS+"freeBoardInsert",dto);
	}

	@Override
	public FreeBoardDto freeBoardDetail(int free_bseq) {
		log.info("IFreeBoardDaoImpl freeBoardDetail 자유게시판 게시글 상세조회");
		return session.selectOne(NS+"freeBoardDetail",free_bseq);
	}

	@Override
	public int freeBoardDel(Map<String, Object> map) {
		log.info("IFreeBoardDaoImpl freeBoardDel 자유게시판 게시글 삭제");
		return session.update(NS+"freeBoardDel",map);
	}

}
