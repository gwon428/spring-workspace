package com.kh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.model.vo.Member;
import com.kh.service.MemberService;

// 어노테이션을 통한 bean 등록
@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;

	@GetMapping("allMember") /*@RequestMapping*/
	public String allMember(Model model) {
		List<Member> list = service.showAllMember();
		// request에 담았던 것을 model에 담는다!
		model.addAttribute("list", list);
		return "allMember";
		// /WEB-INF/views/allMember.jsp
	}
}
