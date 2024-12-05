function comm_delOK(no) {
	var ok = confirm('정말 삭제하시겠습니까?')
	
	if (ok) {
		location.href='comm_picture_delete?pageNum=1&no='+no;
	}
	
}
function comm_importdelOK(no) {
	var ok = confirm('정말 삭제하시겠습니까?')
	
	if (ok) {
		location.href='comm_import_delete?pageNum=1&no='+no;
	}
	
}

function goToList() {
	let pgn = $("#pgn").val();
	let so = $("#so").val(); 
	let si = $("#si").val(); 

	if(so != ""){
		location.href="/danim/comm_picture_search?search_option="+so+"&search_input="+si+"&pageNum="+pgn;
	}
	else{
	if (pgn != "") {
		location.href = "/danim/comm_picture_page?pageNum=" + pgn;
	} else {
		location.href = "/danim/comm_picture_page?pageNum=1";
	}
	}	
}

function previewImg(){

    document.getElementById("picture").onchange = function () {
        var reader = new FileReader();

        reader.onload = function (e) {
            document.getElementById("p_preview").src = e.target.result;
        };
        reader.readAsDataURL(this.files[0]);
    };
}


function comm_updateOK(no,pg,so,si) {
var ok = confirm('정말 수정하시겠습니까?')
	
	if (ok) {
		location.href='comm_picture_update?no='+no+'&pageNum='+pg+'&search_option='+so+'&search_input='+si;
	}
}
function comm_VideodelOK(no) {
	var ok = confirm('정말 삭제하시겠습니까?')
	
	if (ok) {
		location.href='comm_video_delete?pageNum=1&no='+no;
	}
	
}

function comm_VideoupdateOK(no,pg,so,si) {
	var ok = confirm('정말 수정하시겠습니까?')
	
	if (ok) {
		location.href='comm_video_update?no='+no+'&pageNum='+pg+'&search_option='+so+'&search_input='+si;
	}
}
function comm_FreedelOK(no) {
	var ok = confirm('정말 삭제하시겠습니까?')
	
	if (ok) {
		location.href='comm_free_delete?pageNum=1&no='+no;
	}
	
}


function comm_updateFreeOK(no,pg,so,si) {
	var ok = confirm('정말 수정하시겠습니까?')
	
	if (ok) {
		location.href='comm_free_update?no='+no+'&pageNum='+pg+'&search_option='+so+'&search_input='+si;
	}
}

function comm_goodOK(no,id) {
	var ok = confirm('추천하시겠습니까?')
	
	if (ok) {
		alert('추천되었습니다');
		location.href="comm_picture_good?no=" + no + "&id=" + id;
	}
}



function pictureReplyDel(no,no1) {
	
var ok = confirm('정말 삭제하시겠습니까?!!')
	
	if (ok) {
		console.log('여기니');
		//return false;
		location.href='comm_picture_reply_delete?no='+no+'&cpr_no='+no1;
	}
	
	
}

function pictureReplyUpdate(r_no,no)
{
	var ok = confirm('수정 하시겠습니까?!?!?!?!!')
	
	if (ok) {
		
		var txt = prompt("수정할 내용 입력");

		location.href='comm_picture_reply_update?no='+no+"&newReply="+txt+"&cpr_no="+r_no;
	}
	
	else{
		return false;
	}
	
}

function videoReplyUpdate(r_no,no)
{
	var ok = confirm('수정 하시겠습니까?!?!?!?!!')
	
	if (ok) {
		
		var txt = prompt("수정할 내용 입력");
		
	}
	
	location.href='comm_video_reply_update?no='+no+"&newReply="+txt+"&cvr_no="+r_no;
}
function freeReplyUpdate(r_no,no)
{
	var ok = confirm('수정 하시겠습니까?!?!?!?!!')
	
	if (ok) {
		
		var txt = prompt("수정할 내용 입력");
		
	}
	
	location.href='comm_free_reply_update?no='+no+"&newReply="+txt+"&cfr_no="+r_no;
}

function videoReplyDel(no) {
	
	var ok = confirm('정말 삭제하시겠습니까?')
	
	if (ok) {
		location.href='comm_video_reply_delete?cvr_no='+no;
	}
	
	
}

function freeReplyDel(no) {
	
	var ok = confirm('정말 삭제하시겠습니까?')
	
	if (ok) {
		location.href='comm_free_reply_delete?cfr_no='+no;
	}
	
	
}


