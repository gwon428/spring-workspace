package com.semi.coupang.model.vo;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Category {
	private int cateCode;
	private String cateIcon;
	private String cateName;
	private String careUrl;
	
	// join한 하위 컬럼
	private int subCode;
	private String subName;
	
	
	private List<Category> subList;
	
	
	/*셀프조인 (대댓글)
	 	댓글
	 		대댓글
	 		
	 	댓글, 대댓글 테이블 따로 <- 댓글에는 id, 대댓글에는 id(부모id)가 연결된 컬럼만 있으면 가능
	  */
}
