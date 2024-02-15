
function convertToGridXY(latitude, longitude) {
    // 기상청 API에 필요한 상수 값들
    var RE = 6371.00877; // 지구 반경(km)
    var GRID = 5.0; // 격자 간격(km)
    var SLAT1 = 30.0; // 투영 위도1(degree)
    var SLAT2 = 60.0; // 투영 위도2(degree)
    var OLON = 126.0; // 기준점 경도(degree)
    var OLAT = 38.0; // 기준점 위도(degree)
    var XO = 43; // 기준점 X좌표(GRID)
    var YO = 136; // 기준점 Y좌표(GRID)

    var DEGRAD = Math.PI / 180.0;
    var RADDEG = 180.0 / Math.PI;

    var re = RE / GRID;
    var slat1 = SLAT1 * DEGRAD;
    var slat2 = SLAT2 * DEGRAD;
    var olon = OLON * DEGRAD;
    var olat = OLAT * DEGRAD;

    var sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
    sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
    var sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
    sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
    var ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
    ro = re * sf / Math.pow(ro, sn);

    var ra = Math.tan(Math.PI * 0.25 + (latitude) * DEGRAD * 0.5);
    ra = re * sf / Math.pow(ra, sn);
    var theta = longitude * DEGRAD - olon;

    if (theta > Math.PI) theta -= 2.0 * Math.PI;
    if (theta < -Math.PI) theta += 2.0 * Math.PI;
    theta *= sn;

    var x = Math.floor(ra * Math.sin(theta) + XO + 0.5);
    var y = Math.floor(ro - ra * Math.cos(theta) + YO + 0.5);

    return { nx: x, ny: y };
}

// 예시로 위도 37.5665, 경도 126.9780을 변환
var result = convertToGridXY(37.5665, 126.9780);
console.log("예시로 위도 37.5665, 경도 126.9780을 변환한 값"+result.nx, result.ny);

function initMap() {
    // 네이버 지도 생성
    var map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(37.5665, 126.9780), // 초기 맵 중앙 좌표
        zoom: 15, // 초기 줌 레벨
    });

    // 현재 위치 가져오기
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
            function (position) {
                var lat = position.coords.latitude;
                var lng = position.coords.longitude;

                // 현재 위치에 마커 생성
                var marker = new naver.maps.Marker({
                    position: new naver.maps.LatLng(lat, lng),
                    map: map,
                });

                // 맵 중앙을 현재 위치로 이동
                map.setCenter(new naver.maps.LatLng(lat, lng));

                // 날씨 데이터 받아오기
                fetchWeatherData(lat, lng);
            },
            function (error) {
                // 위치 정보 오류 처리, 기본 위치 설정
                console.error('Geolocation error:', error);
                var defaultLat = 37.5665;
                var defaultLng = 126.9780;

                // 기본 위치에 마커 생성
                var marker = new naver.maps.Marker({
                    position: new naver.maps.LatLng(defaultLat, defaultLng),
                    map: map,
                });

                // 맵 중앙을 기본 위치로 이동
                map.setCenter(new naver.maps.LatLng(defaultLat, defaultLng));

                // 날씨 데이터 받아오기
                fetchWeatherData(defaultLat, defaultLng);
            }
        );
    } else {
        // geolocation이 지원되지 않는 경우
        alert('Geolocation is not supported.');

        // 기본 위치 사용
        var defaultLat = 37.5665;
        var defaultLng = 126.9780;

        // 기본 위치에 마커 생성
        var marker = new naver.maps.Marker({
            position: new naver.maps.LatLng(defaultLat, defaultLng),
            map: map,
        });

        // 맵 중앙을 기본 위치로 이동
        map.setCenter(new naver.maps.LatLng(defaultLat, defaultLng));

        // 날씨 데이터 받아오기
        fetchWeatherData(defaultLat, defaultLng);
    }
}

// 네이버 지도 API 호출 완료 시 initMap 함수 실행
naver.maps.onJSContentLoaded = initMap;

