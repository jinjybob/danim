<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/asset/member/css/myPage.css" />
<link rel="stylesheet" href="resources/asset/index/css/style.css" />
<script type="text/javascript" src="resources/asset/index/js/jquery.js"></script>


</head>
<body>
	<div class="full2">
		<div class="header">
			<h2>마이페이지 :: 정보 수정</h2>
			<br>
			<h5>개인정보를 확인하고 수정할 수 있습니다</h5>
		</div>
	<section class="my_profile">
		
		<form action="member.updateInfo" name="member_form" method="post" >
		<div class="my_info">
			<label for="dm_id">아이디</label> 
			<input class="none" type="text" name="dm_id" value="${sessionScope.loginMember.dm_id}" readonly>
			<label for="dm_pw">비밀번호</label>
			<input type="password" name="dm_pw" value="${sessionScope.loginMember.dm_pw}">
			
			<label for="dm_nickname">닉네임</label> 
			<input type="text" name="dm_nickname" id="dm_nickname3" value="${sessionScope.loginMember.dm_nickname}" >
			<div class="check_fnt" id="nick_check"></div>
			<label for="dm_email">이메일</label>
			<input type="text" name="dm_email" id="dm_email3" value="${sessionScope.loginMember.dm_email}" >
			<div class="check_fnt" id="mail_check"></div>
			<div class="btn_wrap2">
			<button id="update_submit">수정 확인</button>
			</div>
		</div>
		</form>
	</section>
	
	</div>
	
</body>
</html>