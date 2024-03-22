package com.semi.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Collect {
	private int orderNum;
	private String id;
	private String name;
	private String phone;
	private int postCode;
	private String roadAddress;
	private String detailAddress;
	private Date collectionDate;
	private String doorPwd;
	private String request;
	private String prog;
	private int kg;
}
