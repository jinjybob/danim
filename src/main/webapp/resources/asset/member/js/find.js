function findId() {
	document.getElementById("searchP").style.display = "none";
	document.getElementById("searchI").style.display = "";
	console.log("화면 전환1")
}

function findPw() {
	document.getElementById("searchI").style.display = "none";
	document.getElementById("searchP").style.display = "";
	console.log("화면 전환2")
}





$(function () {
	//ID 찾기
	
	$("#idSearchBtn").click(function() {
		let dm_email = $('#dm_email1').val();
		$.ajax({
			url : 'member.findId?dm_email='+ dm_email,
			type : 'get',
			success : function(data) {
				console.log(data);							
				
				if (data == "") {
					$("#mail_check").text("등록되지 않은 메일입니다.");
					$("#mail_check").css("color", "red");
				} else {
					$("#mail_check").text("귀하의 아이디는 " + data + "입니다.");
					$("#mail_check").css("color", "blue");
				}
			}, error : function() {
						console.log("실패");
				}
			});
		});
	
	$("#pwSearchBtn").click(function() {
		console.log('wer')
		let dm_id = $('#dm_id').val();
		let dm_email = $('#dm_email2').val();
		$.ajax({
			url : 'member.findPw?dm_id='+dm_id+'&dm_email='+dm_email,
			type : 'get',
			success : function(data) {
				console.log(data);							
				
				if (data == 1) {
					$("#pw_check").text("메일로 임시비밀 번호를 보내드렸습니다.");
					$("#pw_check").css("color", "blue");
					
				} else {
					$("#pw_check").text("입력하신 정보를 다시 확인해 주세요");
					$("#pw_check").css("color", "red");
				}
			}, error : function() {
						console.log("실패");
				}
			});
		});
	
	
});