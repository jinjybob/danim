package com.team2.danim;

public class Criteria2 {
	   /* 현재 페이지 */
    	private int pageNum;
    
	    /* 한 페이지 당 보여질 게시물 갯수 */
	    private int amount;
	    
	    
	    /* 기본 생성자 -> 기봅 세팅 : pageNum = 1, amount = 10 */
	    public Criteria2() {
	        this(1,10);
	    }
	    
	    /* 생성자 => 원하는 pageNum, 원하는 amount */
	    public Criteria2(int pageNum, int amount) {
	        this.pageNum = pageNum;
	        this.amount = amount;
	    }
	 

		public int getPageNum() {
			return pageNum;
		}

		public void setPageNum(int pageNum) {
			
			this.pageNum = pageNum;
		}

		public int getAmount() {
			return amount;
		}

		public void setAmount(int amount) {
			this.amount = amount;
		}

		@Override
		public String toString() {
			return "Criteria [pageNum=" + pageNum + ", amount=" + amount + "]";
		}
		
		
	    
	    
}
