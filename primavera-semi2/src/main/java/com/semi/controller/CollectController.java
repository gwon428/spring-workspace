package com.semi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.model.vo.Collect;
import com.semi.model.vo.Paging;
import com.semi.model.vo.Pagingseven;
import com.semi.service.CollectService;

@Controller
public class CollectController {

	@Autowired
	private CollectService service;

	// 수거 페이지
	@GetMapping("collectPage")
	public String collectPage(Model model) {
		return "collect/collect";
	}

	/*----------------------------------------------------------*/

	// 관리자용 수거신청현황 페이지 (prog제외)

	@GetMapping("showAllCollect")
	public String showallCollect(Model model, Paging paging) {
		List<Collect> list = service.showorderby(paging);
		model.addAttribute("list", list);
		model.addAttribute("paging", new Paging(paging.getPage(), service.showAllCollecttotal()));
		return "collect/showallCollect";
	}

//		@ResponseBody
//		@GetMapping("showAllCollect")
//		public List<Collect> showorderby(Model model, Paging paging) {
//			List<Collect> list = service.showorderby(paging);
//			model.addAttribute("list", list);
//			model.addAttribute("paging", new Paging(paging.getPage(), service.showAllCollecttotal()));
//			System.out.println(list);
//			return list;
//		}

	// 회원용 진행상황 페이지용
	@GetMapping("showCollect")
	public String showCollect(Model model, Pagingseven paging) {
		List<Collect> list = service.showCollect(paging);
		model.addAttribute("list", list);
		model.addAttribute("paging", new Pagingseven(paging.getPage(), service.showCollecttotal()));
		return "collect/showCollect";
	}

	// 관리자용 - 회원 수거 신청 현황 변경 페이지
	@GetMapping("showProgress")
	public String showProgress(Model model, Paging paging) {
		List<Collect> progress = service.showProgress(paging);

		model.addAttribute("progress", progress);
		model.addAttribute("paging", new Paging(paging.getPage(), service.showProgresstotal()));

		return "collect/showProgress";
	}

	// update : 관리자용 progress 관리 페이지용 : prog 바꾸기
	@ResponseBody
	@PostMapping("update_ok")
	public String updateProgress(Collect collect) {
		System.out.println("신청들어옴");
		service.updateProgress(collect);
		return "collect";
	}

	/*----------------------------------------------------------*/
	// 수거 신청 페이지
	@GetMapping("registerCollect")
	public String registerCollect(Model model) {
		return "collect/registerCollect";
	}

	@PostMapping("signUpCollect")
	public String signUp(Collect vo) {
		service.registerCollect(vo);

		return "redirect:/showCollect";
	}

}
