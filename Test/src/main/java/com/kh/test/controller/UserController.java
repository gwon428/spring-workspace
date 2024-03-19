package com.kh.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.test.model.vo.User;
import com.kh.test.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService service;
	
	@GetMapping("/search")
	public String search(String userNo, Model model) {
		User user = service.selectUser(userNo);
		if(user == null) {
			return "/searchFail";
		}
		model.addAttribute("user", user);
		return "/searchSuccess";
	}
	
}
