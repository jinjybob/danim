<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다님 :: 회원 정보 찾기</title>
<link rel="stylesheet" href="resources/asset/index/css/style.css" />
<link rel="stylesheet" href="resources/asset/member/css/findInfo.css" />
<script type="text/javascript" src="resources/asset/index/js/jquery.js"></script>

</head>
<body>
	<div class="content_background">
		<header>
			<h2>아이디/비밀번호 찾기</h2>
		</header>
		<div class="container_btns">
			<button class="findId_btn" onclick="findId()">아이디 찾기</button>
			<button class="findPw_btn" onclick="findPw()">비밀번호 찾기</button>
		</div>
		<div class="container_inputs">
			<div id="searchI">
				<div class="form-group">
					<h3>이메일을 입력해주세요</h3>
					<div>

						<input type="text" class="form-control" id="dm_email1"
							name="dm_email" placeholder="이메일">
						<div class="check_fnt" id="mail_check"></div>
					</div>
				

				<button id="idSearchBtn" class="btn btn-primary btn-block">확인</button>
				</div>
			</div>
		</div>

		<div id="searchP" style="display: none;">
			<div class="form-group">
				<h3>아이디와 이메일을 입력해주세요</h3>
				<div>
					<input type="text" class="form-control" id="dm_id" name="dm_id"
						placeholder="아이디">
				</div>
			
				<div>
					<input type="email" class="form-control" id="dm_email2"
						name="dm_email" placeholder="이메일">
					<div class="check_fnt" id="pw_check"></div>
				</div>
			<button id="pwSearchBtn" class="btn btn-primary btn-block">확인</button>
			</div>
		</div>
	</div>
	<!-- <div class="container">
			<div class="area_inputs">

				<div style="margin-bottom: 10px;" class="custom-radio">
					<input type="radio" class="custom-control-input" id="search_1"
						name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold text-white"
						for="search_1">아이디 찾기</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_2"
						name="search_total" onclick="search_check(2)"> <label
						class="custom-control-label font-weight-bold text-white"
						for="search_2">비밀번호 찾기</label>
				</div>
				<div id="searchI">
					<div class="form-group">
						<h3>가입하실때 입력한 이메일을 입력해주세요</h3>
						<label class="font-weight-bold text-white" for="dm_email">이메일</label>
						<div>

							<input type="text" class="form-control" id="dm_email1"
								name="dm_email">
							<div class="check_fnt" id="mail_check"></div>
						</div>
					</div>

					<div class="form-group">
						<button id="idSearchBtn" class="btn btn-primary btn-block">확인</button>
					</div>
				</div>
			</div>

			<div id="searchP" style="display: none;">
				<div class="form-group">
					<h3>가입하실때 입력한 아이디와 이메일을 입력해주세요</h3>
					<label class="font-weight-bold text-white" for="dm_id">아이디</label>
					<div>
						<input type="text" class="form-control" id="dm_id" name="dm_id">
					</div>
				</div>
				<div class="form-group">
					<label class="font-weight-bold text-white" for="dm_email">이메일</label>
					<div>
						<input type="email" class="form-control" id="dm_email2"
							name="dm_email">
						<div class="check_fnt" id="pw_check"></div>
					</div>
				</div>
				<div class="form-group">
					<button id="pwSearchBtn" class="btn btn-primary btn-block">확인</button>
				</div>
			</div>
		</div> -->


	<script type="text/javascript" src="resources/asset/member/js/find.js"></script>

</body>
</html>