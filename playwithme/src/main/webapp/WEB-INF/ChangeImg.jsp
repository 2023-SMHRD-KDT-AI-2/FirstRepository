<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body{
            background-color: rgb( 160, 225, 243);
        }
        #profileimg{
            display: flex;
            align-items: center;
            justify-content: center; 
        }
        #img{
            flex: none;
            width: 60%;
            height: 60%;
            border-radius: 50%;
            margin-top: 20%;
        }
        #changeImg{
            width: 200px;
            height: 50px;
        }
    </style>
</head>
<body>
    <form action="">
        <div>
        
            <button>확인</button>
        
        </div>
        <div id="profileimg">
        
            <img src="/이미지/spongbob.jpg" alt="" id ="img">    
        </div>
    </form>
    <div>
        <button id = changeImg>프로필사진 변경하기</button>
    </div>
</body>
</html>