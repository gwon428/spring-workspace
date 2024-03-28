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

	/*------------------------------------------ 로그인 ------------------------------------------*/
	// 로그인
	public User getMemberById(String id) {
		return session.selectOne("userMapper.getMemberById", id);
	}

	// 카카오 로그인
	public void kakaoinsert(HashMap<String, Object> userInfo) {
		session.insert("userMapper.kakaoInsert", userInfo);
	}

	public User findkakao(HashMap<String, Object> userInfo) {
		return session.selectOne("userMapper.findkakao", userInfo);
	}

	/*------------------------------------------ 회원가입 ------------------------------------------*/
	// 아이디 중복 체크
	public User check(String id) {
		return session.selectOne("userMapper.idCheck", id);
	}

	// 전화번호 중복 체크
	public User phonecheck(String phone) {
		return session.selectOne("userMapper.phoneCheck", phone);
	}

	// 이메일 중복 체크
	public User emailcheck(String email) {
		return session.selectOne("userMapper.emailCheck", email);
	}

	// 회원 정보 수정 시 본인일 경우 확인 (전화번호, 이메일 중복 가능하게)
	public User checkUser(User user) {
		return session.selectOne("userMapper.userCheck", user);
	}

	// 회원가입
	public int registerUser(User user) {
		return session.insert("userMapper.registerUser", user);
	}

	/*------------------------------------------ 회원 정보 수정 ------------------------------------------*/
	// 비밀번호 확인
	public int updateCheck(String inputPwd) {
		return session.selectOne("userMapper.updateCheck", inputPwd);
	}

	// 회원 정보 수정
	public int updateUser(User user) {
		return session.update("userMapper.updateUser", user);
	}

	/*------------------------------------------ 회원 탈퇴 ------------------------------------------*/
	// 회원 탈퇴
	public int deleteUser(UserDetails userDetails) {
		return session.delete("userMapper.deleteUser", userDetails);
	}


	/*------------------------------------------ 비회원 ------------------------------------------*/
	// 아이디 찾기
	public User findId(User user) {
		return session.selectOne("userMapper.findId", user);
	}

	// 이메일 인증
	public User checkEmail(User user) {
		return session.selectOne("userMapper.checkEmail", user);
	}

	// 비밀번호 재설정
	public int updatePwd(User user) {
		return session.update("userMapper.updatePwd", user);
	}
	
	/*------------------------------------------ 관리자 ------------------------------------------*/
	// 전체 회원 조회
	public List<User> showAllUser(Paging paging) {
		return session.selectList("userMapper.showAllUser", paging);
	}

	// 전체 회원 조회 total
	public int total() {
		return session.selectOne("userMapper.count");
	}

	/*------------------------------------------  수거 신청 현황 ------------------------------------------*/
	// 수집일 순 정렬
	public List<User> showUsercolDate(Paging paging) {
		return session.selectList("userMapper.showUsercolDate", paging);
	}

	// 주문번호 순 정렬
	public List<User> showUserorderNum(Paging paging) {
		return session.selectList("userMapper.showUserorderNum", paging);
	}
	
	/*------------------------------------------ 회원 ------------------------------------------*/
	// 내가 쓴 review 조회
	public List<Review> showReview(Pagingseven paging) {
		return session.selectList("reviewMapper.showReview", paging);
	}

	// 내가 쓴 review total
	public int totalmyReview(String id) {
		return session.selectOne("reviewMapper.countmyReview", id);
	}

	// 내가 쓴 Q&A 조회
	public List<Qna> showQna(Pagingseven paging) {
		return session.selectList("qnaMapper.showQna", paging);
	}

	// 내가 쓴 qna total
	public int totalmyQna(String id) {
		return session.selectOne("qnaMapper.countmyQna", id);
	}

}