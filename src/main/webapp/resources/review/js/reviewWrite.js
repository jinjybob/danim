/**
 * 
 */

//js 준비
document.addEventListener('DOMContentLoaded', function () {


                /* 자유 한마디 실시간 글자수세기, 엔터 3줄 제한 */
                countTxt();

	
   // console.log(document.getElementById('selectBox'));

   document.getElementById('selectBox').addEventListener('change',function(){

    if(document.getElementById('selectBox').value == "direct"){
        document.getElementById('inputContainer').style.display = 'inline-block';
       
    } else{
        document.getElementById('inputContainer').style.display = 'none';
    }
   // if(document.getElementById('selectBoxDirect').ariaValueMax())

 });
	





// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {

    // 드롭버튼클릭했을때
if(event.target.classList.contains('dropbtn')){
    console.log(event.target.parentNode.childNodes[3].classList.toggle("show"));
}

// Close the dropdown menu if the user clicks outside of it
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }

  //뒤에일정추가
  if(event.target.classList.contains('insert_col_back')){
      if(event.target.parentNode.parentNode.parentNode.nextElementSibling){
          alert('다음일정이 이미 존재합니다.');
          return false;
      }
      console.log(daycount);
      if(daycount < 10){
 createSchedule(event.target);
 document.getElementById('totalday').value=daycount;
 document.querySelector('.daily_schedule.active').nextElementSibling.classList.add('active') ;
 document.querySelector('.daily_schedule.active').classList.remove('active') ;
}
    if(daycount >=10){
        console.log('일정생성제한');
        alert('일정은 10일까지만 생성가능합니다.');
    }

  }



}


	
});
/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
// function doDropdown() {
    
//     document.getElementById("myDropdown").classList.toggle("show");


// }

let daycount = 1;

function createSchedule(a){
/*98번과 99번줄 사이에 주석처리 한것 -> <img alt="" src="resources/review/img/plus-circle.svg">\*/
    ++daycount;
   let newDiv =  document.createElement('div');
   newDiv.setAttribute('id','daily_schedule_con');
   newDiv.classList.add('daily_schedule');
   
   newDiv.setAttribute('data-day',daycount);

   newDiv.innerHTML = '<div class="dropdown">\
       <button type="button" onclick="" class="dropbtn">+\
       </button>\
       <div id="myDropdown" class="dropdown-content">\
           <a href="javascript:void(0);" class="insert_col_back">뒤에 일정추가</a> <a href="#" onclick="deleteDay(this)">일정삭제</a>\
       </div>\
   </div>\
   <a href="javascript:void(0);" onclick="activateDay(this)"><span>day '+daycount+'</span></a>'
   console.log(newDiv);
   console.log(a.parentNode.parentNode.parentNode);
   //document.getElementById('schedule_inner_nav').inn
//    a.parentNode.parentNode.parentNode.append('afterend',newDiv);
console.log(a);
    a.parentNode.parentNode.parentNode.parentNode.append(newDiv);
    
    console.log(document.getElementById('schedule_inner_nav').childNodes);
    console.log(document.querySelectorAll('.daily_schedule'));
    
    
    if(daycount >3){
        //console.log(document.querySelectorAll('.daily_schedule')[0]);
        document.querySelectorAll('.daily_schedule')[daycount-4].style.display = 'none';
    }


}

