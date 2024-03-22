package com.semi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.semi.model.dao.CollectDAO;
import com.semi.model.vo.Collect;
import com.semi.model.vo.Paging;
import com.semi.model.vo.Pagingseven;

@Service
public class CollectService {
	
	@Autowired
	private CollectDAO dao;
	
	// 전체 수거 신청 리스트 보기
//	public List<Collect> showAllCollect(Paging paging){
//		paging.setOffset(paging.getLimit() * (paging.getPage()-1));
//		return dao.showAllCollect(paging); 
//	}
	
	public int total() {
		return dao.total();
	}
	
	// 관리자용 수거신청현황 페이지 (prog제외)
	public List<Collect> showAllCollect(Paging paging){
		paging.setOffset(paging.getLimit() * (paging.getPage()-1));
		return dao.showAllCollect(paging); 
	}
	
	public List<Collect> showorderby(Paging paging){
		paging.setOffset(paging.getLimit() * (paging.getPage()-1));
		return dao.showorderby(paging); 
	}
	
	public int showAllCollecttotal() {
		return dao.showAllCollecttotal();
	}
	
	// 회원용 진행상황 페이지용 
		public List<Collect> showCollect(Pagingseven paging){
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			UserDetails userDetails = (UserDetails)principal;
			
			paging.setOffset(paging.getLimit() * (paging.getPage()-1));
			
			paging.setId(userDetails.getUsername());
			return dao.showCollect(paging);
	}
		
		public int showCollecttotal() {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			UserDetails userDetails = (UserDetails)principal;
			
			return dao.showCollecttotal(userDetails.getUsername());
		}
	
	// 관리자용 progress 관리 페이지용(조건x)
	public List<Collect> showProgress(Paging paging){
		paging.setOffset(paging.getLimit() * (paging.getPage()-1));
		return dao.showProgress(paging);
	}	
	
	public int showProgresstotal() {
		return dao.showProgresstotal();
	}
		
	// update : 수거 신청 진행상황 변경
	public int updateProgress(Collect collect) {
		return dao.updateProgress(collect);
	}
	
/*--------------------------------------------------------------*/
	
	// 수거 신청 
	public int registerCollect(Collect vo) {
		return dao.registerCollect(vo);
	}


}
