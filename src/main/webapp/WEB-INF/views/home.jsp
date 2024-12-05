<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>다님 :: 즐거운 여행</title>
<link rel="stylesheet" href="resources/asset/index/css/home.css" />
<link rel="stylesheet" href="resources/asset/index/css/style.css" />
<link rel="stylesheet" href="resources/asset/index/css/carousel.css" />
<link rel="stylesheet" href="resources/review/css/review.css" />
<link rel="stylesheet" href="resources/comm/comm_css/comm_picture.css">
<script type="text/javascript" src="resources/asset/index/js/jquery.js"></script>
<script type="text/javascript" src="resources/asset/index/js/valid.js"></script>

<script type="text/javascript" src="resources/comm/comm_js/comm_js.js"></script>



</head>
<body>
	<header>
		<div class="logo">
			<a href="index"><img src="resources/asset/index/img/logo.png"/></a>
		</div>

		<div class="nav_wrap">
			<ul class="nav">
				<li><a href="plan.page">계획 짜기</a></li>
				<li><a href="review.go">여행 후기</a></li>

				<li><a href="/danim/comm_picture_page?pageNum=1">커뮤니티</a></li>
			

			</ul>
		</div>
		<c:choose>
			<c:when test="${sessionScope.loginMember != null}">
				<div>

					<table>
						<tr>
							<td>${sessionScope.loginMember.dm_nickname}님 환영합니다.</td>
						</tr>
						<tr>
							<td><button class="login_btn" onclick="location.href='member.logout'">로그아웃</button> <button class="login_btn" onclick="location.href='member.myPage'" style="margin-left:30px;">마이페이지</button></td>
						</tr>
					</table>

				</div>
			</c:when>
			<c:otherwise>
				<div class="btns_wrap">
					<ul class="btns">
						<li><a onclick="modalOpen()" class="loginBtn">로그인</a></li>
					</ul>
				</div>
			</c:otherwise>
		</c:choose>

		<div class="modal_background"></div>
		
		<div class="modal_wrap">
			 <div class="modal_header">
				<a onclick="modalClose()" class="modal_close">✖</a>
			</div> 
			<div class="modal_content">
				<div class="modalBx login">
					<h2>아이디가 있으신가요?</h2>
					<button class="modal_loginBtn">로그인</button>
				</div>
				<div class="modalBx register">
					<h2>아이디가 없으신가요?</h2>
					<button class="registerBtn">회원가입</button>
				</div>
				
			</div>

			<div class="formBx" >
				<div class="form loginForm">
					<form action="member.login" method="post" name="loginForm">
						<h3>로그인</h3>
						<input type="text" placeholder="아이디" name="dm_id" id="dm_id1" required>
						<div class="check_fnt" id="id_check1"></div> 
						<input type="password" placeholder="비밀번호" name="dm_pw" id="dm_pw1" required>
						<div class="check_fnt" id="pw_check3"></div>
						<button id="login_submit">로그인</button>
					</form>
					<hr>
					<a href="member.findInfo" onclick="window.open(this.href, '_blank', 'width=700, height=500'); return false;" onkeydown="return enter(event)">아이디/비밀번호를 잊어버리셨나요?</a>
				</div>

				<div class="form registerForm">
					<form action="member.register" method="post" name="registerForm">
						<h3>회원가입</h3>
						<input type="text" placeholder="아이디" name="dm_id" id="dm_id" class="reg_id" required>
						<div class="check_fnt" id="id_check"></div> 
						<input type="password" placeholder="비밀번호" name="dm_pw" id="dm_pw" class="reg_pw" required>
						<div class="check_fnt" id="pw_check1"></div>
						<input type="password" placeholder="비밀번호 확인"  id="dm_pwCheck" class="reg_pwCheck">
						<div class="check_fnt" id="pw_check2"></div>
						<input type="text" placeholder="닉네임" name="dm_nickname" id = "dm_nickname" class="reg_nick" required> 
						<div class="check_fnt" id="nick_check"></div> 
						<input type="text" placeholder="이메일" name="dm_email" id = "dm_email" class="reg_mail" required onkeydown="return enter(event)">
						<div class="check_fnt" id="mail_check"></div>
						<button id="reg_submit" onkeydown="return enter(event)">회원가입</button>
					</form>
				</div>

			</div>
		</div>
		
	

	</header>

	<div>
		<jsp:include page="${contentPage}"></jsp:include>
	</div>
	<footer class="footer">
		<div class="footer_wrap">
			<div class="footer_column">

				<div class="footer_title">
					<h2>다님</h2>
				</div>

				<ul>
					<li><a href="">계획짜기</a></li>
					<li><a href="">여행후기</a></li>
					<li><a href="">커뮤니티</a></li>
				</ul>
			</div>
			<div class="footer_column">

				<div class="footer_title">
					<h2>커뮤니티</h2>
				</div>

				<ul>
					<li><a href="/danim/comm_picture_page?pageNum=1">사진게시판</a></li>
					<li><a href="/danim/comm_video_page?pageNum=1">영상게시판</a></li>
					<li><a href="/danim/comm_free_page?pageNum=1">자유게시판</a></li>
				</ul>
			</div>
			
		</div>
	</footer>
	
	
	<script type="text/javascript" src="resources/asset/index/js/modal.js"></script>
</body>
</html>
