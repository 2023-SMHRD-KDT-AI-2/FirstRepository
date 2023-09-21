<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- core 라이브러리 연결 -->
<%@page import="playwithme.model.*"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>CodePen - Daily UI #013 | Direct Messaging</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css'>
<link rel="stylesheet" href="assets/css/ChatList.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="assets/js/clock.js"></script>


<style>
#searchInput {
	position: relative;
	height: 32px;
	margin: 0;
	border-radius: 33px;
	border: 1px solid gray;
	margin-bottom: 0px;
	width: 220px;
	margin-top: 24px;
	margin-left: 17px;
	padding-left: 27PX;
}

#clearSearch {
	position: relative;
	cursor: pointer;
	color: #b50202;
	z-index: 1;
	left: -32px;
	top: 5px;
}

#search {
	width: 17px;
	z-index: 1;
	position: relative;
	bottom: -55px;
	left: -74px;
}

#clock {
	margin-left: 2px;
	margin-bottom: 10px;
	display: inline-block; /* 시계를 인라인 블록 요소로 설정 */
	vertical-align: middle; /* 세로 정렬을 가운데로 설정 */
	margin-right: 3px;
	font-weight: BOLD;
	font-size: 15px;
}

#fix {
	position: fixed;
	top: 7px;
	left: 15px;
	height: 20px;
}

#internet {
	height: 19px;
	margin-left: 210px;
	margin-bottom: 2px;
}

#lte {
	height: 11px;
	margin-bottom: 5px;
}

#battery {
	height: 21px;
}

h3 {
	padding-left: 7px;
	padding-top: 7px
}

#searchButton {
	height: 26px;
	margin-left: 16px;
	position: relative;
	top: 5px;
}

#createRoomButton {
	height: 29px;
	margin-left: 16px;
	position: relative;
	top: 6px;
}

#back {
	cursor: pointer;
	border: 0px;
	background-color: #a4c4e000;
	margin-top: 50px;
	margin-left: 6px;
}

@media ( min-width : 1920px) {
	.center {
		max-width: 360px;
	}
}

#fix2 {
	position: fixed;
	top: 0px;
	width: 100%;
	bottom: 50px;
}

#title {
	position: relative;
	left: -10px;
	font-size: 25px;
	font-weight: bold;
}

#contact2 {
	width: 300px;
}

.contact {
	background-color: #fafafa;
	width: 91%;
	right: 17px;
}

.contact:hover {
	background-color: #e8e8e8;
}

#pro {
	width: 32px;
	height: 32px;
	margin-right: 35px;
	position: absolute;
	right: 76px;
	border-radius: 50%;
	bottom: 28px;
	border: 1.8px solid black;
}

#menu {
	display: flex;
	position: absolute;
	top: 654px;
	left: -33px;
	right: 0px;
	width: 375px;
	height: 70px;
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#menu li {
	display: block;
	/* border-right: 1px solid #acacac; */
	padding: 6px 6%;
	/* 패딩을 작게 조정 */
	font-size: 10px;
	/* 폰트 크기를 작게 조정 */
	text-align: center;
	cursor: pointer;
}

#menu li.on {
	background: #eee;
}

#menu li:hover {
	background: #eee;
	margin-left: -1px;
}

#menu li:last-child {
	margin-right: 0;
	border-right: 0;
}

#menu li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#menu li .menu_bg.new-icon1 {
	margin-top: 7px;
	background: url("images/친구2.png") no-repeat;
	background-size: contain;
	width: 24px;
}

#menu li .menu_bg.new-icon2 {
	margin-top: 7px;
	background: url("images/게시판5.png") no-repeat;
	background-size: contain;
	width: 24px;
}

#menu li .menu_bg.new-icon3 {
	margin-top: 7px;
	background: url("images/채팅.png") no-repeat;
	background-size: contain;
	width: 24px;
}

#menu li .menu_bg.new-icon4 {
	margin-top: 7px;
	background-size: contain;
	width: 1px;
}

#menu li .menu_bg.new-icon5 {
	margin-top: 7px;
	background: url("images/지도3.png") no-repeat;
	background-size: contain;
	width: 24px;
}


.lastDate {
	position: relative;
	left: 138px;
	bottom: 37px;
	font-size: 11px;
}

</style>

