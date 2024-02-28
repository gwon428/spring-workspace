package com.kh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.model.dao.FilmTextDAO;
import com.kh.model.vo.FilmText;
import com.kh.model.vo.Paging;

@Service
public class FilmTextService {

	@Autowired
	private FilmTextDAO dao;
	
	public List<FilmText> showAllText(Paging paging){
		/*
		 	만약 limit가 10인 경우
		 	page 2 => offset 10
		 	page 3 => offset 20
		 	page 4 => offset 30
		 	
		 	만약 limit가 5인 경우
		 	page 2 => offset 5
		 	page 3 => offset 10
		 	page 4 => offset 15
		 	
		 	offset = limit * (page-1)
		 	
		 */

		
		paging.setOffset(paging.getLimit() * (paging.getPage()-1));
		

		return dao.showAllText(paging);
	}
	
	public int total() {
		return dao.total();
	}
}
