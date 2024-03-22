package com.semi.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;


import com.semi.model.vo.Notice;
import com.semi.model.vo.Paging;
import com.semi.service.NoticeService;


@RequestMapping("/notice")
@Controller
public class NoticeController {

	// 파일 업로드 등록 !!
	private String path = "D:\\upload\\notice\\";

	@Autowired
	private NoticeService service;

	// =====================================================================

	// /notice/list
	@GetMapping("/list")  
	public String list(Model model, Paging paging) {
		// 데이터 바인딩 키 값
		model.addAttribute("noticeList", service.selectAll(paging));
		model.addAttribute("paging", new Paging(paging.getPage(), service.total()));
		// jsp파일 경로와 파일명 !!
		return "/notice/noticeList";
	};

	// =====================================================================

	// /notice/write
	@GetMapping("/write")
	public String noticeWrite() {
		return "notice/noticeWrite";
	};

	@PostMapping("/writeNotice")
	public String noticeWrite(Notice n) throws IllegalStateException, IOException {
		if (!n.getFile().isEmpty()) {
			// 업로드 처리 로직
			String url = noticeFileUpload(n.getFile());
			// 업로드된 경로 set으로 짚어넣어버리고
			n.setUrl(url);
		}
		service.insert(n);
		return "redirect:/notice/list";
	}

	// 파일 업로드 기능
	public String noticeFileUpload(MultipartFile file) throws IllegalStateException, IOException {

		// 중복 방지를 위한 UUID 적용
		UUID uuid = UUID.randomUUID();
		String filename = uuid.toString() + "_" + file.getOriginalFilename();

		File copyFile = new File(path + filename);
		file.transferTo(copyFile); // 업로드한 파일이 지정한 path 위치로 저장

		return filename;
	}
	
	
	
	@GetMapping("noticeView")
	public void view(String noticeNum, Model model) {
		Notice voo = service.select(Integer.parseInt(noticeNum));
		System.out.println("controller : " + service.select(Integer.parseInt(noticeNum)));
		System.out.println("controller geturl : " + voo.getUrl());
		model.addAttribute("vo", service.select(Integer.parseInt(noticeNum)));
	}
	
	
	
	@PostMapping("updateNotice")
	public String update(Notice n) throws IllegalStateException, IOException {
		if (!n.getFile().isEmpty()) {
			if (n.getUrl() != null) {
				File file = new File(path + n.getUrl());
				file.delete();
			}
			String url = noticeFileUpload(n.getFile());
			n.setUrl(url);
		}
		service.update(n);
		
		return "redirect:/notice/list";
	}

	@PostMapping("/upload")
	public String upload(MultipartFile file) throws IllegalStateException, IOException {
		System.out.println("파일 사이즈 : " + file.getSize());
		System.out.println("파일 이름 : " + file.getOriginalFilename());
		System.out.println("파일 파라미터명 : " + file.getName());

		noticeFileUpload(file);

		return "redirect:/";
	}
	
	
	
	
	
	// /notice/delete
	@GetMapping("deleteNotice")
	public String delete(String noticeNum) {
		int parsingNo = Integer.parseInt(noticeNum);
		System.out.println("parsingNo : " + parsingNo);
		// 업로드한 파일도 삭제!
		Notice n = service.select(parsingNo);

		if (n.getUrl() != null) {
			File file = new File(path + n.getUrl());
			file.delete();
		}
		
		service.delete(parsingNo);

		return "redirect:/notice/list";
	}
	
	
}