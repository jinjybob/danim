package com.team2.danim.review;

import java.util.List;

public interface ReviewMapper {

	public List<ReviewBean> getAllReview();

	public List<ReviewBean> getTitleJSON(ReviewBean rb);

	public List<ReviewBean> getfilterdByJSON(ReviewBean rb);

	public int insert(ReviewBean rb);

	public ReviewBean selectDetail(ReviewBean rb);

	public int viewPlus(ReviewBean rb);

	public List<Review_reply> getReply(Review_reply rbr);

	public int wirteReplyByJSON(Review_reply rrp);

	public int repCountPlus(ReviewBean rb);

	public int deleteReplyByJSON(Review_reply rrp);

	public int repCountMinus(ReviewBean rb);

	public int deleteReivew(ReviewBean rb);



	
	
}
