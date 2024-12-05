const idJ = /^[a-z0-9]{4,12}$/;
const pwJ = /^[A-Za-z0-9]{4,12}$/;
	
const nickJ = /^[가-힣A-Za-z0-9]{3,12}$/;
const mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;



$(function () {
	//회원 가입 id 중복체크
	$("#dm_id").blur(function() {
		let dm_id = $('#dm_id').val();
		$.ajax({
			url : 'member.idCheck?dm_id='+ dm_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다");
						$("#id_check").css("color", "red");
						$("#id_check").css("margin-top", "-18px");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						if(idJ.test(dm_id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#id_check").css('margin-top', '0px');
							$("#reg_submit").attr("disabled", false);
				
						} else if(dm_id == ""){
							$('#id_check').text('아이디를 입력해주세요 :)');
							$("#id_check").css("margin-top", "-18px");
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							$('#id_check').text("아이디는 영어 소문자와 숫자 4~12자리만 가능합니다");
							$("#id_check").css("margin-top", "-18px");
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
	
	//로그인 ID 체크
	$("#dm_id1").blur(function() {
		let dm_id = $('#dm_id1').val();
		$.ajax({
			url : 'member.idExist?dm_id='+ dm_id,
			type : 'post',
			success : function(data) {
				console.log("1 = 아이디 있음 / 0 = 없음  : "+ data);							
				
				if (data == 1) {
					$("#id_check1").text("");
					$("#id_check1").css('margin-top', '0px');
					$("#login_submit").attr("disabled", false);
						
					} else {
						$("#id_check1").text("등록되지 않은 아이디입니다.");
						$("#id_check1").css("color", "red");
						$("#id_check1").css("margin-top", "-18px");
						$("#login_submit").attr("disabled", true);
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
	
	//로그인 PW 체크
	$("#dm_pw1").blur(function() {
		let dm_pw = $('#dm_pw1').val();
		let dm_id = $('#dm_id1').val();
		$.ajax({
			url : 'member.pwExist?dm_pw='+dm_pw+'&dm_id='+dm_id,
			type : 'post',
			success : function(data) {
				console.log('비밀번호 일치 = 1 / 불일치 = 0 : ' + data);							
				
				if (data == 1) {
					$("#pw_check3").text("");
					$("#pw_check3").css('margin-top', '0px');
					$("#login_submit").attr("disabled", false);
						
					} else {
						$("#pw_check3").text("비밀번호를 다시 확인해주세요");
						$("#pw_check3").css("color", "red");
						$("#pw_check3").css("margin-top", "-18px");
						$("#login_submit").attr("disabled", true);
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
	
	//비밀번호 무결성 체크
	$('#dm_pw').blur(function pwCheck() {
		 let pw1 = $('#dm_pw').val();
		if(pwJ.test(pw1)) {
			$("#pw_check1").text("");
			$("#pw_check1").css('margin-top', '0px');
			$("#reg_submit").attr("disabled", false);
			
		} else if(pw1 == ""){
			$('#pw_check1').text('비밀번호를 입력해주세요');
			$("#pw_check1").css("margin-top", "-18px");
			$('#pw_check1').css('color', 'red');
			$("#reg_submit").attr("disabled", true);				
			
		} else {
			$('#pw_check1').text("영어 대소문자와 숫자로 4~12자리 비밀번호를 입력해주세요");
			$("#pw_check1").css("margin-top", "-18px");
			$('#pw_check1').css('color', 'red');
			$("#reg_submit").attr("disabled", true);
		}
	});
	
	$('#dm_pwCheck').blur(function isPwSame() {
		let pw1 = $('#dm_pw').val();
		let pw2 = $('#dm_pwCheck').val();
		
		if(pw1 == pw2) {
			$("#pw_check2").text("");
			$("#pw_check2").css('margin-top', '0px');
			$("#reg_submit").attr("disabled", false);
		} else {
			$('#pw_check2').text('비밀번호가 일치하지 않습니다');
			$("#pw_check2").css("margin-top", "-18px");
			$('#pw_check2').css('color', 'red');
			$("#reg_submit").attr("disabled", true);
		}
	}); 
	
	//닉네임 중복 및 무결성 체크
	$("#dm_nickname").blur(function() {
		let dm_nickname = $('#dm_nickname').val();
		$.ajax({
			url : 'member.nickCheck?dm_nickname='+ dm_nickname,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						$("#nick_check").text("사용중인 닉네임입니다");
						$("#nick_check").css("color", "red");
						$("#nick_check").css("margin-top", "-18px");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						if(nickJ.test(dm_nickname)){
							$("#nick_check").text("");
							$("#nick_check").css('margin-top', '0px');
							$("#reg_submit").attr("disabled", false);
				
						} else if(dm_nickname == ""){
							$('#nick_check').text('닉네임을 입력해주세요 :)');
							$("#nick_check").css("margin-top", "-18px");
							$('#nick_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							$('#nick_check').text("닉네임은 3~12자리만 가능합니다");
							$("#nick_check").css("margin-top", "-18px");
							$('#nick_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
	
	//이메일 중복 및 무결성 체크
	$("#dm_email").blur(function() {
		let dm_email = $('#dm_email').val();
		$.ajax({
			url : 'member.mailCheck?dm_email='+ dm_email,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						$("#mail_check").text("사용중인 메일 주소입니다");
						$("#mail_check").css("color", "red");
						$("#mail_check").css("margin-top", "-18px");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						if(mailJ.test(dm_email)){
							$("#mail_check").text("");
							$("#mail_check").css('margin-top', '0px');
							$("#reg_submit").attr("disabled", false);
				
						} else if(dm_email == ""){
							$('#mail_check').text('메일 주소를 입력해주세요 :)');
							$("#mail_check").css("margin-top", "-18px");
							$('#mail_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							$('#mail_check').text("올바른 메일주소를 입력해 주세요");
							$("#mail_check").css("margin-top", "-18px");
							$('#mail_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
	
	
	
});
	
		

		
		 
		
		 
		
		
		
		
			
			
			

			