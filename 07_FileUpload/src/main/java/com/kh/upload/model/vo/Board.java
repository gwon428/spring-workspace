package com.kh.upload.model.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Board {

	private int no;
	private String title;
	private String content;
	private Date date;
	private String url;
	
	private MultipartFile file;
}
