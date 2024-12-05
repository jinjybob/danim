<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/review/js/jquery.js"></script>
<style>

#day1{
display: block;
}

textarea{
	width: 100%;
	resize: none;
}

.dailyBox{
	display: none;
}

.axis{
	width: 15%;
}

.cell{
	width: 25%;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
	position: relative;
	display: inline-block;
}

/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
.show {
	display: block;
}

</style>
<script type="text/javascript" src="resources/review/js/reviewWrite.js"></script>
<script type="text/javascript">
let map, infoWindow, marker, searchBox, input, poly;

let destination = [];

function initMap() {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 37.555946, lng: 126.972317 },
    zoom: 12,
  });

  
 
  const service = new google.maps.places.PlacesService(map);
  //   // We add a DOM event here to show an alert if the DIV containing the
  //   // map is clicked.
  map.addListener('click', function(event) {
	console.log(event.placeId);
	console.log(event);


	if(event.placeId){
		service.getDetails({placeId: event.placeId}, function(place, status){
			console.log(place);
			//console.log(place.name);
			if(place == null){
				console.log('dd');
				let lat =event.latLng.lat();
		let lng =event.latLng.lng();

		let latlng = {
   			 lat: parseFloat(lat),
    		lng: parseFloat(lng),
 					 };
		
 		 const geocoder = new google.maps.Geocoder();

 		 geocoder
  		  .geocode({ location: latlng })
  		  .then((response) => {
		console.log(response);
		console.log(response.results[0].formatted_address);
		

		//데스티네이션에 넣음
		destination.push(response.results[0].formatted_address);
		document.getElementById('allSchedule').innerHTML = destination.join('->');

		 //서버제출용
		 document.getElementsByName('totalRoute')[0].value = destination;
		console.log(document.getElementsByName('totalRoute')[0].value);
			})

			}
			
else{
			//데스티네이션에 넣음
			destination.push(place.name);
			document.getElementById('allSchedule').innerHTML = destination.join('　➜　');

			//서버제출용
 document.getElementsByName('totalRoute')[0].value = destination;
		console.log(document.getElementsByName('totalRoute')[0].value);
	}
		})
	}else{
		
		let lat =event.latLng.lat();
		let lng =event.latLng.lng();

		let latlng = {
    lat: parseFloat(lat),
    lng: parseFloat(lng),
  };
		
  const geocoder = new google.maps.Geocoder();

  geocoder
    .geocode({ location: latlng })
    .then((response) => {
		console.log(response.results[0].formatted_address);
		

		//데스티네이션에 넣음
		destination.push(response.results[0].formatted_address);
		document.getElementById('allSchedule').innerHTML = destination.join('　➜　');

		 //서버제출용
		 document.getElementsByName('totalRoute')[0].value = destination;
		console.log(document.getElementsByName('totalRoute')[0].value);
	})
	}

  });




  infoWindow = new google.maps.InfoWindow();
  marker  = new google.maps.Marker();
 

  // 내위치 찾기

  const locationButton = document.getElementById('locationButton');

 // locationButton.textContent = "현재위치로";
  locationButton.classList.add("custom-map-control-button");
