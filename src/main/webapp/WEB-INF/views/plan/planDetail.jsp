<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/plan/p_js/jQuery.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=10c7423289ef4af1c8687b735db21075&libraries=services"></script>
<script type="text/javascript" src="resources/plan/p_js/plan_map.js"></script>
<script type="text/javascript" src="resources/plan/p_js/plan.js"></script>

<link rel="stylesheet" href="resources/plan/p_css/plan.css">

</head>
<body>
<div id="p_writeTitle"><h1>여행 플래너 상세</h1></div>
<!-- 일전 기본정보 -->
<table id="p_write">
		<tr>
			<td rowspan="3" style="width: 300px; text-align: center;">
				<img src="resources/plan/p_file/${plan.p_titleFile }" id="p_detailFile">
			</td>
			<td colspan="2"><h3>플래너 제목</h3><div style="margin-top: 10px;">${plan.p_title }</div></td>
		</tr>
		
		<tr>
			<td style="width: 250px;"><h3>출발 날짜</h3>
				<div style="margin-top: 10px;">
				<fmt:formatDate value="${plan.p_startDate }" pattern="yyyy년 MM월 dd일"/>부터<p>
				${plan.p_days }박${plan.p_days+1}일
				</div>     
			</td>
			<td><h3>여행 인원</h3><div style="margin-top: 10px;">${plan.p_person }&nbsp;명</div> </td>
		</tr>
		
		<tr>
			<td><h3>여행 장소</h3><div style="margin-top: 10px;">${plan.p_place }</div></td>
			<td><h3>작성날짜</h3><div style="margin-top: 10px;"><fmt:formatDate value="${plan.p_writedate }" pattern="yyyy년 MM월 dd일"/></div></td>

			
		</tr>
</table>



<!-- 여행 전체일정 -->
<div style="margin: auto; width: 800px; text-align: center; font-size: 20pt; margin-top: 60px;">📅 여행 전체일정</div>
<div style="margin: auto; width: 800px;">
<div style="margin: auto; width: 800px; margin-top: 20px; display: inline-block;">

<c:set var="plan" value="${fn:split(plan.p_plan,',') }"></c:set>
<c:forEach var="plan" items="${plan }" varStatus="p">

	<table style="margin: auto; float: left;">
		<tr>
			<td><div id="mapName">${plan }</div></td>
		</tr>
	</table>

</c:forEach>
</div></div>


	
<!-- 필요 예산 상세 -->
<div id="p_DayWriteTitle"><span>💰 여행 예산</span></div>

<div id="p_openDayWrite">
<div id="confirmContent"><div id="p_DayWriteAll"><div id="p_dayWriteDiv">
		<c:forEach var="bd" items="${budgets }">
			<table id="setBudgetTb">
				<tr>
					<td colspan="2">${bd.p_setTitle }</td>
				</tr>

				<tr>
					<td style="text-align: right; width: 60px; height: 35px;">상품명:</td>
					<td>${bd.p_setItem }</td>
				</tr>
				
				<tr>
					<td style="text-align: right; width: 60px; height: 35px;">가격:</td>
					<td><fmt:formatNumber value="${bd.p_setPrice }" pattern="#,###"/> 원</td>
				</tr>
			</table>
		</c:forEach>
</div></div></div></div>



<!-- 예산 결과 보여주는 곳 -->
	<div id="p_DayWriteTitle">💲예산 결과</div>
	<table border="1" id="p_detailBudgetDetail">
		<tr>
			<td id="p_writeBudgetWrite"><textarea> ${plan.p_budget } </textarea></td>
		</tr>
	</table>


	
<!-- 자유 한마디 -->
<c:if test="${not empty plan.p_freeWrite}">
	<div id="p_FreeWordAll">
	<span id="p_openFreeWord" onclick="p_openFreeWord()">💪여행 전 한마디 ▼</span>
	<table border="1" id="p_writeFreeDetail">
		<tr>
			<td id="p_writeFreeWriteDetail"><textarea>${plan.p_freeWrite }</textarea></td>
		</tr>
	</table>
	</div>
 </c:if>
 <c:if test="${empty plan.p_freeWrite}">
	<div id="p_FreeWordAll">
	<span id="p_openFreeWord" onclick="p_openFreeWord()">💪여행 전 한마디 ▼</span>
	<table border="1" id="p_writeFreeDetail">
		<tr>
			<td id="p_writeFreeWriteDetail">한마디가 없습니다.</td>
		</tr>
	</table>
	</div>
</c:if>



<!-- 돌아가기/삭제버튼 -->
<div id="p_detailPlanBackDel">
		<button onclick="history.go(-1)" > &lt; 돌아가기</button>

	<c:if test="${sessionScope.loginMember.dm_id eq plan.p_writer || sessionScope.loginMember.dm_isAdmin eq 'Y' }">
		<button id="p_delete">삭제하기</button>
	</c:if>
</div>

	<input type="hidden" id="p_no" value="${param.p_no}">

</body>
</html>