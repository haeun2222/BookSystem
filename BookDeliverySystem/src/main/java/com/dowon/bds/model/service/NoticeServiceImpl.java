package com.dowon.bds.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dowon.bds.dto.NoticeBoardDto;
import com.dowon.bds.model.mapper.INoticeBoardDao;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoticeServiceImpl implements INoticeService {

	@Autowired
	INoticeBoardDao dao;
	
	@Override
	public List<NoticeBoardDto> noticeeBoardList() {
		log.info("NoticeServiceImpl noticeeBoardList 공지사항 전체글 조회");
		return dao.noticeeBoardList();
	}

	@Override
	public int noticeBoardInsert(NoticeBoardDto dto) {
		log.info("NoticeServiceImpl noticeBoardInsert 공지사항 새글 작성");
		return dao.noticeBoardInsert(dto);
	}

	@Override
	public NoticeBoardDto noticeBoardDetail(int notice_bseq) {
		log.info("NoticeServiceImpl noticeBoardInsert 공지사항 상세조회");
		return dao.noticeBoardDetail(notice_bseq);
	}

	@Override
	public int noticeBoardDel(Map<String, Object> map) {
		log.info("NoticeServiceImpl noticeBoardInsert 공지사항 삭제");
		return dao.noticeBoardDel(map);
	}

	@Override
	public int updateBoard(Map<String, Object> map) {
		log.info("NoticeServiceImpl noticeBoardInsert 공지사항 수정");
		return dao.updateBoard(map);
	}

	@Override
	public int noticeBoardCount() {
		return 0;
	}

	@Override
	public List<NoticeBoardDto> noticeBoardCountList(Map<String, Object> map) {
		return null;
	}

}
