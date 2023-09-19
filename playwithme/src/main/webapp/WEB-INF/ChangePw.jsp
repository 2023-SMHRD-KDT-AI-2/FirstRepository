<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="./styles.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <title></title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');
		#clock {
		margin-left: 36px;
		margin-bottom: 35px;
		display: inline-block; /* 시계를 인라인 블록 요소로 설정 */
		vertical-align: middle; /* 세로 정렬을 가운데로 설정 */
		margin-right: 3px;
		font-weight: BOLD;
		font-size: 15px;
		}
		#fix{
		    position: fixed;
		    top: 6px;
		    left: -18px;
		    height: 20px;
		    z-index: 1000;
		    
		}
		
		#internet{
			height: 19px;
			margin-left: 197px;
			margin-bottom: 12px;
		}
		#lte{
			height: 11px;
			margin-bottom: 16px;
		}
		#battery{
			height: 21px;
			margin-bottom: 11px;
		}
        :root {
            --success-color: #2ecc71;
            --error-color: #e74c3c;
        }

        * {
            box-sizing: border-box;
        }

        body {
            background-color: #f9fafb;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            background: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
            width: 360px;
    		height: 740px;
        }

        #div {
            padding-bottom: 40px;
        }

        h2 {
            text-align: center;
            margin: 0 0 40px;
        }

        .form {
            padding: 30px 40px;
            margin-top: 90px;
            
        }

        .form-control {
            margin-bottom: 10px;
            padding-bottom: 20px;
            position: relative;
        }

        .form-control label {
            color: #777;
            display: block;
        }

        .form-control input {
            border: 2px solid #f0f0f0;
            border-radius: 4px;
            display: block;
            width: 100%;
            padding: 10px;
            font-size: 14px;
        }

        .form-control input:focus {
            outline: 0;
            border-color: #777;
        }

        .form-control.success input {
            border-color: var(--success-color);
        }

        .form-control.error input {
            border-color: var(--error-color);
        }

        .form-control small {
            color: var(--error-color);
            position: absolute;
            bottom: 0;
            left: 0;
            visibility: hidden;
        }

        .form-control.error small {
            visibility: visible;
        }

        .form button {
            cursor: pointer;
            background-color: #67b7ee;
    		border: #67b7ee;
            border-radius: 4px;
            color: #fff;
            display: block;
            font-size: 16px;
            padding: 10px;
            margin-top: 20px;
            width: 100%;
        }

        a {
            text-decoration-line: none;
        }
        #change{
        display: none
        }
        
	 #back {
	 	cursor: pointer;
	 	position: fixed;
	    color: gray;
	    border: 0px;
	    background-color: white;
	    margin-top: 39px;
	    margin-left: 10px;
		}

    </style>

</head>


<body>
      
  <div id=fix>
     

		<span id="clock"></span>
		<img src="images/인터넷.png" id="internet">
		<img src="images/LTE.png" id="lte">
		<img src="images/배터리.png" id="battery">
		
		
	</div>
    <div class="container">

<button class="material-symbols-outlined" id ="back" >
arrow_back_ios
</button>
        <form action="ChangePwProgram" id="form" class="form" onsubmit="return check()">

            <div id="logimg">
                <img src="">
                <h2>Play With Me</h2>
            </div>


            <div class="form-control">
                <input type="password" id="pw" name="pw" placeholder="이전 비밀번호">
                <small>Error message</small>
            </div>

            <div class="form-control">
                <input type="password" id="pw2" name="pw2" placeholder="변경 비밀번호">
                <small>Error message</small>
            </div>
            <div class="form-control">
                <input type="password" id="pw3" name="pw3" placeholder="비밀번호 확인">
                <small>Error message</small>
            </div>
			
			
            <button type="submit" id='button1'>비밀번호 변경 <br>
            <button type='button' id='button2'>취소</button> 
			
        </form>
    </div>
    <script src="js/jquery-3.7.1.js"></script>
    <script>
///////////////////////////////////////////////////////////////////////////////
	// 시계
	function updateClock() {
		const currentDate = new Date();
		const hours = currentDate.getHours();
		const minutes = currentDate.getMinutes();
		
		const hours12 = hours % 12 || 12;
		
		const hoursStr = String(hours12).padStart(2, '0'); 
	    const minutesStr = String(minutes).padStart(2, '0'); 

	    const clockElement = document.getElementById("clock");
	    clockElement.textContent = `${hoursStr}:${minutesStr}`;
	}

	// 1초마다 시간을 업데이트
	setInterval(updateClock, 1000);

	// 초기 로딩 시에도 시간 표시
	updateClock();

	//////////////////////////////////////////////////////////////////////////////// 
    $('#button1').click(function check(){
    	if($('#pw').val() === $('#pw3').val()){
    		alert("기존 비밀번호와 같습니다.")
    		return false;
    	}else{
    		if($('#pw2').val() === $('#pw3').val() && $('#pw').val() === `${info.get(0).getPw()}`){
        		return true
        	}else{
    	    	alert('비밀번호가 일치하지 않습니다.')
    	    	window.location.reload()
    	    	$('#pw2').value=''
    	    	$('#pw3').value=''
    	    	return false
    	    	}
    	}
    })
        
    	
    $('#button1').hover(
    function() {
        $(this).css('backgroundColor', '#40a9f2');
    },
    function() {
        $(this).css('backgroundColor', ''); // 마우스 아웃 시 배경색 초기화
    }
	);
    $('#button2').hover(
    function() {
        $(this).css('backgroundColor', '#40a9f2');
    },
    function() {
        $(this).css('backgroundColor', ''); // 마우스 아웃 시 배경색 초기화
    }
	);
    $('#button2').click(function(){
    	window.history.back()
    })
    $('#back').click(function () {
		location.href = 'goProfile';
	})
    </script>
</body>

</html>