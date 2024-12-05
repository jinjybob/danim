<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script type="text/javascript">
$(function() {
	adjustHeight();
});

window.onpageshow = function(event) {
	if (event.persisted
			|| (window.performance && window.performance.navigation.type == 2)) {
		let pgn = $("#pgn").val();
		let so = $("#so").val(); 
		let si = $("#si").val(); 
		if(so != ""){
			location.href="/danim/comm_video_search?search_option="+so+"&search_input="+si+"&pageNum="+pgn;
		}
		else{
		if (pgn != "") {
			location.href = "/danim/comm_video_page?pageNum=" + pgn;
		} else {
			location.href = "/danim/comm_video_page";
		}
			
		}
	}
}

function adjustHeight() {
	  var textEle = $('#video_txt_area');
	  textEle[0].style.height = 'auto';
	  var textEleHeight = textEle.prop('scrollHeight');
	  textEle.css('height', textEleHeight);
	};
</script>
</head>
<body>
	<div id="comm_picture_detail_area">
		<div id="comm_menu112">
			<aside id="comm_menu_side">
				<table id="comm_picture_tbl">
					<tr>
						<td id="comm_picture_td_title">커뮤니티
						
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
				<h2  class="best_pic2">영상게시판</h2>
				</div>
				<hr class="comm_detail_hr">
			<c:forEach var="v" items="${video }">
				<table id="comm_picture_detail_tbl">
					<tr>
						<td id="comm_detail_title" colspan="2">${v.cv_write_name }
						<input name="token" type="hidden" value="${token }">
						</td>
					</tr>
					<tr>
						<td id="comm_picture_detail_td2">조회수  : ${v.cv_view } |
						추천수 : ${v.cv_good } |
						작성자 : ${v.cv_writer } |
						</td>
					</tr>
					<tr>
						<td id="comm_picture_detail_td2">
						작성일 : <fmt:formatDate value="${v.cv_date }" pattern="yyyy-MM-dd"/>
						</td>
					</tr>
					<tr>
					</tr>
					<tr>
					<td>
						<video controls="controls" id="comm_video_detail_img"
								src="resources/comm/file/${v.cv_name }"></video>
								</td>
					</tr>
					<tr>
						<td colspan="2" ><textarea 
						readonly="readonly"
						id="video_txt_area">${v.cv_txt }</textarea></td>
					</tr>
					<tr>
					<td>
					<c:if
						test="${sessionScope.loginMember.dm_id ne v.cv_writer && sessionScope.loginMember != null && checked.cvg_good eq null or checked.cvg_good == 0 }">
						<form action="comm_video_good">
							<table style="padding-left: 48%; padding-top: 10px;">
								<tr>
									<td colspan="4" style="text-align: right;"><input
										name="no" type="hidden" value="${v.cv_no }"> <input
										name="id" type="hidden"
										value="${sessionScope.loginMember.dm_id }"> <input
										name="token2" value="${token2 }" type="hidden">
										<input type="hidden" name="pageNum" value="${param.pageNum }" id="pgn"> 
										<input type="hidden" name="search_option" value="${param.search_option }" id="so"> 
										<input type="hidden" name="search_input" value="${param.search_input }" id="si">
										<button class="comm_heart_btn" onclick="return reallyGood();">
											<img class="comm_heart_img"
												src="resources/comm/comm_img/heart.png">
										</button></td>
								</tr>
							</table>
						</form>

					</c:if>
					<c:if
						test="${sessionScope.loginMember.dm_id ne v.cv_writer && sessionScope.loginMember != null && checked.cvg_good == 1 }">
						<form action="comm_video_Nogood">
							<table style="padding-left: 48%; padding-top: 10px;">
								<tr>
									<td colspan="4" style="text-align: right;"><input
										name="no" type="hidden" value="${v.cv_no }"> <input
										name="id" type="hidden"
										value="${sessionScope.loginMember.dm_id }"> <input
										name="token2" value="${token2 }" type="hidden">
										<input type="hidden" name="pageNum" value="${param.pageNum }" id="pgn"> 
										<input type="hidden" name="search_option" value="${param.search_option }" id="so"> 
										<input type="hidden" name="search_input" value="${param.search_input }" id="si">
										<button class="comm_heart_btn"
											onclick="return reallyNoGood();">
											<img class="comm_heart_img"
												src="resources/comm/comm_img/heart2.png">
										</button></td>
								</tr>
							</table>
						</form>
					</c:if>
					
					
					</td>
					
					</tr>
					
					
					<c:if
						test="${sessionScope.loginMember.dm_nickname eq v.cv_writer || sessionScope.loginMember.dm_isAdmin eq 'Y'}">
						<tr>
							<td colspan="2" style="text-align: right">
							<button style="width: 70px; margin-right: 10px; font-size: 15pt; background: none; border: none;"
			onclick="comm_VideoupdateOK(${v.cv_no},${param.pageNum },'${param.search_option }','${param.search_input }')"><img id="detail_icon" src="resources/comm/comm_img/edit.png"></button>
								<button style="width: 70px; font-size: 15pt; background: none; border: none;"
									onclick="comm_VideodelOK(${v.cv_no})"><img id="detail_icon" src="resources/comm/comm_img/delete.png"></button>
									</td>
						</tr>
					</c:if>
					
					
				</table>
				<hr class="comm_detail_hr">
				<button id="list_btn" onclick="window.history.back()">목록</button>
				<table id="comm_picture_detail_reply_title">
					<tr>
						<td><div id="comment_div">Comment &nbsp;<img src="resources/comm/comm_img/comment.png" id="comment_img"></div></td>
					</tr>
				</table>

				<form action="comm_video_reply">
					<table id="comm_picture_detail_reply">
					<c:forEach items="${reply }" var="r">
							<tr>
								<td style="text-align: center;  width: 180px;">${r.cvr_owner }<c:if test="${v.cv_writer eq r.cvr_owner }">
								<span id="reply_writer">
								&nbsp;&nbsp;작성자&nbsp;&nbsp;</span>
								</c:if></td>
								<td style="text-align: center;">${r.cvr_txt }</td>
								<td style="text-align: center;">
								<div id="reply_div">
								<fmt:formatDate value="${r.cvr_when }" pattern="yyyy-MM-dd"/>
								<c:if
									test="${sessionScope.loginMember.dm_id eq r.cvr_owner_id  || sessionScope.loginMember.dm_isAdmin eq 'Y'}">
									
										&nbsp;<button id="reply_btn" onclick="videoReplyUpdate(${r.cvr_no},${param.no})"><img id="reply_icon" src="resources/comm/comm_img/edit.png"></button>
										&nbsp;<button id="reply_btn" onclick="videoReplyDel(${r.cvr_no})"><img id="reply_icon" src="resources/comm/comm_img/delete.png"></button>
								</c:if>
								</div>
								</td>	
							</tr>
						</c:forEach>
						<tr>
							<td style="text-align: center;">
							<c:if test="${sessionScope.loginMember != null }">
							${sessionScope.loginMember.dm_nickname }
							</c:if>
							<c:if test="${sessionScope.loginMember == null }">
							로그인이 필요합니다.
							</c:if>
								<input name="cvr_owner" type="hidden"
								value="${sessionScope.loginMember.dm_nickname }"> <input
								name="cvr_owner_id" type="hidden"
								value="${sessionScope.loginMember.dm_id }">
							</td>
							<td style="text-align: center;"><input
								id="comm_picture_detail_replyInput" placeholder="댓글입력..."name="cvr_txt"
								class="cvr_txt"> <input type="hidden" name="no"
								value="${v.cv_no }"> <input type="hidden" name="token2"
								value="${token2}"></td>
							<td colspan="2" style="text-align: center;">
							<c:if test="${sessionScope.loginMember != null }">
									<button style="width: 70px; font-size: 15pt;"
										onclick="return videoreplyOK()">작성</button>
								</c:if> <c:if test="${sessionScope.loginMember == null }">
									<button style="width: 70px; font-size: 15pt;"
										onclick="return replyNoOK()">작성</button>
								</c:if></td>
						</tr>
					</table>
				</form>
			</c:forEach>
		</div>
	</div>
</body>
</html>