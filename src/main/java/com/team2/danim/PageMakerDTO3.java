package com.team2.danim;

public class PageMakerDTO3 {

	/* 시작 페이지 */
	private int startPage;
	
	/* 끝 페이지 */
	private int endPage;
	
	/* 이전 페이지, 다음 페이지 존재유무 */
	private boolean prev, next;
	
	/*전체 게시물 수*/
	private int total;
	
	/* 현재 페이지, 페이지당 게시물 표시수 정보 */
	private Criteria3 cri3;	
	
	/* 생성자 */
	public PageMakerDTO3(Criteria3 cri3, int total) {
		
		this.cri3 = cri3;
		this.total = total;
		
		/* 마지막 페이지 */
		this.endPage = (int)(Math.ceil(cri3.getPageNum()/10.0))*10;
		
		/* 시작 페이지 */
		this.startPage = this.endPage - 9;
		
		/* 전체 마지막 페이지 */
		int realEnd = (int)(Math.ceil(total * 1.0/cri3.getAmount()));
		
		/* 전체 마지막 페이지(realend)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정 */
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		/* 시작 페이지(startPage)값이 1보다 큰 경우 true */
		this.prev = this.startPage > 1;
		
		/* 마지막 페이지(endPage)값이 1보다 큰 경우 true */
		this.next = this.endPage < realEnd;
		
		
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Criteria3 getCri() {
		return cri3;
	}

	public void setCri(Criteria3 cri3) {
		this.cri3 = cri3;
	}

	@Override
	public String toString() {
		return "PageMakerDTO3 [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", cri3=" + cri3 + "]";
	}
	
	
	
}
	