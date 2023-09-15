



<%@page import="playwithme.model.*"%>
<%@page import="playwithme.model.CctvDAO"%>
<%@page import="playwithme.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="playwithme.model.MemberDAO"%>
<%@page import="playwithme.model.CctvDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="assets/css/MapMain.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>

	#clock {
		margin-left: 10px;
		margin-bottom: 10px;
		display: inline-block; /* 시계를 인라인 블록 요소로 설정 */
		vertical-align: middle; /* 세로 정렬을 가운데로 설정 */
		margin-right: 3px;
		font-weight: BOLD;
		font-size: 15px;
	}
	#fix{
	    position: relative;
	    top: -2px;
	    left: 0;
	    height: 20px;
	    
	}
	#navi{
		height: 14px;
		margin-bottom: 2px;
	}
	#internet{
		height: 19px;
		margin-left: 180px;
		margin-bottom: 2px;
	}
	#lte{
		height: 11px;
		margin-bottom: 5px;
	}
	#battery{
		height: 21px;
	}
</style>


</head>
<body>

	<div id=fix>

		<span id="clock"></span>
		<img src="images/네비.png" id="navi">
		<img src="images/인터넷.png" id="internet">
		<img src="images/LTE.png" id="lte">
		<img src="images/배터리.png" id="battery">
		

	</div>

	<%
	String id = (String) session.getAttribute("memberid");
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberDTO> info = new ArrayList<>();
	info = dao.getmember(id);
	session.setAttribute("info", info);
	%>
	<!-- 선웅선웅선웅선웅  -->
	<%
	CctvDAO cdao = new CctvDAO();
	%>
	<p style="margin-top: -12px">
		<em class="link"> <a href="/web/documentation/#CategoryCode"
			target="_blank"></a>
		</em>
	</p>
	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 740px; position: relative; overflow: hidden;"></div>


		<ul id="category">
			<li id="AT4" data-order="0"><span class="category_bg new-icon1"></span>
				명소</li>
			<li id="FD6" data-order="1"><span class="category_bg new-icon2"></span>
				식당</li>
			<li id="CE7" data-order="2"><span class="category_bg new-icon3"></span>
				카페</li>
			<li id="AD5" data-order="3"><span class="category_bg new-icon4"></span>
				CCTV</li>
		</ul>
		<ul id="menu">
			<li id="A1" data-order="0"><span id="friendLink"
			class="menu_bg new-icon1"></span>
				친구</li>
			<li id="A2" data-order="1"><span class="menu_bg new-icon2"></span>
				게시판</li>
			<li id="A3" data-order="2"><span id="chatLink"
				class="menu_bg new-icon3"></span> 채팅</li>
			<li id="A4" data-order="3"><span class="menu_bg new-icon4"></span>
				마이</li>
			<li id="A5" data-order="4"><span class="menu_bg new-icon5"></span>
				지도</li>
		</ul>
		<ul id="post">
			<li id="post1" data-order="0"><span class="post new-icon1"></span>
			</li>
		</ul>
	</div>
	<div id="clickLatlng"></div>
	<div id="menu_wrap" class="bg_white">
		<div class="option">
			<div>
				<form onsubmit="customSearchPlaces(); return false;">
					<input type="text" value="" id="keyword">
					<!-- <button type="submit">검색</button> -->
				</form>
			</div>
		</div>

		<ul id="placesList"></ul>
		<div id="pagination"></div>
	</div>

	<div id="me">
		<p id="message"></p>
	</div>
	<div id="myModal" class="modal">
		<form action="BoardProgram" method="post" onsubmit="return check()">
			<h3>게시글 작성</h3>
			<label for="postTitle">제목:</label> <input type="text" id="postTitle"
				placeholder="제목을 입력하세요" name="title"> <br> <br> <label
				for="numParticipants">인원수:</label> <select id="numParticipants"
				name="numPeople">

			</select> <br> <br> <label for="meetingTime">모임시간:</label> <input
				type="time" id="meetingTime" name="meetTime"> <br> <br>
			<label for="meetingPlace">모임장소:</label> <input type="text"
				id="meetingPlace" name="place"> <br> <br> <label
				for="postContent">내용:</label>
			<textarea id="postContent" name="bContent" rows="4" cols="50"></textarea>

			<br> <br> <input type="hidden" id="latitude"
				name="latitude" value=""></input> <input type="hidden"
				id="longitude" name="longitude" value=""></input> <input
				type="hidden" value=<%=info.get(0).getMember_Id()%> name=memberId></input>


			<button type="button" id="cancelPost">취소</button>
			<button type="submit" id="savePost">저장</button>
			<!-- <button id="savePost">저장</button> -->
		</form>
	</div>

	<div id="modalBackground" class="modal-background"></div>



	<script src="js/jquery-3.7.1.js"></script>
	<script type="text/javascript"

		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4409c4de37e0df523071580270ee4ff4&libraries=services,clusterer,drawing"></script>



	<script src="assets/js/MapMain.js"></script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {

			// id가져오기
			let chatSpan = document.getElementById("chatLink");
		})

		///////////////////////////////////////////////////////////////////////////////
		// 시계
		function updateClock() {
			const currentDate = new Date();
			const hours = currentDate.getHours();
			const minutes = currentDate.getMinutes();
			

			const hours12 = hours % 12 || 12;
			

			const hoursStr = String(hours12).padStart(2, '0'); 
		    const minutesStr = String(minutes).padStart(2, '0'); 

		    const clockElement = document.getElementById("clock");
		    clockElement.textContent = `${hoursStr}:${minutesStr}`;

	
		}

		// 1초마다 시간을 업데이트
		setInterval(updateClock, 1000);

		// 초기 로딩 시에도 시간 표시
		updateClock();

		////////////////////////////////////////////////////////////////////////////////       

		document.addEventListener("DOMContentLoaded", function () {
	        // id가져오기
	       	let chatSpan = document.getElementById("chatLink");
	
	        // 클릭 리스너 이벤트
	        chatSpan.addEventListener("click", function () {
	            //  goChattingList.jsp이동
	        	window.location = "goChattingList";
	        });
	    });

		//친구 목록 가기
		document.addEventListener("DOMContentLoaded", function () {
	        // id가져오기
	       	let chatSpan = document.getElementById("friendLink");
	
	        // 클릭 리스너 이벤트
	        chatSpan.addEventListener("click", function () {
	            //  goChattingList.jsp이동
	        	window.location = "goFriendList";
	        });
	    });
		
		   //////////////////////////////////////////////
		    addMarker2() 
			<% BoardDAO dao2 = new BoardDAO();
			ArrayList<BoardDTO> board_Num = new ArrayList<>();
			board_Num = dao2.list();%>
			
		///////////////////////////////////////////\
			// 전체게시글 지도 표시
			function addMarker2() {
			let marker4 =new kakao.maps.Marker({})
			let infowindow3 = new kakao.maps.InfoWindow({}) 
			let positions =[]
					console.log("sarf")				
					
					<%for(int i = 0; i<board_Num.size(); i++ ){%>
						
							data4 = {
							content: "<div><%=board_Num.get(i).getTitle()%></div>",
					        latlng: new kakao.maps.LatLng(<%=board_Num.get(i).getLongitude()%>, <%=board_Num.get(i).getLatitude()%>)				
							};
							positions.push(data4)
							
					        imageSrc1 = "file/<%=board_Num.get(i).getM_Profile()%>"

					        imageSize1 = new kakao.maps.Size(25, 25); 

					        //console.log(board_Num.get(i).getM_Profile());
					        // 마커 이미지를 생성합니다    
					        markerImage1 = new kakao.maps.MarkerImage(imageSrc1, imageSize1); 
					        
					        
					        console.log(imageSrc1)
					        console.log(positions[<%=i%>].latlng)
					    // 마커를 생성합니다
					    	marker4 = new kakao.maps.Marker({
					    	map: map, // 마커를 표시할 지도
					        position: positions[<%=i%>].latlng, // 마커의 위치
					        image: markerImage1
					    });
						 // 마커에 표시할 인포윈도우를 생성합니다 
					    	 infowindow3 = new kakao.maps.InfoWindow({
					         content: positions[<%=i%>].content
					         
					         // 인포윈도우에 표시할 내용
					    });
						 
					    // 마커가 지도 위에 표시되도록 설정합니다
					    marker4.setMap(map);
					    console.log(infowindow3.isOpen)
						
					    kakao.maps.event.addListener(marker4, 'mouseover', makeOverListener(map, marker4, infowindow3));
					    kakao.maps.event.addListener(marker4, 'mouseout', makeOutListener(infowindow3));
			<%}%>
			}
					// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
						function makeOverListener(map, marker4, infowindow) {
						    return function() {
						        infowindow.open(map, marker4);
						    };
						}
						
						// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
						function makeOutListener(infowindow) {
						    return function() {
						        infowindow.close();
						    };
						}   
		/////////////////////////////////////////////////////////////////
		// 내 게시물 마커 생성
		 	<%--  let positions1 = [
		    <% 
		    for(int  i = 0; i<board_Num.size(); i++ ){%>
		       {title :"<%=board_Num.get(i).getTitle()%>" , latlng: new kakao.maps.LatLng(<%=board_Num.get(i).getLongitude()%>,<%=board_Num.get(i).getLatitude()%>)},
		    <%}%>
		    
		 ];
		
		// 마커 이미지의 이미지 주소입니다
		var imageSrc1 = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		    
		for (var i = 0; i < positions1.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize1 = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage1 = new kakao.maps.MarkerImage(imageSrc1, imageSize1); 
		    
		    // 마커를 생성합니다
		    var marker1 = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions1[i].latlng, // 마커를 표시할 위치
		        title : positions1[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage1 // 마커 이미지 
		    });
		}; --%>


  
 
	</script>



</body>



</html>