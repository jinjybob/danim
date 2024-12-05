package com.team2.danim;

public class Criteria {
	   /* 현재 페이지 */
    	private int pageNum;
    
	    /* 한 페이지 당 보여질 게시물 갯수 */
	    private int amount;
	    
	    	
	    public Criteria() {
	        this(1,6);
	    }
	    
	    /* 생성자 => 원하는 pageNum, 원하는 amount */
	    public Criteria(int pageNum, int amount) {
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
