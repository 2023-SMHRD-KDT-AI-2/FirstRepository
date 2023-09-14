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
    console.log("ä�� ������ ���Ƚ��ϴ�.");
};

socket.onmessage = (event) => {
    // �����κ��� �޽����� �޾��� �� ������ �ڵ�
    // �޽����� WebSocket�� ���� ������ ������ �ڵ�
    const chatDiv = document.getElementById("chat-messages");
    const message = event.data;
    
    // ���ϴ� ������ ������ 'info' ������ ����
    // ���� ���, ���� ����� �̸��� ǥ���Ϸ��� ���:
    const senderName = "������̸�";  // '������̸�'�� ���� ���� ����� �̸����� ��ü
    
    chatDiv.innerHTML += `<div class="message"><strong>${senderName}:</strong> ${message}</div>`;

    chatDiv.scrollTop = chatDiv.scrollHeight;
};

// ������ ������ �� ������ �ڵ�
socket.onclose = (event) => {
    console.log("ä�� ������ �������ϴ�.");
};

// �޽����� WebSocket�� ���� ������ ������ �ڵ�
function sendMessage() {
    const message = document.getElementById("message").value;
    socket.send(message);
    document.getElementById("message").value = "";
}









/*
//const socket = new WebSocket("ws://59.3.58.102:8080/playwithme/chat");

const socket = new WebSocket("ws://59.3.58.102:8080/playwithme/chat");

    socket.onopen = (event) => {
        console.log("ä�� ������ ���Ƚ��ϴ�.");
    };

socket.onmessage = (event) => {
    // �����κ��� �޽����� �޾��� �� ������ �ڵ�
    // �޽����� WebSocket�� ���� ������ ������ �ڵ�
    const chatDiv = document.getElementById("chat-messages");
    const message = event.data;
    chatDiv.innerHTML += `<div class="message"><strong>${info.get(0).getMember_Id()}:</strong> ${message}</div>`;

   

    chatDiv.scrollTop = chatDiv.scrollHeight;
};

// ������ ������ �� ������ �ڵ�
socket.onclose = (event) => {
    console.log("ä�� ������ �������ϴ�.");
};

// �޽����� WebSocket�� ���� ������ ������ �ڵ�
function sendMessage() {
    const message = document.getElementById("message").value;
    socket.send(message);
    document.getElementById("message").value = "";
}
*/
</script>

	
	
        
        
    
</body>
</html>
