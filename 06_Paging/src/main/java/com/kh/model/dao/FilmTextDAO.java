package com.kh.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.model.vo.FilmText;
import com.kh.model.vo.Paging;

@Repository
public class FilmTextDAO {
	@Autowired
	private SqlSessionTemplate session;
	
	public List<FilmText> showAllText(Paging paging){
		return session.selectList("filmMapper.showAllText", paging);
	}
	
	public int total() {
		return session.selectOne("filmMapper.count");
	}
}