function fetchWeatherData(latitude, longitude) {
    var currentDate = new Date();
    var year = currentDate.getFullYear();
    var month = ('0' + (currentDate.getMonth() + 1)).slice(-2);
    var day = ('0' + currentDate.getDate()).slice(-2);
    var currentHour = currentDate.getHours();

    // 위도와 경도를 격자 좌표로 변환
    var gridXY = convertToGridXY(latitude, longitude);

    // 현재 시각에서 가장 가까운 과거의 baseTime 설정
    var baseTimes = ["0200", "0500", "0800", "1100", "1400", "1700", "2000", "2300"];
	var currentHour = new Date().getHours().toString().padStart(2, '0');
	var currentMinute = new Date().getMinutes().toString().padStart(2, '0');
	var compareTime = (parseInt(currentHour + currentMinute) + 10).toString().padStart(4, '0');

// 가장 가까운 이전 시간의 baseTime 찾기
var selectedBaseTime = baseTimes.reduce(function (prev, curr) {
    // 현재 시간이 compareTime 보다 작으면서 현재 baseTime이 compareTime보다 작은 경우
    if (currentHour + currentMinute < compareTime && curr < compareTime) {
        return curr; // 현재 baseTime 반환
    }
    // 현재 시간이 compareTime 이상인 경우 또는 현재 baseTime이 compareTime보다 작은 경우
    return (curr <= compareTime && curr > prev) ? curr : prev;
}, baseTimes[0]);

// 만약에 selectedBaseTime이 비어 있다면, 현재 시간보다 이전의 baseTime이 없다는 의미이므로
// 가장 마지막 baseTime인 "2300"으로 설정
selectedBaseTime = selectedBaseTime || "2300";

console.log("Selected Base Time:", selectedBaseTime);

    // 선택된 baseTime으로 API 호출
    var xhr = new XMLHttpRequest();
    var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst';
    var serviceKey = 'It7znRVf2fj97pNd4Gwh4Xxy0UFAgiz/ycXSYvuTdg8LYdsLKOw1tKTi0xfBW3abCpBAcf6h+y515iOXHE2qGg==';
    var numOfRows = '1000';
    var dataType = 'JSON';
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + encodeURIComponent(serviceKey);
    queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1');
    queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent(numOfRows);
    queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent(dataType);
    queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent(year + month + day);
    queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent(selectedBaseTime);
    queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent(gridXY.nx);
    queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent(gridXY.ny);

    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
      if (this.readyState == 4) {
            if (this.status == 200) {
                var response = JSON.parse(this.responseText);
                processWeatherData(response);
            } else {
                console.error('Error fetching weather data. Status:', this.status);
                // 여기에 적절한 에러 처리를 추가할 수 있습니다.
                
            }
        }
    };
    xhr.send('');
}
function extractMinTemp(data, category) {
    var minTemperature = Number.MAX_VALUE;
   
    for (var i = 0; i < data.response.body.items.item.length; i++) {
        var item = data.response.body.items.item[i];

        if (item.category === category) {
            var value = parseFloat(item.fcstValue);
            
            minTemperature = Math.min(minTemperature, value);
           
        }
    }

    return minTemperature;
}
function extractMaxTemp(data, category) {

    var maxTemperature = Number.MIN_VALUE;

    for (var i = 0; i < data.response.body.items.item.length; i++) {
        var item = data.response.body.items.item[i];

        if (item.category === category) {
            var value = parseFloat(item.fcstValue);

            maxTemperature = Math.max(maxTemperature, value);
        }
    }
    return maxTemperature;
}
function calculateDailyAverage(data, category) {
    var dailySum = 0;
    var count = 0;
	var firstTemperature = true;
	var minTemperature;
	var maxTemperature;

    for (var i = 0; i < data.response.body.items.item.length; i++) {
        var item = data.response.body.items.item[i];
 // 현재 날짜에 해당하는 예보 값만 처리
       if (item.category === category && item.baseDate === item.fcstDate) {
           var value = parseFloat(item.fcstValue);
            // 최초로 들어온 값으로 최저 온도와 최고 온도를 초기화
    if (firstTemperature) {
        minTemperature = value;
        maxTemperature = value;
        firstTemperature = false;
    } else {
        // 이미 초기화된 경우에는 현재 값과 비교하여 업데이트
        minTemperature = Math.min(minTemperature, value);
        maxTemperature = Math.max(maxTemperature, value);
    }
            dailySum += value;
            count++;
        }
    }

    if (count === 0) {
        return '-'; // 데이터가 없는 경우
    }

    // 최저 온도와 최고 온도를 결과에 추가
    var dailyAverage = (dailySum / count).toFixed(2);
    return addUnitToValue(category, dailyAverage, minTemperature, maxTemperature);
}
function calculateDailyAverageSky(data, category) {
    var sum = 0;
    var count = 0;

    for (var i = 0; i < data.response.body.items.item.length; i++) {
        var item = data.response.body.items.item[i];
        
        if (item.category === category && item.baseDate === item.fcstDate) {
            sum += parseInt(item.fcstValue);
            count++;
        }
    }

    return count > 0 ? Math.round(sum / count) : 0;
}

