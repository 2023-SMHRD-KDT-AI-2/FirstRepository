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
	<title>내게시글 수정</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<link rel="stylesheet" href="assets/css/FixBoard.css">
	<link rel="stylesheet" href="assets/css/jquery.datetimepicker.min.css" />
   <script src="js/jquery-3.7.1.js"></script>
   <script src="assets/js/jquery.datetimepicker.full.min.js"></script>
   <style >
   #meetingTime{
   width: 108px;
   
   }
   </style>
</head>
<body>
	<!-- 뒤로가기 버튼 -->
	<button class="material-symbols-outlined" id="back"
		style="color: gray;">arrow_back_ios</button>
	<!-- 수정할 보드 정보 불러오기 -->
	<%
	BoardDTO board = (BoardDTO) request.getAttribute("board");
	String meetTime = board.getMeet_Time();
	String formattedMeetTime = meetTime.substring(0, 2) + ":" + meetTime.substring(2);
	%>

	<form action="FixBoardProgram" method="post">
		<input type="hidden" name="board_Num"
			value="<%=board.getBoard_Num()%>">
		<div id="main">
			<label for="postTitle">제목:</label> 
			<input type="text" id="postTitle"
				name="title" value="<%=board.getTitle()%>"><br>

		</div>
		<div id="content">
			<label for="postTitle">내용:</label><br>
			<textarea id="postContent" name="b_Content" rows="4" cols="50"><%=board.getB_Content()%></textarea>
			<br>
		</div>
		<div id="sub" f>
			<label for="postTitle">인원수:</label> 
			<select id="numParticipants"
				name="numPeople">
				<%for (int i = 1; i < 15; i++) {%>
				<option value="<%=i%>"
					<%=board.getNum_People() == i ? "selected" : ""%>><%=i%>명
				</option>
				<%}%>
			</select> 
			<label for="postTitle">모임시간:</label> 
			<input
            type="text" id="meetingTime" name="meetTime" placeholder ="날짜 입력...">
            <script >
            $('#meetingTime').datetimepicker({
               ownerDocument: document,
                 contentWindow: window,
                 value:'',
                 rtl:false,
                 format:'Y/m/d H:i',
                 formatTime:'H:i',
                 formatDate:'Y/m/d',
                 // new Date(), '1986/12/08', '-1970/01/05','-1970/01/05',
                 startDate: false,
                 step: 5,
                 monthChangeSpinner:true,
                 closeOnDateSelect:false,
                 closeOnTimeSelect:true,
                 closeOnWithoutClick:true,
                 closeOnInputClick:true,
                 openOnFocus:true,
                 timepicker:true,
                 datepicker:true,
                 weeks:false,
                 // use formatTime format (ex. '10:00' for formatTime: 'H:i')
                 defaultTime:false,
                 // use formatDate format (ex new Date() or '1986/12/08' or '-1970/01/05' or '-1970/01/05')
                 defaultDate:false,
                 minDate:0,
                 maxDate:false,
                 minTime:'now',
                 maxTime:false,
                 minDateTime:false,
                 maxDateTime:false,
                 allowTimes: [],
                 opened:false,
                 initTime:true,
                 inline:false,
                 theme:'',
                 touchMovedThreshold: 5,
                 onSelectDate:function () {},
                 onSelectTime:function () {},
                 onChangeMonth:function () {},
                 onGetWeekOfYear:function () {},
                 onChangeYear:function () {},
                 onChangeDateTime:function () {},
                 onShow:function () {},
                 onClose:function () {},
                 onGenerate:function () {},
                 withoutCopyright:true,
                 inverseButton:false,
                 hours12:false,
                 next:'xdsoft_next',
                 prev :'xdsoft_prev',
                 dayOfWeekStart: 0,
                 parentID:'body',
                 timeHeightInTimePicker: 25,
                 todayButton:true,
                 prevButton:true,
                 nextButton:true,
                 defaultSelect:true,
                 scrollMonth:true,
                 scrollTime:true,
                 scrollInput:true,
                 lazyInit:false,
                 mask:false,
                 validateOnBlur:true,
                 allowBlank:true,
                 yearStart: 1950,
                 yearEnd: 2050,
                 monthStart: 0,
                 monthEnd: 11,
                 id:'',
                 fixed:false,
                 roundTime:'round',// ceil, floor
                 className:'',
                 weekends: [],
                 highlightedDates: [],
                 highlightedPeriods: [],
                 allowDates : [],
                 allowDateRe :null,
                 disabledDates : [],
                 disabledWeekDays: [],
                 yearOffset: 0,
                 beforeShowDay:null,
                 enterLikeTab:true,
                 showApplyButton:false,
                 insideParent:false,

            });
            </script>
		</div>
		<!-- 나머지 수정할 항목들도 유사하게 추가 -->
		<div id="btn">
			<button type="submit" class="first">수정</button>
		</div>
	</form>
	<script src="js/jquery-3.7.1.js"></script>
	<script>
	
		$('#back').click(function() {
			location.href = 'goMyBoard';
		})
		$('.first').hover(function() {
			$(this).css('backgroundColor', '#40a9f2');
		}, function() {
			$(this).css('backgroundColor', ''); // 마우스 아웃 시 배경색 초기화
		})
	</script>
</body>
</html>