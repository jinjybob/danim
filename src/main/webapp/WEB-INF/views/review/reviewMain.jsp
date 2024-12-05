<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.img_box_container{
  width: 100%;
  text-align: center;
}

.img_box {
	border: 5px solid transparent;
	border-radius: 20px;
	background-image: linear-gradient(#444444, #444444),
		linear-gradient(to bottom right, #38CEB5, #6D1E91);
	background-origin: border-box;
	background-clip: content-box, border-box;
	width: 420px;
	height: 250px;
	margin-top: 60px;
}

#contents {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	border-radius: 5%;
	margin-left: 20px;
	margin-right: 20px;
	margin-bottom: 20px;
}

#contentTable {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
}

.itsActive {
	background-color: green;
}

div {
	
}

.flex-container {
	display: flex;
	justify-content: center;
	margin-top: 30px;
}

.flex-container3 {
	display: flex;
	justify-content: center;
}

.flex-container2 {
	justify-content: center;
	display: flex;
	padding-bottom: 60px;
	padding-top: 20px;
}

.selector_btn {
	border-radius: 2em;
	padding: 5px;
	margin-right: 5px;
	border: 1px solid gray;
}

.selected_btn {
	border-radius: 2em;
	padding: 5px;
	margin-right: 5px;
	border: 1px solid gray;
}

