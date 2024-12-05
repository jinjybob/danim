package com.team2.danim.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO mDAO;

	//로그인 처리

	@RequestMapping(value = "member.login", method = RequestMethod.POST)
	public String home(Member m, HttpServletRequest req) {
		
		// 로그인
		mDAO.login(m, req);
		req.setAttribute("contentPage", "index.jsp");
		return "home";
	}

	
	//로그아웃 처리
	@RequestMapping(value = "member.logout", method = RequestMethod.GET)
	public String logout(Member m, HttpServletRequest req) {
		
		mDAO.logout(req);
		req.setAttribute("contentPage", "index.jsp");
		return "home";
	}
	
	//회원가입
	@RequestMapping(value = "member.register", method = RequestMethod.POST)
	public String register(Member m, HttpServletRequest req) {
		
		mDAO.register(m, req);
		mDAO.login(m, req);
		req.setAttribute("contentPage", "index.jsp");
		
		return "home";
	}
	
	//마이페이지 이동
	@RequestMapping(value = "member.myPage", method = RequestMethod.GET)
	public String toMyPage(Member m, HttpServletRequest req) {
		req.setAttribute("contentPage", "member/myPage.jsp");
		
		
		return "home";
	}
	
	//회원 탈퇴
	@RequestMapping(value = "member.delete", method = RequestMethod.GET)
	public String deleteMember(HttpServletRequest req) {
		
		mDAO.deleteMember(req);
		mDAO.logout(req);
		req.setAttribute("contentPage", "index.jsp");
		return "home";
	}
	
	//회원 정보 수정 페이지 이동
	@RequestMapping(value = "member.update", method = RequestMethod.GET)
	public String toMemberUpdate(Member m, HttpServletRequest req) {
		
		req.setAttribute("contentPage", "member/myPage_update.jsp");
		return "home";
	}
	
	//회원 정보 수정
	@RequestMapping(value = "member.updateInfo", method = RequestMethod.POST)
	public String MemberUpdate(Member m, HttpServletRequest req) {
		mDAO.updateMember(m, req);
		req.setAttribute("contentPage", "member/myPage.jsp");
		return "home";
	}
	
	//아이디 중복 체크
	@RequestMapping(value = "member.idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("dm_id") String dm_id) {
		
		return mDAO.userIdCheck(dm_id);
	}
	
	//로그인 아이디 체크
	@RequestMapping(value = "member.idExist", method = RequestMethod.POST)
	@ResponseBody
	public int idExist(@RequestParam("dm_id") String dm_id) {
		
		return mDAO.userIdExist(dm_id);
	}
	
	//로그인 비번 체크
	@RequestMapping(value = "member.pwExist", method = RequestMethod.POST)
	@ResponseBody
	public int pwExist(@RequestParam("dm_id") String dm_id, @RequestParam("dm_pw") String actual_pw) {
		
		return mDAO.userPwExist(dm_id, actual_pw);
	}
	
	//닉네임 중복 체크
	@RequestMapping(value = "member.nickCheck", method = RequestMethod.GET)
	@ResponseBody
	public int nickCheck(@RequestParam("dm_nickname") String dm_nickname) {
		
		return mDAO.userNickCheck(dm_nickname);
	}
	
	//이메일 중복 체크
	@RequestMapping(value = "member.mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public int mailCheck(@RequestParam("dm_email") String dm_email) {
		
		return mDAO.userMailCheck(dm_email);
	}
	
	//정보찾기 창 열기
	@RequestMapping(value = "member.findInfo", method = RequestMethod.GET)
	public String toFindInfo(HttpServletRequest req) {
		
		return "member/findInfo";
	}
	
	//id찾기
	@RequestMapping(value = "member.findId", method = RequestMethod.GET)
	@ResponseBody
	public String findId(@RequestParam("dm_email") String dm_email) {
		
		return mDAO.findId(dm_email);
	}
	
	//비밀번호 찾기
	@RequestMapping(value = "member.findPw", method = RequestMethod.GET)
	@ResponseBody
	public int findPw(Member m) {
		
		return mDAO.findPw(m);
	}
}
