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
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>CodePen - Daily UI #013 | Direct Messaging</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css'>
<link rel="stylesheet" href="assets/css/ChatList.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>


</head>
<body>
<%
String id = (String) session.getAttribute("memberid");
MemberDAO dao = new MemberDAO();
ArrayList<MemberDTO> info = new ArrayList<>();
info = dao.getmember(id);
session.setAttribute("info", info);
String memberId = info.get(0).getMember_Id();
ChattingListDAO Chatdao = new ChattingListDAO();
String nName=Chatdao.nName(memberId);
ArrayList<ChattingListDTO> chatList = new ArrayList<>();
chatList = Chatdao.chatlist(memberId);
ChattingListDTO chatinfo1=(ChattingListDTO)session.getAttribute("chatinfo");
%>
<div class="chat">
    <div class="contact bar">
    	<%
     String room = request.getParameter("room");

     ChattingListDAO chattoboard = new ChattingListDAO();
     String i = chattoboard.chatFindBoard(room);
     if (i != null) {
	%>
	<a href="goProfile2?i=<%=i%>">
    <i  class="fa-regular fa-newspaper" style="color: #5d92ee;"></i>
    </a>
	<% } %>
        <div class="name">                
        </div>
        <div class="seen">
        <!-- 참여자 id -->
        </div>
        			<!-- 방 삭제하기 -->

        <i id="delete-option" class="fa-solid fa-right-from-bracket" style="color: #5b90ec;"></i>
    </div>
    <div class="messages" id="chat-messages">
    </div>
    <div class="input">
        <input type="hidden" id="name-input" placeholder="이름 입력" value="<%=memberId%>">
        <input type="text" id="message" placeholder="메시지 입력">
        <i class="fa-solid fa-message" id="send-button" style="color: #6398f2;"></i>
    </div>
</div>


<script>
const urlParams = new URLSearchParams(window.location.search);
const chatroom = urlParams.get('room');
//채팅 null 입력 하면 버튼 비활성화
//메시지 입력란과 아이콘 요소를 가져옵니다.
const messageInput = document.getElementById("message");
const sendButton = document.getElementById("send-button");



//아이콘 클릭 이벤트 핸들러 함수
function handleIconClick() {
 // 메시지 입력란의 값
 const messageValue = messageInput.value;

 // 메시지 값이 null 또는 빈 문자열인 경우 클릭 이벤트를 무시합니다.
 if (!messageValue || messageValue.trim() === "") {
 	sendButton.style.color = "#ccc"; // 회색
     return;
 }

 // 메시지 값이 있는 경우, 실제로 클릭 이벤트를 처리하는 로직을 여기에 추가하세요.
 sendMessage(); // 아이콘 클릭 이벤트가 활성화되는 경우 메시지 전송 로직을 수행
}

//아이콘 클릭 이벤트 핸들러를 등록합니다.
sendButton.addEventListener("click", handleIconClick);

//메시지 입력란의 입력 이벤트를 감지합니다.
messageInput.addEventListener("input", function() {
 // 메시지 입력란의 값
 const messageValue = messageInput.value;

 // 메시지 값이 null 또는 빈 문자열인 경우 버튼을 비활성화하고 색깔을 회색으로 변경합니다.
 if (!messageValue || messageValue.trim() === "") {
     //sendButton.disabled = true;
     sendButton.style.color = "#ccc"; // 회색
 } else {
     // 메시지 값이 있는 경우 버튼을 활성화하고 파란색으로 변경합니다.
    //sendButton.disabled = false;
     sendButton.style.color = "#6398f2"; // 파란색
 }
});

//초기로딩 시 메시지 입력란이 비어있다면 버튼을 비활성화합니다.
if (!messageInput.value || messageInput.value.trim() === "") {
 sendButton.disabled = true;
 sendButton.style.color = "#ccc"; // 회색
} else {
 sendButton.disabled = false;
 
 sendButton.style.color = "#6398f2"; // 파란색
}



$.ajax({
   url : "ChatRoomTitle",
   type : "get",
   data : {"roomtitle" : chatroom},
   success : function(data){
      $(".name").html(data);
   },
   error : function(){ alert("error"); }   
});

//db에 저장된 이전 채팅 내용 가져오기
$.ajax({
    url: "ChatGet",
    type: "get",
    data: { "roomtitle": chatroom },
    success: async function (data) {
        // 데이터를 받아서 처리
        var chatMessages = $("#chat-messages");

        // 서버에서 받은 JSON 데이터를 순회하며 메시지를 화면에 추가
        for (var i = 0; i < data.length; i++) {
            var message = data[i];
            if (message.member_id == '<%=memberId%>') {
                var messageDiv = $("<div>").addClass("message my");
            } else {
                var messageDiv = $("<div>").addClass("message");
            }
            // member_id와 ch_content를 메시지에 추가
            var memberId = message.member_id;
            
            // 닉네임을 가져오는 AJAX 요청을 비동기로 실행하고 결과를 기다림
            var nName = await getNickname(memberId);

            var chContent = message.ch_content;
            messageDiv.text(nName + ": " + chContent);

            // 메시지를 화면에 추가
            chatMessages.append(messageDiv);
        }
    },
    error: function (jqXHR, textStatus, errorThrown) {
        console.error("AJAX 오류 발생: " + textStatus, errorThrown);
    }
});

