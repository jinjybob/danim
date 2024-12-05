package com.team2.danim.review;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team2.danim.TokenMaker;

@Controller
public class ReviewController {

		
		@Autowired
		reviewDAO reviewDAO;
	
		
		@RequestMapping(value = "/reviewinsert.do", method = RequestMethod.POST)
		public String reviewInsert(MultipartHttpServletRequest req2) {
			
			reviewDAO.insertReview(req2);
			reviewDAO.getAllreview(req2);
			req2.setAttribute("contentPage", "review/reviewMain.jsp");
			
			return "home";
		}
		@RequestMapping(value = "/review.go", method = RequestMethod.GET)
		public String goReviewMain(HttpServletRequest req) {
			TokenMaker.make(req);
			reviewDAO.getAllreview(req);
			req.setAttribute("contentPage", "review/reviewMain.jsp");
			
			return "home";
		}
		
		@RequestMapping(value = "/reviewWrite.go", method = RequestMethod.GET)
		public String goReviewWrite(HttpServletRequest req) {
			
			req.setAttribute("contentPage", "review/reviewWrite.jsp");
			
			
			return "home";
		}
		
		@RequestMapping(value = "/reviewDeatil.go", method = RequestMethod.GET)
		public String goReviewDetail(ReviewBean rb , Review_reply rbr ,HttpServletRequest req) {
			
			reviewDAO.viewPlus(rb,req);
			reviewDAO.getDetail(req);
			reviewDAO.getReply(rbr, req);
			req.setAttribute("contentPage", "review/reviewDetail2.jsp");
			
			
			return "home";
		}
		
		@RequestMapping(value = "/reviewUpload.do", method = RequestMethod.GET)
		public String doReviewupload(HttpServletRequest req) {
			
			
			
			req.setAttribute("contentPage", "review/reviewDetail.jsp");
			
			
			return "home";
		}
		@RequestMapping(value = "/deleteReview", method = RequestMethod.GET)
		public String deleteReview(HttpServletRequest req) {
			
			reviewDAO.deleteReview(req);
			reviewDAO.getAllreview(req);
			
			req.setAttribute("contentPage", "review/reviewMain.jsp");
			
			
			return "home";
		}
		
		
// 비동기로 선택메뉴 필터
		@RequestMapping(value = "/getfilterdByJSON", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
		public @ResponseBody ReviewsAjaxDTO getfilterdByJSON( ReviewBean rb ) {
			
			
			System.out.println( rb.getRb_budget());
			
			ReviewsAjaxDTO reviews = reviewDAO.getfilterdByJSON(rb);
			
			
			
			return reviews;

		}
		
		//댓글작성
		@RequestMapping(value = "/writeReplyByJSON", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
		public @ResponseBody ReplysAjaxDTO wirteReplyByJSON( Review_reply rrp, ReviewBean rb ) {
			
			
			
			ReplysAjaxDTO replys = reviewDAO.wirteReplyByJSON(rrp, rb);
			
			
			
			return replys;
			
		}
		
		//댓글삭제
		@RequestMapping(value = "/deleteReplyByJSON", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
		public @ResponseBody ReplysAjaxDTO deleteReplyByJSON( Review_reply rrp, ReviewBean rb ) {
			
			
			
			ReplysAjaxDTO replys = reviewDAO.deleteReplyByJSON(rrp, rb);
			
			
			
			return replys;
			
		}
		
}


