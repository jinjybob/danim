<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/plan.js"></script>
<link rel="stylesheet" href="resources/css/plan.css">
</head>
<body>

	<form action="">
		<table border="1">

			<tr>
				<td rowspan="4">플래너 표지 사진 업로드</td>
				<td colspan="2">Title: <input></td>
			</tr>

			<tr>
				<td>Place: <input></td>
				<td>Person: <input></td>
			</tr>

			<tr>
				<td colspan="2">Route: 간단하게 여행루트를 선택해주세요 <input></td>
			</tr>

			<tr>
				<td colspan="2">지도 들어갈자리</td>
			</tr>
		</table>
	</form>

	<c:forEach var="p" begin="1" end="${param.p_days}">
		<!-- 추가하기 버튼 -->
		<div class="btnWrap">
			<button id="p_add">누르면 박스 추가!</button>
		</div>

		<div>
			DAY${p}
			<div>
				<table border="1" id="aaad">
					<tr>
						<td rowspan="2">지도</td>
						<td>주소:<input></td>
					</tr>
					<tr>
						<td>메뉴: <input></td>
					</tr>
					<tr>
						<td colspan="2">|</td>
					</tr>

				</table>

			</div>
		</div>

	</c:forEach>
	
	<table border="1">
	<tr>
	<td>여행 계획 결과</td>
	</tr>
	</table>





</body>
</html>