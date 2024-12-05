<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다님 :: DANIM</title>
</head>
<link rel="stylesheet" href="resources/asset/index/css/style.css">
<link rel="stylesheet" href="resources/asset/index/css/index.css">

<link rel="stylesheet" href="resources/asset/index/css/carousel.css">

<body>
	<section class="section_carousel">
		<div class="carousel-wrapper">
	
			<div class="carousel">
				<img class="carousel_item" src="resources/asset/index/img/1.jpg" />
				<img class="carousel_item" src="resources/asset/index/img/2.jpg" />
				<img class="carousel_item" src="resources/asset/index/img/3.jpg" />

				<div class="carousel_button--next"></div>
				<div class="carousel_button--prev"></div>
			</div>
		</div>
	</section>
	<section class="section_content1">

		<div class="title_wrap">
			<div class="section_title">
				<h1>즐거운 여행, 다님</h1>
			</div>
			<div class="section_desc">다님에서 여행과 관련된 정보를 얻어보세요</div>
		</div>
		<div class="boxWrap">
			<div class="box">
				<div class="imgBx">
					<a href="planMain"><img src="resources/asset/index/img/4.jpg"></a>
				</div>
				<div class="imgTitle">
					<h2>계획 짜기</h2>
				</div>
				<div class="imgDesc">
					<h3>여행의 시작은 탄탄한 계획에서!</h3>
				</div>
			</div>
			<div class="box">
				<div class="imgBx">
					<a href="review.go"><img src="resources/asset/index/img/5.jpg"></a>
				</div>
				<div class="imgTitle">
					<h2>여행 후기</h2>
				</div>
				<div class="imgDesc">
					<h3>
						다른 여행 후기를 바탕으로<br>자신만의 계획을 세워보세요!
					</h3>
				</div>
			</div>
			<div class="box">
				<div class="imgBx">
					<a href="/danim/comm_free_page?pageNum=1"><img src="resources/asset/index/img/6.jpg"></a>
				</div>
				<div class="imgTitle">
					<h2>커뮤니티</h2>
				</div>
				<div class="imgDesc">
					<h3>다른 사람들과 소통해보세요!</h3>
				</div>
			</div>

		</div>
	</section>
	<section class="section_content2">
		<div class="title_wrap">
			<div class="section_title">
				<h1>여행지에서의 추억들</h1>
			</div>
			<div class="section_desc">다른 사람들의 추억을 엿볼수 있어요</div>
		</div>
		<div class="boxWrap">
			<div class="box">
				<div class="imgBx">
					<a href="/danim/comm_picture_page?pageNum=1"><img src="resources/asset/index/img/7.jpg"></a>
				</div>
				<div class="imgTitle">
					<h2>베스트 사진</h2>
				</div>
				<div class="imgDesc">
					<h3>여행에서의 최고의<br>한 장을 확인해보세요</h3>
				</div>
			</div>
			<div class="box">
				<div class="imgBx">
					<a href="/danim/comm_video_page?pageNum=1"><img src="resources/asset/index/img/8.jpg"></a>
				</div>
				<div class="imgTitle">
					<h2>베스트 영상</h2>
				</div>
				<div class="imgDesc">
					<h3>
						여행지에서의 최고의 추억을<br>생생한 영상으로 확인해보세요
					</h3>
				</div>
			</div>
			

		</div>
	</section>
	

	<script src="resources/asset/index/js/carousel.js"></script>

</body>
</html>