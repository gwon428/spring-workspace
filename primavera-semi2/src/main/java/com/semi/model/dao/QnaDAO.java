package com.semi.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.model.vo.Collect;
import com.semi.model.vo.Paging;
import com.semi.model.vo.PagingQna;
import com.semi.model.vo.Qna;

@Repository
public class QnaDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	// 리스트 페이징 처리 (Qna 보이는 첫 페이지)
	public List<Qna> showAllQna(Paging paging){
		return session.selectList("qnaMapper.showAllQna", paging);
	}
	public int total() {
		return session.selectOne("qnaMapper.countQna");
	}
	
	// qna 등록 - insert
	public int insert(Qna qna) {
		return session.insert("qnaMapper.insertQna", qna);
	}
	
	// 작성한 QnA 전문 보이게 - selectOne
	public Qna select(int qnaNum) {
		return session.selectOne("qnaMapper.select", qnaNum);
	}
	
	// 작성한 Qna 수정
	public int update(Qna qna) {
		return session.update("qnaMapper.update", qna);
	}
	

	// 작성한 Qna 삭제 
	public int delete(int qnaNum) {
		return session.delete("qnaMapper.delete", qnaNum);
	}
	
	// 관리자용 Q&A 게시판 관리 페이지 : qna의 status가 'N'인 경우 리스트
	public List<Qna> listStatus(Paging paging){
		return session.selectList("qnaMapper.listStatus", paging);
	}
	public int totalStatus() {
		return session.selectOne("qnaMapper.countStatus");
	}
	
	
}
