package com.team2.danim.plan;

import java.util.List;
import java.util.Map;
import com.team2.danim.Criteria3;

public interface PlanMapper {

	//게시물 등록
	int uploadPlan(Plan_write pw);

	
	//게시물 전체 조회
	List<Plan_write> getAllPlan();
	
	//게시물 한개 조회
	Plan_write getPlan(int p_no);

	
	//페이징
	public int getTotalPlan();
	
	
	//페이징
	public List<Plan_write> getPlanPaging(Criteria3 cri3);

	
	//제목 검색수
	public int getp_searchTitle(Plan_write pw);
	//제목검색
	public List<Plan_write> p_searchTitle(Map<String, String> map);

	
	//장소 검색수
	public int getPlaceCount(Plan_write pw);
	//장소검색
	public List<Plan_write> p_searchPlace(Map<String, String> map);

	
	//전체 검색수
	public int getPlaceTitleCount(Plan_write pw);
	//전체 검색
	public List<Plan_write> p_searchAll(Map<String, String> map);

	//게시글 삭제
	int deletePlan(int p_no);

	

}
