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
        .check{
            width: 50%;
        }
        table{
            display: flex;
            justify-content: center;
            align-items: center;
            border-collapse: separate;
            border-spacing: 5px 60px;
           
        }
        td{
            
            font-size: small;
        }
        
        input.check{
            display: none;
        }

        .bold {
            background-color: rgb( 160, 195, 223);
            border-radius: 10px;
        }
    </style>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    
</head>
<body>
    
    <form action="">
        
        <table>
            <tr>
                <td>     
                    <span>
                    <label for="chk">
                        <i class="fa fa-cutlery fa-3x traval1" aria-hidden="true">🛫</i>
                    </label><br>
                    <input type="checkbox" id="chk" class="traval check" name="favorite" value="아웃도어/여행" >
                    <br>아웃도어/여행</td>
                    </span>
                <td>
                    <label for="chk1">
                        <i class="fa fa-cutlery fa-3x sports1" aria-hidden="true">🚴‍♀️</i>
                    </label><br>
                    <input type="checkbox" id="chk1" class="sports check" name="favorite" value="운동/스포츠"><br>운동/스포츠</td>
                <td>
                    <label for="chk2">
                        <i class="fa fa-cutlery fa-3x book1" aria-hidden="true">📚</i>
                    </label><br>
                    <input type="checkbox"  id="chk2" class="book check" name="favorite" value="인문학/책/글"><br>인문학/책/글</td>
            </tr>
            <tr>
                <td>
                    <label for="chk3">
                        <i class="fa fa-cutlery fa-3x culture1" aria-hidden="true">🎊</i>
                    </label><br>
                    <input type="checkbox" id="chk3" class="culture check" name="favorite" value="문화/공연/축제"><br>문화/공연/축제</td>
                <td>
                    <label for="chk4">
                        <i class="fa fa-cutlery fa-3x music1 " aria-hidden="true">🎧</i>
                    </label><br>
                    <input type="checkbox" id="chk4" class="music check" name="favorite" value="음악/악기"><br>음악음악/악기</td>
                <td>
                    <label for="chk5">
                        <i class="fa fa-cutlery fa-3x make1" aria-hidden="true">🛠</i>
                    </label><br>
                    <input type="checkbox" id="chk5" class="make check" name="favorite" value="공예/만들기"><br>공예/만들기</td>
            </tr>
            <tr>
                <td>
                    <label for="chk6">
                        <i class="fa fa-cutlery fa-3x cook1" aria-hidden="true">🍽</i>
                    </label><br>
                    <input type="checkbox" id="chk6" class="cook check" name="favorite" value="요리/제조"><br>요리/제조</td>
                <td>
                    <label for="chk7">
                        <i class="fa fa-cutlery fa-3x picture1" aria-hidden="true">📷</i>
                    </label><br>
                    <input type="checkbox" id="chk7" class="picture check" name="favorite" value="사진/영상"><br>사진/영상</td>
                <td>
                    <label for="chk8">
                        <i class="fa fa-cutlery  fa-3x car1" aria-hidden="true">🚗</i>
                    </label><br>
                    <input type="checkbox" id="chk8" class="car check" name="favorite" value="차/오토바이"><br>차/오토바이</td>
            </tr>
            <tr>
                <td>
                    <label for="chk9">
                        <i class="fa fa-cutlery fa-3x pet1" aria-hidden="true">🐈</i>
                    </label><br>
                    <input type="checkbox" id="chk9" class="pet check" name="favorite" value="반려동물"><br>반려동물</td>
                <td>
                    <label for="chk10">
                        <i class="fa fa-cutlery fa-3x look1" aria-hidden="true">⚾</i>
                    </label><br>
                    <input type="checkbox" id="chk10" class="look check" name="favorite" value="야구관람"><br>야구관람</td>
                <td>
                    <label for="chk11">
                        <i class="fa fa-cutlery fa-3x people1" aria-hidden="true">👨‍👩‍👦‍👦</i>
                    </label><br>
                    <input type="checkbox" id="chk11" class="people check" name="favorite" value="사교/인맥"><br>사교/인맥</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td><input type="submit"></td>
            </tr>
        </table>
        
    </form>
    <script src="js/jquery-3.7.1.js"></script>
    <script>
        $(document).ready(function(){
        $('.music').click(function(){
          if($('.music1').hasClass('bold')){
             $('.music1').removeClass('bold')
          }else {
            
            $('.music1').addClass('bold')       
          }
        });
      });
      $(document).ready(function(){
        $('.traval').click(function(){
          if($('.traval1').hasClass('bold')){
             $('.traval1').removeClass('bold')
          }else {
            
            $('.traval1').addClass('bold')       
          }
        });
      });
      $(document).ready(function(){
        $('.book').click(function(){
          if($('.book1').hasClass('bold')){
             $('.book1').removeClass('bold')
          }else {
            
            $('.book1').addClass('bold')       
          }
        });
      });
      $(document).ready(function(){
        $('.sports').click(function(){
          if($('.sports1').hasClass('bold')){
             $('.sports1').removeClass('bold')
          }else {
            
            $('.sports1').addClass('bold')       
          }
        });
      });
      $(document).ready(function(){
        $('.make').click(function(){
          if($('.make1').hasClass('bold')){
             $('.make1').removeClass('bold')
          }else {
            
            $('.make1').addClass('bold')       
          }
        });
      });
      $(document).ready(function(){
        $('.cook').click(function(){
          if($('.cook1').hasClass('bold')){
             $('.cook1').removeClass('bold')
          }else {
            
            $('.cook1').addClass('bold')       
          }
        });
      });
      $(document).ready(function(){
        $('.picture').click(function(){
          if($('.picture1').hasClass('bold')){
             $('.picture1').removeClass('bold')
          }else {
            
            $('.picture1').addClass('bold')       
          }
        });
      });
      $(document).ready(function(){
        $('.car').click(function(){
          if($('.car1').hasClass('bold')){
             $('.car1').removeClass('bold')
          }else {
            
            $('.car1').addClass('bold')       
          }
        });
      });
      $(document).ready(function(){
        $('.pet').click(function(){
          if($('.pet1').hasClass('bold')){
             $('.pet1').removeClass('bold')
          }else {
            
            $('.pet1').addClass('bold')       
          }
        });
      });
      $(document).ready(function(){
        $('.look').click(function(){
          if($('.look1').hasClass('bold')){
             $('.look1').removeClass('bold')
          }else {
            
            $('.look1').addClass('bold')       
          }
        });
      });
      $(document).ready(function(){
        $('.people').click(function(){
          if($('.people1').hasClass('bold')){
             $('.people1').removeClass('bold')
          }else {
            
            $('.people1').addClass('bold')       
          }
        });
      });
      $(document).ready(function(){
        $('.culture').click(function(){
          if($('.culture1').hasClass('bold')){
             $('.culture1').removeClass('bold')
          }else {
            
            $('.culture1').addClass('bold')       
          }
        });
      });

    </script>
    
   
</body>
</html>