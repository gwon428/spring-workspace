package com.semi.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Pagingseven {

	private String id;
	
	private int page = 1;
	private int offset = 0;
	private int limit = 7;
	private int pageSize = 10;
	private int endPage;
	private int startPage;
	private int total;

	private boolean prev;
	private boolean next;

	public Pagingseven(int page, int total) {

		this.page = page;
		this.endPage = (int) (Math.ceil((double) page / this.pageSize)) * this.pageSize;
		this.startPage = this.endPage - this.pageSize + 1;

		// ex > 100개의 공지사항은 끝쪽수로 나눈게 우리는 라스트 페이지인거다 !
		int lastPage = (int) (Math.ceil((double) total / this.limit));

		if (lastPage < this.endPage) {
			this.endPage = lastPage;
		}

		this.prev = this.startPage > 1;
		this.next = this.endPage < lastPage;
	}

}

