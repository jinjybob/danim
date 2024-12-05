package com.team2.danim.comm;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team2.danim.Criteria;
import com.team2.danim.Criteria2;
import com.team2.danim.TokenMaker;



@Controller	
public class CommController {
	
	@Autowired
	private CommDAO cDAO;
	
	

	@RequestMapping(value = "/comm_picture_page", method = RequestMethod.GET)
	public String comm_picture_page(HttpServletRequest req,Criteria cri) {
		TokenMaker.make(req);
		cDAO.getPageMaker(req, cri);
		cDAO.getCommPicturePaging(req, cri);
		cDAO.getGoodPicture(req);
		
		req.setAttribute("contentPage", "comm/comm_picture.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_page", method = RequestMethod.GET)
	public String comm_video_page(HttpServletRequest req,Criteria cri) {
		TokenMaker.make(req);
		cDAO.getPageMakerVideo(req, cri);
		cDAO.getCommVideoPaging(req, cri);
		cDAO.getGoodVideo(req);
		
		req.setAttribute("contentPage", "comm/comm_video.jsp");
		return "home";
		
	}

	

	@RequestMapping(value = "/comm_picture_write", method = RequestMethod.GET)
	public String comm_picture_write(HttpServletRequest req) {
		
		
		req.setAttribute("contentPage", "comm/comm_picture_write.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_write", method = RequestMethod.GET)
	public String comm_video_write(HttpServletRequest req) {
		
		
		req.setAttribute("contentPage", "comm/comm_video_write.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_free_write", method = RequestMethod.GET)
	public String comm_free_write(HttpServletRequest req) {
		
		
		req.setAttribute("contentPage", "comm/comm_free_write.jsp");
		return "home";
		
	}
	@RequestMapping(value = "/comm_import_write", method = RequestMethod.GET)
	public String comm_import_write(HttpServletRequest req) {
		
		
		req.setAttribute("contentPage", "comm/comm_import_write.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_upload", method = RequestMethod.POST)
	public String comm_picture_upload(HttpServletRequest req,Criteria cri,MultipartHttpServletRequest req2) {
		
		
		/*TokenMaker.make(req);*/		
		cDAO.upload(req,req2);
		cDAO.getPageMaker(req, cri);
		cDAO.getCommPicturePaging(req, cri);
		cDAO.getGoodPicture(req);
		
		req.setAttribute("contentPage", "comm/comm_picture.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_upload", method = RequestMethod.POST)
	public String comm_video_upload(HttpServletRequest req,Criteria cri,MultipartHttpServletRequest req2) {
		
		
		TokenMaker.make(req);
		cDAO.videoUpload(req,req2);
		cDAO.getPageMakerVideo(req, cri);
		cDAO.getCommVideoPaging(req, cri);
		cDAO.getGoodVideo(req);
		
		req.setAttribute("contentPage", "comm/comm_video.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_free_upload", method = RequestMethod.POST)
	public String comm_free_upload(HttpServletRequest req,Criteria2 cri2,MultipartHttpServletRequest req2) {
		
		
		TokenMaker.make(req);
		cDAO.freeUpload(req2,req);
		cDAO.getImport(req);
		cDAO.getFreePageMaker(req, cri2);
		cDAO.getCommFreePaging(req, cri2);
		
		req.setAttribute("contentPage", "comm/comm_free.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_import_upload", method = RequestMethod.POST)
	public String comm_import_upload(HttpServletRequest req,Criteria2 cri2,MultipartHttpServletRequest req2) {
		
		
		TokenMaker.make(req);
		cDAO.importUpload(req,req2);
		cDAO.getImport(req);
		cDAO.getFreePageMaker(req, cri2);
		cDAO.getCommFreePaging(req, cri2);
		
		req.setAttribute("contentPage", "comm/comm_free.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_detail", method = RequestMethod.GET)
	public String comm_picture_detail(HttpServletRequest req,Comm_picture cp,Comm_picture_reply cpr,Comm_Picture_good cpg) {
		cDAO.viewPlus(cp,req);
		cDAO.goodCheck(cpg, req, cp);
		cDAO.getReply(cpr,req);
		cDAO.getCommPicture2(cp,req);
		
		req.setAttribute("contentPage", "comm/comm_picture_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_reply_update", method = RequestMethod.GET)
	public String comm_picture_reply_update(HttpServletRequest req,Comm_picture cp,Comm_picture_reply cpr,Comm_Picture_good cpg) {
		
		cDAO.goodCheck(cpg, req, cp);
		cDAO.pictureReplyUpdate(cpr,req);
		cDAO.getReply(cpr,req);
		cDAO.getCommPicture2(cp,req);
		
		req.setAttribute("contentPage", "comm/comm_picture_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_reply_update", method = RequestMethod.GET)
	public String comm_video_reply_update(HttpServletRequest req,Comm_video cv,Comm_Video_reply cvr,Comm_Video_good cvg) {
		
		cDAO.goodVideoCheck(cvg, req, cv);
		cDAO.videoReplyUpdate(cvr,req);
		cDAO.getVideoReply(cvr,req);
		cDAO.getCommVideo2(cv,req);
		
		req.setAttribute("contentPage", "comm/comm_video_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_free_reply_update", method = RequestMethod.GET)
	public String comm_free_reply_update(HttpServletRequest req,Comm_free cf,Comm_free_reply cfr,Comm_free_good cfg) {
		
		cDAO.goodFreeCheck(cfg, req, cf);
		cDAO.freeReplyUpdate(cfr,req);
		cDAO.getFreeReply(cfr,req);
		cDAO.getCommFree2(cf,req);
		
		req.setAttribute("contentPage", "comm/comm_free_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_detail", method = RequestMethod.GET)
	public String comm_video_detail(HttpServletRequest req,Comm_video cv,Comm_Video_reply cvr,Comm_Video_good cvg) {
		
		cDAO.viewVideoPlus(cv,req);
		cDAO.goodVideoCheck(cvg, req, cv);
		cDAO.getVideoReply(cvr,req);
		cDAO.getCommVideo2(cv,req);
		
		req.setAttribute("contentPage", "comm/comm_video_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_free_detail", method = RequestMethod.GET)
	public String comm_free_detail(HttpServletRequest req,Comm_free cf,Comm_free_reply cfr,Comm_free_good cfg) {
		
		cDAO.viewFreePlus(cf,req);
		cDAO.goodFreeCheck(cfg, req, cf);
		cDAO.getFreeReply(cfr,req);
		cDAO.getCommFree2(cf,req);
		
		req.setAttribute("contentPage", "comm/comm_free_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_import_detail", method = RequestMethod.GET)
	public String comm_import_detail(HttpServletRequest req,Comm_import ci,Comm_import_reply cir) {
		
		cDAO.viewImportPlus(ci,req);
		cDAO.getImportReply(cir,req);
		cDAO.getCommImport2(ci,req);
		
		req.setAttribute("contentPage", "comm/comm_import_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_reply", method = RequestMethod.GET)
	public String comm_picture_reply(HttpServletRequest req,Comm_picture cp,Comm_picture_reply cpr) {
		
		TokenMaker.make2(req);
		cDAO.pictureReplyUpload(cpr,req);
		cDAO.getReply(cpr,req);
		cDAO.getCommPicture2(cp,req);
		
		req.setAttribute("contentPage", "comm/comm_picture_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_reply", method = RequestMethod.GET)
	public String comm_video_reply(HttpServletRequest req,Comm_video cv,Comm_Video_reply cvr) {
		
		TokenMaker.make2(req);
		cDAO.videoReplyUpload(cvr,req);
		cDAO.getVideoReply(cvr,req);
		cDAO.getCommVideo2(cv,req);
		
		req.setAttribute("contentPage", "comm/comm_video_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_free_reply", method = RequestMethod.GET)
	public String comm_free_reply(HttpServletRequest req,Comm_free cf,Comm_free_reply cfr) {
		
		TokenMaker.make2(req);
		cDAO.freeReplyUpload(cfr,req);
		cDAO.getFreeReply(cfr,req);
		cDAO.getCommFree2(cf,req);
		
		req.setAttribute("contentPage", "comm/comm_free_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_good", method = RequestMethod.GET)
	public String comm_picture_good(HttpServletRequest req,Comm_picture cp,Comm_picture_reply cpr,Comm_Picture_good cpg) {
		

		TokenMaker.make2(req);
		cDAO.goodPlus(cpg,req,cp);
		cDAO.goodCheck(cpg, req, cp);
		cDAO.getReply(cpr,req);
		cDAO.getCommPicture2(cp,req);
		
		req.setAttribute("contentPage", "comm/comm_picture_detail.jsp");
		return "home";
		
}

	@RequestMapping(value = "/comm_video_Nogood", method = RequestMethod.GET)
	public String comm_video_Nogood(HttpServletRequest req,Comm_video cv,Comm_Video_reply cvr,Comm_Video_good cvg) {
		
		TokenMaker.make2(req);
		cDAO.goodVideoMinus(cvg,req,cv);
		cDAO.goodVideoCheck(cvg, req, cv);
		cDAO.getVideoReply(cvr,req);
		cDAO.getCommVideo2(cv,req);
		
		req.setAttribute("contentPage", "comm/comm_video_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_good", method = RequestMethod.GET)
	public String comm_video_good(HttpServletRequest req,Comm_video cv,Comm_Video_reply cvr,Comm_Video_good cvg) {
		
		TokenMaker.make2(req);
		cDAO.goodVideoPlus(cvg,req,cv);
		cDAO.goodVideoCheck(cvg, req, cv);
		cDAO.getVideoReply(cvr,req);
		cDAO.getCommVideo2(cv,req);
		
		req.setAttribute("contentPage", "comm/comm_video_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_free_Nogood", method = RequestMethod.GET)
	public String comm_free_Nogood(HttpServletRequest req,Comm_free cf,Comm_free_reply cfr,Comm_free_good cfg) {
		
		TokenMaker.make2(req);
		cDAO.goodFreeMinus(cfg,req,cf);
		cDAO.goodFreeCheck(cfg, req, cf);
		cDAO.getFreeReply(cfr,req);
		cDAO.getCommFree2(cf,req);
		
		req.setAttribute("contentPage", "comm/comm_free_detail.jsp");
		return "home";
		
	}
	
	@RequestMapping(value = "/comm_free_good", method = RequestMethod.GET)
	public String comm_free_good(HttpServletRequest req,Comm_free cf,Comm_free_reply cfr,Comm_free_good cfg) {
		
		TokenMaker.make2(req);
		cDAO.goodFreePlus(cfg,req,cf);
		cDAO.goodFreeCheck(cfg, req, cf);
		cDAO.getFreeReply(cfr,req);
		cDAO.getCommFree2(cf,req);
		
		req.setAttribute("contentPage", "comm/comm_free_detail.jsp");
		return "home";
		
	}
	
	@RequestMapping(value = "/comm_picture_Nogood", method = RequestMethod.GET)
	public String comm_picture_Nogood(HttpServletRequest req,Comm_picture cp,Comm_picture_reply cpr,Comm_Picture_good cpg) {
		
		TokenMaker.make2(req);
		cDAO.goodMinus(cpg,req,cp);
		cDAO.goodCheck(cpg, req, cp);
		cDAO.getReply(cpr,req);
		cDAO.getCommPicture2(cp,req);
		
		req.setAttribute("contentPage", "comm/comm_picture_detail.jsp");
		return "home";
		
	}
	

	@RequestMapping(value = "/comm_picture_delete", method = RequestMethod.GET)
	public String comm_picture_delete(HttpServletRequest req,Comm_picture cp,Criteria cri) {
		
		
		cDAO.delPicture(cp,req);
		cDAO.getPageMaker(req, cri);
		cDAO.getCommPicturePaging(req, cri);
		cDAO.getGoodPicture(req);
		
		req.setAttribute("contentPage", "comm/comm_picture.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_delete", method = RequestMethod.GET)
	public String comm_video_delete(HttpServletRequest req,Comm_video cv,Criteria cri) {
		
		
		cDAO.delVideo(cv,req);
		cDAO.getPageMakerVideo(req, cri);
		cDAO.getCommVideoPaging(req, cri);
		cDAO.getGoodVideo(req);
		
		req.setAttribute("contentPage", "comm/comm_video.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_free_delete", method = RequestMethod.GET)
	public String comm_free_delete(HttpServletRequest req,Comm_free cf,Criteria2 cri2) {
		
		
		cDAO.delFree(cf,req);
		cDAO.getFreePageMaker(req, cri2);
		cDAO.getImport(req);
		cDAO.getCommFreePaging(req, cri2);
		
		
		req.setAttribute("contentPage", "comm/comm_free.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_import_delete", method = RequestMethod.GET)
	public String comm_import_delete(HttpServletRequest req,Comm_import ci,Criteria2 cri2) {
		
		
		cDAO.delImport(ci,req);
		cDAO.getFreePageMaker(req, cri2);
		cDAO.getImport(req);
		cDAO.getCommFreePaging(req, cri2);
		
		
		req.setAttribute("contentPage", "comm/comm_free.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_reply_delete", method = RequestMethod.GET)
	public String comm_picture_reply_delete(HttpServletRequest req,Comm_picture cp,Comm_picture_reply cpr) {
		
		
		cDAO.delPictureReply(cpr,req);
		cDAO.getReply(cpr,req);
		cDAO.getCommPicture2(cp,req);
		
		req.setAttribute("contentPage", "comm/comm_picture_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_reply_delete", method = RequestMethod.GET)
	public String comm_video_reply_delete(HttpServletRequest req,Comm_video cv,Comm_Video_reply cvr) {
		
		
		cDAO.delVideoReply(cvr,req);
		cDAO.getVideoReply(cvr,req);
		cDAO.getCommVideo2(cv,req);
		
		req.setAttribute("contentPage", "comm/comm_video_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_free_reply_delete", method = RequestMethod.GET)
	public String comm_free_reply_delete(HttpServletRequest req,Comm_free cf,Comm_free_reply cfr) {
		
		
		cDAO.delFreeReply(cfr,req);
		cDAO.getFreeReply(cfr,req);
		cDAO.getCommFree2(cf,req);
		
		req.setAttribute("contentPage", "comm/comm_free_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_update", method = RequestMethod.GET)
	public String comm_picture_update(HttpServletRequest req,Comm_picture cp) {
		
		
		cDAO.getCommPicture2(cp,req);
		
		
		req.setAttribute("contentPage", "comm/comm_picture_update.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_update", method = RequestMethod.GET)
	public String comm_video_update(HttpServletRequest req,Comm_video cv) {
		
		
		cDAO.getCommVideo2(cv,req);
		
		
		req.setAttribute("contentPage", "comm/comm_video_update.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_free_update", method = RequestMethod.GET)
	public String comm_video_update(HttpServletRequest req,Comm_free cf) {
		
		
		cDAO.getCommFree2(cf,req);
		
		
		req.setAttribute("contentPage", "comm/comm_free_update.jsp");
		return "home";
		
	}
	
	@RequestMapping(value = "/comm_picture_update_do", method = RequestMethod.POST)
	public String comm_picture_update_do(HttpServletRequest req,Comm_picture cp,MultipartHttpServletRequest req2) {
		
		
		cDAO.updatePicture(cp,req,req2);
		
		
		req.setAttribute("contentPage", "comm/comm_picture_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_update_do", method = RequestMethod.POST)
	public String comm_video_update_do(HttpServletRequest req,Comm_video cv,MultipartHttpServletRequest req2) {
		
		
		cDAO.updateVideo(cv,req,req2);
		
		
		req.setAttribute("contentPage", "comm/comm_video_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_free_update_do", method = RequestMethod.POST)
	public String comm_free_update_do(HttpServletRequest req,Comm_free cf,MultipartHttpServletRequest req2) {
		
		
		cDAO.updateFree(cf,req,req2);
		
		
		req.setAttribute("contentPage", "comm/comm_free_detail.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_picture_search", method = RequestMethod.GET)
	public String comm_picture_search(HttpServletRequest req,Comm_picture cp,Criteria cri) {
		
		cDAO.serachPicture(cp,req,cri);

		
		
		req.setAttribute("contentPage", "comm/comm_picture.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_video_search", method = RequestMethod.GET)
	public String comm_video_search(HttpServletRequest req,Comm_video cv,Criteria cri) {
		
		cDAO.searchVideo(cv,req,cri);
		
		
		
		req.setAttribute("contentPage", "comm/comm_video.jsp");
		return "home";
		
	}

	@RequestMapping(value = "/comm_free_search", method = RequestMethod.GET)
	public String comm_free_search(HttpServletRequest req,Comm_free cf,Criteria2 cri2) {
		
		cDAO.searchFree(cf,req,cri2);
		cDAO.getImport(req);
		
		
		req.setAttribute("contentPage", "comm/comm_free.jsp");
		return "home";
		
	}
	
	
	@RequestMapping(value = "/comm_video", method = RequestMethod.GET)
	public String comm_video(HttpServletRequest req) {
		TokenMaker.make(req);
		cDAO.getCommVideo(req);
		cDAO.getGoodVideo(req);
		req.setAttribute("contentPage", "comm/comm_video.jsp");
		
		return "home";
		
	}
	@RequestMapping(value = "/comm_free_page", method = RequestMethod.GET)
	public String comm_free(HttpServletRequest req,Criteria2 cri2) {
		
		TokenMaker.make(req);
		cDAO.getFreePageMaker(req, cri2);
		cDAO.getImport(req);
		cDAO.getCommFreePaging(req, cri2);
		req.setAttribute("contentPage", "comm/comm_free.jsp");
		
		return "home";

	}
	
	
	
}
