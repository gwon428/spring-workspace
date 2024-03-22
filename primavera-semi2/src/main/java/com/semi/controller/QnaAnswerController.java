package com.semi.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.semi.model.vo.Qna;
import com.semi.model.vo.QnaAnswer;
import com.semi.service.QnaAnswerService;
import com.semi.service.QnaService;

@Controller
public class QnaAnswerController {
	
	@Autowired
	private QnaAnswerService service;

	@Autowired
	private QnaService qnaService;
	
	private String path = "D:\\upload\\qnaAnswer\\";
	
	// 파일 업로드
	public String fileUploads(MultipartFile file) throws IllegalStateException, IOException {	
	// 중복 방지를 위한 UUID 적용
		UUID uuid = UUID.randomUUID();
		String filename = uuid.toString() + "_" + file.getOriginalFilename();
				
		File copyFile = new File(path + filename);
		file.transferTo(copyFile);  // 업로드한 파일이 지정한 path 위치로 저장
				
		return filename;
	}
	
	// insert
	@GetMapping("writeAnswer")
	public String insert(int qnaNum, Model model) {
		model.addAttribute("qna", qnaNum);
		Qna qna = qnaService.select(qnaNum);
		model.addAttribute("qnaView", qna);
		return "qnaAnswer/insertQnaAnswer";
	}
	
	
	@PostMapping("insertAnswer")
	public String insertAnswer(QnaAnswer qnaAnswer) throws IllegalStateException, IOException {
		System.out.println("qnaAnswer : " + qnaAnswer);
		
		if(!qnaAnswer.getFile().isEmpty()) {
			String url = fileUploads(qnaAnswer.getFile());
			qnaAnswer.setUrl(url);
		}
		service.insertQnaAnswer(qnaAnswer);
		service.updateStatus(qnaAnswer.getQnaNum());
		return "redirect:/viewQna?qnaNum="+qnaAnswer.getQnaNum();
	}
	
	
	// select
	//@GetMapping("viewAnswer")
//	public String selectQnaAnswer(int qnaNum, Model model) {
//		//int qnanum = Integer.parseInt(qnaNum);
//		QnaAnswer qnaAnswer = service.selectQnaAnswer(qnaNum);
//		model.addAttribute("qnaAnswer", qnaAnswer);
//		System.out.println("qnaAnswer : " + qnaAnswer.getContent());
//		return "qnaAnswer/viewAnswer";
//	}
	
	
	//수정(update)
	@GetMapping("updateQnaAnswer")
	public String updateQna(Model model, String qnaNum) {
		int answerNum = Integer.parseInt(qnaNum);
		//model.addAttribute("qnaAnswer", answerNum );
		QnaAnswer qnaAnswer = service.selectQnaAnswer(answerNum);
		model.addAttribute("qnaAnswer", qnaAnswer);
		// 질문 바인딩
		model.addAttribute("qnaView", qnaService.select(answerNum));
		return "qnaAnswer/updateQnaAnswer";
	}
		
	@PostMapping("updateAnswer")
		public String update(QnaAnswer qnaAnswer) throws IllegalStateException, IOException {
		
		/*
		if(!qnaAnswer.getFile().isEmpty()) {
				if(qnaAnswer.getUrl()!=null) {
					File file = new File(path+qnaAnswer.getUrl());
					file.delete();
				}
				String url = fileUploads(qnaAnswer.getFile());
				qnaAnswer.setUrl(url);
			}
		*/
		
		if(!qnaAnswer.getFile().getOriginalFilename().equals("")) {
			String url = fileUploads(qnaAnswer.getFile());
			qnaAnswer.setUrl(url);
		} else if(qnaAnswer.isDelImg()) {
			// 이미지 삭제했을 경우
			File file = new File(path+qnaAnswer.getUrl());
			file.delete();
			qnaAnswer.setUrl(null);	
		} 
			service.updateQnaAnswer(qnaAnswer);
		
			return "redirect:/viewQna?qnaNum="+qnaAnswer.getQnaNum();
		}
	
	
	// 삭제(delete)
	 @GetMapping("/deleteQnaAnswer")
		public String delete(String qnaNum) {
			
			int parsingNo = Integer.parseInt(qnaNum);
			
			// 업로드한 파일도 삭제! 필요!!!!
			// 필요한 정보 가져오기
			QnaAnswer qnaAnswer = service.selectQnaAnswer(parsingNo);
			if(qnaAnswer.getUrl()!=null) {
				// url이 null이 아닌 경우 정보 삭제!
				File file = new File(path+qnaAnswer.getUrl());
				file.delete();
			}
			
			// 삭제
			service.deleteQnaAnswer(parsingNo);
			service.updateStatusDelete(parsingNo);
			return "redirect:/viewQna?qnaNum="+qnaAnswer.getQnaNum();
		} 
	  
	
}
