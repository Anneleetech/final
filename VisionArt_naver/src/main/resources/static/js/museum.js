// 네이버 지도 API 호출 완료 시 initMap 함수 실행
naver.maps.onJSContentLoaded = function() {
    initMap();
};
 
 onload = async function(){
	//createMap(); // 실제 구현할 때 검색 주소에 해당하는 좌표 리스트로 받고 마커 찍기
	
	await getData();
	searchByAddress();
	;
};
 function initMap() {
    // 네이버 지도 생성
    var map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(37.5665, 126.9780), // 초기 맵 중앙 좌표 (서울)
        zoom: 15, // 초기 줌 레벨
    });

    // 현재 위치 가져오기
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            var lat = position.coords.latitude;
            var lng = position.coords.longitude;

            // 현재 위치에 마커 생성
            var marker = new naver.maps.Marker({
                position: new naver.maps.LatLng(lat, lng),
                map: map,
            });

            // 맵 중앙을 현재 위치로 이동
            map.setCenter(new naver.maps.LatLng(lat, lng));
        }, function(error) {
            // 위치 정보를 가져오지 못하는 경우 기본 위치에 마커 생성
            var defaultLat = 37.5665;
            var defaultLng = 126.9780;

            var defaultMarker = new naver.maps.Marker({
                position: new naver.maps.LatLng(defaultLat, defaultLng),
                map: map,
            });

            // 맵 중앙을 기본 위치로 이동
            map.setCenter(new naver.maps.LatLng(defaultLat, defaultLng));

            alert('위치정보를 허용하지 않으셨습니다. 한국 서울로 임의지정합니다. Error getting location. Defaulting to Seoul, South Korea.');
        });
    } else {
        alert('Geolocation is not supported.');

        // 위치 정보를 가져오지 못하는 경우 기본 위치에 마커 생성
        var defaultLat = 37.5665;
        var defaultLng = 126.9780;

        var defaultMarker = new naver.maps.Marker({
            position: new naver.maps.LatLng(defaultLat, defaultLng),
            map: map,
        });

        // 맵 중앙을 기본 위치로 이동
        map.setCenter(new naver.maps.LatLng(defaultLat, defaultLng));
    }
}