.selector_unit {
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 2em;
	margin-right: 5px;
	width: 120px;
	height: 50px;
	font-size: 14pt;
	text-align: center;
	border: 4px solid transparent;
	border-radius: 20px;
	background-image: linear-gradient(#ffffff, #ffffff),
		linear-gradient(to bottom right, #38CEB5, #6D1E91);
	background-origin: border-box;
	background-clip: content-box, border-box;
}

.selector_unit:hover {
	background-color: white;
}

.bb {
	transition: max-height 0.5s ease-out;
	height: 0;
	max-height: 0;
	overflow: hidden;
}

.aa {
	max-height: 600px;
}

ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

.container {
	margin: 0 auto;
	margin-top:10px;
}

.tab-container {
	display: flex;
	justify-content: center;
	padding-top: 25px;
}

.tab-container:hover {
	display: flex;
	justify-content: center;
	padding-top: 25px;
	background-color: white;
	-webkit-tap-highlight-color: transparent !important;
}

.tab-container__item {
	cursor: pointer;
	margin-right: 30px;
}

.tab-container__item:hover {
	cursor: pointer;
	margin-right: 30px;
}

.tab-container__item:hover {
	background-color: white;
	transition: background-color 0.4s ease-in-out;
}

.tab-container__item:hover .tab-container__item--title {
	color: #fff;
	transition: color 0.4s ease-in-out;
}
/* .tab-container__item.active {
  border-bottom: 2px solid #369fff;
} */
.tab-container__item.active .tab-container__item--title {
	color: #369fff;
}

.tab-container__item.active:hover {
	background-color: white;
	transition: background-color 0.4s ease-in-out;
}

.tab-container__item.active:hover .tab-container__item--title {
	color: #fff;
	transition: color 0.4s ease-in-out;
}

.tab-container__item--title {
	display: inline-block;
	color: #999;
	font-weight: 700;
	text-decoration: none;
	margin: 15px;
}

.content-container {
	padding: 10px;
}

.content-container__content {
	display: none;
}

.content-container__content.target {
	display: block;
}
</style>
<script type="text/javascript" src="resources/review/js/jquery.js"></script>
<script type="text/javascript" src="resources/review/js/review.js"></script>
<script type="text/javascript">
</script>
</head>
<body>



	<div class="container">
		<ul class="tab-container">
			<li class="tab-container__item active" data-tab="tab1">
				<div class="selector_unit">#인원 🏃</div>
			</li>
			<li class="tab-container__item" data-tab="tab2">
				<div class="selector_unit">#예산 💸</div>
			</li>
			<li class="tab-container__item" data-tab="tab3">
				<div class="selector_unit">#테마 🎨</div>
			</li>
			<li class="tab-container__item" data-tab="tab4">
				<div class="selector_unit">#지역 🌏</div>
			</li>
		</ul>

		<section class="content-container">
			<article id="tab1" class="content-container__content">
				<div class="flex-container" style="text-align: center;">
					<div id="head_count_div">
						인원수&nbsp;&nbsp; <input type="range" id="headcount" min="1"
							max="10" value="1" step="1"> <span id="headcount_value"></span><span>명</span>
					</div>

					<div id="direct_input">
						직접입력 : <input id="headcount_value1" value="1">명
						<button id="headcount_select_btn">
							<img id="check_img" alt="" src="resources/review/img/check.png">
						</button>
					</div>


				</div>
			</article>
			<article id="tab2" class="content-container__content">
				<div class="flex-container">
					<div class="budget_select_btn" id="budget1">~100,000</div>
					<div class="budget_select_btn" id="budget2">~300,000</div>
					<div class="budget_select_btn" id="budget3">~500,000</div>
					<div class="budget_select_btn" id="budget4">~700,000</div>
					<div class="budget_select_btn" id="budget5">~1,000,000</div>
				</div>
			</article>
			<article id="tab3" class="content-container__content">
				<div class="flex-container">
					<div class="theme_select_btn" id="theme1">커플여행</div>
					<div class="theme_select_btn" id="theme2">나홀로여행</div>
					<div class="theme_select_btn" id="theme3">감성카페찾기</div>
					<div class="theme_select_btn" id="theme4">맛집투어</div>
					<div class="theme_select_btn" id="theme5">비즈니스여행</div>
				</div>
			</article>
			<article id="tab4" class="content-container__content">
				<div class="flex-container">
					<div class="location_select_btn" id="location1">서울</div>
					<div class="location_select_btn" id="location2">대전</div>
					<div class="location_select_btn" id="location3">대구</div>
					<div class="location_select_btn" id="location4">부산</div>
					<div class="location_select_btn" id="location5">제주</div>
				</div>
			</article>
		</section>
	</div>



	<div class="flex-container2" id="selectedElements"
		style="display: none;">
		<div id="selectCancel" onclick="cancelingSelect()">선택해제</div>
		<div class="flex-container3" id="choosedVal">
			<!-- <div id="choosed_head" ></div>
<div id="choosedVal1"></div>
<div id="choosedVal2"></div>
<div id="choosedVal3"></div> -->

		</div>

	</div>

	<div>
	<c:if test="${not empty sessionScope.loginMember.dm_id }">
<input type="hidden" name="writer" value="${sessionScope.loginMember.dm_id }">

    <div id="review_write_div"> <div id="write_cover"><span id="test"><a href="reviewWrite.go?writer=${sessionScope.loginMember.dm_id }">후기쓰기</a></span><div id="penImg"><img id="penimgg" style="width: 30px;" src="resources/review/img/note.png"></div></div></div>

</c:if>

		<div class="" id="contentTable">
			<c:forEach items="${reviews }" var="reviews">
				<div class="flex-container" id="contents">
					<div class="img_box_container">
						<a
							href="reviewDeatil.go?rb_no=${reviews.rb_no }&t=${sessionScope.token}"><img
							class="img_box"
							src="resources/review/img/${fn:split(reviews.rb_img, ',')[0]}"
							alt="이미지위치"></a>
					</div>
					<div class="content_title" style="font-size: 30px">${reviews.rb_title }</div>
					<div id="icon_div">
						<!-- <img src="resources/review/img/good2.png" id="review_icon">&nbsp;:
						${reviews.rb_likecount } &nbsp;  -->
						
						<img src="resources/review/img/eye2.png" id="review_icon">&nbsp;:
						${reviews.rb_viewcount } &nbsp;
						
						<img src="resources/review/img/ripple2.png" id="review_icon">&nbsp;:
						${reviews.rb_commentcount }
					</div>
					<div>
						<span>#<fmt:formatNumber value="${reviews.rb_budget }"	type="currency" />이하
						</span> | <span> #${reviews.rb_theme }</span> | <span>
							#${reviews.rb_location }</span> | <span>
							#${reviews.rb_headNum }인</span>
					</div>
					<%-- <div>날짜 : <fmt:formatDate value="${reviews.rb_date  }" type="date" pattern="MM.dd"/>  | 작성자 : ${reviews.rb_username } </div> --%>
				</div>
			</c:forEach>

		</div>
	</div>

	<div class="flex-container">



</div>

</body>
</html>