function getSkyDescription(skyValue) {
    switch (skyValue) {
        case 1:
             return { description: '맑음', imageUrl: `/icon/Weather-clear.png` };
        case 2:
			 return { description: '구름 약간', imageUrl: `/icon/Weather-cloudy.png` };
        case 3:
			 return { description: '구름많음', imageUrl: `/icon/Weather-cloudycloudy.png` };
        case 4:
			 return { description: '흐림', imageUrl: `/icon/Weather-sunnyandcloudy.png` };
        default:
             return { description: '알 수 없음', imageUrl: `/icon/Weather-dontknow.png` };
    }
}
function calculateDailyAveragePty(data, category) {
    var sum = 0;
    var count = 0;

    for (var i = 0; i < data.response.body.items.item.length; i++) {
        var item = data.response.body.items.item[i];
      if (item.category === category && item.baseDate === item.fcstDate) {
            sum += parseInt(item.fcstValue);
            count++;
        }
    }

    return count > 0 ? Math.round(sum / count) : 0;
}

function getPrecipitationTypeDescription(ptyValue) {

    switch (ptyValue) {
        case 0:
            return { description: '비 안옴', imageUrl: `/icon/Weather-notrainy.png` };
        case 1:
            return { description: '비', imageUrl: `/icon/Weather-rainywithumbrella.png` };
        case 2:
            return { description: '비/눈', imageUrl: `/icon/Weather-cloudyandrainyandsnowy.png` };
        case 3:
            return { description: '눈', imageUrl: `/icon/Weather-snowy.png` };
        case 4:
            return { description: '소나기', imageUrl: `/icon/Weather-thunderstromandrainy.png` };
        default:
            return { description: '알 수 없음', imageUrl: `/icon/Weather-dontknow.png` };
    }
}


function displayDailyAverages(data) {
    // 하루 평균 온도 계산
    var dailyTemperature = calculateDailyAverage(data, 'TMP');
    console.log('하루 평균 온도:', dailyTemperature);

    //하루 평균 습도 계산
    var dailyHumidity = calculateDailyAverage(data, 'REH');
    console.log('하루 평균 습도:', dailyHumidity);
    
     // 하루 평균 SKY 계산 및 표현
    var dailySky = calculateDailyAverageSky(data, 'SKY');
    var dailySkyType=getSkyDescription(dailySky);
    var skyImageUrl = dailySkyType.imageUrl;
    console.log('하루 평균 SKY:', dailySky);
    // 하루 평균 PTY 계산 및 표현
    var dailyPrecipitationType = calculateDailyAveragePty(data, 'PTY');
     var precipitationType = getPrecipitationTypeDescription(dailyPrecipitationType);
    var imageUrl = precipitationType.imageUrl;
    console.log('하루 평균 PTY:', dailyPrecipitationType);
    
   
    
     // 하루 평균 최저 기온 계산 및 표현
    var minTemperature = calculateDailyAverage(data, 'TMN');
    console.log('최저 온도:', minTemperature);
    if(minTemperature=='-'){
		 //남아있는 시간중에 최저 기온 값 없으면, 
    var minTemperature = extractMinTemp(data, 'TMP');
     console.log('최저 온도:', minTemperature);
	}

    // 하루 평균 최고 기온 계산 및 표현
    var maxTemperature = calculateDailyAverage(data, 'TMX');
   console.log('최고 온도:', maxTemperature);
    if(maxTemperature=='-'){
		 //남아있는 시간중에 최저,최대 기온 값 없으면, 
    var maxTemperature = extractMaxTemp(data, 'TMP');
     console.log('최저 온도:', maxTemperature);
	}

    var averageDiv = document.getElementById('average');
    averageDiv.innerHTML = '오늘 하루 날씨는 평균 온도 '+ '<img src="/icon/Weather-dailyTemp.png" alt="Temp Icon1" class="temp-icon">'+ dailyTemperature +
        ' 평균 습도 ' + '<img src="/icon/Weather-dailyHumidity.png" alt="Temp Icon2" class="temp-icon">'+ dailyHumidity +
        '이고, 하늘 상태는 ' +dailySkyType.description +  '<img src="' + skyImageUrl + '" alt="Weather Sky Icon" class="weather-sky-icon">'+
        '이며, 강수 형태는 ' + precipitationType.description +  '<img src="' + imageUrl + '" alt="Weather Icon" class="weather-icon">'+
        '이고, 최저 기온은 ' + '<img src="/icon/Weather-lowTemp.png" alt="Temp Icon3" class="temp-icon">'+ minTemperature +
        '°C이고, 최고 기온은 '+ '<img src="/icon/Weather-highTemp.png" alt="Temp Icon4" class="temp-icon">'+ maxTemperature + '입니다.';
}

