package com.semi.model.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class QnaAnswer {
	private int qnaNum;
	private String id;
	private String content;
	private String url;
	private Date answerDate;
	
	private boolean delImg;
	private MultipartFile file;
}
