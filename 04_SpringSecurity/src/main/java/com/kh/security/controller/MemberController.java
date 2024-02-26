package com.kh.security.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.security.model.vo.Member;
import com.kh.security.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	//
	@GetMapping("/all")
	public void all() {}
	
	// 회원 페이지 이동
	@GetMapping("/member")
	public void member() {}
	
	// 에러 페이지 이동
	@GetMapping("/error")
	public void error() {}
	
	// 관리자 페이지로 이동
	@GetMapping("/admin")
	public void admin() {}
	
	// 로그인 페이지로 이동
	@GetMapping("/login")
	public void login() {}

	
	// 회원가입 페이지
	@GetMapping("/register")
	public void register() {}	// register.jsp 페이지로 이동
	
	// 회원가입 로직
	@PostMapping("/register")
	public String register(Member vo) {
		// 사용자한테 받은 정보 전달
		service.registerMember(vo);
		// security에서 제공하는 기본 login 창이 뜸 -> 이걸 나중에 수정
		return "redirect:/login";
	}
	
	
}