// 사용자의 닉네임을 가져오는 함수
async function getNickname(memberId) {
    return new Promise(function (resolve, reject) {
        $.ajax({
            url: "NickName",
            type: "get",
            data: { "MemberId": memberId },
            success: function (data) {
                resolve(data);
            },
            error: function () {
                reject("error");
            }
        });
    });
}



$.ajax({
    url: "ChatParti",
    type: "get",
    data: { "roomtitle": chatroom },
    dataType: "json",
    success: async function (data) {
        var html = "";
        for (var i = 0; i < data.length; i++) {
            var memberId = data[i];	
            try {
                var nName = await getNickname(memberId);
                console.log(nName + " chat.jsp");
                html += "「 " + nName + "」  "; // 닉네임 사용
            } catch (error) {
                console.error("닉네임 가져오기 오류:", error);
            }
        }
        $(".seen").html(html);
    },
    error: function () {
        alert("오류 발생");
    }
});


$.ajax({
    url: "JoinChat",
    type: "post",
    data: { "roomtitle": chatroom, "id": "<%= memberId %>" },
    success: function (response) {
        // 성공 시 수행할 작업
        console.log("Success:", response);
    },
    error: function (xhr, status, error) {
        // 실패 시 수행할 작
    }
});

//방 삭제하기(박기원)
document.getElementById('delete-option').addEventListener('click', function() {
	console.log("chatting_Room_num:", chatroom);
    $.ajax({
        url: "LeaveChatRoom",
        type: 'get',
        data: {
        	chatting_Room_num: chatroom
        },
        success: function(response) {

        	window.location = "goChattingList";
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error('Request failed: ' + textStatus + ', ' + errorThrown);
        }
    });
});



console.log(chatroom)
const socket = new WebSocket('ws://localhost:8082/aa/chat/'+chatroom);
let senderName = ""; // 초기값은 빈 문자열로 설정합니다.

// 이름 입력란의 값이 변경될 때마다 발신자 이름을 업데이트합니다.
document.getElementById("name-input").addEventListener("input", (event) => {
    senderName = event.target.value;
});

// 연결이 열렸을 때 실행할 코드
socket.onopen = (event) => {
    console.log("채팅 소켓이 열렸습니다.");
};

socket.onmessage = (event) => {
    // 서버로부터 메시지를 받았을 때 실행할 코드
    const chatDiv = document.getElementById("chat-messages");
    const data = JSON.parse(event.data);
    console.log(data);
    // 메시지 출력
    const messageElement = document.createElement('div');
    if (data.senderName === "<%=memberId%>") {
        messageElement.classList.add("message","my");
    } else {
        messageElement.classList.add("message","other");
    }
    messageElement.innerHTML = "<strong>"+data.n_Name+":</strong>"+data.message;

    chatDiv.appendChild(messageElement);
    chatDiv.scrollTop = chatDiv.scrollHeight;
};

// 연결이 닫혔을 때 실행할 코드
socket.onclose = (event) => {
    console.log("채팅 소켓이 닫혔습니다. (코드: " + event.code + ")");
};

// sendMessage 함수 정의
function sendMessage() {
    const message = document.getElementById("message").value;
    const data = JSON.stringify({
        senderName: "<%=memberId%>",
        message: message,
        n_Name:"<%=nName%>"
        
    });
    socket.send(data);
    document.getElementById("message").value = "";
}



//메시지 입력란에서 Enter 키를 눌렀을 때
messageInput.addEventListener("keyup", function(event) {
    if (event.key === "Enter") {
        event.preventDefault(); // Enter 키 기본 동작(새 줄 추가)을 막습니다.
        if (messageInput.value && messageInput.value.trim() !== "") {
            sendMessage(); // 메시지 값이 있는 경우에만 sendMessage 함수를 호출하여 메시지 전송
        }
    }
});







//sendButton.addEventListener("click", sendMessage);
//버튼 클릭 시 sendMessage 함수 호출
// 버튼 클릭 시 sendMessage 함수 호출


//document.getElementById("send-button").addEventListener("click", sendMessage);
</script>
<script src="https://kit.fontawesome.com/9db75878c5.js" crossorigin="anonymous"></script>
</body>
</html>