function pictureUpload() {
	/*	var title = document.getElementById('title').value;
	var picture = document.getElementById('picture').value;
	var txt = document.getElementById('txt').value;*/
	
	var title = document.picture_upload.comm_picture_write_name.value;
	var picture = document.picture_upload.comm_picture_name.value;
	var txt = document.picture_upload.comm_picture_txt.value;	
	
	var fileLen = picture.length;
	 
    /** 
     * lastIndexOf('.') 
     * 뒤에서부터 '.'의 위치를 찾기위한 함수
     * 검색 문자의 위치를 반환한다.
     * 파일 이름에 '.'이 포함되는 경우가 있기 때문에 lastIndexOf() 사용
     */
    var lastDot = picture.lastIndexOf('.');
 
    // 확장자 명만 추출한 후 소문자로 변경
    var fileExt = picture.substring(lastDot, fileLen).toLowerCase();

	 
	if (title == "") {
		alert("제목을 입력해주세요");
		
		return false;
		
	}
	else if (picture == "") {
		alert("사진을 등록해주세요");
	
		return false;	
	}
	else if (fileExt != ".jfif" && fileExt != ".jpg" && fileExt != ".jpeg" && fileExt != ".png" && 
			fileExt != ".gif" &&fileExt != ".bmp" && fileExt != ".tif" && fileExt != ".tiff")
	{
		
		alert("이미지 파일만 등록해주세요");
		
		return false;
	}
	
	else if (txt == ""){ 
			alert("내용을 입력해주세요");
			
			return false;
	}
	
	return true;
}	
function freeUpload() {
	var title = document.getElementById('title').value;
	var picture = document.getElementById('picture').value;
	var txt = document.getElementById('txt').value;
	
	/*var title = document.picture_upload.comm_picture_write_name.value;
	var picture = document.picture_upload.comm_picture_name.value;
	var txt = document.picture_upload.comm_picture_txt.value;	
	*/
	var fileLen = picture.length;
	
	/** 
	 * lastIndexOf('.') 
	 * 뒤에서부터 '.'의 위치를 찾기위한 함수
	 * 검색 문자의 위치를 반환한다.
	 * 파일 이름에 '.'이 포함되는 경우가 있기 때문에 lastIndexOf() 사용
	 */
	var lastDot = picture.lastIndexOf('.');
	
	// 확장자 명만 추출한 후 소문자로 변경
	var fileExt = picture.substring(lastDot, fileLen).toLowerCase();
	
	
	if (title == "") {
		alert("제목을 입력해주세요");
		
		return false;
		
	}
	else if (picture != "") {
		if (fileExt != ".jfif" && fileExt != ".jpg" && fileExt != ".jpeg" && fileExt != ".png" && 
				fileExt != ".gif" &&fileExt != ".bmp" && fileExt != ".tif" && fileExt != ".tiff")
		{
			
			alert("이미지 파일만 등록해주세요");
			
			return false;
		
	}
	}
	
	else if (txt == ""){ 
		alert("내용을 입력해주세요");
		
		return false;
	}
	
	return true;
}	

function videoUpload() {
	var title = document.getElementById('title').value;
	var video = document.getElementById('picture').value;
	var txt = document.getElementById('txt').value;

	
/*	var title = document.picture_upload.cv_write_name.value;
	var video = document.picture_upload.cv_name.value;
	var txt = document.picture_upload.cv_txt.value;	*/
	
	var fileLen = video.length;
	

	var lastDot = video.lastIndexOf('.');
	var fileExt = video.substring(lastDot, fileLen).toLowerCase();
	
	
	if (title == "") {
		alert("제목을 입력해주세요");
		
		return false;
		
	}
	if (video == "") {
		alert("영상을 등록해주세요");
		
		return false;	
	}
	
	if (fileExt != ".mp4" && fileExt != ".m4v" && fileExt != ".avi" && fileExt != ".wmv" && 
			fileExt != ".mwa" &&fileExt != ".asf" && fileExt != ".mkv" && fileExt != ".mpg" && fileExt != ".mov" && fileExt != ".webm"
				&& fileExt != ".3gp" && fileExt != ".3g2" && fileExt != ".mpeg" && fileExt != ".ts")
	{
		
		alert("동영상 파일만 등록해주세요");
		
		return false;
	}
	if (txt == ""){ 
		alert("내용을 입력해주세요");
		
		return false;
	}
	
	return true;
}	


function reallyGood() {
	
	var ok = confirm('정말 추천하시겠습니까?')
	
	if(ok){
		return true;
	}
	else {
		return false;
	}
}

function reallyNoGood() {
	
	var ok = confirm('추천을 취소 하시겠습니까?')
	
	if(ok){
		return true;
	}
	else {
		return false;
	}
}

function replyOK(){
	
	
	var txt = document.getElementsByClassName('cpr_txt')[0].value;
	
	if (txt == "") {
		alert('댓글을 입력해주세요');
		return false;
	}
	else{
		return true;
		
	}
	}
function replyNoOK(){
	alert('로그인 후 이용해주세요')
	return false;
}

function videoreplyOK(){
	
	
	var txt = document.getElementsByClassName('cvr_txt')[0].value;
	
	if (txt == "") {
		alert('댓글을 입력해주세요');
		return false;
	}
	else{
		return true;
		
	}
}

function freereplyOK(){
	
	
	var txt = document.getElementsByClassName('cfr_txt')[0].value;
	
	if (txt == "") {
		alert('댓글을 입력해주세요');
		return false;
	}
	else{
		return true;
		
	}
}


function replyNoOK(){
	alert('로그인 후 이용해주세요')
	return false;
}



function mouse_over(i){
	let aa = "hz"+i
	
	document.getElementById('hz'+i).play();
	document.getElementById('play_img'+i).style.visibility="hidden";
	
}
function mouse_over3(i){
	/*
	document.getElementById('big_img'+i).style.filter="blur(2.5px)";*/
	
}
function mouse_out3(i){
	/*
	document.getElementById('big_img'+i).style.filter="blur(0px)";*/
	
	
}



function mouse_out(i){
	
	let aa = "hz"+i	    
	document.getElementById("hz"+i).pause();
	document.getElementById('play_img'+i).style.visibility="visible";
	
}



function mouse_over2(i){
	let aa = "mz"+i
	document.getElementById("mz"+i).play();

	document.getElementById('play2_img'+i).style.visibility="hidden";
	
}

function mouse_out2(i){
	
	let aa = "mz"+i	    
	document.getElementById("mz"+i).pause();

	document.getElementById('play2_img'+i).style.visibility="visible";
}

