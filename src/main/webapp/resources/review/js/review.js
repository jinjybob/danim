/**
 * 
 */

//json 통신을 위한 변수선언
 let rb_budget = "";
 let rb_theme = "";
 let rb_location = "";
 let rb_headNum = "";

// js준비
document.addEventListener('DOMContentLoaded', function () {
	
	window.onpageshow = function(event) {
		if (event.persisted
				|| (window.performance && window.performance.navigation.type == 2)) {

			location.href = "/danim/review.go";
		}

	}
  document.querySelectorAll('.budget_select_btn, .theme_select_btn, .location_select_btn').forEach(function(target,curin) {

    target.addEventListener('click',function(){

// 카테고리 재선택시 선택목록에서 제거, 재선택한 카테고리 색 없애기, ajax를 위한 변수초기화
      if(target.classList.contains('itsActive')){

        target.classList.remove('itsActive')

        if(target.classList.contains('budget_select_btn')){
          rb_budget ="";
          document.getElementById('choosedVal').querySelector('.budget_selected_btn').remove();

        }
        else if(target.classList.contains('theme_select_btn')){
          rb_theme ="";
          document.getElementById('choosedVal').querySelector('.theme_selected_btn').remove();
        }
        else if(target.classList.contains('location_select_btn')){
          rb_location ="";
          document.getElementById('choosedVal').querySelector('.location_selected_btn').remove();
        }

         //선택요소 없을시 선택요소div 숨기기
               
         if(document.getElementById('choosedVal').childElementCount == 0){
          document.getElementById('selectedElements').style.display = 'none';
        }

        //카테고리 재선택시 마다 ajax호출
        eraseJSTL();
        callAjax();
      }else{

        //카테고리 별 클릭시 활성화, 활성화시 같은카테고리 다른요소 비활성화

         if(target.classList.contains('budget_select_btn')){
  let budgetsActive = document.getElementById('tab2').querySelectorAll('.itsActive');

  for(let i of budgetsActive){
    i.classList.remove('itsActive');
  }
}
else if(target.classList.contains('theme_select_btn')){
  let themesActive = document.getElementById('tab3').querySelectorAll('.itsActive');

  for(let i of themesActive){
    i.classList.remove('itsActive');
  }
}
else if(target.classList.contains('location_select_btn')){
  let locationsActive = document.getElementById('tab4').querySelectorAll('.itsActive');

  for(let i of locationsActive){
    i.classList.remove('itsActive');
  }
}

        target.classList.add('itsActive');

        //선택된 카테고리 목록 보여주기
        document.getElementById('selectedElements').style.display ='flex';
      

        //active 카테고리들 선택후 카테고리 별로 ajax통신을 위한변수에 값 입력, 선택목록에 선택한 카테고리추가
 document.querySelectorAll('.itsActive').forEach(function(db){

  let word;
  let newDiv;

  if(db.classList.contains('location_select_btn')){
    
    rb_location = db.textContent;
    console.log(rb_location);

    word = rb_location;
    newDiv = document.createElement('div');
    newDiv.classList.add('location_selected_btn')
    newDiv.append(word);
    newDiv.insertAdjacentHTML('beforeend', '<img class="deleteBtn" src="resources/review/img/close.png">');

    if(document.getElementById('choosedVal').querySelectorAll('.location_selected_btn').length == 0 ){

         document.getElementById('choosedVal').appendChild(newDiv);
       }
       else if(document.getElementById('choosedVal').querySelectorAll('.location_selected_btn').length  >= 1 ){
      
         document.querySelector('.location_selected_btn').remove();
         document.getElementById('choosedVal').appendChild(newDiv);
       }

  }else if(db.classList.contains('budget_select_btn')){

    rb_budget = db.textContent;
    console.log(rb_budget);

    word = rb_budget;
    newDiv = document.createElement('div');
    newDiv.classList.add('budget_selected_btn')
    newDiv.append(word);
    newDiv.insertAdjacentHTML('beforeend', '<img class="deleteBtn" src="resources/review/img/close.png">');

    if(document.getElementById('choosedVal').querySelectorAll('.budget_selected_btn').length == 0 ){

         document.getElementById('choosedVal').appendChild(newDiv);
       }
       else if(document.getElementById('choosedVal').querySelectorAll('.budget_selected_btn').length  >= 1 ){
      
         document.querySelector('.budget_selected_btn').remove();
         document.getElementById('choosedVal').appendChild(newDiv);
       }

       // sql 검색을 위해 변수에 넣을때 콤마제거 
    let delComma = db.textContent.replaceAll(",","");
    console.log(delComma);
    rb_budget =delComma.substring(1, db.textContent.length);

  }else if(db.classList.contains('theme_select_btn')){
    rb_theme = db.textContent;
    console.log(rb_theme);

    word = rb_theme;
    newDiv = document.createElement('div');
    newDiv.classList.add('theme_selected_btn')
    newDiv.append(word);
    newDiv.insertAdjacentHTML('beforeend', '<img class="deleteBtn" src="resources/review/img/close.png">');

    if(document.getElementById('choosedVal').querySelectorAll('.theme_selected_btn').length == 0 ){

         document.getElementById('choosedVal').appendChild(newDiv);
       }
       else if(document.getElementById('choosedVal').querySelectorAll('.theme_selected_btn').length  >= 1 ){
      
         document.querySelector('.theme_selected_btn').remove();
         document.getElementById('choosedVal').appendChild(newDiv);
       }

  }

 });


 console.log(rb_budget,rb_location,rb_theme)

 eraseJSTL();
 callAjax();


      }


})
});
    

	  //인원수 슬라이더 value표시
let slider = document.getElementById("headcount");
let output = document.getElementById("headcount_value");

slider.oninput = function() {
    output.innerHTML = this.value;
    document.getElementById("headcount_value1").value = this.value;

}


document.getElementById('headcount_select_btn').addEventListener('click',function(){


  //선택목록 나타내기
  document.getElementById('selectedElements').style.display ='flex'; 

  //선택목록에 인원수 추가
let newDiv = document.createElement('div')
newDiv.append(document.getElementById('headcount_value1').value +'명');
newDiv.classList.add('selected_headcount');
newDiv.insertAdjacentHTML('beforeend', '<img class="deleteBtn" src="resources/review/img/close.png">');

console.log(document.getElementById('choosedVal').querySelectorAll('.selected_headcount'));

//선택목록에 인원수 없을시 추가, 있으면 삭제 후 새로운 값 입력
if(document.getElementById('choosedVal').querySelectorAll('.selected_headcount').length >= 1){

  document.querySelector('.selected_headcount').remove();
  document.getElementById('choosedVal').appendChild(newDiv);

  //인원수 ajax통신용 변수에 입력
  console.log(rb_headNum);
  rb_headNum = document.getElementById("headcount_value1").value;

  eraseJSTL();
  callAjax();

}else{

  document.getElementById('choosedVal').appendChild(newDiv);
rb_headNum = document.getElementById("headcount_value1").value;
console.log(rb_headNum);

eraseJSTL();
callAjax();

}

})


//탭메뉴

       const tabItem = document.querySelectorAll(".tab-container__item");
const tabContent = document.querySelectorAll(".content-container__content");

let cc = tabItem.forEach(function(item){

     item.addEventListener("click", tabHandler);
});

function tabHandler(item) {
  const tabTarget = item.currentTarget;
 
  const target = tabTarget.dataset.tab;

  // tabItem.forEach((title) => {
  //   title.classList.remove("active");
  // });
  tabContent.forEach(function(content) {
    content.classList.remove("target");
  });
  document.querySelector("#"+target).classList.add("target");
  // tabTarget.classList.add("active");
}

  })
  //js준비 끝
  

