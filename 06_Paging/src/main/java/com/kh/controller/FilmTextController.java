package com.kh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.model.vo.FilmText;
import com.kh.model.vo.Paging;
import com.kh.service.FilmTextService;

@Controller
public class FilmTextController {

	@Autowired
	private FilmTextService service;
	
	@GetMapping("/list")
	public String allText(Model model, Paging paging) {
		List<FilmText> list = service.showAllText(paging);
		model.addAttribute("list", list);
		model.addAttribute("paging", new Paging(paging.getPage(), service.total()));
		return "list";
	}
	
	
}
