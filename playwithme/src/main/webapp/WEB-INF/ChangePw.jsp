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
    <title></title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');

        :root {
            --success-color: #2ecc71;
            --error-color: #e74c3c;
        }

        * {
            box-sizing: border-box;
        }

        body {
            background-color: #f9fafb;
            font-family: 'Open Sans', sans-serif;
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
    </style>

</head>


<body>
    <div class="container">

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
    </script>
</body>

</html>