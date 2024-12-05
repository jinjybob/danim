<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/plan/p_js/jquery.js" ></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=10c7423289ef4af1c8687b735db21075&libraries=services"></script>
<script type="text/javascript" src="resources/plan/p_js/plan_map.js" ></script>
<script type="text/javascript" src="resources/plan/p_js/plan.js" ></script>

<link rel="stylesheet" href="resources/plan/p_css/plan.css">

</head>

<body>

<div id="p_writeTitle"><h1>여행 플래너 제작하기</h1></div>

<!-- 일정 기본정보 등록 -->
<form action="plan.writeReg" name="planWrite" method="post" enctype="multipart/form-data" id="planWrite" onsubmit="return p_submit();" >
	<table id="p_write">
	            <!-- 아이디, 닉네임, 박수, token 정보 hidden -->
		<tr><td id="p_writeHiddenInput"><input type="hidden" name="p_writer" value="${param.p_writer }">
				<input type="hidden" id="p_nickname" name="p_nickname" value="${param.p_nickname }">
				<input type="hidden" id="p_days" name="p_days" value="${param.p_days }">
				<input type="hidden" name="token" value="${token }">
		</td></tr>

		<tr>
			<!-- 파일 업로드 미리보기 -->
			<td rowspan="3" style="width: 300px; text-align: center;">📸이미지 미리보기<img id="p_preview"></td>
			
			<!-- 제목/날짜/인원/장소 작성 -->	
			<td colspan="2"><h3>플래너 제목</h3><input name="p_title" id="p_title" maxlength="19" ></td>
		</tr>
		
		<tr>
			<td style="width: 250px;"><h3>출발 날짜</h3><input type="date" name="p_startDate" id="p_startDate" min="1"></td>
			<td><h3>여행 인원</h3><p><input type="number" name="p_person" id="p_person">명 </td>
		</tr>

		<tr>
			<td colspan="2"><h3>여행 장소</h3><input name="p_place" id="p_place" maxlength="19"></td>
		</tr>
		
		<tr>
			<!-- 파일 업로드 -->
			<td colspan="3"><input type="file" name="p_titleFile" id="p_titleFiles"/></td>
		</tr>
		
		
		
<!-- 지도 여행 일정 등록 -->
		<tr>
			<td colspan="3">
				<div style="font-size: 20pt; text-align: center; margin-top: 60px;">📅 여행 전체일정</div>
				<div id="p_mapSearchDiv">❗검색 후 이름을 클릭하면 자동으로 추가가 됩니다.<p>
									<input placeholder="검색어를 입력해주세요" id="p_search">
									<input type="button" id="p_searchBtn" value="✔검색"></div>
				<!-- 지도 표시되는 곳 -->
				<div id="map"></div>
			</td>
		</tr>
		
		<tr>
			<!-- 지도에서 선택한 장소 표시되는 곳 -->
			<td colspan="3"><div id="p_route"></div></td>
		</tr>
		
	</table>
 
	
<!-- 여행 예산 설정 -->
	<div id="p_DayWriteTitle"><span>💰여행 예산</span></div>
	<div style="margin: auto;text-align: center;"> ❗ 여행 전체일정에서 비용이 필요한 일정을 선택 후 작성해주세요<p>(일정을 클릭시 자동으로 작성란이 생성됩니다.)</div>
	<div style="margin: auto;text-align: center;"><button id="p_addTransportation" type="button">🚗교통비 🍴식비 추가</button></div>
	<div id="p_openDayWrite">
			<div id="confirmContent"><div id="p_DayWriteAll"><div id="p_dayWriteDiv"></div></div></div>
	</div>


<!-- 예산결과 보여주는 곳 -->
	<div id="p_BudgetAll">
	<span id="p_openBudget" onclick="budgetCalc()">💲계산하기</span>
	<table border="1" id="p_writeBudget">
			
		<tr>
			<td id="p_writeBudgetWrite" style="text-align: center;"> 계산하기 버튼을 눌러주세요.</td>
		</tr>
	</table>
	</div>


	
<!-- 자유 한마디 -->
	<div id="p_FreeWordAll">
	<span id="p_openFreeWord">💪여행 전 한마디 </span>
	<table border="1" id="p_writeFree">
		<tr>
			<td id="p_writeFreeWrite"><textarea id="p_freeWrite" name="p_freeWrite" placeholder="자유롭게 작성해주세요 (100자 이내)" maxlength="100"></textarea>
									<input type="text" placeholder="( / 100)" id="textLengthCheck" readonly/></td>
		</tr>
	</table>
	</div>
	
	<div id="p_regOk">
	
	<input type="submit" value="플래너 등록" id="p_submit" class="p_submit">
	</div> 
	
</form> 



</body>
</html>