package com.semi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.model.dao.NoticeDAO;
import com.semi.model.vo.Notice;
import com.semi.model.vo.Paging;

@Service
public class NoticeService {

	@Autowired
	private NoticeDAO dao;

	// 공지사항 리스트
	public List<Notice> selectAll(Paging paging) {

		paging.setOffset(paging.getLimit() * (paging.getPage() - 1));
		return dao.selectAll(paging);
	}

	//
	public Notice select(int noticeNum) {
		return dao.select(noticeNum);
	}

	public int insert(Notice n) {
		return dao.insert(n);
	}

	public int total() {
		return dao.total();
	}

	public int update(Notice noticeNum) {
		return dao.update(noticeNum);
	}

	public int delete(int notice_num) {
		return dao.delete(notice_num);
	}
	
}
