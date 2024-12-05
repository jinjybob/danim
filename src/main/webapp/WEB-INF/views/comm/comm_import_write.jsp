<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


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
			<form action="comm_import_upload" method="post"
				enctype="multipart/form-data" name="picture_upload"
				onsubmit="return freeUpload();">
				<table id="comm_write_tbl">
					<tr>
					<td colspan="2" id="comm_write_title">
					공지쓰기
					</td>
					</tr>
					<tr>
						<td  class="comm_write_left">사진</td>
						<td  class="comm_write_file">
						<input id="picture" type="file" name="ci_file_name"  value="'basic'">
						</td>
					</tr>
					<tr>
						<td class="comm_write_left">제목</td>
						<td><input id="title" name="ci_write_name" class="comm_write_title"></td>
					</tr>
					<tr>
						<td class="comm_write_left">내용</td>
						<td><textarea id="txt" class="comm_picture_write_txt" name="ci_txt"></textarea> 
							<input name="token"	type="hidden" value="${token }">
							<input type="hidden" name="ci_writer" value="${sessionScope.loginMember.dm_nickname }">
						</td>
					</tr>
					<tr>
						<td colspan="2" id="comm_write_Btn_td"><button id="comm_write_Btn">작성</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>


</body>
</html>

