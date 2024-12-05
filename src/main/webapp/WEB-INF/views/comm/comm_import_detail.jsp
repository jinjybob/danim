<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onpageshow = function(event) {
	if (event.persisted	|| (window.performance && window.performance.navigation.type == 2)) {
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
	<div id="comm_import_area">
		<div id="comm_menu112">
			<aside id="comm_menu_side">
				<table id="comm_picture_tbl">
					<tr>
						<td id="comm_picture_td_title">커뮤니티
						<input type="hidden"
							name="pageNum" value="${param.pageNum }" id="pgn"> <input
							type="hidden" name="search_option"
							value="${param.search_option }" id="so"> <input
							type="hidden" name="search_input" value="${param.search_input }"
							id="si">
						</td>
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
		<div id="comm_picture_detail_content112">
			<div id="content_title_div">
				<h2  class="best_pic2">자유게시판</h2>
				</div>
				<hr class="comm_detail_hr2">
			<c:forEach var="i" items="${notification }">
				<table id="comm_picture_detail_tbl2">
					<tr>
						<td id="comm_detail_title" colspan="2">${i.ci_write_name }
						<input name="token" type="hidden" value="${token }">
						</td>
					</tr>
					<tr>
						<td id="comm_picture_detail_td2">조회수  : ${i.ci_view } |
						작성자 : 관리자 |
						</td>
					</tr>
					<tr>
						<td id="comm_picture_detail_td2">
						작성일 : <fmt:formatDate value="${i.ci_date }" pattern="yyyy-MM-dd"/>
						</td>
					</tr>
					<tr>
					</tr>
					<tr>
						<c:if test="${i.ci_file_name ne 'basic.jpg' }">
						<td>
						<img id="comm_picture_detail_img2"
							src="resources/comm/file/${i.ci_file_name }"></td>
						</c:if>
						<c:if test="${i.ci_file_name eq 'basic.jpg' }">
						</c:if>
					</tr>
					<tr>
						<td colspan="2" class="comm_picture_detail_td4">
						<pre class="comm_picture_detail_td4">${i.ci_txt }</pre>
						</td>
					</tr>
					<c:if test="${sessionScope.loginMember.dm_nickname eq i.ci_writer || sessionScope.loginMember.dm_isAdmin eq 'Y'}">
						<tr>
							<td colspan="4" style="text-align: right"><button style="width: 70px; font-size: 15pt;"
									onclick="comm_importdelOK(${i.ci_no})">삭제</button>
								
									</td>
						</tr>
					</c:if>
				</table>
								<hr class="comm_detail_hr">
				<button id="list_btn" onclick="window.history.back()">목록
				
				</button>
				

			</c:forEach>
		</div>
	</div>
</body>
</html>