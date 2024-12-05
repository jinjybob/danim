<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/plan/p_js/jquery.js"></script>
<script type="text/javascript">
$(function() {
	
	
	let aaa = $("#aaa").val();
	$(".pc" + aaa).css("backgroundColor", "#E2E3FF");
	$(".pc" + aaa).css("fontWeight", "500");
	$(".pc" + aaa).css("fontSize", "16pt");
	
	let bbb = $("#bbb").val();
	$(".pc2" + bbb).css("backgroundColor", "#E2E3FF");
	$(".pc2" + bbb).css("fontWeight", "500");
	$(".pc2" + bbb).css("fontSize", "16pt");

	
	
});
window.onpageshow = function(event) {
	if (event.persisted
			|| (window.performance && window.performance.navigation.type == 2)) {
		let pgn = $("#pgn").val();
		let so = $("#so").val(); 
		let si = $("#si").val(); 
		if(so != ""){
			location.href="/danim/comm_free_search?search_option="+so+"&search_input="+si+"&pageNum="+pgn;
		}
		else{
		if (pgn != "") {
			location.href = "/danim/comm_free_page?pageNum=" + pgn;
		} else {
			location.href = "/danim/comm_free_page";
		}
			
		}
	}
}

</script>
</head>
<body>


	<div id="comm_free_area">
		<div id="comm_free_menu112">
			<aside id="comm_menu_side">
				<table id="comm_picture_tbl">
					<tr>
						<td id="comm_picture_td_title">커뮤니티</td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_picture_page?pageNum=1">사진게시판</a></td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a
							href="/danim/comm_video_page?pageNum=1">영상게시판</a></td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_free_page?pageNum=1">자유게시판</a></td>
					</tr>
				</table>
			</aside>
		</div>


		<div id="comm_free_content1122">
			

			<div id="content_title_div">
