<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>클릭한 위치에 마커 표시하기</title>
    
</head>
<body>
<div id="map" style="width:100%;height:350px;">0</div>
<p><em>지도를 클릭해주세요!</em></p>
<form action = "BoardService.do" method ="post">
    <table id="list">
    	<tr>
    		<td>작성자</td>
    		<td><input type ="text" name = "memberId"></td>
    	</tr>
        <tr>
            <td>제목</td>
            <td><input type="text" name = "title"> </td>
        </tr>
        <tr>
            <td>인원수</td>
            <td><input type="text" name = "numPeople"> </td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea name = "b_content" rows="10" style="resize: none;"></textarea></td>
        </tr>
        <tr>
            <td>모임 시간</td>
            <td colspan="2">
                <input type="text" name = "meetTime" style="float: right;">
            </td>
        </tr>
        <tr>
            <td>위도</td>
            <td id = "longitude" name = "longitude" ></td>
        </tr>
        <tr>
            <td>경도</td>
            <td id = "latitude" name = "latitude"></td>
        </tr>
        <tr>
            <td>주소</td>
            <td>
                <input type="text" name = "place">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="reset" value="초기화">
                <input type="submit" value="작성하기">
            </td>
        </tr>
    </table>
    </form>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=984ad7ec7053f83c9546db7ad1d059ad"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    
    var message1 = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 입니다';
    var message2 = '경도는 ' + latlng.getLng() + ' 입니다';
    
    var resultDiv1 = document.getElementById('longitude'); 
    var resultDiv2 = document.getElementById('latitude'); 
    resultDiv1.innerHTML = message1;
    resultDiv2.innerHTML = message2;
    
});


</script>
</body>
</html>