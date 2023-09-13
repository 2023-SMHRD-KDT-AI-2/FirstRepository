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
</head>

<body>
	
	<div id="clock"></div>
<%
	String id =(String)session.getAttribute("memberid");
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberDTO> info = new ArrayList<>();
	info=dao.getmember(id);
	session.setAttribute("info",info);
	
	%>
<!-- 선웅선웅선웅선웅  -->
<%
	CctvDAO cdao = new CctvDAO();




%>	
    <p style="margin-top:-12px">
        <em class="link">
            <a href="/web/documentation/#CategoryCode" target="_blank"></a>
        </em>
    </p>
    <div class="map_wrap">
        <div id="map" style="width:100%;height:740px;position:relative;overflow:hidden;"></div>
        <ul id="category">
            <li id="AT4" data-order="0">
                <span class="category_bg new-icon1"></span>
                명소
            </li>
            <li id="FD6" data-order="1">
                <span class="category_bg new-icon2"></span>
                식당
            </li>
            <li id="CE7" data-order="2">
                <span class="category_bg new-icon3"></span>
                카페
            </li>
            <li id="AD5" data-order="3">
                <span class="category_bg new-icon4"></span>
                CCTV
            </li>
        </ul>
        <ul id="menu">
            <li id="A1" data-order="0">
                <span class="menu_bg new-icon1"></span>
                친구
            </li>
            <li id="A2" data-order="1">
                <span class="menu_bg new-icon2"></span>
                게시판
            </li>
            <li id="A3" data-order="2">
                <span id="chatLink" class="menu_bg new-icon3"></span>
                채팅
            </li>
            <li id="A4" data-order="3">
                <span class="menu_bg new-icon4"></span>
                마이
            </li>
            <li id="A5" data-order="4">
                <span class="menu_bg new-icon5"></span>
                지도
            </li>
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

<div id="me"><p id="message"></p></div>
<div id="myModal" class="modal">
    <form action="BoardProgram" method ="post" onsubmit="return check()">
    <h3>게시글 작성</h3>
    <label for="postTitle">제목:</label>
    <input type="text" id="postTitle" placeholder="제목을 입력하세요" name="title">
    
    <br><br>

    <label for="numParticipants">인원수:</label>
    <select id="numParticipants" name="numPeople">
        
    </select>

    <br><br>

    <label for="meetingTime">모임시간:</label>
    <input type="time" id="meetingTime" name="meetTime">

    <br><br>

    <label for="meetingPlace">모임장소:</label>
    <input type="text" id="meetingPlace" name="place">

    <br><br>

    <label for="postContent">내용:</label>
    <textarea id="postContent" name="bContent" rows="4" cols="50"></textarea>
    
    <br><br>
    <input type="hidden" id="latitude"  name="latitude" value = ""></input>
    <input type="hidden" id="longitude" name="longitude" value = ""></input>
    <input type="hidden" value=<%=info.get(0).getMember_Id()%> name=memberId></input>
    

    <button type = "button" id="cancelPost">취소</button>
    <button type="submit" id="savePost">저장</button> 
    <!-- <button id="savePost">저장</button> -->
     </form>
</div>

<div id="modalBackground" class="modal-background"></div>
<script src="js/jquery-3.7.1.js"></script>
	<script> 
        document.addEventListener("DOMContentLoaded", function () {
        // id가져오기
       	let chatSpan = document.getElementById("chatLink");})
        function updateClock() {
            const currentDate = new Date();
            const hours = currentDate.getHours();
            const minutes = currentDate.getMinutes();


            const clockElement = document.getElementById("clock");
            clockElement.textContent = `${hours}:${minutes}`;
        }

        // 1초마다 시간을 업데이트
        setInterval(updateClock, 1000);

        // 초기 로딩 시에도 시간 표시
        updateClock();
        
        
   
	    document.addEventListener("DOMContentLoaded", function () {
	        // id가져오기
	       	let chatSpan = document.getElementById("chatLink");
	
	        // 클릭 리스너 이벤트
	        chatSpan.addEventListener("click", function () {
	            //  goChattingList.jsp이동
	        	window.location = "goChattingList";
	        });
	    });
	</script>


<script type="text/javascript"

src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4409c4de37e0df523071580270ee4ff4&libraries=services,clusterer,drawing"></script>

<script src="assets/js/MapMain.js"></script>
</body>

</html>