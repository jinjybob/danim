package com.team2.danim.review;

import java.util.List;

public class ReviewsAjaxDTO {
	
	private List<ReviewBean> reviews;

	public ReviewsAjaxDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReviewsAjaxDTO(List<ReviewBean> reviews) {
		super();
		this.reviews = reviews;
	}

	public List<ReviewBean> getReviews() {
		return reviews;
	}

	public void setReviews(List<ReviewBean> reviews) {
		this.reviews = reviews;
	}

	



	
	
	

}