//  locationButton.setAttribute('type','button');
  map.controls[google.maps.ControlPosition.TOP_CENTER].push(locationButton);
  locationButton.addEventListener("click", () => {
    // Try HTML5 geolocation.
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (position) => {
        	console.log(position);
          const pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude,
          };

          infoWindow.setPosition(pos);
          infoWindow.setContent("나의 위치");
          infoWindow.open(map);
          marker.setPosition(pos);
          marker.setMap(map);
		  marker.addListener('click',function(){
			  marker.setMap(null);
		  })
		  map.setCenter(pos);
          map.setZoom(12);
		  
        },
        () => {
          handleLocationError(true, infoWindow, map.getCenter());
        }
      );
    } else {
      // Browser doesn't support Geolocation
      handleLocationError(false, infoWindow, map.getCenter());
    }
  });

  

  //장소검색시작
  input = document.getElementById('pac-input');
  searchBox = new google.maps.places.SearchBox(input);

 
  map.controls[google.maps.ControlPosition.TOP_CENTER].push(input);
  // Bias the SearchBox results towards current map's viewport.
  map.addListener("bounds_changed", () => {
    searchBox.setBounds(map.getBounds());
  });

  
  let searchMarkers = [];

  // Listen for the event fired when the user selects a prediction and retrieve
  // more details for that place.
  searchBox.addListener("places_changed", () => {
    const places = searchBox.getPlaces();
	console.log(places);
    if (places.length == 0) {
      return;
    }

    // Clear out the old markers.
    searchMarkers.forEach((marker) => {
      marker.setMap(null);
    });
    searchMarkers = [];

    // For each place, get the icon, name and location.
    const bounds = new google.maps.LatLngBounds();

    places.forEach((place) => {
      if (!place.geometry || !place.geometry.location) {
        console.log("Returned place contains no geometry");
        return;
      }

      const icon = {
        url: place.icon,
        size: new google.maps.Size(10, 10),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(10, 10),
      };

      // Create a marker for each place.
      searchMarkers.push(
      new google.maps.Marker({
          map,
          icon,
          title: place.name,
          position: place.geometry.location,
        })

		///////////////////////////////////////
      );


	


      if (place.geometry.viewport) {
        // Only geocodes have viewport.
        bounds.union(place.geometry.viewport);
      } else {
        bounds.extend(place.geometry.location);
      }
    });

	//검색마커에 리스너 추가, 클릭가능하게
    searchMarkers.forEach((marker, curindx) => {
	 	//console.log(marker);
			console.log(curindx);
 	marker.addListener('click', function(){
		 console.log(this.title);

		 //데스티네이션에위치넣음
		 destination.push(this.title);
		 document.getElementById('allSchedule').innerHTML = destination.join('->');

		 //서버제출용
		 document.getElementsByName('totalRoute')[0].value = destination;
		console.log(document.getElementsByName('totalRoute')[0].value);
	 });
	 	marker.addListener('click', addLatLng);

      });

    map.fitBounds(bounds);
  });


//장소검색끝

//폴리라인 시작

//서버에 좌표보내기용변수
let coordinate = "";

poly = new google.maps.Polyline({
    strokeColor: "#000000",
    strokeOpacity: 1.0,
    strokeWeight: 3,
  });
  poly.setMap(map);
let markers =[];
marker = new google.maps.Marker();

  // add event listener for click event
  document.getElementById("remove-line").addEventListener("click", removeLine);
  map.controls[google.maps.ControlPosition.TOP_CENTER].push(document.getElementById("remove-line"));

  //일정삭제 기능
  function removeLine() {
	  console.log(markers);
	  for (let i = 0; i < markers.length; i++) {
		  markers[i].setMap(null);
		}
		markers = [];
		destination = [];
		console.log(markers);
		poly.setMap(null);
		poly.getPath().clear();
		console.log(poly.getPath());
		console.log(destination);
		
		coordinate = "";

		//모든경로비우기
		document.getElementById('allSchedule').innerHTML =""

		//각 일정삭제

		document.querySelectorAll('.scehduleBox').forEach(function(eachBox){

			eachBox.innerHTML ="";

		})


		
		// 제출용 정보삭제
		document.getElementsByName('totalRoute')[0].value = "";

		document.querySelectorAll('.dScedule').forEach(function(each){
			console.log(each);
			each.value ="";
		})
		
		console.log(document.getElementById('coordinate'));
		document.getElementById('coordinate').value ="" ;
		
	}
 
  // Add a listener for the click event
 map.addListener("click", addLatLng);


