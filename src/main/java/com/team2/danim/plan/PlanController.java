package com.team2.danim.plan;


import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.team2.danim.Criteria3;
import com.team2.danim.TokenMaker;

@Controller
public class PlanController {
	
	@Autowired
	private PlanDAO pDAO;
	
	
	/*@RequestMapping(value = "/planMain", method = RequestMethod.GET)

	public String planMain(HttpServletRequest req) {
		TokenMaker.make(req);
		pDAO.getAllPlan(req);
		
		req.setAttribute("contentPage", "plan/planMain.jsp");
		return "home";
	}*/
	
	@RequestMapping(value = "/plan.page", method = RequestMethod.GET)
	public String PlanPage(HttpServletRequest req,Criteria3 cri3) {
		TokenMaker.make(req);
		pDAO.getPageMakerPlan(req, cri3);
		pDAO.getPlanPaging(req, cri3);
		
		req.setAttribute("contentPage", "plan/planMain.jsp");
		return "home";
		
	}
	
	
	@RequestMapping(value = "/plan.writePlanner", method = RequestMethod.GET)
	public String planWrite(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "plan/planWrite.jsp");
		return "home";

	}
	
	@RequestMapping(value = "/plan.writeReg", method = RequestMethod.POST)
	public String planWriteOK(MultipartHttpServletRequest req, Criteria3 cri3) {
		
		TokenMaker.make(req);
		pDAO.uploadPlan(req);
		
		pDAO.getPageMakerPlan(req, cri3);
		pDAO.getPlanPaging(req, cri3);
		
		req.setAttribute("contentPage", "plan/planMain.jsp");
		
		return "home";
	}
	
	
	@RequestMapping(value = "/plan.detailPlanner", method = RequestMethod.GET)
	public String planDetail(HttpServletRequest req) {
		
		TokenMaker.make(req);
		pDAO.getPlan(req);
		//pDAO.getHeart(req);
		
		req.setAttribute("contentPage", "plan/planDetail.jsp");
		
		return "home";
	}
	
	@RequestMapping(value = "/plan.search", method = RequestMethod.GET)
	public String plan_search(HttpServletRequest req,Plan_write pw ,Criteria3 cri3) {
		
		pDAO.searchPlan(pw, req, cri3);
		
		req.setAttribute("contentPage", "plan/planMain.jsp");
		
		return "home";
	}
	
	
@RequestMapping(value = "/plan.delete", method = RequestMethod.GET)
public String planDelete(HttpServletRequest req,Criteria3 cri3) {
	TokenMaker.make(req);
	
	pDAO.deletePlan(req);
	pDAO.getPageMakerPlan(req, cri3);
	pDAO.getPlanPaging(req, cri3);
	
	req.setAttribute("contentPage", "plan/planMain.jsp");
	return "home";
	

	

}

}