<!-- 				 <img id="sdf_img" src="resources/comm/comm_img/board1.png"> --><h2  class="best_pic">자유게시판</h2>
				</div>
				<hr id="comm_free_hr">
				<c:if test="${pageMaker != null && not empty frees }">
				<div id="paging_div2">
					<!-- 이전페이지 버튼 -->
							<input id="aaa" value="${param.pageNum }" type="hidden">
					<table id="paging_Tbl2">
						<tr>
							<td><c:if test="${pageMaker.prev}">
									<li class="pageInfo_btn previous"><a
										href="/danim/comm_free_page?pageNum=${pageMaker.startPage-1}">&lt;&lt;&nbsp;&nbsp;</a></li>
								</c:if></td>
							<!-- 각 번호 페이지 버튼 -->
							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<td class="paging_Tbl_td"><a
									href="/danim/comm_free_page?pageNum=${num }"><span class="pc${num}">[${num}]</span></a></td>
							</c:forEach>
							<td><c:if test="${pageMaker.next}">
									<li class="pageInfo_btn next"><a
										href="/danim/comm_free_page?pageNum=${pageMaker.endPage + 1 }">&nbsp;&nbsp;&gt;&gt;</a></li>
								</c:if></td>
						</tr>
					</table>
					<form action="comm_free_search">
				<table id="comm_free_searchTbl">
					<tr>
						<td><select name="search_option" id="search_option">
								<option value="title">제목</option>
								<option value="writer">작성자</option>
								<option value="txt">내용</option>
						</select> <input name="search_input" id="search_option" value="${param.search_input }">
						<input type="hidden" value="1" name="pageNum">
						 <input type="hidden" name="pageNum" value="${param.pageNum }" id="pgn">
						 <input type="hidden" name="search_option" value="${param.search_option }" id="so">
					<input type="hidden" name="search_input" value="${param.search_input }" id="si">
							<button id="comm_picture_searchBtn">검색</button></td>
					</tr>
				</table>
			</form>
				</div>
			</c:if>
			<c:if test="${pageMakerTitle != null && not empty frees }">
				<div id="paging_div2">
							<input id="bbb" value="${param.pageNum }" type="hidden">
					<!-- 이전페이지 버튼 -->
					<table id="paging_Tbl2">
						<tr>
							<td><c:if test="${pageMakerTitle.prev}">
									<li class="pageInfo_btn previous"><a
										href="/danim/comm_free_search?search_input=${param.search_input }&pageNum=${pageMakerTitle.startPage-1}&search_option=${sessionScope.search_option}">&lt;&lt;&nbsp;&nbsp;</a></li>
								</c:if></td>
							<!-- 각 번호 페이지 버튼 -->
							<c:forEach var="num" begin="${pageMakerTitle.startPage}"
								end="${pageMakerTitle.endPage}">
								<td class="paging_Tbl_td"><a
									href="/danim/comm_free_search?search_input=${param.search_input }&pageNum=${num }&search_option=${sessionScope.search_option}">
									<span class="pc2${num}">[${num}]</span></a></td>
							</c:forEach>
							<td><c:if test="${pageMakerTitle.next}">
									<li class="pageInfo_btn next"><a
										href="/danim/comm_free_search?search_input=${param.search_input }&pageNum=${pageMakerTitle.endPage + 1 }&search_option=${sessionScope.search_option}">&nbsp;&nbsp;&gt;&gt;</a></li>
								</c:if></td>
						</tr>
					</table>
					<form action="comm_free_search">
				<table id="comm_free_searchTbl">
					<tr>
						<td><select name="search_option" id="search_option">
								<option value="title">제목</option>
								<option value="writer">작성자</option>
								<option value="txt">내용</option>
						</select> <input name="search_input" id="search_option" value="${param.search_input }">
						<input type="hidden" value="1" name="pageNum" >
						 <input type="hidden" name="pageNum" value="${param.pageNum }" id="pgn">
						 <input type="hidden" name="search_option" value="${param.search_option }" id="so">
					<input type="hidden" name="search_input" value="${param.search_input }" id="si">
							<button id="comm_picture_searchBtn">검색</button></td>
					</tr>
				</table>
			</form>
				</div>

			</c:if>
			
			<c:if test="${not empty frees}">
			<table id="comm_free_tbl">
				<tr id="comm_free_tbl_title">
					<td class="comm_free_td1">글번호</td>
					<td id="comm_free_tbl_main2">제목</td>
					<td class="comm_free_td2">작성자</td>
					<td class="comm_free_td3">조회수</td>
					<td class="comm_free_td3">날짜</td>
				</tr>
				<c:forEach var="i" items="${imports }">
				<tr id="comm_free_tbl_title2">
					<td class="comm_free_td1">공지</td>
					<td id="comm_free_tbl_main2"
					onclick="location.href='comm_import_detail?no=${i.ci_no }&t=${sessionScope.token }&id=${sessionScope.loginMember.dm_id}&pageNum=${param.pageNum }&search_option=${param.search_option }&search_input=${param.search_input }'">
					${i.ci_write_name }</td>
					<td>관리자</td>
					<td>${i.ci_view }</td>
					<td><fmt:formatDate value="${i.ci_date }" pattern="yyyy-MM-dd"/></td>
				</tr>
				</c:forEach>
				<c:forEach items="${frees }" var="f">
					<tr id="comm_free_tbl_tr" class="row">
						<td class="comm_free_td1">${f.cf_no }</td>
						<td id="comm_free_tbl_main"
							onclick="location.href='comm_free_detail?no=${f.cf_no }&t=${sessionScope.token }&id=${sessionScope.loginMember.dm_id}&pageNum=${param.pageNum }&search_option=${param.search_option }&search_input=${param.search_input }	'">
							${f.cf_write_name }</td>
						<td>${f.cf_writer }</td>
						<td>${f.cf_view }</td>
						<td><fmt:formatDate value="${f.cf_date }" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>				
			</table>
					</c:if>
			<c:if test="${empty frees }">
					<table class="comm_empty_Tbl">
						<tr>
							<td id="comm_empty_write">${param.search_input }(으)로 등록된 게시글이 없습니다.</td>
							<td><a onclick="window.history.back()">&nbsp;&nbsp;&nbsp;돌아가기</a></td>
						</tr>
					</table>


				</c:if>
							<c:if test="${sessionScope.loginMember != null}">
				<input type="button" id="comm_free_writeBtn2" value="글쓰기"
					onclick="location.href='/danim/comm_free_write'">
			</c:if>

				<c:if test="${ sessionScope.loginMember.dm_isAdmin eq 'Y'}">
				<input type="button" id="comm_free_writeBtn" value="공지쓰기"
					onclick="location.href='/danim/comm_import_write'">
								
			</c:if>

		</div>
	</div>


</body>
</html>