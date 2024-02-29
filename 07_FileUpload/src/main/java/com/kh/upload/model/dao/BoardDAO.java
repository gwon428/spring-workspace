package com.kh.upload.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.upload.model.vo.Board;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	public int writeBoard(Board board) {
		return session.insert("boardMapper.writeBoard", board);
	}

	public List<Board> showAllText(Board board) {
		return session.selectList("boardMapper.showAllText", board);
	}

	public Board view(int no) {
		return session.selectOne("boardMapper.view", no);
	}

	public int updateBoard(Board board) {
		return session.update("boardMapper.updateBoard", board);
	}

	public int deleteBoard(int no) {
		return session.delete("boardMapper.deleteBoard", no);
	}
}
