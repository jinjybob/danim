<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	
	previewImg();
	adjustHeight();
});

function adjustHeight() {
	  var textEle = $('#comm_picture_update_txt');
	  textEle[0].style.height = 'auto';
	  var textEleHeight = textEle.prop('scrollHeight');
	  textEle.css('height', textEleHeight);
	};

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
	<div id="comm_picture_area">
		<div id="comm_menu112">
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
		<div id="comm_update_content112">
			<div id="content_title_div2">
				<h2  class="best_update_pic2">자유게시판</h2>
				</div>
				<hr class="comm_update_hr">
			<c:forEach var="f" items="${free }">
				<form action="comm_free_update_do" method="post"
					enctype="multipart/form-data">
					<table id="comm_picture_update_tbl">
						<tr>
					<td id="comm_picture_update_td2">제목</td>
							<td><input
								value="${f.cf_write_name }"
								name="cf_write_name" id="comm_picture_update_title">
								</td>

						</tr>
						<tr>
						</tr>
						<tr>
							<td  id="comm_picture_update_td2">사진</td>
							<td>
							<c:if test="${f.cf_file_name ne 'basic.jpg' }">
							<img id="p_preview"
								src="resources/comm/file/${f.cf_file_name }">
								</c:if>
							<c:if test="${f.cf_file_name eq 'basic.jpg' }">
							<img id="p_preview" src="resources/comm/comm_img/noImage.png">
								</c:if>
								<input
								type="hidden" value="${f.cf_file_name }"
								name="oldFile"> <input id="picture" type="file" name="newFile">
								<input type="hidden"
								value="${f.cf_no }" name="cf_no">
								<input type="hidden"
										name="pageNum" value="${param.pageNum }" id="pgn"> <input
										type="hidden" name="search_option"
										value="${param.search_option }" id="so"> <input
										type="hidden" name="search_input"
										value="${param.search_input }" id="si"> 
							</td>
						</tr>
						<tr>
							<td  id="comm_picture_update_td2">내용</td>
							<td><textarea id="comm_picture_update_txt"
									name="cf_txt">${f.cf_txt }</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: right"><button
									style="width: 70px; font-size: 15pt">수정</button></td>
						</tr>
					</table>
				</form>
			</c:forEach>
		</div>
	</div>
</body>
</html>