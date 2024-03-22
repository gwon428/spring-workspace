package com.semi.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Paging {

	private String keyword;
	private String select;

	private int page = 1;
	private int offset = 0;
	private int limit = 10;
	private int pageSize = 10;
	private int endPage;
	private int startPage;
	private int total;

	private String searchType;
	private String searchKeyword;

	private int sorts;

	private boolean prev;
	private boolean next;

	private String sort = "dateDesc";

	public Paging(int page, int total) {
		this.page = page;
		this.total = total;
	
		int totalPages = (int) Math.ceil((double) total / this.limit);

		this.startPage = ((page - 1) / pageSize) * pageSize + 1;

		this.endPage = Math.min(startPage + pageSize - 1, totalPages);
	
		this.prev = this.startPage > 1;
		this.next = this.endPage < totalPages;
	}
}
