package com.team2.danim.review;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.team2.danim.comm.CommMapper;
import com.team2.danim.comm.Comm_picture;
import com.team2.danim.comm.Comm_picture_reply;

@Service
public class reviewDAO {

	@Autowired
	SqlSession ss;
	
	public void getAllreview(HttpServletRequest req) {

		
		req.setAttribute("reviews", ss.getMapper(ReviewMapper.class).getAllReview());
		
	}


	/*public ReviewsAjaxDTO getTitleJSON(ReviewBean rb) {

		List<ReviewBean> reviewTitles =	ss.getMapper(ReviewMapper.class).getTitleJSON(rb);
		
		ReviewsAjaxDTO rbs = new ReviewsAjaxDTO(reviewTitles);
		
		return rbs;
	}*/

	public ReviewsAjaxDTO getfilterdByJSON(ReviewBean rb) {
List<ReviewBean> reviews =	ss.getMapper(ReviewMapper.class).getfilterdByJSON(rb);
		
		ReviewsAjaxDTO reviewsArr = new ReviewsAjaxDTO(reviews);
		
		return reviewsArr;

	}


	public void insertReview(MultipartHttpServletRequest req2) {
		// TODO Auto-generated method stub
		try {
			
			List<MultipartFile> fileList = req2.getFiles("d1Img");
			System.out.println(fileList);
			String strF = "";
			for(MultipartFile file : fileList) {
				long size = file.getSize();
				String fileName = file.getOriginalFilename();
				System.out.printf("fileName:%s, fileSize: %d\n", fileName, size);
				
				//랜덤파일명생성
				String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + fileName;
				
				String realPath = req2.getSession().getServletContext().getRealPath("resources/review/img");
				//System.out.println(realPath);
				
				File savePath = new File(realPath);
				if(!savePath.exists()) {
					savePath.mkdirs();
				}
				//파일저장
				realPath += File.separator +storedFileName;
				File saveFile = new File(realPath);
				file.transferTo(saveFile);
				
				strF += storedFileName +",";
				
				
				
			}
			System.out.println(strF);
			
			//System.out.println(picsName);
			
			ReviewBean rb = new ReviewBean();
			
			rb.setRb_title(req2.getParameter("title"));
			rb.setRb_text(req2.getParameter("totalText"));
			
			if(req2.getParameter("headNum").equals("direct")) {
				System.out.println("ㅅㄷㄴ");
				rb.setRb_headNum(req2.getParameter("selectBoxDirect"));
			}else {
				rb.setRb_headNum(req2.getParameter("headNum"));
				
			}
			rb.setRb_budget(req2.getParameter("budget"));
			rb.setRb_theme(req2.getParameter("theme"));
			rb.setRb_location(req2.getParameter("location"));
			rb.setRb_img(strF); 
			rb.setRb_username(req2.getParameter("writer"));
			rb.setRb_coordinate(req2.getParameter("coordinate"));
			rb.setRb_d1Schedule(req2.getParameter("d1Schedule"));
			rb.setRb_d1Text(req2.getParameter("d1Text"));
			rb.setRb_d2Schedule(req2.getParameter("d2Schedule"));
			rb.setRb_d2Text(req2.getParameter("d2Text"));
			rb.setRb_d3Schedule(req2.getParameter("d3Schedule"));
			rb.setRb_d3Text(req2.getParameter("d3Text"));
			rb.setRb_d4Schedule(req2.getParameter("d4Schedule"));
			rb.setRb_d4Text(req2.getParameter("d4Text"));
			rb.setRb_d5Schedule(req2.getParameter("d5Schedule"));
			rb.setRb_d5Text(req2.getParameter("d5Text"));
			rb.setRb_d6Schedule(req2.getParameter("d6Schedule"));
			rb.setRb_d6Text(req2.getParameter("d6Text"));
			rb.setRb_d7Schedule(req2.getParameter("d7Schedule"));
			rb.setRb_d7Text(req2.getParameter("d7Text"));
			rb.setRb_d8Schedule(req2.getParameter("d8Schedule"));
			rb.setRb_d8Text(req2.getParameter("d8Text"));
			rb.setRb_d9Schedule(req2.getParameter("d9Schedule"));
			rb.setRb_d9Text(req2.getParameter("d9Text"));
			rb.setRb_d10Schedule(req2.getParameter("d10Schedule"));
			rb.setRb_d10Text(req2.getParameter("d10Text"));
			rb.setRb_totalroute(req2.getParameter("totalRoute"));
			rb.setRb_totalday(req2.getParameter("totalday"));
		
			
			//System.out.println(rb.getRb_coordinate());
			if (ss.getMapper(ReviewMapper.class).insert(rb) == 1) {
				System.out.println("업로드성공");
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}


	public void getDetail(HttpServletRequest req) {
		// TODO Auto-generated method stub
		
		ReviewBean rb = new ReviewBean();
		
		rb.setRb_no(Integer.parseInt(req.getParameter("rb_no")));
		
		ReviewBean result = ss.getMapper(ReviewMapper.class).selectDetail(rb);
		req.setAttribute("result", result);
//		System.out.println("set성공");
		
		
		
		
	}
	
	//조회수
	public void viewPlus(ReviewBean rb, HttpServletRequest req) {
		
		try {
		String token = (String)req.getSession().getAttribute("token"); // 디테일 진입시 생성된 토큰 값
		
		System.out.println(token);
		
		String successToken = (String) req.getSession().getAttribute("successToken");
		System.out.println(successToken + "?????????????");
		
		if(successToken == token) {
			return;
		}

		
			System.out.println(req.getParameter("rb_no"));
			rb.setRb_no(Integer.parseInt(req.getParameter("rb_no")));
			if (ss.getMapper(ReviewMapper.class).viewPlus(rb)==1) {
				req.getSession().setAttribute("successToken", token);
				System.out.println("조회수증가 성공");
			}
			
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//댓글
	public void getReply(Review_reply rbr, HttpServletRequest req) {
		
		try {
			System.out.println(req.getParameter("rb_no"));
			
			rbr.setRbr_rb_no(Integer.parseInt(req.getParameter("rb_no")));
			req.setAttribute("reply", ss.getMapper(ReviewMapper.class).getReply(rbr));
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	public ReplysAjaxDTO wirteReplyByJSON(Review_reply rrp, ReviewBean rb) {
		// TODO Auto-generated method stub
		
		int writeSuccess = ss.getMapper(ReviewMapper.class).wirteReplyByJSON(rrp);
		
		if(writeSuccess ==1) {
			System.out.println("성공이니까 get실행");
			List<Review_reply> replys =ss.getMapper(ReviewMapper.class).getReply(rrp);
			ReplysAjaxDTO replysArr = new ReplysAjaxDTO(replys);
			//작성할 때 댓글숫자도 올려주기
			int commentCount =replysArr.getReplys().size();
			rb.setRb_no(rrp.getRbr_rb_no());
			rb.setRb_commentcount(commentCount);
			int repCountUp = ss.getMapper(ReviewMapper.class).repCountPlus(rb);
			
			if(repCountUp ==1) {
				System.out.println("댓글수 갱신성공");
			}
			
			return replysArr;
		}
		else {
			System.out.println("작성실패");
		return null;
				}
	}


	public ReplysAjaxDTO deleteReplyByJSON(Review_reply rrp, ReviewBean rb) {
		
		int deleteSuccess = ss.getMapper(ReviewMapper.class).deleteReplyByJSON(rrp);
		
		if(deleteSuccess ==1) {
			System.out.println("삭제성공이니까 get실행");
			List<Review_reply> replys =ss.getMapper(ReviewMapper.class).getReply(rrp);
			ReplysAjaxDTO replysArr = new ReplysAjaxDTO(replys);
			//삭제할 때 댓글숫자도 내려주기
			int commentCount =replysArr.getReplys().size();
			rb.setRb_no(rrp.getRbr_rb_no());
			rb.setRb_commentcount(commentCount);
			int repCountDown = ss.getMapper(ReviewMapper.class).repCountMinus(rb);
			
			if(repCountDown ==1) {
				System.out.println("댓글수 갱신성공");
			}
			
			return replysArr;
		}
		else {
			System.out.println("작성실패");
		return null;
				}
	}


	public void deleteReview(HttpServletRequest req) {
		ReviewBean rb = new ReviewBean();
		
		rb.setRb_no(Integer.parseInt(req.getParameter("rb_no")));
		
		int delR =ss.getMapper(ReviewMapper.class).deleteReivew(rb);
		
		if(delR == 1) {
		System.out.println("삭제성공");
		}
		}
	

}
