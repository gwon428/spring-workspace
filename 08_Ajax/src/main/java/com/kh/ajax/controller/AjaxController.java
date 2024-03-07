package com.kh.ajax.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ajax.model.vo.Member;
import com.kh.ajax.service.MemberService;

@Controller
public class AjaxController {

	private int count = 0;
	
	@Autowired
	private MemberService service;
	
	@ResponseBody	// 응답 자체?
	@GetMapping("/count")
	public int count() {
		System.out.println("ajax로 요청이 들어옴!");
		return ++count;
	}
	
	@ResponseBody		// 이걸 하지 않으면 .jsp를 찾음
	@GetMapping("/encoding")
	public String encoding(String nick) {
		System.out.println("encoding...");
		return nick;
	}
	
	@ResponseBody
	@PostMapping("/check")
	public boolean check(String id) {
		Member member = service.idCheck(id);
		if(member == null) return false;
		return true;
	}
	
	@ResponseBody
	@PostMapping("/serial")
	public Member serial(Member member) {
		System.out.println(member);
		service.register(member);
		return member;
	}
}