// Handles click events on a map, and adds a new point to the Polyline.
function addLatLng(event) {
	poly.setMap(map);
  const path = poly.getPath();
	console.log(path);
	console.log(poly);
	console.log(event.latLng.lat());
	console.log(event.latLng.lng());


	coordinate += '{ "lat": '+event.latLng.lat()+', "lng": '+event.latLng.lng()+'} |';

	
	console.log(coordinate);
	document.getElementById('coordinate').value = coordinate;
  // Because path is an MVCArray, we can simply append a new coordinate
  // and it will automatically appear.
  path.push(event.latLng);
  //console.log(event.latLng);
  // Add a new marker at the new plotted point on the polyline.
  let destinationNum = path.getLength()-1;
   let dds =  new google.maps.Marker({
    position: event.latLng,
    title: "#" + path.getLength(),
    map: map,
	label: "#" + path.getLength(),
  });

  
  //우클릭시 일정에추가
  dds.addListener('rightclick',function(){
		  console.log(dds.title);
		  console.log(destination);
		  console.log(destination[destinationNum]);
		  
		  let rcdestination = dds.title+destination[destinationNum];

	let selectDay =	  document.querySelector('.daily_schedule.active').getAttribute('data-day');

	let dayfinder = 'day'+selectDay;

	let targetScedule = document.getElementById(dayfinder).querySelector('.scehduleBox');
	console.log(targetScedule +'여기');

	let newDiv = document.createElement('div');

	newDiv.setAttribute('id', 'scheduled'+ dds.title);

	newDiv.classList.add('schedule_wrapper')
	

	newDiv.innerHTML = rcdestination;
	


//일정중복방지
	if(document.getElementById('scheduled'+ dds.title)){

		alert('이미 추가된 일정입니다.');
	}
	else{

		//하루 최대일정제한 10개
		if(targetScedule.childElementCount >= 10){
			alert('하루최대일정3개 다른날짜에 넣어주세요');
		}
		else{
	targetScedule.insertAdjacentElement('beforeend',newDiv);
		console.log(targetScedule.childElementCount);
	console.log(dayfinder);
	console.log(document.querySelector('input#'+dayfinder));
	document.querySelector('input#'+dayfinder).value += rcdestination+',';
}
}


})
markers.push(dds);
console.log(destination);

//   marker.setPosition(event.latLng);
//   marker.setTitle("#" + path.getLength());
//   marker.setMap(map);
//   marker.setLabel("#" + path.getLength());

//   markers.push(marker);
//   console.log(markers);
}

//폴리라인 끝

  

  
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(
    browserHasGeolocation
      ? "Error: The Geolocation service failed."
      : "Error: Your browser doesn't support geolocation."
  );
  infoWindow.open(map);
}

</script>
</head>

<body>
	<form id="form" name="form" action="/danim/reviewinsert.do" method="post" enctype="multipart/form-data">
	<div class="content_wrapper">

		<div id="r_write_Title"><h1>여행 후기 작성하기</h1></div>


		<div id="r_reviewTitle"><input type="text" name="title" id="rvTitle"placeholder="여행 후기 제목을 입력해주세요"></div>
			
			<!-- 좌표히든 --><input type="hidden" name ="coordinate" id="coordinate" value="">


		<div class="flex-container">
					
			<div>
				<select name="headNum" id="selectBox">
					<option selected="selected" disabled="disabled">인원</option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
					<option>10</option>
					<option value="direct">직접입력</option>

				</select>
				<span id="inputContainer">
				<input id="selectBoxDirect" name="selectBoxDirect" type="number" min="1"> 명
				</span>
			</div>

			<div>
				<select name="budget" id="selectBox2">
					<option selected="selected" disabled="disabled">비용</option>
					<option value="100000" >~ 100,000</option>
					<option value="300000">~ 300,000</option>
					<option value="500000">~ 500,000</option>
					<option value="700000">~ 700,000</option>
					<option value="1000000">~ 1,000,000</option>

				</select>

			</div>

			<div>
				<select name="theme" id="selectBox3">
					<option selected="selected" disabled="disabled">테마</option>
					<option>커플여행</option>
					<option>나홀로여행</option>
					<option>감성카페찾기</option>
					<option>맛집투어</option>
					<option>비즈니스여행</option>

				</select>

			</div>

			<div>
				<select name="location" id="selectBox4">
					<option selected="selected" disabled="disabled">지역</option>
					<option>서울</option>
					<option>대전</option>
					<option>대구</option>
					<option>부산</option>
					<option>제주</option>

				</select>

			</div>

		</div>

		<div class="flex-container">
		</div>

		

	</div>



	<div style="text-align: center; margin-bottom: 20px;"><h2>여행spot 지도</h2></div>
	<!-- The div element for the map -->
	 <div>
		<input id="locationButton"type="button" value="현재위치로"> 
		<input
      id="pac-input"
      class="controls"
      type="text"
      placeholder="검색어를 입력해주세요"
    />
	<input id="remove-line" type="button" value="일정삭제" />
