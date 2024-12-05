/**
 * 
 */

//js 준비
document.addEventListener('DOMContentLoaded', function () {
	

		
	
	
	
	// console.log(document.getElementById('totalday').value);

    let totalday = document.getElementById('totalday').value;

    for (let index = 1; index <= totalday; index++) {
        
        let newDiv = document.createElement('div');

        let theday = "selecDay"+ index;

        newDiv.innerText = "day"+index;

        newDiv.classList.add('dailySelected');
        newDiv.setAttribute('id',theday);
        newDiv.setAttribute('data-day',index);

        document.getElementById('dayselWrap').insertAdjacentElement("beforeend",newDiv);
    }

    document.getElementById('selecDay1').style.display ="block";
    document.getElementById('selecDay1').classList.add('activate');
    document.getElementById('day1').classList.add('activate');
	
	
})

function veiwPrevDay(target){


    console.log(document.querySelector('.dailySelected.activate'));
  if( document.querySelector('.dailySelected.activate').getAttribute('data-day') == 1) {
      alert('일정 첫 날입니다');
      return false;
  }
  else{
        //날짜저장
    let prevday =document.querySelector('.dailySelected.activate').getAttribute('data-day')-1;
        //액티브해제
        document.querySelector('.dailySelected.activate').style.display = 'none';
        document.querySelector('.dailySelected.activate').classList.remove('activate');
        document.querySelector('.dailyBox.activate').style.display = 'none';
        document.querySelector('.dailyBox.activate').classList.remove('activate');

        //액티브설정
        console.log(document.getElementById('selecDay'+prevday));
        document.getElementById('selecDay'+prevday).classList.add('activate');
        document.getElementById('selecDay'+prevday).style.display ='block';
        document.getElementById('day'+prevday).classList.add('activate');
        document.getElementById('day'+prevday).style.display ='block';

    }



}

function veiwNextDay(target){

    let totalday = document.getElementById('totalday').value;

    if( document.querySelector('.dailySelected.activate').getAttribute('data-day') == totalday) {
        alert('일정 마지막 날입니다');
        return false;
    }
    else{
        //날짜저장
        let nextday =parseInt(document.querySelector('.dailySelected.activate').getAttribute('data-day'))+1;
        //액티브해제
        document.querySelector('.dailySelected.activate').style.display = 'none';
        document.querySelector('.dailySelected.activate').classList.remove('activate');
        document.querySelector('.dailyBox.activate').style.display = 'none';
        document.querySelector('.dailyBox.activate').classList.remove('activate');

        //액티브설정
        console.log(nextday);
        console.log(document.getElementById('selecDay'+nextday));
        document.getElementById('selecDay'+nextday).classList.add('activate');
        document.getElementById('selecDay'+nextday).style.display ='block';
        document.getElementById('day'+nextday).classList.add('activate');
        document.getElementById('day'+nextday).style.display = 'block';
        


    }

}


function writeReply(){
    let rbr_rb_no= document.getElementById('set_rbr_rb_no').value;
    let rbr_owner= document.getElementById('set_rbr_owner').value;
    let rbr_txt= document.getElementById('set_rbr_txt').value;

    httpRequest = new XMLHttpRequest();
    /* httpRequest의 readyState가 변화했을때 함수 실행 */
      httpRequest.onreadystatechange = function() {
        /* readyState가 Done이고 응답 값이 200일 때, 받아온 response로 그려줌 */
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
            if (httpRequest.status === 200) {
            let result = httpRequest.response;
            console.log(result);
  
                console.log('글번 : '+rbr_rb_no)
                console.log('오우너 : '+rbr_owner)
                console.log('내용 : '+rbr_txt)
  
                showReplys(result);
  
            } else {
              alert('Request Error!');
            }
        }
      };
      /* Get 방식으로  요청 */
      httpRequest.open('GET', 'http://localhost/danim/writeReplyByJSON?rbr_rb_no='+rbr_rb_no+'&rbr_owner='+rbr_owner+'&rbr_txt='+rbr_txt);
  
      /* Response Type을 Json으로 사전 정의 */
      httpRequest.responseType = "json";
      /* 정의된 서버에 요청을 전송 */
      httpRequest.send();
  }

  //view에 댓글목록 출력
function showReplys(result){
    // console.log(result.reviews.forEach());
    //if문만들기 위한 세션아이디
    let sessionId= document.getElementById('set_rbr_owner').value;
    
    //다시그리기위해 비우기
    repBox.innerHTML="";

     result.replys.forEach(function(i, indexNum){
       
     
       let repBox = document.getElementById('repBox');
       let newDiv = document.createElement('div');
       newDiv.classList.add('reply_wrapper')
       repBox.append(newDiv);
   
       //view 표시할 때 date 세팅
       let backTODate = new Date(i.rbr_when).toLocaleDateString();
    let splitdate = backTODate.split('.');
    let MM ;
    if(splitdate >9){
        MM = splitdate[1];
    }else{
        MM = 0+splitdate[1];
    }

    let dd = splitdate[2];

    let setMMdd = MM+'.'+dd;
    let MMdd = setMMdd.replace(/ /g,"");
    console.log(MMdd);

        
       
       console.log(sessionId);
       console.log(i.rbr_owner);
   
       
       newDiv.insertAdjacentHTML('beforeend', '<div style="text-align: left;">'+ i.rbr_owner +'</div>');
       newDiv.insertAdjacentHTML('beforeend', '<div style=" width: 60%; text-align: center;">'+ i.rbr_txt +'</div>');
       newDiv.insertAdjacentHTML('beforeend', '<div style="text-align: right;">작성일 : '+MMdd +'</div>');
       if(sessionId == i.rbr_owner){
       newDiv.insertAdjacentHTML('beforeend', '<div><button class="btnCover" onclick="delReply(this)" value="'+i.rbr_no+'"><img class="deleteBtn" src="resources/review/img/close.png"></button></div>');
    }
   
        });
   
   };

function delReply(e){
    
    let rbr_no = e.value;
    let rbr_rb_no= document.getElementById('set_rbr_rb_no').value;

    httpRequest = new XMLHttpRequest();
    /* httpRequest의 readyState가 변화했을때 함수 실행 */
      httpRequest.onreadystatechange = function() {
        /* readyState가 Done이고 응답 값이 200일 때, 받아온 response로 그려줌 */
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
            if (httpRequest.status === 200) {
            let result = httpRequest.response;
            console.log(result);
  
                //console.log('글번 : '+rbr_rb_no)
               // console.log('오우너 : '+rbr_owner)
               // console.log('내용 : '+rbr_txt)
  
                showReplys(result);
  
            } else {
              alert('Request Error!');
            }
        }
      };
      /* Get 방식으로  요청 */
      httpRequest.open('GET', 'http://localhost/danim/deleteReplyByJSON?rbr_rb_no='+rbr_rb_no+'&rbr_no='+rbr_no);
  
      /* Response Type을 Json으로 사전 정의 */
      httpRequest.responseType = "json";
      /* 정의된 서버에 요청을 전송 */
      httpRequest.send();
}

function deleteRD(){

    let rb_no =document.getElementById('set_rbr_rb_no').value;
    location.href = '/danim/deleteReview?rb_no='+rb_no;
}