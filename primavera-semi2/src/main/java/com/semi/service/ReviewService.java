package com.semi.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.semi.model.dao.ReviewDAO;
import com.semi.model.vo.Review;
import com.semi.model.vo.Paging;

@Service
public class ReviewService {

	@Autowired
	private ReviewDAO dao;

	public int insert(Review b) {
		return dao.insert(b);
	}

	public List<Review> selectAll() {
		return dao.selectAll();
	}

	public Review select(int no) {
		return dao.select(no);
	}

	public int updatereview(Review b) {
		return dao.updatereview(b);
	}

	public int deletereview(int no) {
		return dao.deletereview(no);
	}

	public List<Review> selectPage(Paging paging, String searchType, String searchKeyword) {
        paging.setOffset(paging.getLimit() * (paging.getPage() - 1));
        return dao.selectPage(paging, searchType, searchKeyword);
    }

    public int total(String searchType, String searchKeyword) {
        return dao.total(searchType, searchKeyword);
    }
}