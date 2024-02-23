package com.semi.coupang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

// 페이지 이동 처리 컨트롤러
@Controller
public class PageController {

	@GetMapping("detail")
	public String detail() {
		return "detail";
	}
	
}
