package com.kh.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.model.dao.MemberDAO;
import com.kh.model.dto.SearchDTO;
import com.kh.model.vo.Member;

@Service 	// 페이징 처리도 Service에서!
public class MemberService {
	// 비즈니스 로직을 처리하는 메서드
	
	@Autowired	// bean 등록 되어있는 것들에 바로 접근 가능하도록
	private MemberDAO dao;
	
	public List<Member> showAllMember(){
		return dao.showAllMember();
	}
	
	public int registerMember(Member vo) {
		return dao.registerMember(vo);
	}
	
	public Member signIn(Member vo) {
		return dao.signIn(vo);
	}
	
	public int updateMember(Member vo) {
		return dao.update(vo);
	}

	public List<Member> findMember(String keyword, String select) {
		SearchDTO dto = new SearchDTO();
		dto.setKeyword(keyword);
		dto.setSelect(select);
		return dao.findMember(dto);
	}
	
	public List<Member> findMember2(String[] checkId){
		// list로 받고있기 때문에 service에서 받는 배열을 넣을 수 없음 -> list로 변환
		List<String> idList = Arrays.asList(checkId);
		return dao.findMember2(idList);
	}
	
}
