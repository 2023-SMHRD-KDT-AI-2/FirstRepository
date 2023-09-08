<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="playwithme.model.*"%>
<%@page import="playwithme.controller.*"%>
<!DOCTYPE html>
<html>
<head>
<title>WebSocket Chat</title>
<style>
body {
	font-family: Arial, sans-serif;
}

#chat-container {
	width: 300px;
	margin: 0 auto;
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 10px;
	box-shadow: 0px 0px 10px #ccc;
}

#chat-messages {
	max-height: 300px;
	overflow-y: auto;
	padding: 10px;
	border: 1px solid #eee;
	border-radius: 5px;
	background-color: #f7f7f7;
}

.message {
	background-color: #0084FF;
	color: #fff;
	padding: 5px 10px;
	margin-bottom: 5px;
	border-radius: 5px;
}

.message.sent {
	background-color: #4CAF50;
	text-align: right;
}

#message {
	width: 100%;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

#send-button {
	display: block;
	margin-top: 5px;
	background-color: #0084FF;
	color: #fff;
	border: none;
	border-radius: 3px;
	padding: 5px 10px;
	cursor: pointer;
}

#name-input {
	width: 100%;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 3px;
}
</style>
</head>
<body>
	<div id="chat-container">
		<div id="chat-messages"></div>
		<input type="text" id="message" placeholder="Type a message">
		<button onclick="sendMessage()">Send</button>

	</div>


<script>
const socket = new WebSocket("ws://59.3.58.102:8080/playwithme/chat");

socket.onopen = (event) => {
    console.log("채팅 소켓이 열렸습니다.");
};

socket.onmessage = (event) => {
    // 서버로부터 메시지를 받았을 때 실행할 코드
    // 메시지를 WebSocket을 통해 서버로 보내는 코드
    const chatDiv = document.getElementById("chat-messages");
    const message = event.data;
    
    // 원하는 정보를 포함한 'info' 변수를 정의
    // 예를 들어, 보낸 사람의 이름을 표시하려는 경우:
    const senderName = "당신의이름";  // '당신의이름'을 실제 보낸 사람의 이름으로 대체
    
    chatDiv.innerHTML += `<div class="message"><strong>${senderName}:</strong> ${message}</div>`;

    chatDiv.scrollTop = chatDiv.scrollHeight;
};

// 연결이 닫혔을 때 실행할 코드
socket.onclose = (event) => {
    console.log("채팅 소켓이 닫혔습니다.");
};

// 메시지를 WebSocket을 통해 서버로 보내는 코드
function sendMessage() {
    const message = document.getElementById("message").value;
    socket.send(message);
    document.getElementById("message").value = "";
}









/*
//const socket = new WebSocket("ws://59.3.58.102:8080/playwithme/chat");

const socket = new WebSocket("ws://59.3.58.102:8080/playwithme/chat");

    socket.onopen = (event) => {
        console.log("채팅 소켓이 열렸습니다.");
    };

socket.onmessage = (event) => {
    // 서버로부터 메시지를 받았을 때 실행할 코드
    // 메시지를 WebSocket을 통해 서버로 보내는 코드
    const chatDiv = document.getElementById("chat-messages");
    const message = event.data;
    chatDiv.innerHTML += `<div class="message"><strong>${info.get(0).getMember_Id()}:</strong> ${message}</div>`;

   

    chatDiv.scrollTop = chatDiv.scrollHeight;
};

// 연결이 닫혔을 때 실행할 코드
socket.onclose = (event) => {
    console.log("채팅 소켓이 닫혔습니다.");
};

// 메시지를 WebSocket을 통해 서버로 보내는 코드
function sendMessage() {
    const message = document.getElementById("message").value;
    socket.send(message);
    document.getElementById("message").value = "";
}
*/
</script>

	
	
        
        
    
</body>
</html>
