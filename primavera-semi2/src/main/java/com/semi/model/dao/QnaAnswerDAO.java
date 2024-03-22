package com.semi.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.model.vo.QnaAnswer;

@Repository
public class QnaAnswerDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	
	// insert
	public int insertQnaAnswer(QnaAnswer qnaAnswer) {
		return session.insert("qnaAnswerMapper.insertQnaAnswer", qnaAnswer); 
	}
	
	// select
	public QnaAnswer selectQnaAnswer(int qnaNum) {
		return session.selectOne("qnaAnswerMapper.selectQnaAnswer", qnaNum);	
	}
	
	// update
	public int updateQnaAnswer(QnaAnswer qnaAnswer) {
		return session.update("qnaAnswerMapper.updateQnaAnswer", qnaAnswer);
	}
	
	// delete
	public int deleteQnaAnswer(int qnaNum) {
		return session.delete("qnaAnswerMapper.deleteQnaAnswer", qnaNum);
	}
	
	// updateStatus
	public int updateStatus(int qnaNum) {
		return session.update("qnaAnswerMapper.updateStatus", qnaNum);
	}
	
	// updateStatusDelete
	public int updateStatusDelete(int qnaNum) {
		return session.update("qnaAnswerMapper.updateStatusDelete", qnaNum);
	}
}