function moveNextD(){
    if(document.querySelector('.daily_schedule.active').nextElementSibling == null){
       result = confirm('마지막 일정입니다. 일정을 추가할까요?');
       if(result == true){
           console.log(document.querySelector('.daily_schedule.active').childNodes[0]);
        console.log(document.querySelector('.daily_schedule.active').childNodes[0].childNodes[3].childNodes[3]);
        backwardBtn = document.querySelector('.daily_schedule.active').childNodes[0].childNodes[3].childNodes[3];
          
        if(daycount < 10){
            createSchedule(backwardBtn);
            document.getElementById('totalday').value=daycount;
        }
        else{
            console.log('생성제한');
            alert('일정은 10일까지만 생성가능합니다.');
        }
        }
        else{
            return false;
        }
    }
    else if(document.querySelector('.daily_schedule.active').nextElementSibling.style.display =='none'){
        console.log('다음버튼 view 변경시');
        document.querySelector('.daily_schedule.active').previousElementSibling.previousElementSibling.style.display = 'none';

        let activateThis = document.querySelector('.daily_schedule.active').nextElementSibling;

        activateThis.classList.add('active') ;
        document.querySelector('.daily_schedule.active').classList.remove('active') ;
        document.querySelector('.daily_schedule.active').style.display ='block';

        onlyShowselected(activateThis);
        
    }
    else{
        console.log('다음버튼 일반상태');

        let activateThis = document.querySelector('.daily_schedule.active').nextElementSibling;
        activateThis.classList.add('active') ;
        document.querySelector('.daily_schedule.active').classList.remove('active') ;

        onlyShowselected(activateThis);

    }

}

function activateDay(e){
    document.querySelector('.daily_schedule.active').classList.remove('active');
    e.parentNode.classList.add('active');
    console.log('일정눌렀을때 활성화상태');


   onlyShowselected(e.parentNode);

}

//활성화된 일정만 보여주기
function onlyShowselected(target){
    let dayCheck = 'day'+target.getAttribute('data-day');
    console.log(dayCheck);


    document.querySelectorAll('.dailyBox').forEach(function(dailyBox){
       console.log(dailyBox);
        dailyBox.style.display ='none';
    });

    document.getElementById(dayCheck).style.display ='block';
    console.log(document.getElementById(dayCheck));
}

//앞으로눌렀을때
function movePrevD(){
    if(document.querySelector('.daily_schedule.active').getAttribute('data-day') == 1){
        alert('첫번째 일정입니다.');
    } else{
        console.log('이전버튼 일반상태');
        console.log(document.querySelector('.daily_schedule.active').previousElementSibling);

        let activateThis = document.querySelector('.daily_schedule.active').previousElementSibling;

        activateThis.classList.add('active');
        document.querySelector('.daily_schedule.active').nextElementSibling.classList.remove('active') ;
        if(document.querySelector('.daily_schedule.active').style.display == 'none'){
            document.querySelector('.daily_schedule.active').style.display = 'block';

            if(document.querySelector('.daily_schedule.active').nextElementSibling.nextElementSibling.nextElementSibling != null){
            document.querySelector('.daily_schedule.active').nextElementSibling.nextElementSibling.nextElementSibling.style.display = 'none';}
        }

        onlyShowselected(activateThis)
    }
}

function deleteDay(e){
    if(document.querySelectorAll('.daily_schedule').length ==1){
        alert('최소 1일 일정필요');
        return false;
    }
    else{
        let daycheck = e.parentNode.parentNode.parentNode.getAttribute('data-day');
       
        let scheduledcheck = document.querySelector('input#day'+daycheck);
        console.log(scheduledcheck);

        //일정있으면 삭제불가하게설정
        if(scheduledcheck.value != ""){
            alert('일정이 있으면 삭제할 수 없어요');

            return false;
        }

        console.log(e.parentNode.parentNode.parentNode);
        console.log(e.parentNode.parentNode.parentNode.getAttribute('data-day'));

        if(e.parentNode.parentNode.parentNode.classList.contains('active')){
                console.log(e.parentNode.parentNode.parentNode.previousElementSibling);
            e.parentNode.parentNode.parentNode.previousElementSibling.classList.add('active');

        }
       // console.log('여기실행여부확인');
        e.parentNode.parentNode.parentNode.remove();
        --daycount;
        document.getElementById('totalday').value=daycount;
        document.querySelectorAll('.daily_schedule').forEach(function reset(i, curidx){
                console.log(i, curidx);
               i.setAttribute('data-day',curidx+1);
               let dayNum = curidx +1;
              // console.log(i.childNodes[2].firstChild);
               i.childNodes[2].firstChild.textContent = 'day ' + dayNum;
                i.style.display ='none';
        })


        //액티브 설정 후 앞뒤 값 있을때만 보이기
        document.querySelector('.daily_schedule.active').style.display = 'block';
        let dayselect = document.querySelector('.daily_schedule.active');
        //선택한 곳 보여주는 함수실행
        onlyShowselected(dayselect);

        if(document.querySelector('.daily_schedule.active').previousElementSibling != null){
        document.querySelector('.daily_schedule.active').previousElementSibling.style.display ='block';}
        if(document.querySelector('.daily_schedule.active').nextElementSibling != null){
        document.querySelector('.daily_schedule.active').nextElementSibling.style.display ='block';}

        
    }
}