function processWeatherData(data) {
	 // 콘솔에 데이터 출력
            console.log(data);
    // 응답이 정상적으로 도착했는지 확인
    if (data.response.header.resultCode === '00' && data.response.header.resultMsg === 'NORMAL_SERVICE') {
        // 필요한 데이터가 있는지 확인
        if (data.response.body.items && data.response.body.items.item) {
            // 테이블 헤더 생성
         //  var table = '<table><tr><th>날짜</th><th>(업데이트)시간</th><th>예보날짜</th><th>예보시간</th><th>카테고리 코드</th><th>카테고리 이름</th><th>데이터</th></tr>';
var table = '<table><tr><th>예보날짜</th><th>예보시간</th><th>카테고리 이름</th><th>데이터</th></tr>';

            // 각 항목에 대해 반복
            for (var i = 0; i < data.response.body.items.item.length; i++) {
                var item = data.response.body.items.item[i];
                // 테이블 행 추가
               /*table += '<tr><td>' + item.baseDate + '</td><td>' + item.baseTime + '</td><td>' + item.fcstDate + '</td><td>' + item.fcstTime + '</td><td>' + item.category + '</td><td>' + item.fcstValue + '</td></tr>';*/
 	//table += '<tr><td>' + item.baseDate + '</td><td>' + item.baseTime + '</td><td>' + item.fcstDate + '</td><td>' + item.fcstTime + '</td><td>' + item.category + '</td><td>' + getCategoryName(item.category) + '</td><td>' + addUnitToValue(item.category, item.fcstValue) + '</td></tr>';
     table += '<tr><td>' + item.fcstDate + '</td><td>' + item.fcstTime + '</td><td>' + getCategoryName(item.category) + '</td><td>' + addUnitToValue(item.category, item.fcstValue) + '</td></tr>';
            }

            // 테이블 마무리
            table += '</table>';

            // HTML 요소에 테이블 추가
            document.getElementById('weatherTable').innerHTML = table;
             // 별도로 나타내고자 하는 하루 평균 값들을 표시
            displayDailyAverages(data);
        } else {
            // 데이터가 없을 경우 메시지 표시
             console.error('날씨 데이터가 없습니다.');
            document.getElementById('weatherTable').innerHTML = '날씨 데이터가 없습니다.';
        }
    } else {
        // 응답이 정상적이지 않을 경우 메시지 표시
        console.error('비정상적인 응답: ' + data.response.header.resultMsg);
        document.getElementById('weatherTable').innerHTML = '비정상적인 응답: ' + data.response.header.resultMsg;
    }
}
 // 카테고리 코드와 이름의 매핑
        function getCategoryName(categoryCode) {
            var categoryNames = {
                POP: '강수확률',
                PTY: '강수형태',
                PCP: '1시간 강수량',
                REH: '습도',
                SNO: '1시간 신적설',
                SKY: '하늘상태',
                TMP: '1시간 기온',
                TMN: '일 최저기온',
                TMX: '일 최고기온',
                UUU: '풍속(동서성분)',
                VVV: '풍속(남북성분)',
                WAV: '파고',
                VEC: '풍향',
                WSD: '풍속'
            };

            return categoryNames[categoryCode] || 'Unknown';
        }
 // 각 항목에 따른 단위 추가
        function addUnitToValue(category, value) {
            var units = {
                POP: '%',
                PTY: '',  // No unit for precipitation type
                PCP: 'mm',
                REH: '%',
                SNO: 'mm',
                SKY: '',  // No unit for sky condition
                TMP: '°C',
                TMN: '°C',
                TMX: '°C',
                UUU: 'm/s',
                VVV: 'm/s',
                WAV: 'm',
                VEC: '°',
                WSD: 'm/s'
            };
  if (category === 'SKY') {
                // 값에 따라 '맑음', '구름많음', '흐림'으로 변환
                switch (value) {
                    case '1':
                        return '맑음';
                    case '2':
           				 return '구름 약간';  
                    case '3':
                        return '구름많음';
                    case '4':
                        return '흐림';
                    default:
                        return value;
                }
            } else if (category === 'PTY') {
                // 값에 따라 '없음', '비', '비/눈', '눈', '소나기'로 변환
                switch (value) {
                    case '0':
                        return '없음';
                    case '1':
                        return '비';
                    case '2':
                        return '비/눈';
                    case '3':
                        return '눈';
                    case '4':
                        return '소나기';
                    default:
                        return value;
                }
            }

            var unit = units[category] || '';
            return value + ' ' + unit;
        }


