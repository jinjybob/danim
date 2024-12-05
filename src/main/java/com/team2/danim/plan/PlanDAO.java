package com.team2.danim.plan;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.team2.danim.Criteria3;
import com.team2.danim.PageMakerDTO3;

@Service
public class PlanDAO {

	@Autowired
	private SqlSession ss;
	
	

	public void uploadPlan(MultipartHttpServletRequest req2) {

		String strF = "";

		try {
			MultipartFile mf = req2.getFile("p_titleFile");
			System.out.println(mf);
			
			long size = mf.getSize();
			String fileName = mf.getOriginalFilename();
			
			String token = req2.getParameter("token");
			String successToken = (String) req2.getSession().getAttribute("successToken");
			
			
			System.out.printf("fileName:%s, fileSize: %d\n", fileName, size);
			
			//랜덤파일명생성
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + fileName;
			
			String realPath = req2.getSession().getServletContext().getRealPath("resources/plan/p_file");
			System.out.println(realPath);
			
			File savePath = new File(realPath);
			if(!savePath.exists()) {
				savePath.mkdirs();
			}
			//파일저장
			realPath += File.separator +storedFileName;
			File saveFile = new File(realPath);
			mf.transferTo(saveFile);
			
			if (successToken != null && token.equals(successToken)) {
				strF += storedFileName +",";
				return;
			}
		
			//값가져오기
			String p_writer = req2.getParameter("p_writer");
			String p_title = req2.getParameter("p_title");
			int p_days = Integer.parseInt(req2.getParameter("p_days"));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String p_startDate = req2.getParameter("p_startDate");
			int p_person = Integer.parseInt(req2.getParameter("p_person"));
			String p_place = req2.getParameter("p_place");
			
			String[] p_plans = req2.getParameterValues("p_plan");
			String p_plan = new String();
			for (int i = 0; i < p_plans.length; i++) {
				p_plan += p_plans[i] + ",";
			}
			
			String p_budget = req2.getParameter("p_budget");
			String p_freeWrite = req2.getParameter("p_freeWrite");
			
			
			String[] p_setItems = req2.getParameterValues("p_setItem");
			String[] p_setTitles = req2.getParameterValues("p_setTitle");	
			String[] p_setPrices = req2.getParameterValues("p_setPrice");
			
			String item = "";
			String title = "";
			String price = "";
			for (int i = 0; i < p_setItems.length; i++) {
				item = item + p_setItems[i] + ",";
				title = title + p_setTitles[i] + ",";
				price = price + p_setPrices[i] + ",";
			}
			Plan_write pw = new Plan_write();
			pw.setP_setItem(item);
			pw.setP_setTitle(title);
			pw.setP_setPrice(price);
			
			
			
			//빈에 담기
			pw.setP_writer(p_writer);
			pw.setP_title(p_title);
			pw.setP_titleFile(storedFileName);
			pw.setP_days(p_days);
			pw.setP_startDate(sdf.parse(p_startDate));
			pw.setP_person(p_person);
			pw.setP_place(p_place);
			pw.setP_plan(p_plan);
			pw.setP_budget(p_budget);
			pw.setP_freeWrite(p_freeWrite);
			
			
			
			//확인용
			System.out.println("작성자(p_writer)::   " + p_writer);
			System.out.println("제목(p_title)::   " + p_title);
			System.out.println("사진(p_titleFile)::   " + storedFileName);
			System.out.println("박수(p_days)::   " + p_days);
			System.out.println("출발일(p_startDate)::   " + p_startDate);
			System.out.println("사람수(p_person)::   " + p_person);
			System.out.println("장소(p_place)::   " + p_place);
			System.out.println("일정(p_plan)::   " + p_plan);
			System.out.println("총예산(p_budget)::   " + p_budget);
			System.out.println("한마디(p_freeWrite)::   " + p_freeWrite);
			System.out.println("제목배열(setTitle)::   " + title);
			System.out.println("상품명배열(setItem)::   " + item);
			System.out.println("가격배열(setPrice)::   " + price);
			
			if (ss.getMapper(PlanMapper.class).uploadPlan(pw) == 1) {
				req2.getSession().setAttribute("successToken", token);
				/*req.setAttribute("pbs", pb);*/
				System.out.println("작성 성공");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("작성 실패");
		}

	}

	public void getAllPlan(HttpServletRequest req) {
		
		try {
			req.setAttribute("plans", ss.getMapper(PlanMapper.class).getAllPlan());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void getPlan(HttpServletRequest req) {
		
		try {
			
			int p_no = Integer.parseInt(req.getParameter("p_no"));
			Plan_write pw = ss.getMapper(PlanMapper.class).getPlan(p_no);
			req.setAttribute("plan", pw);
			String[] title = pw.getP_setTitle().split(",");
			String[] item = pw.getP_setItem().split(",");
			String[] price = pw.getP_setPrice().split(",");
			
			ArrayList<Plan_budget> budgets = new ArrayList<Plan_budget>();
			Plan_budget pb = null;
			for (int i = 0; i < title.length; i++) {
				pb = new Plan_budget();
				pb.setP_setTitle(title[i]);
				pb.setP_setItem(item[i]);
				pb.setP_setPrice(price[i]);
				budgets.add(pb);
				
			}
			req.setAttribute("budgets", budgets);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void getPageMakerPlan(HttpServletRequest req,Criteria3 cri3) {
		
		int total = ss.getMapper(PlanMapper.class).getTotalPlan();
		
		PageMakerDTO3 pageMake = new PageMakerDTO3(cri3, total);
		req.setAttribute("pageMaker", pageMake);
		
		System.out.println(pageMake.getEndPage());
		System.out.println(pageMake.getStartPage());
		System.out.println(pageMake.getTotal());
		System.out.println("페이지메이커 실행후");
	}

	
	public void getPlanPaging(HttpServletRequest req,Criteria3 cri3) {
		
		try {
				
			if(req.getParameter("pageNum") != null)
			{
				cri3.setPageNum(Integer.parseInt(req.getParameter("pageNum")));
				}
				req.setAttribute("plans", ss.getMapper(PlanMapper.class).getPlanPaging(cri3));
				System.out.println("불러온후");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	public void searchPlan(Plan_write pw, HttpServletRequest req, Criteria3 cri3) {
		
		String p_searchSelect = req.getParameter("p_searchSelect");
		req.getSession().setAttribute("p_searchSelect", p_searchSelect);
		
		System.out.println(req.getSession().getAttribute("p_searchSelect"));
		
		if(req.getParameter("pageNum") != null){
				cri3.setPageNum(Integer.parseInt(req.getParameter("pageNum")));
			}
		
		
		if (req.getSession().getAttribute("p_searchSelect").equals("p_searchTitle")) {
			try {
				String p_searchWrite = req.getParameter("p_searchWrite");
				System.out.println("검색어:" + p_searchWrite);
				
				pw.setP_title(p_searchWrite);
				
				int total = ss.getMapper(PlanMapper.class).getp_searchTitle(pw);
				System.out.println("카운트수" + total);
				
				PageMakerDTO3 pageMake = new PageMakerDTO3(cri3, total);
				req.setAttribute("pageMakerTitle", pageMake);
				Map<String, String> map = new HashMap<String, String>();
				map.put("p_searchWrite", req.getParameter("p_searchWrite"));
				map.put("amount",cri3.getAmount()+"");
				map.put("pageNum",cri3.getPageNum()+"");
				
				req.setAttribute("plans", ss.getMapper(PlanMapper.class).p_searchTitle(map));
				
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}
		else if (req.getSession().getAttribute("p_searchSelect").equals("p_searchPlace")) {
			
			try {
				System.out.println(req.getParameter("p_searchWrite"));
				
				pw.setP_place((req.getParameter("p_searchWrite")));
				
				int total = ss.getMapper(PlanMapper.class).getPlaceCount(pw);
				System.out.println("카운트수" + total);
				
				PageMakerDTO3 pageMake = new PageMakerDTO3(cri3, total);
				req.setAttribute("pageMakerTitle", pageMake);
				Map<String, String> map = new HashMap<String, String>();
				map.put("p_searchWrite", req.getParameter("p_searchWrite"));
				map.put("amount",cri3.getAmount()+"");
				map.put("pageNum",cri3.getPageNum()+"");
				
				
				req.setAttribute("plans", ss.getMapper(PlanMapper.class).p_searchPlace(map));
				
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}
		else if (req.getSession().getAttribute("p_searchSelect").equals("p_searchAll")) {
			
			System.out.println(req.getParameter("p_searchWrite"));
			
			pw.setP_place(req.getParameter("p_searchWrite"));
			pw.setP_title(req.getParameter("p_searchWrite"));
			
			int total = ss.getMapper(PlanMapper.class).getPlaceTitleCount(pw);
			
			
			PageMakerDTO3 pageMake = new PageMakerDTO3(cri3, total);
			req.setAttribute("pageMakerTitle", pageMake);
			Map<String, String> map = new HashMap<String, String>();
			map.put("p_searchWrite", req.getParameter("p_searchWrite"));
			map.put("amount",cri3.getAmount()+"");
			map.put("pageNum",cri3.getPageNum()+"");
			
			req.setAttribute("plans", ss.getMapper(PlanMapper.class).p_searchAll(map));
		}
	}

	public void deletePlan(HttpServletRequest req) {

		try {
			int p_no = Integer.parseInt(req.getParameter("p_no"));
			
			if (ss.getMapper(PlanMapper.class).deletePlan(p_no) == 1) {
				System.out.println("삭제성공");
			}else {
				System.out.println("삭제실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB에러");
		}
		
		
		
	}

	


	
	
	
	
}	
	
	
	
	
	
	
	
	
	
	
	