// jstl 초기 불러온값 삭제
function eraseJSTL(){
document.getElementById('contentTable').innerHTML = "" ;


}
// 검색필터선택해제
function cancelingSelect(){
  document.getElementById('selectedElements').style.display ='none';
document.getElementById('choosedVal').innerHTML = "" ;

  rb_budget = "";
  rb_theme = "";
  rb_location = "";
  rb_headNum = "";

  eraseJSTL();
    callAjax();
  document.querySelectorAll('.itsActive').forEach(function(deactive){
    console.log(document.querySelectorAll('.itsActive'));
    deactive.classList.remove('itsActive');

    eraseJSTL();
    callAjax();
  })

}

//ajax호출

function callAjax(){
  httpRequest = new XMLHttpRequest();
  /* httpRequest의 readyState가 변화했을때 함수 실행 */
    httpRequest.onreadystatechange = function() {
      /* readyState가 Done이고 응답 값이 200일 때, 받아온 response로 그려줌 */
      if (httpRequest.readyState === XMLHttpRequest.DONE) {
          if (httpRequest.status === 200) {
          let result = httpRequest.response;
          console.log(result);

              console.log('찌역 : '+rb_location)
              console.log('뗴마 : '+rb_theme)
              console.log('예산 : '+rb_budget)
              console.log('헤드넘 : '+rb_headNum)

              getReviews(result);

          } else {
            alert('Request Error!');
          }
      }
    };
    /* Get 방식으로  요청 */
    httpRequest.open('GET', 'http://localhost/danim/getfilterdByJSON?rb_location='+rb_location+'&rb_budget='+rb_budget+'&rb_theme='+rb_theme+'&rb_headNum='+rb_headNum);

    /* Response Type을 Json으로 사전 정의 */
    httpRequest.responseType = "json";
    /* 정의된 서버에 요청을 전송 */
    httpRequest.send();
}


