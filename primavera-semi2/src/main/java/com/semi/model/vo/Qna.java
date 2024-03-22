package com.semi.model.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Qna {
	
	private int qnaNum;
	private String id;
	private String title;
	private String content;
	private Date writeDate;
	private String url;
	private String status;
	private String secret;
	
	private boolean delImg;
	private MultipartFile file;
}
