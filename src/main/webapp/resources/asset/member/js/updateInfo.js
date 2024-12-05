

const mailJ2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

$(function () {
	
	
	$("#dm_nickname3").blur(function() {
		let dm_nickname = $('#dm_nickname3').val();
		const nickJ2 = /^[가-힣A-Za-z0-9]{3,12}$/;
		$.ajax({
			url : 'member.nickCheck?dm_nickname='+ dm_nickname,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						$("#nick_check").text("사용중인 닉네임입니다");
						$("#nick_check").css("color", "red");
						$("#nick_check").css("margin-top", "-18px");
						$("#update_submit").attr("disabled", true);
					} else {
						
						if(nickJ2.test(dm_nickname)){
							$("#nick_check").text("");
							$("#nick_check").css('margin-top', '0px');
							$("#update_submit").attr("disabled", false);
				
						} else if(dm_nickname == ""){
							$('#nick_check').text('닉네임을 입력해주세요 :)');
							$("#nick_check").css("margin-top", "-18px");
							$('#nick_check').css('color', 'red');
							$("#update_submit").attr("disabled", true);				
							
						} else {
							$('#nick_check').text("닉네임은 3~12자리만 가능합니다");
							$("#nick_check").css("margin-top", "-18px");
							$('#nick_check').css('color', 'red');
							$("#update_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
	
	//이메일 중복 및 무결성 체크
	$("#dm_email3").blur(function() {
		let dm_email = $('#dm_email3').val();
		$.ajax({
			url : 'member.mailCheck?dm_email='+ dm_email,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						$("#mail_check").text("사용중인 메일 주소입니다");
						$("#mail_check").css("color", "red");
						$("#mail_check").css("margin-top", "-18px");
						$("#update_submit").attr("disabled", true);
					} else {
						
						if(mailJ2.test(dm_email)){
							$("#mail_check").text("");
							$("#mail_check").css('margin-top', '0px');
							$("#update_submit").attr("disabled", false);
				
						} else if(dm_email == ""){
							$('#mail_check').text('메일 주소를 입력해주세요 :)');
							$("#mail_check").css("margin-top", "-18px");
							$('#mail_check').css('color', 'red');
							$("#update_submit").attr("disabled", true);				
							
						} else {
							$('#mail_check').text("올바른 메일주소를 입력해 주세요");
							$("#mail_check").css("margin-top", "-18px");
							$('#mail_check').css('color', 'red');
							$("#update_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
	
})