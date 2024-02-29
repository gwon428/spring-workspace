package com.kh.upload.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.upload.model.dao.BoardDAO;
import com.kh.upload.model.vo.Board;

@Service
public class BoardService {

	@Autowired
	private BoardDAO dao;
	
	public int writeBoard(Board board) {
		return dao.writeBoard(board);
	}

	public List<Board> showAllText(Board board) {
		return dao.showAllText(board);
	}

	public Board view(int no) {
		return dao.view(no);
	}

	public int updateBoard(Board board) {
		return dao.updateBoard(board);
	}

	public int deleteBoard(int no) {
		return dao.deleteBoard(no);
	}
}