</div>
		<div id="map"></div>

	<!-- Async script executes immediately and must be after any DOM elements used in callback. -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHwlLJC7x2AYE7IuJZCOkKJ1KRSBgCmoY&callback=initMap&libraries=places&v=weekly&region=KR&language=ko"
		async></script> 
<div id="allSchedule_wrapper"> <h2 style="margin-bottom: 20px;">모든 일정</h2>
<div id="allSchedule"></div>
</div>
	<div id="schedule">
		<div id="schedule_inner_nav">
			<div style="width: 15%;  ">
				<!-- <a>모든경로보기</a> -->


				<div id="prevbtnDiv"><a href="javascript:void(0);" onclick="movePrevD()" id="prevbtn">prev&lt;</a></div>

			</div>
			<div style="width: 10%; position: absolute; right: 0; ">
			<div id="prevbtnDiv"><a href="javascript:void(0);" onclick="moveNextD()" id="nextbtn"> &gt;next</a></div>
			</div>
			<div id="daily_schedule_con" class="daily_schedule active" data-day="1"><div class="dropdown">
					<button type="button" onclick="" class="dropbtn"> +
					<!-- <img id="dropbtnPlus" src="resources/review/img/plusBtn.png"/> -->
					</button>
					<div id="myDropdown" class="dropdown-content">
						<a href="javascript:void(0);" class="insert_col_back">뒤에 일정추가</a> 
						<a href="javascript:void(0);" onclick="deleteDay(this)" class="delete_col_back">일정삭제</a>
					</div>
				</div>
				<a href="javascript:void(0);" onclick="activateDay(this)"><span>day 1</span></a>
			</div>
		</div>
	</div>
	<div class="dailyBox" id="day1" data-day="1">
		<h3 style="margin-bottom: 20px; margin-top: 65px;">day1 일정표시</h3>
		<div class="scehduleBox"></div>


		<input class="dScedule" type="hidden" name="d1Schedule" id="day1" value="">
		<div class="dTextDiv"><textarea name="d1Text" id="d1Text" cols="30" rows="10" placeholder="day1의 후기를 작성해주세요"></textarea></div>

	</div>
	<div class="dailyBox" id="day2" data-day="2">
		<h3 style="margin-bottom: 20px; margin-top: 65px;">day2 일정표시</h3>
		<div class="scehduleBox"></div>

		<input class="dScedule" type="hidden" name="d2Schedule" id="day2" value="">
		<div class="dTextDiv"><textarea name="d2Text" id="d2Text" cols="30" rows="10" placeholder="day2의 후기를 작성해주세요"></textarea></div>

	</div>
	<div class="dailyBox"  id="day3" data-day="3">
		<h3 style="margin-bottom: 20px; margin-top: 65px;">day3 일정표시</h3>
		<div class="scehduleBox"></div> 

		<input class="dScedule" type="hidden" name="d3Schedule" id="day3" value="">
		<div class="dTextDiv"><textarea name="d3Text" id="d3Text" cols="30" rows="10" placeholder="day3의 후기를 작성해주세요"></textarea></div>

	</div>
	<div class="dailyBox" id="day4" data-day="4">
		<h3 style="margin-bottom: 20px; margin-top: 65px;">day4 일정표시</h3>
		<div class="scehduleBox"></div>
		<input class="dScedule" type="hidden" name="d4Schedule" id="day4" value="">
		<div class="dTextDiv"><textarea name="d4Text" id="d4Text" cols="30" rows="10" placeholder="day4의 후기를 작성해주세요"></textarea></div>

	</div>
	<div class="dailyBox" id="day5" data-day="5">
		<h3 style="margin-bottom: 20px; margin-top: 65px;">day5 일정표시</h3>
		<div class="scehduleBox"></div>

		<input class="dScedule" type="hidden" name="d5Schedule" id="day5" value="">
		<div class="dTextDiv"><textarea name="d5Text" id="d5Text" cols="30" rows="10" placeholder="day5의 후기를 작성해주세요"></textarea></div>

	</div>
	<div class="dailyBox" id="day6" data-day="6">
		<h3 style="margin-bottom: 20px; margin-top: 65px;">day6 일정표시</h3>
		<div class="scehduleBox"></div>

		<input class="dScedule" type="hidden" name="d6Schedule" id="day6" value="">
		<div class="dTextDiv"><textarea name="d6Text" id="d6Text" cols="30" rows="10" placeholder="day6의 후기를 작성해주세요"></textarea></div>

	</div>
	<div class="dailyBox" id="day7" data-day="7">
		<h3 style="margin-bottom: 20px;">day7 일정표시</h3>
		<div class="scehduleBox"></div>

		<input class="dScedule" type="hidden" name="d7Schedule" id="day7" value="">
		<div class="dTextDiv"><textarea name="d7Text" id="d7Text" cols="30" rows="10" placeholder="day7의 후기를 작성해주세요"></textarea></div>

	</div>
	<div class="dailyBox" id="day8" data-day="8">
		<h3 style="margin-bottom: 20px;">day8 일정표시</h3>
		<div class="scehduleBox"></div>

		<input class="dScedule" type="hidden" name="d8Schedule" id="day8" value="">
		<div class="dTextDiv"><textarea name="d8Text" id="d8Text" cols="30" rows="10" placeholder="day8의 후기를 작성해주세요"></textarea></div>

	</div>
	<div class="dailyBox" id="day9" data-day="9">
		<h3 style="margin-bottom: 20px;">day9 일정표시</h3>
		<div class="scehduleBox"></div>

		<input class="dScedule" type="hidden" name="d9Schedule" id="day9" value="">
		<div class="dTextDiv"><textarea name="d9Text" id="d9Text" cols="30" rows="10" placeholder="day9의 후기를 작성해주세요"></textarea></div>

	</div>
	<div class="dailyBox" id="day10" data-day="10">
		<h3 style="margin-bottom: 20px;">day10 일정표시</h3>
		<div class="scehduleBox"></div>

		<input class="dScedule" type="hidden" name="d10Schedule" id="day10" value="">
	<div class="dTextDiv"><textarea name="d10Text" id="d10Text" cols="30" rows="10" placeholder="day10의 후기를 작성해주세요"></textarea></div>
	</div>


<div id="r_writeAllreview"><h2>여행총후기</h2>
<div id="totalTextDiv"><textarea name="totalText" id="totalText" cols="30" rows="10" maxlength="499"></textarea></div></div>
	
		<!-- 전체경로히든 --><input type="hidden" name="totalRoute" id="" value="">
		<!-- 작성자히든 --><input type="hidden" name="writer" id="writer" value="${param.writer}">


	<!-- 총 여행사진 -->
	<div id="r_writeAllreview"><h2>총 여행사진 업로드</h2>❗업로드할 사진을 한꺼번에 업로드해주세요</div>
	<div style="text-align: center; padding-left: 100px;"><input type="file" multiple="multiple" name="d1Img" id="d1Img" onchange="showPreview(event);"></div>
	<div id="d1Img_container"></div>
	<input type="text" name="totalday" id="totalday" value="1" hidden="hidden"> <!-- 히든토탈데이 -->

<div id="review_submit"><button type="button" onclick="dosubmit()" >여행후기 등록</button></div>


</form>

</body>

</html>