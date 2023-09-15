
<%@page import="java.util.ArrayList"%>
<%@page import="javax.print.attribute.HashPrintRequestAttributeSet"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="playwithme.model.*" %>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <style>
    @import url("https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap");
      
       body{
       background: #fafafa;
       
       
       }
        #profileimg {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column; /* To stack the image and button vertically */
        }
        
        #img {
            flex: none;
            width: 200px;
            height: 200px;
            border-radius: 50%;
            margin-top: 30%;
            cursor: pointer; /* Add a pointer cursor to indicate it's clickable */
        }
        
        #changeImg {
            display: none; /* Hide the file input visually */
        }
        
       #changeImgLabel {
            cursor: pointer; /* Add a pointer cursor to the label */
        }
        
        #submitButton {
        	margin-top: 60%;
        	margin-left : 20%;
        	
            width: 200px;
            height: 50px;
            cursor: pointer; /* Add a pointer cursor to the submit button */
            border-radius: 4px;
            color: gray;
            background-color: white;
            border: 3px solid #gray;
            cursor: pointer;
            display: block;
            font-size: 14px;
            padding: 10px;
            text-align : center;
            font-family: "paybooc-Light", sans-serif;
            text-decoration: none;
         	transition: 0.25s;
        }
         #submitButton:hover{
           background-color: gray;
          color: white;
          letter-spacing: 2px;
          cursor: pointer;
        }
        #submitButton:active {
        }
        #backbtn {
        border: 0px;
        color : #fafafa ;
        background-color : #fafafa;
        }
        #backbtn > img {
        	width : 50px;
        }
        
		.material-symbols-outlined {
  			font-variation-settings:
 		 'FILL' 0,
		  'wght' 400,
 		 'GRAD' 0,
		'opsz' 24
		}
		button {
		cursor :pointer;
		border : 0px;
		background-color :#fafafa;
		margin-top : 10px;
		margin-left : 5px;
		
		}
		#clock {
		margin-left: 10px;
		margin-bottom: 16px;
		display: inline-block; /* 시계를 인라인 블록 요소로 설정 */
		vertical-align: middle; /* 세로 정렬을 가운데로 설정 */
		margin-right: 3px;
		font-weight: BOLD;
		font-size: 15px;
		}
		#fix{
		    position: relative;
		    top: -3px;
		    left: 6px;
		    height: 20px;
		    
		}
		#internet{
			height: 19px;
			margin-left: 192px;
		}
		#lte{
			height: 11px;
			margin-bottom: 4px;
		}
		#battery{
			height: 21px;
			margin-bottom: -1px;
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
	<button class="material-symbols-outlined" id ="back" style="color:gray;">
	arrow_back_ios
	</button>

         <form action="ChangeImg" method="post" enctype="multipart/form-data">
        <div id="profileimg">
            <label for="changeImg" id="changeImgLabel"> <!-- Label to trigger file input -->
                <img src="file/${info.get(0).getM_Profile()}" onerror="this.src='images/default.jpg'" id="img">
            </label>
            <input type="file" id="changeImg" name="filename"> <!-- Hidden file input -->
        </div>
        <div id="submitButtonContainer">
            <input type="submit" id="submitButton" value="변경하기"> <!-- Submit button -->
        </div>
    </form>
    <script src="js/jquery-3.7.1.js"></script>
    <script src="assets/js/clock.js"></script>
    <script>

        // JavaScript to trigger the file input when the image is clicked
        document.getElementById('changeImgLabel').addEventListener('click', function() {
            if (!fileInputClicked) {
                document.getElementById('changeImg').click();
                fileInputClicked = true;
            }
        });
        document.getElementById('changeImg').addEventListener('change', function() {
            fileInputClicked = false;
        });
        
        $('#back').click(function () {
			location.href = 'goProfile';
		})
    </script>
</body>
</html>