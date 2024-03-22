package com.semi.model.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Review {

	private int no;
	private String id;
	private String title;
	private String content;
	private int orderNum;
	private Date date;
	private String url;
	private int rating;

	private MultipartFile file;
}