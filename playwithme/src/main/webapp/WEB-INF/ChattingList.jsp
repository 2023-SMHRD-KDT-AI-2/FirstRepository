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
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css'>
<link rel="stylesheet" href="assets/css/ChatList.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="assets/js/clock.js"></script>


<style>
#searchInput {
	position: relative;
	height: 29px;
	margin: 0;
	border-radius: 33px;
	border: 1px solid gray;
	margin-bottom: 0px;
	width: 220px;
	margin-top: 10px;
	margin-left: 20px;
}

#clearSearch {
	position: relative;
	cursor: pointer;
	color: red;
	z-index: 1;
	left: -32px;
	top: 5px;
}

#search {
	height: 34px;
	margin: 0;
	border-radius: 33px;
	border: 1px solid gray;
	font-weight: 1000;
	margin-bottom: 29px;
	padding-left: 10px;
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
	position: relative;
	top: -2px;
	left: 0;
	height: 20px;
}

#internet {
	height: 19px;
	margin-left: 187px;
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
	height: 26px;
	margin-left: 13px;
	position: relative;
	top: 5px;
}

#back {
	cursor: pointer;
	border: 0px;
	background-color: #fafafa;
	margin-top: 23px;
	margin-left: 6px;
}

@media ( min-width : 1920px) {
	.center {
		max-width: 360px;
	}
}

#fix2 {
	position: fixed;
	top: 15px;
	width: 100%;
}

#title {
	position: relative;
	left: 30px;
	font-size: 25px;
	font-weight: bold;
}
</style>

</head>
<body class="center">
	
   <div id=fix>

      <span id="clock"></span>
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
		String memberId = info.get(0).getMember_Id();
		ChattingListDAO Chatdao = new ChattingListDAO();
		ArrayList<ChattingListDTO> chatList = new ArrayList<>();

		chatList = Chatdao.chatlist(memberId);
		%>

		<div id="fix2">
			<button class="material-symbols-outlined" id="back"
				style="color: gray;">arrow_back_ios</button>
			<span id="title">채팅</span> <br> <input type="text"
				name="roomTitle" id="searchInput">
			<!-- 검색어 입력란 id를 "searchInput"으로 수정 -->
			<span id="clearSearch" class="material-symbols-outlined">close</span>
			<img id="createRoomButton" src="images/채팅방생성.png" alt="채팅방 생성" />
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
					<img class="pic" src="file/<%=info_master.get(0).getM_Profile()%>"
						onerror="this.src='images/default.jpg'">
				</div>
				<div class="badge">
					<!-- 안 읽은 채팅수  -->
				</div>
				<div class="name">
					<!-- 채팅방 이름을 클릭하면 해당 채팅방으로 이동 -->
					<%=chatList.get(i).getChatting_Room_title()%>
				</div>
				<div class="message">
					<%
					String lastchat = Chatdao.lastCaht(Integer.parseInt(chatList.get(i).getChatting_Room_num()));
					if (lastchat != null) {
					%>
					<%=lastchat%>
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
		<script>
			$('#back').click(function() {
				location.href = 'goMain';
			})
			// 검색어 입력란에 입력이 있을 때 실행
			$("#searchInput").on(
					"input",
					function() {
						var query = $(this).val().toLowerCase();

						// 모든 연락처 숨기기
						$(".contact").hide();

						// 검색어와 일치하는 연락처만 보이기
						$(".contact").each(
								function() {
									var contactText = $(this).find(".name")
											.text().toLowerCase();
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
											alert('채팅방 success');
											window.location = 'goChattingList';
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											console.error('Request failed: '
													+ textStatus + ', '
													+ errorThrown);
											alert('채팅방 fail');
										}
									});
								});
					});
		</script>
</body>

</html>

