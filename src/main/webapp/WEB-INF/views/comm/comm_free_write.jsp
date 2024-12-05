<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	
	previewImg();

});
</script>
</head>
<body>


	<div id="comm_picture_area">
		<div id="comm_menu1122">
			<aside id="comm_menu_side">
				<table id="comm_picture_tbl">
					<tr>
						<td id="comm_picture_td_title">커뮤니티</td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_picture_page?pageNum=1">사진게시판</a></td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_video_page?pageNum=1">영상게시판</a></td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_free_page?pageNum=1">자유게시판</a></td>
					</tr>
				</table>
			</aside>
		</div>


		<div id="comm_free_write_content112">
		<div id="content_title_div">
				<h2  class="best_write_pic2">자유게시판</h2>
				</div>
				<hr class="comm_write_hr2">
			<form action="comm_free_upload" method="post"
				enctype="multipart/form-data" name="picture_upload"
				onsubmit="return freeUpload();">
				<table id="comm_write_tbl">
					<tr>
					<td colspan="2" id="comm_write_title">
					글쓰기
					</td>
					</tr>
					<tr>
						<td  class="comm_write_left">사진</td>
						<td  class="comm_write_file">
						<input id="picture" type="file" name="cf_file_name"  value="'basic'">
						</td>
					</tr>
					<tr>
						<td class="comm_write_left">제목</td>
						<td><input id="title" name="cf_write_name" class="comm_write_title"
						placeholder="제목 입력(최대20자)" maxlength="20"
						></td>
					</tr>
					<tr>
						<td class="comm_write_left">내용</td>
						<td><textarea id="txt" class="comm_picture_write_txt" name="cf_txt"
						placeholder="내용 입력(최대300자)" maxlength="300"
						></textarea> 
							<input name="token"	type="hidden" value="${token }">
							<input type="hidden" name="cf_writer" value="${sessionScope.loginMember.dm_nickname }">
						</td>
					</tr>
					<tr>
						<td colspan="2" id="comm_write_Btn_td"><button id="comm_write_Btn">작성</button></td>
					</tr>
				</table>
					<div id="image_container" class="image_container_div2">
				<h2>사진 미리보기</h2>
				<img id="p_preview" src="resources/comm/comm_img/noImage.png">
				</div>
			</form>
		</div>
	</div>


</body>
</html>