<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/plan/p_js/plan.js" ></script>
<link rel="stylesheet" href="resources/plan/p_css/plan.css">
</head>
<body>
<!-- 플래너 작성 버튼 -->
<c:if test="${sessionScope.loginMember != null}">
	<form action="plan.writePlanner">
		<table id="p_mainWrite">
		<tr><td><h3>🏃‍♂️나만의 플래너 제작🏃‍♀️</h3></td></tr>
		
			<tr>
				<td>총 몇일 여행하시나요?&nbsp;&nbsp;<input type="number" name="p_days" id="p_days" min="1"> 일 </td>
			</tr>
			<tr>
				<td colspan="2">
					<button id="p_writePlannerBtn" class="p_writePlannerBtn">나만의 플래너 작성</button>
					 <!-- input hidden으로 아이디정보 가져가기 -->
					 <input type="hidden" name="p_writer" value="${sessionScope.loginMember.dm_id }">
					 <input type="hidden" name="p_nickname" value="${sessionScope.loginMember.dm_nickname }">
				</td>
			</tr>
		</table>
	</form>
</c:if>

<c:if test="${sessionScope.loginMember == null}">
	<form action="plan.writePlanner">
		<table id="p_mainWrite" >
		<tr><td><h3>🏃‍♂️나만의 플래너 제작🏃‍♀️</h3></td></tr>
		
			<tr>
				<td id="p_noLogin"> 
				<div>로그인 후 나만의 플래너 작성이 가능합니다.</div>
				<div><a onclick="modalOpen()" class="loginBtn">로그인</a> 하러갈까요?</div>
			</td>
			</tr>
		</table>
	</form>
</c:if>

<!-- 페이징 기능-->
<c:if test="${pageMaker != null }">
<div id="p_pagingDiv">
		<!-- 이전페이지 버튼 -->
	<table id="p_pagingTbl">
		<tr>
			<td><c:if test="${pageMaker.prev}">
				<li class="pageInfo_btn previous"><a
					href="/danim/plan.page?pageNum=${pageMaker.startPage-1}"> &lt;이전 </a></li>
				</c:if></td>
				
			<!-- 각 번호 페이지 버튼 -->
			<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
				<td>
					<a href="/danim/plan.page?pageNum=${num }">&nbsp;${num}&nbsp;&nbsp;|&nbsp;</a>
				</td>
			</c:forEach>
				<td><c:if test="${pageMaker.next}">
					<li class="pageInfo_btn next"><a
						href="/danim/plan.page?pageNum=${pageMaker.endPage + 1 }">다음&gt;</a></li>
					</c:if></td>
		</tr>
	</table>
</div>
</c:if>

<c:if test="${pageMakerTitle != null }">
<div id="p_pagingDiv">
		<!-- 이전페이지 버튼 -->
	<table id="p_pagingTbl">
		<tr>
			<td><c:if test="${pageMakerTitle.prev}">
				<li class="pageInfo_btn previous"><a
					href="/danim/plan.search?pageNum=${pageMakerTitle.startPage-1}"> &lt;이전 </a></li>
				</c:if></td>
				
			<!-- 각 번호 페이지 버튼 -->
			<c:forEach var="num" begin="${pageMakerTitle.startPage}"
						end="${pageMakerTitle.endPage}">
				<td><a
					href="/danim/plan.search?p_searchSelect=${sessionScope.p_searchSelect}&p_searchWrite=${param.p_searchWrite}&pageNum=${num }">&nbsp;${num}&nbsp;&nbsp;|&nbsp;</a></td>
			</c:forEach>
				<td><c:if test="${pageMakerTitle.next}">
					<li class="pageInfo_btn next"><a
						href="/danim/plan.search?p_searchSelect=${sessionScope.p_searchSelect}&p_searchWrite=${param.p_searchWrite}&pageNum=${pageMakerTitle.endPage + 1 }">다음&gt;</a></li>
					</c:if></td>
		</tr>
	</table>
</div>
</c:if>



<!-- 검색기능 -->
<form action="plan.search">
<div style="text-align: center; margin-bottom: 50px;">
	<table id="p_searchTbl">
		<tr>
		<td align="center" colspan="3">
				<select id="p_searchSelect" name="p_searchSelect">
					<option value="p_searchAll">전체</option>
					<option value="p_searchTitle">여행제목</option>
					<option value="p_searchPlace">여행장소</option>
				</select>
				<input id="p_searchWrite" name="p_searchWrite">
				<button id="p_searchBtn">✔검색</button></td>
		</tr>
	</table>
</div>
</form>





<!-- 등록된 플래너 전체 조회-->
<c:if test="${empty plans}"> <div id="p_noPlanner"><b>'${param.p_searchWrite }'</b>에 관련된 플래너가 없습니다😭 </div>  </c:if>

<c:if test="${not empty plans}">
 <div id="p_mainDetailAllDiv"> 
 	<div id="p_mainDetailDiv">
			<c:forEach var="p" items="${plans }" varStatus="status">
		 <table id="p_mainDetail"> 
			 <tr>
					<td><div style="text-align: center;"><a href="plan.detailPlanner?p_no=${p.p_no }">
						<c:if test="${p.p_titleFile eq 'danimPagingTest00'}">
							<img id="p_mainPic"src="resources/plan/p_img/paging.png">
						</c:if>
						<c:if test="${p.p_titleFile ne 'danimPagingTest00'}">
						<img id="p_mainPic"src="resources/plan/p_file/${p.p_titleFile }">
						</c:if>
						</a></div></td>
				</tr>
				<tr>
					<td align="center"><h3>${p. p_title}</h3></td>
				</tr>  
		 </table> 
			</c:forEach>
</div> </div> 
</c:if>





</body>
</html>