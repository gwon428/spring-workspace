package com.semi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.model.dao.QnaAnswerDAO;
import com.semi.model.vo.QnaAnswer;

@Service
public class QnaAnswerService {

	@Autowired
	private QnaAnswerDAO dao;
	
	public int insertQnaAnswer(QnaAnswer qnaAnswer) {
		return dao.insertQnaAnswer(qnaAnswer);
	}
	
	// select
	public QnaAnswer selectQnaAnswer(int qnaNum) {
		return dao.selectQnaAnswer(qnaNum);
	}
	
	// update
	public int updateQnaAnswer(QnaAnswer qnaAnswer) {
		return dao.updateQnaAnswer(qnaAnswer);
	}
		
	// delete
	public int deleteQnaAnswer(int qnaNum) {
		return dao.deleteQnaAnswer(qnaNum);
	}
	
	// updateStatus
	public int updateStatus(int qnaNum) {
		return dao.updateStatus(qnaNum);
	}
	
	// updateStatusDelete
	public int updateStatusDelete(int qnaNum) {
		return dao.updateStatusDelete(qnaNum);
	}
}