//json 통신 view에 나오게하는 함수
function getReviews(result){
 // console.log(result.reviews.forEach());
  result.reviews.forEach(function(i, indexNum){
    
  
    //console.log(i.rb_title);

    let contentTable = document.getElementById('contentTable');
    let newDiv = document.createElement('div');
    newDiv.setAttribute('id','contents');
    contentTable.append(newDiv);

    //view 표시할 때 date, 통화형식 세팅
    let backTODate = new Date(i.rb_date).toLocaleDateString();
    let korCurrency = new Intl.NumberFormat('kor',
    {
      style : 'currency',
      currency : 'KRW'
    }).format(i.rb_budget);
    
    //첫번째이미지 가져오기
    console.log(i.rb_img);
    let imgStr =i.rb_img;
    let splitedimg =imgStr.split(",");
    console.log(splitedimg[0]);

    
    newDiv.insertAdjacentHTML('afterbegin', '<div class="img_box_container">'+'<a href="reviewDeatil.go?rb_no='+ i.rb_no +'">'+'<img class="img_box" src="resources/review/img/'+ splitedimg[0] +'" alt="이미지위치"></a> </div>');
    newDiv.insertAdjacentHTML('beforeend', '<div class="content_title" style="font-size: 30px">'+ i.rb_title +'</div>');
    newDiv.insertAdjacentHTML('beforeend', '<div id="icon_div"> <img src="resources/review/img/eye2.png" id="review_icon">&nbsp;:&nbsp;'+i.rb_viewcount+'&nbsp;&nbsp; <img src="resources/review/img/ripple2.png" id="review_icon">&nbsp;:&nbsp;'+i.rb_commentcount+'</div>');
    //newDiv.insertAdjacentHTML('beforeend', '<div>'+backTODate+'작성자 :'+i.rb_username +' </div>' );
    newDiv.insertAdjacentHTML('beforeend', '<div> <span># '+korCurrency+' 이하 </span> | <span>#'+i.rb_theme+' </span> | <span>#'+i.rb_location+'</span> | <span>#'+i.rb_headNum+'인</span> </div>' );


     });

};


//이벤트 위임
      document.addEventListener('click',function(e) {
        
            // deleteBtn 클릭시 이벤트
           if(e.target.classList.contains('deleteBtn')){

              if(e.target.parentNode.classList.contains('selected_headcount')){
                e.target.parentNode.remove();
                rb_headNum ="";
                eraseJSTL();
                callAjax();
           
              }else if(e.target.parentNode.classList.contains('budget_selected_btn')){
                e.target.parentNode.remove();
                document.getElementById('tab2').querySelector('.itsActive').classList.remove('itsActive');
               rb_budget ="";
               eraseJSTL();
               callAjax();
              }else if(e.target.parentNode.classList.contains('theme_selected_btn')){
                e.target.parentNode.remove();
               document.getElementById('tab3').querySelector('.itsActive').classList.remove('itsActive');
              rb_theme ="";
              eraseJSTL();
              callAjax();
             }else if(e.target.parentNode.classList.contains('location_selected_btn')){
              e.target.parentNode.remove();
               document.getElementById('tab4').querySelector('.itsActive').classList.remove('itsActive');
           
              rb_location ="";
              eraseJSTL();
              callAjax();
             }
               
             //선택요소 없을시 숨기기
               
               if(document.getElementById('choosedVal').childElementCount == 0){
                 document.getElementById('selectedElements').style.display = 'none';
               }
           }
    });

