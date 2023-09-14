<%@page import="java.util.ArrayList"%>
<%@page import="playwithme.model.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style >
body {
background-color: #fafafa;

}
  #back {
		border : 0px;
		background-color :#fafafa;
		margin-top : 15px;
		margin-left : 10px;
		
		}
.first {
            cursor: pointer;
            background-color: #67b7ee;
    		border: #67b7ee;
            border-radius: 4px;
            color: #fff;
            font-size: 20px;
            width: 32%;
            height: 35px;
        }
       	form {
       	display: block;
       	margin-top: 20%;
       	
       	}
       	#content {
       	margin-top: 5%;
       	margin-left: 5%;
       	}
       	#postContent {
       	
       	width: 90%;
       	height: 200px;
       	
       	}
       	#btn {
       	display: flex;
       	justify-content: right;
       	margin-top: 5%;
       	
       	}
       	#sub{
       	margin-top: 5%;
       	margin-left: 5%;
       	}
       	#main{
       	margin-top: 5%;
       	margin-left: 5%;
       	}
</style>
</head>
<body>
<button class="material-symbols-outlined" id ="back" style="color:gray;">
arrow_back_ios
</button>
<% BoardDTO board=(BoardDTO)request.getAttribute("board"); %>

<form action="FixBoardProgram" method="post">
	<input type="hidden" name="board_Num" value="<%=board.getBoard_Num()%>">
    <div id ="main">
    <label for="postTitle">제목:</label>
    <input type="text" id="postTitle" name="title" value="<%=board.getTitle()%>"><br>
    
    </div>
    <div id = "content">
    <label for="postTitle">내용:</label>
    <textarea id="postContent" name="b_Content" rows="4" cols="50"><%=board.getB_Content()%></textarea><br>
    </div>
    <div id = "sub"f>
    <label for="postTitle">인원수:</label>
   <select id="numParticipants" name="numPeople"><br>
   		<%for(int i = 1 ; i < 15; i++){
   			%>
        <option value="<%=i %>"><%=i %>명</option>
   		<% }%>
    </select>
    <label for="postTitle">시간:</label>
    <input type="time" id="postTitle" name="meet_Time" >
    </div>
    <!-- 나머지 수정할 항목들도 유사하게 추가 -->
    <div id= "btn">
    <button type="submit" class = "first">수정 완료</button>
    </div>
</form>
<script src="js/jquery-3.7.1.js"></script>
<script>

	$('#back').click(function () {
	location.href = 'goMyBoard';
	})
	 $('.first').hover(
		    function() {
		        $(this).css('backgroundColor', '#40a9f2');
		    },
		    function() {
		        $(this).css('backgroundColor', ''); // 마우스 아웃 시 배경색 초기화
		    }
			);
</script>
</body>
</html>