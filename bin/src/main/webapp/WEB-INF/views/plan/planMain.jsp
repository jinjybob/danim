<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 플래너 작성 페이지로 넘어가는 버튼 -->
<form action="plan.writePlanner">
	<table border="1">
	<tr>
	<td>여행일정 <input type="number" name="p_days"> 일</td>
	<td>출발일: <input type="date" name="p_startDate"></td>
	</tr>
		<tr>
		<td><button>나만의 플래너 제작</button></td>
<!-- input hidden으로 아이디정보 가져가기 -->
		</tr>
	</table>
</form>

<p>


<!-- 플래너 전체를 볼 수 있는 곳 -->
<form action="">
	<table border="1">
		<tr>
			<td>플래너 표지 사진1</td>
			<td>플래너 표지 사진2</td>
			<td>플래너 표지 사진3</td>
			<td>플래너 표지 사진4</td>
		</tr>

		<tr>
			<td>플래너 타이틀1</td>
			<td>플래너 타이틀2</td>
			<td>플래너 타이틀3</td>
			<td>플래너 타이틀4</td>
		</tr>
	</table>
</form>










</body>
</html>