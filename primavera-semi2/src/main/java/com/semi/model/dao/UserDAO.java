package com.semi.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

import com.semi.model.vo.Review;
import com.semi.model.vo.Paging;
import com.semi.model.vo.Pagingseven;
import com.semi.model.vo.Qna;
import com.semi.model.vo.User;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate session;

	
	// 카카오 로그인
	public void kakaoinsert(HashMap<String, Object> userInfo) {
		session.insert("userMapper.kakaoInsert", userInfo);
	}
	
	public User findkakao(HashMap<String, Object> userInfo) {
		return session.selectOne("userMapper.findkakao", userInfo);
	}
	
	public User check(String id) {
		return session.selectOne("userMapper.idCheck", id);
	}
	
	public User phonecheck(String phone) {
		return session.selectOne("userMapper.phoneCheck", phone);
	}
	
	public User emailcheck(String email) {
		return session.selectOne("userMapper.emailCheck", email);
	}
	
	public User checkUser(User user) {
		return session.selectOne("userMapper.userCheck", user);
	}
	
	public int registerUser(User user) {
		return session.insert("userMapper.registerUser", user);
	}
	
	public User getMemberById(String id) {
		return session.selectOne("userMapper.getMemberById", id);
	}
	
	public int updateCheck(String inputPwd) {
		return session.selectOne("userMapper.updateCheck", inputPwd);
	}
	
	public int updateUser(User user) {
		return session.update("userMapper.updateUser", user);
	}

	public int deleteUser(UserDetails userDetails) {
		return session.delete("userMapper.deleteUser", userDetails);
	}

	public List<User> showAllUser(Paging paging) {
		return session.selectList("userMapper.showAllUser", paging);
	}
	
	public int total() {
		return session.selectOne("userMapper.count");
	}
	
	public User findId(User user) {
		return session.selectOne("userMapper.findId", user);
	}
	
	public User checkEmail(User user) {
		return session.selectOne("userMapper.checkEmail", user);
	}
	
	
	// 내가 쓴 리뷰 리스트 출력
	public List<Review> showReview(Pagingseven paging){
		return session.selectList("reviewMapper.showReview", paging);
	}

	public int totalmyReview(String id) {
		return session.selectOne("reviewMapper.countmyReview", id);
	}
	
	// 내가 쓴 Q&A 리스트 출력
	public List<Qna> showQna(Pagingseven paging){
		return session.selectList("qnaMapper.showQna", paging);
	}
	
	public int totalmyQna(String id) {
		return session.selectOne("qnaMapper.countmyQna", id);
	}

	// 비밀번호 재설정
	public int updatePwd(User user) {
		return session.update("userMapper.updatePwd", user);
	}

	public List<User> showUsercolDate(Paging paging) {
		return session.selectList("userMapper.showUsercolDate", paging);
	}
	
	public List<User> showUserorderNum(Paging paging){
		return session.selectList("userMapper.showUserorderNum", paging);
	}

	
}
