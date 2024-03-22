package com.semi.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.semi.model.vo.Review;
import com.semi.model.vo.Paging;
import com.semi.service.ReviewService;

@Controller
public class ReviewController {

	private String path = "D:\\upload\\review\\";

	@Autowired
	private ReviewService service;

	@GetMapping("/review/write")
	public void write() {
	}

	@PostMapping("/review/write")
	public String write(Review b) throws IllegalStateException, IOException {

		// 로그인 아이디 받아오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		b.setId(userDetails.getUsername());

		System.out.println("review  : " + b);
		if (b == null || b.getFile() == null) {
			System.out.println("Error: Review 객체 또는 파일이 null입니다.");
			return "redirect:/error";
		}

		if (!b.getFile().isEmpty()) {
			String url = fileUploadreview(b.getFile());
			b.setUrl(url);
		}
		service.insert(b);
		return "redirect:/review/view?no=" + b.getNo();
	}

	@GetMapping("/review/list")
	public String list(Model model, 
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "sort", defaultValue = "dateDesc") String sort,
			@RequestParam(value = "searchType", required = false) String searchType,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword) throws UnsupportedEncodingException {

		int total = service.total(searchType, searchKeyword);
		Paging paging = new Paging(page, total);
		paging.setSort(sort);

		List<Review> boardList = service.selectPage(paging, searchType, searchKeyword);
		model.addAttribute("list", boardList);
		model.addAttribute("paging", paging);

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		boolean isLoggedIn = authentication != null && authentication.isAuthenticated()
				&& !(authentication instanceof AnonymousAuthenticationToken);
		model.addAttribute("isLoggedIn", isLoggedIn);

		// 검색 조건을 model에 추가
		model.addAttribute("searchType", searchType);
		String encodedSearchKeyword = "";
		if (searchKeyword != null && !searchKeyword.isEmpty()) {
			encodedSearchKeyword = URLEncoder.encode(searchKeyword, StandardCharsets.UTF_8.toString());
		}
		model.addAttribute("encodedSearchKeyword", encodedSearchKeyword);

		return "review/list";
	}

	@GetMapping("/review/view")
	public String view(String no, Model model) {
		// 현재 로그인한 사용자의 아이디 가져오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String currentLoggedInUserId = "";
		if (principal instanceof UserDetails) {
			currentLoggedInUserId = ((UserDetails) principal).getUsername();
		} else {
			currentLoggedInUserId = principal.toString();
		}
		// 모델에 현재 로그인한 사용자의 아이디 추가
		model.addAttribute("currentUserId", currentLoggedInUserId);
		// 게시물 정보를 모델에 추가
		model.addAttribute("vo", service.select(Integer.parseInt(no)));
		return "review/view";
	}

	@PostMapping("/updatereview")
	public String update(Review b, @RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes)
			throws IllegalStateException, IOException {
		if (!file.isEmpty()) {
			// 새 이미지 파일 업로드
			String newUrl = fileUploadreview(file);
			// 새로운 이미지 URL을 Review 객체에 설정
			b.setUrl(newUrl);
		} else {
			// 파일이 제공되지 않은 경우, 기존 URL을 유지
			b.setUrl(b.getUrl());
		}

		service.updatereview(b);
		return "redirect:/review/view?no=" + b.getNo();
	}

	@PostMapping("/uploadreview")
	public String upload(MultipartFile file) throws IllegalStateException, IOException {
		System.out.println("파일 사이즈 : " + file.getSize());
		System.out.println("파일 이름 : " + file.getOriginalFilename());
		System.out.println("파일 파라미터명 : " + file.getName());

		fileUploadreview(file);

		return "redirect:/";
	}

	@GetMapping("/deletereview")
	public String delete(String no) {
		int parsingNo = Integer.parseInt(no);
		Review b = service.select(parsingNo);
		if (b.getUrl() != null) {
			File file = new File(path + b.getUrl());
			file.delete();
		}
		service.deletereview(parsingNo);
		return "redirect:/review/list";
	}

	@PostMapping("/multiUploadreview")
	public String multiUpload(List<MultipartFile> files) throws IllegalStateException, IOException {
		for (MultipartFile file : files) {
			fileUploadreview(file);
		}
		return "redirect:/";
	}

	@GetMapping("/error")
	public String errorPage() {
		return "/error";
	}

	// 파일 업로드
	public String fileUploadreview(MultipartFile file) throws IllegalStateException, IOException {
		UUID uuid = UUID.randomUUID();
		String filename = uuid.toString() + "_" + file.getOriginalFilename();

		File copyFile = new File(path + filename);
		file.transferTo(copyFile);

		return filename;
	}
}