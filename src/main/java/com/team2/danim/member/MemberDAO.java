package com.team2.danim.member;

import java.io.File;
import java.net.URLDecoder;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MemberDAO {

	@Autowired
	private SqlSession ss;
	
	
	@Autowired
	private JavaMailSender mailSender;
	
	//로그인
	public void login(Member m, HttpServletRequest req) {
		Member dbMember = ss.getMapper(MemberMapper.class).getMemberByID(m);

		String inputPw = req.getParameter("dm_pw");
		String actualPw = Sha256.encodeSha256(inputPw);

		if (dbMember != null) {
			if (actualPw.equals(dbMember.getDm_pw())) {
				req.getSession().setAttribute("loginMember", dbMember);
				req.getSession().setMaxInactiveInterval(60 * 10);
			} else {
				System.out.println("Log in failed(invalid PW");
				req.setAttribute("result", "로그인 실패(PW오류)");
			}
		} else {
			System.out.println("Log in failed(invalid ID)");
			req.setAttribute("result", "로그인 실패(미가입ID)");
		}
		
	}

	//로그아웃
	public void logout(HttpServletRequest req) {
		req.getSession().setAttribute("loginMember", null);
	}

	//회원가입
	public void register(Member m, HttpServletRequest req) {

		
		try {
			String reg_id = req.getParameter("dm_id");
			String reg_rawPw = req.getParameter("dm_pw");
			String reg_dbPw = Sha256.encodeSha256(reg_rawPw);
			String reg_nick = req.getParameter("dm_nickname");
			String reg_email = req.getParameter("dm_email");
			String reg_isAdmin = req.getParameter("dm_isAdmin");
			
			m.setDm_id(reg_id);
			m.setDm_pw(reg_dbPw);
			m.setDm_nickname(reg_nick);
			m.setDm_email(reg_email);
			m.setDm_isAdmin(reg_isAdmin);
			
			if(ss.getMapper(MemberMapper.class).register(m) == 1) {
				System.out.println("가입 성공");
			} else {
				System.out.println("가입 실패");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("가입 실패");
		}
	}

	//회원 탈퇴
	public void deleteMember(HttpServletRequest req) {
		try {
			Member m = (Member) req.getSession().getAttribute("loginMember");
			String join_photo = m.getDm_photo();
			
			if (ss.getMapper(MemberMapper.class).deleteMember(m) == 1) {
				req.setAttribute("result", "탈퇴성공");

				String path = req.getSession().getServletContext().getRealPath("resources/img_account");
				join_photo = URLDecoder.decode(join_photo, "utf-8");
				new File(path + "/" + join_photo).delete();

				logout(req);
			} else {
				req.setAttribute("result", "탈퇴실패");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	//정보 수정
	public void updateMember(Member m, HttpServletRequest req) {
		try {
			String reg_id = req.getParameter("dm_id");
			String reg_rawPw = req.getParameter("dm_pw");
			String reg_dbPw = Sha256.encodeSha256(reg_rawPw);
			String reg_nick = req.getParameter("dm_nickname");
			String reg_email = req.getParameter("dm_email");
			
			m.setDm_id(reg_id);
			m.setDm_pw(reg_dbPw);
			m.setDm_nickname(reg_nick);
			m.setDm_email(reg_email);
			
			if(ss.getMapper(MemberMapper.class).updateMember(m) == 1) {
				System.out.println("수정 성공");
				req.getSession().setAttribute("loginMember", m);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("수정 실패");
		}
	}
	
	public int userIdCheck(String dm_id) {
		
		MemberMapper mm = ss.getMapper(MemberMapper.class);
		return mm.checkOverId(dm_id);
	}

	public int userNickCheck(String dm_nickname) {

		MemberMapper mm = ss.getMapper(MemberMapper.class);
		
		return mm.checkOverNick(dm_nickname);
	}

	public int userMailCheck(String dm_email) {
		
		MemberMapper mm = ss.getMapper(MemberMapper.class);
				
		return mm.checkOverMail(dm_email);
	}

	public int userIdExist(String dm_id) {
		
		MemberMapper mm = ss.getMapper(MemberMapper.class);
		Member m = mm.checkExistId(dm_id);
		
		if (m != null) {
			return 1;
		} else {
			return 0;
		}
	}

	public int userPwExist(String dm_id, String actual_pw) {
		MemberMapper mm = ss.getMapper(MemberMapper.class);
		Member m = mm.checkExistId(dm_id);
		String dm_pw = Sha256.encodeSha256(actual_pw);
		
		if (m != null) {
			if (m.getDm_pw().equals(dm_pw)) {
				return 1;
			} else {
				return 0;
			}
			
		} return 0;
		
	}

	public String findId(String dm_email) {
		MemberMapper mm = ss.getMapper(MemberMapper.class);
		
		return mm.findId(dm_email);
	}
	
	//임시 비밀번호 발급용 난수 생성기
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}


	public int findPw(Member m2) {

		String key = getKey(false, 6);
		MemberMapper mm = ss.getMapper(MemberMapper.class);
		Member m = mm.isValidInfo(m2);
		
		System.out.println(key);
		System.out.println(m);
		
		if (m != null) {
			MimeMessage mail = mailSender.createMimeMessage();
			
			String htmlStr = "<h2>안녕하세요 '"+ m.getDm_id() +"' 님</h2><br><br>" 
					+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
					+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + key +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
					+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			try {
				mail.setSubject("DANIM :: 임시 비밀번호가 발급되었습니다.", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(m.getDm_email()));
				mailSender.send(mail);
			} catch (MessagingException e) { 
				e.printStackTrace();
			}
			
			// 비밀번호 암호화해주는 메서드
			String dm_pw = Sha256.encodeSha256(key);
			m.setDm_pw(dm_pw);
			mm.searchPw(m);
			
			return 1;
		} else {
			return 0;
		}
		
	}
	


	
}