//미리보기

function showPreview(event) { 
    console.log(event);
    console.log(event.target.getAttribute('id')); 
    let targetId = event.target.getAttribute('id');
    console.log(event.target.files);
    document.querySelector("div#"+targetId+"_container").innerHTML =""
    for (var image of event.target.files) { 
        var reader = new FileReader(); 
        reader.readAsDataURL(image);
        reader.onload = function(event) {
             var img = document.createElement("img"); 
             img.classList.add('preview');
             img.setAttribute("src", event.target.result); 
             //console.log(event.target.result);
             document.querySelector("div#"+targetId+"_container").appendChild(img); 
            };
              console.log(image); 
            
            }
             }

             function countTxt() {
                //글자수세기
                document.getElementById('totalText').addEventListener('input',function(e) {
                    console.log("키업!");
                    let content = e.value;
                    console.log(e.target.value.length)
            
                // 	$("#textLengthCheck").val("(" + content.length + "/ 100)"); //실시간 글자수 카운팅
                // 	if (content.length > 100) {
                // 		alert("최대 100자까지만 입력 가능합니다.");
                // 		$(this).val(content.substring(0, 100));
                // 		$('#textLengthCheck').html("(100 / 최대 100자)");
                // 	}
                // //엔터 3줄 제한
                // 	$('#p_freeWrite').keydown(function(){
                //         var rows = $('#p_freeWrite').val().split('\n').length;
                //         var maxRows = 3;
                //         if( rows > maxRows){
                //             alert('3줄 까지만 작성 가능합니다');
                //             modifiedText = $('#p_freeWrite').val().split("\n").slice(0, maxRows);
                //             $('#p_freeWrite').val(modifiedText.join("\n"));
                //         }
                //     });
                });
            }
            function dosubmit(){

               let dd = document.getElementById('form');
               let cc = document.getElementsByName('form');
               console.log(cc);
             //   console.log(dd);

             //유효성검사필요
            let rvTitle = document.getElementById('rvTitle'); 
            let head = document.getElementById('selectBox');
            let headDirect = document.getElementById('selectBoxDirect');
            let bud = document.getElementById('selectBox2');
            let theme = document.getElementById('selectBox3');
            let loca = document.getElementById('selectBox4');
            let day1S = document.getElementsByName('d1Schedule');
            let totalText = document.getElementById('totalText');
            let img = document.getElementById('d1Img');

            console.log(head.value);
            console.log(headDirect.value);
            console.log(day1S[0]);
            


            if(rvTitle.value ==""){
                alert('제목을 입력해주세요');
                
                return false;
            }
            if(head.value =="인원" && headDirect.value == ""){
                alert('인원선택필요');
                
                return false;
            }
            if(head.value =="direct" && headDirect.value == ""){
                alert('직접입력필요');
                return false;
            }
            if(bud.value =="비용"){
                alert('비용선택필요');
                return false;
            }
            if(theme.value =="테마"){
                alert('테마선택필요');
                return false;
            }
            if(loca.value =="지역"){
                alert('지역선택필요');
                return false;
            }
            if(day1S[0].value ==""){
                alert('day1일정은 필수입력사항입니다');
                return false;
            }
            if(totalText.value ==""){
                alert('총후기는 필수입력사항입니다.');
                return false;
            }
            if(img.value ==""){
                alert('최소1개이상의 이미지를넣어주세요');
                return false;
            }

            //필요값 확인후 제출
                dd.submit();
                        }
 


