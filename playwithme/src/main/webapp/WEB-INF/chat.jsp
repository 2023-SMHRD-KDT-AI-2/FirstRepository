<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
</head>
<body>
	<div id="chat-container">
		<div id="chat-messages"></div>
		<input type="text" id="name-input" placeholder="이름 입력"> <input
			type="text" id="message" placeholder="메시지 입력">
		<button id="send-button" onclick="sendMessage()">전송</button>
	</div>

	<script>
        const urlParams = new URLSearchParams(window.location.search);
        const chatroom = urlParams.get('room');
        const socket = new WebSocket(`ws://220.80.33.64:8080/playwithme/chat/${chatroom}`);
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
            chatDiv.innerHTML += `<div class="message"><strong>${data.senderName}:</strong> ${data.message}</div>`;
            chatDiv.scrollTop = chatDiv.scrollHeight;
        };

        // 연결이 닫혔을 때 실행할 코드
        socket.onclose = (event) => {
            console.log("채팅 소켓이 닫혔습니다.");
        };

        // 메시지를 WebSocket을 통해 서버로 보내는 코드 / 및 이름 
function sendMessage() {
    const message = document.getElementById("message").value;
    const data = JSON.stringify({
        senderName: senderName,
        message: message
    });
    socket.send(data);
    document.getElementById("message").value = "";
}
    </script>
</body>
</html>
