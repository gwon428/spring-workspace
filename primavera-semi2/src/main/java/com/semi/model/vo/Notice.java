package com.semi.model.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Notice {
	private int noticeNum;
	private String title;
	private String content;
	private String id;
	private String url;
	private Date writeDate;
	
	// 파일 업로드를 위한 !! vo
	private MultipartFile file;
}
