<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/asset/index/css/style.css" />
<link rel="stylesheet" href="resources/asset/member/css/myPage.css">

</head>
<body>
	<div class="full">
		<div class="header">
			<h2>마이페이지</h2>
			<br>
			<h5>개인정보를 확인하고 수정할 수 있습니다</h5>
		</div>
		<section class="my_profile">
			<div class="my_info">
					<label for="dm_id">아이디</label>
				<div>
					<input type="text" class="form-control none" id="dm_id" name="dm_id"
						value="${sessionScope.loginMember.dm_id}" readonly>
				</div>
					<label for="dm_nickname">닉네임</label>
				
				<div>
					<input type="text" class="form-control none" id="dm_nickname" name="dm_nickname"
						value="${sessionScope.loginMember.dm_nickname}" readonly>
				</div>
				<label for="dm_email">이메일</label>
				<div>
					<input type="email" class="form-control none" id="dm_email2"
						name="dm_email" value="${sessionScope.loginMember.dm_email}" readonly>
				</div>
			</div>
				 

			<div class="btn_wrap">
				<button onclick="location.href='member.update'">정보 수정</button>
				<button onclick="location.href='member.delete'">회원 탈퇴</button>
			</div>
		</section>
	</div>


	<!-- <form action="member.delete" onclick="deleteCheck()">
		<input type="text" placeholder="아이디" name="dm_id"
			value="${sessionScope.loginMember.dm_id}"> <input
			type="password" placeholder="비밀번호" name="dm_pw"
			value="${sessionScope.loginMember.dm_pw}">
		<button>회원 탈퇴</button>
	</form> -->
</body>
</html>