</head>
<body class="center">

	<div id=fix>

		<span id="clock"></span> <img src="images/인터넷.png" id="internet">
		<img src="images/LTE.png" id="lte"> <img src="images/배터리.png"
			id="battery">


	</div>

	<%
	String id = (String) session.getAttribute("memberid");
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberDTO> info = new ArrayList<>();
	info = dao.getmember(id);
	session.setAttribute("info", info);
	String memberId = info.get(0).getMember_Id();
	ChattingListDAO Chatdao = new ChattingListDAO();
	ArrayList<ChattingListDTO> chatList = new ArrayList<>();

	chatList = Chatdao.chatlist(memberId);
	%>

	<div id="fix2">
		<button class="material-symbols-outlined" id="back"
			style="color: gray;">arrow_back_ios</button>
		<span id="title">채팅</span> <img src="images/검색.png" id="search">
		<input type="text" id="searchInput" /><span
			id="clearSearch" class="material-symbols-outlined"> close </span> <img
			id="createRoomButton" src="images/채팅방생성.png" alt="채팅방 생성" />
	</div>



	<div class="contacts">


		<%
		for (int i = 0; i < chatList.size(); i++) {
		%>
		<div class="contact"
			onclick="location.href='<%="goChat?room=" + chatList.get(i).getChatting_Room_num()%>'">
			<div class="pic">
				<%
				ArrayList<MemberDTO> info_master = new ArrayList<>();
				info_master = dao.getmember(chatList.get(i).getMember_Id());
				%>
				<img class="pic" src="images/<%=info_master.get(0).getM_Profile()%>"
					onerror="this.src='images/default.jpg'">
			</div>

			<div class="name">
				<!-- 채팅방 이름을 클릭하면 해당 채팅방으로 이동 -->
				<%=chatList.get(i).getChatting_Room_title()%>
			</div>
			<div class="message">
				<%
				String lastchat = Chatdao.lastCaht(Integer.parseInt(chatList.get(i).getChatting_Room_num()));
				String lastdata = Chatdao.lastData(Integer.parseInt(chatList.get(i).getChatting_Room_num()));

				String timePart = ""; // 시간 부분을 저장할 변수 초기화

				if (lastdata != null) {
					String[] parts = lastdata.split(" "); // 공백을 기준으로 문자열을 나눔
					if (parts.length > 1) { // parts 배열이 최소한 2개 이상의 요소를 가져야 함
						timePart = parts[1]; // 시간 부분을 가져옴
					}
				}

				String originalTime = timePart; // 원래 시간 문자열

				// ':' 문자를 기준으로 문자열을 분리
				String[] timeParts = originalTime.split(":");
				if (timeParts.length >= 2) { // 최소한 시간과 분이 있어야 함
					int hour = Integer.parseInt(timeParts[0]); // 시간 부분을 정수로 파싱
					String minute = timeParts[1]; // 분 부분

		               // 오전 오후
		               String amPm = "오전";

		               if (hour >= 12) {
		                  amPm = "오후";
		               }

		               // 시간이 12를 넘어가면 1로 바꿔줌
		               if (hour > 12) {
		                  hour = hour % 12; // 12로 나눈 나머지가 1로 바뀜
		               }

		               // 시간과 분을 "AM/PM 시간:분" 형식으로 조합
		               // 앞에 한자리수 넘어가면 0 추가
		               String formattedHour = (hour < 10) ? "0" + hour : String.valueOf(hour);
		               String formattedMinute = (minute.length() == 1) ? "0" + minute : minute;
		               String formattedTime = amPm + " " + formattedHour + "시 " + formattedMinute + "분";

		               //String formattedTime = amPm + " " + hour + "시 " + minute + "분";

					// 대화 내용과 시간을 출력
				%>
				<%=lastchat%>
				<div class="lastDate">
					<%=formattedTime%>
				</div>
				<%
				} else {
				%>
				대화가 없습니다
				<%
				}
				%>
			</div>
		</div>
		<%
		}
		%>

	</div>



	<ul id="menu">
		<li id="A1" data-order="0"><span id="friendLink"
			class="menu_bg new-icon1"></span> 친구</li>
		<li id="A2" data-order="1"><span id="boardLink"
			class="menu_bg new-icon2"></span>게시판</li>
		<li id="A3" data-order="2"><span id="chatLink"
			class="menu_bg new-icon3"></span> 채팅</li>
		<li id="A4" data-order="3"><span class="menu_bg new-icon4"><img
				id="pro" src="images/<%=info.get(0).getM_Profile()%>"></span> 마이</li>
		<li id="A5" data-order="4"><span class="menu_bg new-icon5"></span>
			지도</li>
	</ul>
	<script src="assets/js/menuFix.js"></script>
	<script>
		$('#back').click(function() {
			window.history.back();
		})
		// 검색어 입력란에 입력이 있을 때 실행
		$("#searchInput").on("input", function() {
			var query = $(this).val().toLowerCase();

			// 모든 연락처 숨기기
			$(".contact").hide();

			// 검색어와 일치하는 연락처만 보이기
			$(".contact").each(function() {
				var contactText = $(this).find(".name").text().toLowerCase();
				if (contactText.indexOf(query) !== -1) {
					$(this).show();
				}
			});
		});
		$("#clearSearch").click(function() {
			$("#searchInput").val("");
			$(".contact").show();
		});

		$(document).ready(
				function() {
					$('#createRoomButton').on(
							'click',
							function() {
								var roomTitle = $('#searchInput').val();
								$.ajax({
									url : 'ChattingListProgram',
									type : 'GET',
									data : {
										roomTitle : roomTitle
									},
									success : function(response) {

										console.log('서버 응답:', response);
										//alert('채팅방 success');
										window.location = 'goChattingList';
									},
									error : function(jqXHR, textStatus,
											errorThrown) {
										console.error('Request failed: '
												+ textStatus + ', '
												+ errorThrown);
										alert('채팅방 생성 실패');
									}
								});
							});
				});
	</script>
</body>

</html>

