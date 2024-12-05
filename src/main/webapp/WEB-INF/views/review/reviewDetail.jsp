<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
div{

border: 1px solid red;
}

.flex-container{
display: flex;
justify-content: center;


}

</style>
<title>Insert title here</title>
</head>
<body>

<div class="content_wrapper">
<div> 글제목</div>

<div class="flex-container">
<div>인원</div>
<div>예산</div>
<div>테마</div>
<div>지역</div>

 </div>

<div class="flex-container">
<div>화살표&lt;</div>
<div>
데이(변수)
<div>
일정표시

${result.rb_title}
</div>
</div>
<div>화살표&gt;</div>
</div>

<div> 경로표시 지도</div>
<div>
 요약페이지
<div>경로</div>
<div>비용</div>
<div>후기</div>

</div>
<div>댓글</div>

</div>

</body>
</html>