 // 현재위치
		let p_nowLatitude = 0;
		let p_nowLongitude = 0;
		let infowindow = "";
		
        if(navigator.geolocation) {
            
            navigator.geolocation.getCurrentPosition(function(position) {
                
                // 위치를 가져오는데 성공할 경우
                jQuery.each(position.coords, function(key, item) {
                    //현재 위치의 위도 경도
                    // alert(position.coords.latitude)
                    // alert(position.coords.longitude)
                    p_nowLatitude =  position.coords.latitude;
                    p_nowLongitude = position.coords.longitude;
                });
            }, function(error) {
                // 위치를 가져오는데 실패한 경우
                consol.log(error.message);
            });
        } else {
            consol.log("Geolocation을 지원하지 않는 브라우저 입니다.");
        }



$(function() {
	
	/*지도만들어주기*/
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(p_nowLatitude, p_nowLongitude), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	
	/*검색하기*/
	//"https://dapi.kakao.com/v2/local/search/keyword.json?
	
	$("#p_searchBtn").click(function() {
			
			if(infowindow !=""){
				
				infowindow.close();
			}
			let search = $("#p_search").val();
			let routeClick = "";
			
			$.ajax({
				url : "https://dapi.kakao.com/v2/local/search/keyword.json",
				data : {query: search, x:37.56933989973153, y:126.98601057408942, radius:5000},
				beforeSend: function(req) {
					req.setRequestHeader("Authorization", "KakaoAK 1943fc09ad80ac61112c29da558c0619");
				},
				success : function(r) {
					//키워드 검색
					console.log(r);
					console.log(JSON.stringify(r));
					
					let newY = 0;
					let newX = 0;
					newY = r.documents[0].y;
					newX = r.documents[0].x;
					
					/*마커 생성하기*/
					let restaurantName = "";
					let routeClick = "";
					// 이동할 위도 경도 위치를 생성합니다
					//이동할 위도 경도 위치
			    var moveLatLon = new kakao.maps.LatLng(newY, newX);
			    
			    // 지도 중심을 이동 시킵니다
			    map.setCenter(moveLatLon);
			    
			    //윈포윈도우
			    var iwContent = '<div id="infoo"><div style="padding:5px; white-space : nowrap; height: 30px; width: 180px; font-size: 10pt;" class="p_markerInfo">Hello World!</div></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

			    // 인포윈도우를 생성하고 지도에 표시합니다
			    infowindow = new kakao.maps.InfoWindow ({
			        content : iwContent,
			        removable : iwRemoveable
			    });
			    
					$.each(r.documents, function(i, l) {
						console.log(l.place_name);
						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
							map : map,
							position: new kakao.maps.LatLng(l.y, l.x)
					});
						
						// 마커에 클릭이벤트를 등록합니다
					    kakao.maps.event.addListener(marker, 'click', function() {
					    // 마커 위에 인포윈도우를 표시합니다
					    infowindow.open(map, marker);
					    
					   // alert("지도장소이름:" + l.place_name);
					    $(".p_markerInfo").text(l.place_name);
					    $(".p_markerInfo").val(l.address_name);
					    
					    
					    
					});
					});
					
				
				    
				    
				}
			});
			
	});
	
	
	
	
});