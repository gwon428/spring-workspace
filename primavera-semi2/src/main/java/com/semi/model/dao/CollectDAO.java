package com.semi.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.model.vo.Collect;
import com.semi.model.vo.Paging;
import com.semi.model.vo.Pagingseven;

@Repository
public class CollectDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	
	// 전체 수거 신청 리스트 보기
//	public List<Collect> showAllCollect(Paging paging){
//		return session.selectList("collectMapper.showAllCollect", paging);
//	}
	
	public int total() {
		return session.selectOne("collectMapper.count");
	}
	// 관리자용 수거신청현황 페이지 (prog제외)
	public List<Collect> showAllCollect(Paging paging){
		return session.selectList("collectMapper.showAllCollect", paging);
	}
	
	public List<Collect> showorderby(Paging paging){
		return session.selectList("collectMapper.showAllCollectorderby", paging);
	}
	
	public int showAllCollecttotal() {
		return session.selectOne("collectMapper.countAllCollect");
	}
	
	
	// 회원용 진행상황 페이지용 
	public List<Collect> showCollect(Pagingseven paging){
		return session.selectList("collectMapper.showCollect", paging);
	}
	
	public int showCollecttotal(String id) {
		return session.selectOne("collectMapper.Collect", id);
	}
	
	
	// 관리자용 progress 관리 페이지용(조건x)
	public List<Collect> showProgress(Paging paging){
		return session.selectList("collectMapper.showProgress", paging);
	}
	
	public int showProgresstotal() {
		return session.selectOne("collectMapper.countProgress");
	}
	
	// update : 수거 신청 진행상황 변경
	public int updateProgress(Collect collect) {
		return session.update("collectMapper.updateProgress", collect);
	}
	
/*--------------------------------------------------------------*/
	// 수거 신청 
	public int registerCollect(Collect vo) {
		return session.insert("collectMapper.registerCollect", vo);
	}
	
	
	
}
