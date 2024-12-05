<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#comm_picture_td{
border: 1px solid black;
}
#comm_picture_td_title{
border: 1px solid black;
font-weight: bold;
font-size: 17pt;
}
#comm_picture_tbl a{
text-decoration: none;
	
}
#comm_picture_tbl  a:visited {
color: black; text-decoration: none;
}

#comm_menu{
padding-left: 30px;
width: 10%; 
text-align: center;
}

#comm_picture_searchTbl{
border: solid 1px black;
}

#comm_picture_content{

}

#comm_picture_searchTbl{
margin-left: 70%;
}

#comm_picture_searchBtn{
margin-left: 10px;
}


#comm_picture_content_title2{
padding-top: 100px;
}

#comm_picture_best_img{
width: 280px;
height: 200px;
border: solid 5px black;	
margin-top: 20px;

}

#comm_picture_best_writer{

text-align: right;
font-weight: bold;
border: solid 5px black;	


}
#comm_picture_writename{

text-align: center;
font-weight: bold;
border: solid 5px black;	


}

#comm_picture_bestTbl{
}

#comm_picture_bestTbl2{
}


#comm_menu112{
border : 3px solid black;
height : 800px;
width : 200px;
position: fixed;
}
#comm_picture_content112{
border : 1px solid black;
position: absolute;
left : 250px;
width: 1200px;
}
</style>
</head>
<body>

<div id="comm_menu112">
<aside id="comm_menu_side">
<table id="comm_picture_tbl">
<tr><td id="comm_picture_td_title">커뮤니티</td></tr>
<tr><td id="comm_picture_td"><a href="/danim/comm_picture">사진게시판</a></td></tr>
<tr><td id="comm_picture_td"><a href="/danim/comm_video">동영상게시판</a></td></tr>
<tr><td id="comm_picture_td"><a href="/danim/comm_free">자유게시판</a></td></tr>
</table>
</aside>
</div>


<div id="comm_picture_content112">
<table id="comm_picture_searchTbl">
<tr><td>
<select>
<option>제목</option> 
<option>작성자</option> 
<option>내용</option> 
<option>제목+내용</option> 
</select> 
<input><button id="comm_picture_searchBtn">검색</button>
</td></tr>
</table>

<h2 id="comm_picture_content_title">이달의 사진</h2>
<table id="comm_picture_bestTbl">
<tr><td id=""><img id="comm_picture_best_img" src="resources/comm_img/testimg1.jpg"></img></td>
<td><img id="comm_picture_best_img" src="resources/comm_img/testimg2.jpg"></img></td>
<td><img id="comm_picture_best_img" src="resources/comm_img/testimg3.jpg"></img></td></tr>
<tr><td id="comm_picture_best_writer">김진현님</td><td id="comm_picture_best_writer">박혜아님</td><td id="comm_picture_best_writer">서병관님</td></tr>

<tr><td><img id="comm_picture_best_img" src="resources/comm_img/testimg4.jpg"></img></td>
<td><img id="comm_picture_best_img" src="resources/comm_img/testimg5.jpg"></img></td>
<td><img id="comm_picture_best_img" src="resources/comm_img/testimg6.jpg"></img></td></tr>
<tr><td id="comm_picture_best_writer">김진현님</td><td id="comm_picture_best_writer">박혜아님</td><td id="comm_picture_best_writer">서병관님</td></tr>
</table>

<h2 id="comm_picture_content_title2">사진 게시판</h2>
<table id="comm_picture_bestTbl2">
<c:forEach var="p" items="${pictures }">
<tr><td>${p.comm_picture_write_name }</td></tr>
</c:forEach>
</table>


</div>


</body>
</html>