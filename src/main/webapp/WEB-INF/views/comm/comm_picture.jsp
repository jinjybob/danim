<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/plan/p_js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		window.onpageshow = function(event) {
			if (event.persisted
					|| (window.performance && window.performance.navigation.type == 2)) {
				let pgn = $("#pgn").val();
				let so = $("#so").val(); 
				let si = $("#si").val(); 
				
				if(so != ""){
					location.href="/danim/comm_picture_search?search_option="+so+"&search_input="+si+"&pageNum="+pgn;
				}
				else{
				if (pgn != "") {
					location.href = "/danim/comm_picture_page?pageNum=" + pgn;
				} else {
					location.href = "/danim/comm_picture_page";
						}	
				}
			}
		}		
		
		
		let aaa = $("#aaa").val();
		$(".pc" + aaa).css("backgroundColor", "#E2E3FF");
		$(".pc" + aaa).css("fontWeight", "500");
		$(".pc" + aaa).css("fontSize", "16pt");
		
		let bbb = $("#bbb").val();
		$(".pc2" + bbb).css("backgroundColor", "#E2E3FF");
		$(".pc2" + bbb).css("fontWeight", "500");
		$(".pc2" + bbb).css("fontSize", "16pt");
	
	}); 
</script>
</head>
<body>


	<div id="comm_picture_area">
		<div id="comm_menu112">
			<aside id="comm_menu_side">
				<table id="comm_picture_tbl">
					<tr>
						<td id="comm_picture_td_title">커뮤니티</td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a
							href="/danim/comm_picture_page?pageNum=1">사진게시판</a></td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a
							href="/danim/comm_video_page?pageNum=1">영상게시판</a></td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a
							href="/danim/comm_free_page?pageNum=1">자유게시판</a></td>
					</tr>
				</table>
			</aside>
		</div>


		<div id="comm_picture_content112">

			<form action="comm_picture_search">
				<table id="comm_picture_searchTbl">
					<tr>
						<td><select name="search_option" id="search_option">
								<option value="title">제목</option>
								<option value="writer">작성자</option>
								<option value="txt">내용</option>
						</select> <input name="search_input" id="search_input"
							value="${param.search_input }"> <input type="hidden"
							value="1" name="pageNum">
							<button id="comm_picture_searchBtn">검색</button></td>
					</tr>
				</table>
			</form>
			<!--현재페이지돌아오게하는거  -->
			<form>
				<input type="hidden" name="pageNum" value="${param.pageNum }"
					id="pgn"> <input type="hidden" name="search_option"
					value="${param.search_option }" id="so"> <input
					type="hidden" name="search_input" value="${param.search_input }"
					id="si">
			</form>
			<c:if test="${param.search_input eq null}">
				<div id="content_title_div">

					<!-- 				 <img id="sdf_img" src="resources/comm/comm_img/best2.png"> -->
					<h2 class="best_pic">베스트 사진</h2>

				</div>
				<hr id="comm_hr">
				<div style="width: 100%; float: left;">
					<c:forEach var="g" items="${good_pictures }" varStatus="status">
						<table class="comm_picture_bestTbl2" style="">
							<tr>
								<td id="write_name_Td2">BEST ${status.index +1}</td>
							</tr>
							<tr>
								<td><img class="comm_picture_best_img2"

									src="resources/comm/file/${g.comm_picture_name }"
									onclick="location.href='comm_picture_detail?no=${g.comm_picture_no }&t=${sessionScope.token }&id=${sessionScope.loginMember.dm_id}&pageNum=${param.pageNum }&search_option=${param.search_option }&search_input=${param.search_input }'"></img>
								</td>
							</tr>
							<tr>
								<td id="comm_picture_best_writer"><span
									style="float: right;">${g.comm_picture_writer }님&nbsp;&nbsp;</span></td>
							</tr>
						</table>
					</c:forEach>


				</div>
			</c:if>

			<div style="width: 100%; float: left; padding-top: 40px;">

				<div id="content_title_div">
					<!-- <img id="sdf_img" src="resources/comm/comm_img/photo-1.png"> -->
					<h2
						<c:if test="${param.search_input eq null }"> class="best_pic3"</c:if>
						<c:if test="${param.search_input ne null }"> id="comm_picture_content_title2"</c:if>>
						사진게시판</h2>
				</div>
				<hr id="comm_hr">
				<c:if test="${pictures != null }">
					<c:forEach var="p" items="${pictures }" varStatus="status">
						<table class="comm_picture_bestTbl2">
							<tr>
								<td id="write_name_Td">${p.comm_picture_write_name }</td>
							</tr>
							<tr>
								<td><img id="comm_picture_best_img"
									src="resources/comm/file/${p.comm_picture_name }"
									onclick="location.href='comm_picture_detail?no=${p.comm_picture_no }&t=${sessionScope.token }&id=${sessionScope.loginMember.dm_id}&pageNum=${param.pageNum }&search_option=${param.search_option }&search_input=${param.search_input }'"></img></td>
							</tr>
							<tr>
								<td id="comm_picture_best_writer"><span
									style="float: right;">${p.comm_picture_writer }님</span></td>
							</tr>
						</table>
					</c:forEach>
				</c:if>
				<c:if test="${empty pictures }">
					<table class="comm_empty_Tbl">
						<tr>
							<td id="comm_empty_write">${param.search_input }(으)로등록된사진이 없습니다.</td>
							<td><a onclick="window.history.back()">&nbsp;&nbsp;&nbsp;돌아가기</a></td>
						</tr>
					</table>
				</c:if>

				<div class="pageInfo_wrap"></div>


			</div>
			<c:if test="${sessionScope.loginMember != null}">
				<input type="button" id="comm_picture_writeBtn" value="작성"
					onclick="location.href='/danim/comm_picture_write'">
			</c:if>
			<c:if test="${pageMaker != null && not empty pictures }">
				<div id="paging_div">
					<input id="aaa" value="${param.pageNum }" type="hidden">
					<!-- 이전페이지 버튼 -->
					<table id="paging_Tbl">
						<tr>
							<td><c:if test="${pageMaker.prev}">
									<li class="pageInfo_btn previous"><a
										href="/danim/comm_picture_page?pageNum=${pageMaker.startPage-1}">&lt;&lt;&nbsp;&nbsp;</a></li>
								</c:if></td>
							<!-- 각 번호 페이지 버튼 -->
							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<td class="paging_Tbl_td"><a
									href="/danim/comm_picture_page?pageNum=${num }"><span
										class="pc${num}">[${num}]</span></a></td>
							</c:forEach>
							<td><c:if test="${pageMaker.next}">
									<li class="pageInfo_btn_next"><a
										href="/danim/comm_picture_page?pageNum=${pageMaker.endPage + 1 }">&nbsp;&nbsp;&gt;&gt;</a></li>
								</c:if></td>
						</tr>
					</table>
				</div>
			</c:if>
			<c:if test="${pageMakerTitle != null && not empty pictures }">
				<div id="paging_div">
					<!-- 이전페이지 버튼 -->
					<input id="bbb" value="${param.pageNum }" type="hidden">
					<table id="paging_Tbl">
						<tr>
							<td><c:if test="${pageMakerTitle.prev}">
									<li class="pageInfo_btn previous"><a
										href="/danim/comm_picture_search?search_input=${param.search_input }&pageNum=${pageMakerTitle.startPage-1}&search_option=${sessionScope.search_option}">&lt;&lt;&nbsp;&nbsp;</a></li>
								</c:if></td>
							<!-- 각 번호 페이지 버튼 -->
							<c:forEach var="num" begin="${pageMakerTitle.startPage}"
								end="${pageMakerTitle.endPage}">

								<td class="paging_Tbl_td"><a
									href="/danim/comm_picture_search?search_input=${param.search_input }&pageNum=${num }&search_option=${sessionScope.search_option}"><span
										class="pc2${num }">[${num}]</span></a></td>
							</c:forEach>
							<td><c:if test="${pageMakerTitle.next}">
									<li class="pageInfo_btn next"><a
										href="/danim/comm_picture_search?search_input=${param.search_input }&pageNum=${pageMakerTitle.endPage + 1 }&search_option=${sessionScope.search_option}">&nbsp;&nbsp;&gt;&gt;</a></li>
								</c:if></td>
						</tr>
					</table>

				</div>

			</c:if>
		</div>

	</div>

</body>
</html>