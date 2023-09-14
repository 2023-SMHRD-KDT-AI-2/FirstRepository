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
ArrayList<ChattingListDTO> chatList = new ArrayList<>();
chatList = Chatdao.chatlist(memberId);
ChattingListDTO chatinfo1=(ChattingListDTO)session.getAttribute("chatinfo");
%>
<div class="chat">
    <div class="contact bar">
        <div class="name">                
        </div>
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

$.ajax({
   url : "ChatRoomTitle",
   type : "get",
   data : {"roomtitle" : chatroom},
   success : function(data){
      $(".name").html(data);
   },
   error : function(){ alert("error"); }   
});

$.ajax({
    url : "ChatGet",
    type : "get",
    data : {"roomtitle" : chatroom},
    success : function(data){
        // 데이터를 받아서 처리
        var chatMessages = $("#chat-messages");

        // 서버에서 받은 JSON 데이터를 순회하며 메시지를 화면에 추가
        for (var i = 0; i < data.length; i++) {
             var message = data[i];
             if(message.member_id == '<%=memberId%>'){
                 var messageDiv = $("<div>").addClass("message my");
             } else {
                 var messageDiv = $("<div>").addClass("message");
             }
             // member_id와 ch_content를 메시지에 추가
             var memberId = message.member_id;
             var chContent = message.ch_content;
             messageDiv.text(memberId + ": " + chContent);

            // 메시지를 화면에 추가
            chatMessages.append(messageDiv);
        }
    },
    error: function(jqXHR, textStatus, errorThrown) {
        console.error("AJAX 오류 발생: " + textStatus, errorThrown);
    }
});

console.log(chatroom)
const socket = new WebSocket('ws://localhost:8090/aa/chat/'+chatroom);
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
    messageElement.innerHTML = "<strong>"+data.senderName+":</strong>"+data.message;

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
        message: message
    });
    socket.send(data);
    document.getElementById("message").value = "";
}

// 버튼 클릭 시 sendMessage 함수 호출
document.getElementById("send-button").addEventListener("click", sendMessage);
</script>
<script src="https://kit.fontawesome.com/9db75878c5.js" crossorigin="anonymous"></script>
</body>
</html>
