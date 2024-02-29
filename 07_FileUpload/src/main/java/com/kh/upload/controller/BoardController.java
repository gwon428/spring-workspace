package com.kh.upload.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.upload.model.vo.Board;
import com.kh.upload.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;

	private String path = "D:\\upload\\";

	@PostMapping("/upload")
	public String upload(MultipartFile file) throws IllegalStateException, IOException {
		System.out.println("파일 사이즈 : " + file.getSize());
		System.out.println("파일 이름 : " + file.getOriginalFilename());
		System.out.println("파일 파라미터명 : " + file.getName());

		fileUpload(file);
		return "redirect:/";
	}

	@PostMapping("multiUpload")
	public String multiUpload(List<MultipartFile> files) throws IllegalStateException, IOException {
		for (MultipartFile file : files) {
			fileUpload(file);
		}
		return "redirect:/";
	}

	// 파일 업로드 기능을 하는 메서드
	public String fileUpload(MultipartFile file) throws IllegalStateException, IOException {

		// 중복 방지를 위한 UUID 적용
		UUID uuid = UUID.randomUUID();
		String filename = uuid.toString() + "_" + file.getOriginalFilename();

		// 경로에 파일 이름으로 파일 객체를 생성하겠다
		File copyFile = new File(path + filename);
		// 업로드한 파일이 지정한 path 위치로 저장
		file.transferTo(copyFile);

		return filename;
	}

	@GetMapping("/write")
	public void write() {
	}

	@PostMapping("/write")
	public String writeBoard(MultipartFile file, Board board) throws IllegalStateException, IOException {
		if (!board.getFile().isEmpty()) {
			String url = fileUpload(board.getFile());
			board.setUrl(url);
		}
		service.writeBoard(board);
		return "redirect:/view?no=" + board.getNo();
	}

	@GetMapping("/list")
	public String list(Model model, Board board) {
		List<Board> list = service.showAllText(board);
		model.addAttribute("list", list);
		return "/list";
	}

	@GetMapping("/view")
	public void view(Model model, String no) {
		model.addAttribute("vo", service.view(Integer.parseInt(no)));
	}

	@PostMapping("/update")
	public String updateBoard(Model model, Board board) throws IllegalStateException, IOException {
		
		if(!board.getFile().isEmpty()) {
			// board.getFile() --> 존재한다면? 수정 후 이미지 파일 --> 이미지 파일을 수정하겠다.
			
			if(board.getUrl() != null) {
				// board.getUrl() --> 존재한다면? 수정 전 이미지 파일
				// null이 아닌 경우가 기존 이미지가 존재하기 때문에 기존 이미지 삭제
				File file = new File(path + board.getUrl());
				file.delete();
			}
			
			String url=fileUpload(board.getFile());
			board.setUrl(url);
		} 
		model.addAttribute("vo", service.updateBoard(board));
		return "redirect:/view?no="+board.getNo();
	}

	@GetMapping("/delete")
	public String deleteBoard(String no) {
		// 업로드한 파일도 삭제
		int parsingNo = Integer.parseInt(no);
		Board b = service.view(parsingNo);
		if(b.getUrl()!=null) {
			File file = new File(path + b.getUrl());
			file.delete();
		}
		service.deleteBoard(parsingNo);
		return "redirect:/list";
	}

}
