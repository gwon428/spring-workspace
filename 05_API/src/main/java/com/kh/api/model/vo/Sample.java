package com.kh.api.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Sample {
	private int sampleCode;
	private String name;
	private String addr;
	private String outline;
	private String useHour;
	private Date startDate;
	private Date endDate;
	private String detail;
}