/*
function createMap(){
	var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.523930, 126.980493),
    zoom: 15
    });
  	let marker = new naver.maps.Marker({
        position: new naver.maps.LatLng(37.523930, 126.980493),
        map: map
    });  
};*/
function updateMap(allInfo, longitude, latitude){

	// 새로운 네이버 지도 생성
    map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(latitude, longitude),
        zoom: 15
    });

    let marker = new naver.maps.Marker({
        position: new naver.maps.LatLng(latitude, longitude),
        map: map
    });

    let infoWindow = new naver.maps.InfoWindow({
        content: allInfo
    });

    naver.maps.Event.addListener(marker, "click", function (e) {
        if (infoWindow.getMap()) {
            infoWindow.close();
        } else {
            infoWindow.open(map, marker);
        }
    });
};
function formatDate(dateString) {
    const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
    return new Date(dateString).toLocaleDateString(undefined, options);
}
function searchByAddress() {
    $("#searchBtn").on("click", function () {
		 // 검색 버튼 클릭 시 showInfo 초기화
    $("#showInfo").empty();
        $.ajax({
            url: "/ex/search",
            data: { address: $("#searchInput").val() },
            type: "post",
            dataType: "json",
		success: function (result) {
	    console.log("Server result:", result); // 서버 응답 확인
    let showInfo = document.getElementById("showInfo");
    //showInfo.innerHTML = "";  // 검색 결과를 표시하기 전에 초기화
    
    let searchInfo = document.createElement("div");
		searchInfo.setAttribute("id", "searchInfo");
		
  		if (result && result.length > 0) {
       for (let i = 0; i < result.length; i++) {
        let museum = result[i];
        
         // 숫자로 사용되는 필드만 숫자 타입으로 변환
            if (!isNaN(museum.longitude)) {
                museum.longitude = parseFloat(museum.longitude);
            }

            if (!isNaN(museum.latitude)) {
                museum.latitude = parseFloat(museum.latitude);
            }


            // 필요한 정보를 추출하고 동적으로 HTML에 추가
            let info = document.createElement("span");
            info.setAttribute("id", "info" + i);

            let nameText = document.createElement("a");
            nameText.setAttribute("href", "javascript:void(0)");
            nameText.setAttribute("id", "name" + i);
            nameText.style.textDecorationLine = "none";
            nameText.style.color = "black";

            let addrText = document.createElement("p");
            addrText.setAttribute("id", "commentText");

            info.appendChild(nameText);
            info.appendChild(addrText);

            // 이름과 주소 정보 추가
            nameText.innerHTML += "<h4>" + museum.fcltyNm + "</h4>";
            addrText.innerHTML += museum.rdnmadr;

         	info.innerHTML += "<hr>";
            searchInfo.appendChild(info);
			showInfo.appendChild(searchInfo);


            // 지도 업데이트 함수 호출
            let allInfo = [
                "<div id='allInfo' class='scrollable-content'>",
                "<h4>" + museum.fcltyNm + "</h4>",
                "<p>" + museum.fcltyType + "</p>",
                "<p>" + museum.rdnmadr + "</p>",
                "<p>"+"운영기관전화번호 : " + museum.operPhoneNumber + "</p>",
                "<p>" +"운영기관명 : "+ museum.operInstitutionNm + "</p>",
                 "<p>"+"운영홈페이지 : " + museum.homepageUrl + "</p>",
                 "<p>"+"편의시설정보 : " + museum.fcltyInfo + "</p>",
                 "<p>"+"평일관람시작시각 : " + museum.weekdayOperOpenHhmm + "</p>",
                 "<p>"+"평일관람종료시각 : " + museum.weekdayOperColseHhmm+ "</p>",
                  "<p>"+"공휴일관람시작시각 : " + museum.holidayOperOpenHhmm + "</p>",
                 "<p>"+"공휴일관람종료시각 : " + museum.holidayCloseOpenHhmm + "</p>",
                  "<p>"+"휴관정보 : " + museum.rstdeInfo + "</p>",
                  "<p>"+"어른관람료 : " + museum.adultChrge + "</p>",
                   "<p>"+"청소년관람료 : " + museum.yngbgsChrge + "</p>",
                    "<p>"+"어린이관람료 : " + museum.childChrge + "</p>",
                    "<p>"+"관람료기타정보 : " + museum.etcChrgeInfo + "</p>",
                    "<p>"+"박물관미술관소개 : " + museum.fcltyIntrcn + "</p>",
                    "<p>"+"교통안내정보 : " + museum.trnsportInfo + "</p>",
                    "<p>"+"관리기관전화번호 : " + museum.phoneNumber + "</p>",
                    "<p>"+"관리기관명 : " + museum.institutionNm + "</p>",
                     "<p>" + "데이터기준일자(업데이트) : " + formatDate(museum.referenceDate) + "</p>",
                    "<p>"+"제공기관코드 : " + museum.insttCode + "</p>",
                "</div>"
            ].join("");

            // 클릭 이벤트에 지도 업데이트 함수 연결
            $("#name" + i).on("click", function () {
                updateMap(allInfo, museum.longitude, museum.latitude);
            });
        }
    } else {
         // 'result' 속성이 없거나 비어있을 경우 처리
        showInfo.innerHTML = "<p>No results found</p>";
    }
},
            error: function (request, status, error) {
                console.error("Error while fetching data:", status, error);
                // 서버 응답이 정상적인 JSON 형식이 아닌 경우 또는 서버 측에서 오류가 발생한 경우 콘솔에 출력
            }
        });
    });
}

const API_KEY='It7znRVf2fj97pNd4Gwh4Xxy0UFAgiz%2FycXSYvuTdg8LYdsLKOw1tKTi0xfBW3abCpBAcf6h%2By515iOXHE2qGg%3D%3D'
async function getData(){
	
const url = `http://api.data.go.kr/openapi/tn_pubr_public_museum_artgr_info_api?serviceKey=${API_KEY}&pageNo=1&numOfRows=100&type=json`;
const response = await fetch(url)
const data = await response.json()
console.log("data",data);
} 
