package com.semi.coupang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.coupang.model.vo.Pick;
import com.semi.coupang.model.vo.Product;
import com.semi.coupang.service.PickService;
import com.semi.coupang.service.ProductService;

@Controller
public class PageController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private PickService pickService;

	@GetMapping("detail")
	public String detail(String code, Model model) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails user = (UserDetails) principal;
		
		
		Product product = productService.select(Integer.parseInt(code));
		model.addAttribute("product", product);
		
		// 상품코드, 아이디
		Pick vo = new Pick();
		vo.setProdCode(Integer.parseInt(code));
		vo.setId(user.getUsername());
		Pick pick = pickService.select(vo);
		model.addAttribute("pick", pick);
		
		return "detail";
	}
	
	@ResponseBody
	@PostMapping("/addPick")
	public boolean addPick(String code) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails user = (UserDetails) principal;
		
		Pick vo = new Pick();
		vo.setProdCode(Integer.parseInt(code));
		vo.setId(user.getUsername());
		
		// 찜 추가
		pickService.insert(vo);
		
		return true;
	}
	
	@ResponseBody
	@PostMapping("/delPick")
	public boolean delPick(String code) {
		
		pickService.delete(Integer.parseInt(code));
		
		return true;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
