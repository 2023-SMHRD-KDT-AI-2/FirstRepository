<!-- 
박기원

2023.09.18
친구 리스트 + 친구 추가 + 1:1 채팅 추가 + 버튼 누를때 마다 새로고침+ 삭제 버튼 파란색, 친구 채팅방 이름 및 친구 name 띄게
문제저 삭제 버튼 누를시 채팅방 같이 이동 z index써서 해결

 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- core 라이브러리 연결 -->

<%@page import="playwithme.model.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>CodePen - Daily UI #013 | Direct Messaging</title>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel='stylesheet'
   href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css'>
<link rel="stylesheet" href="assets/css/FriendList.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="assets/js/clock.js"></script>


<style>
#searchInput {
       position: relative;
    height: 31px;
    margin: 0;
    border-radius: 33px;
    border: 1px solid gray;
    margin-bottom: 0px;
    width: 220px;
    margin-top: 30px;
    margin-left: 19px;
    padding-left: 27PX;
}

#clearSearch {
    position: relative;
    cursor: pointer;
    color: #b50202;
    z-index: 1;
    left: -32px;
    top: 5px;
}

#search {
    width: 17px;
    z-index: 1;
    position: relative;
    bottom: -60px;
    left: -129px;
}

#clock {
   margin-left: 2px;
   margin-bottom: 10px;
   display: inline-block; /* 시계를 인라인 블록 요소로 설정 */
   vertical-align: middle; /* 세로 정렬을 가운데로 설정 */
   margin-right: 3px;
   font-weight: BOLD;
   font-size: 15px;
}

#fix {
    position: fixed;
    top: 7px;
    left: 15px;
    height: 20px;
}

#internet {
    height: 19px;
    margin-left: 210px;
    margin-bottom: 2px;
}


#lte {
   height: 11px;
   margin-bottom: 5px;
}

#battery {
   height: 21px;
}

h3 {
   padding-left: 7px;
   padding-top: 7px
}

#searchButton {
   height: 26px;
   margin-left: 16px;
   position: relative;
   top: 5px;
}
/*
#friendAddButton {
       height: 24px;
    margin-left: 13px;
    position: relative;
    top: 6px;
    width: 25px;
}
*/

#friendAddButton {
    height: 24px;
    margin-left: 3px;
    position: relative;
    top: 4px;
    width: 25px;
}


#back {
      cursor: pointer;
    border: 0px;
    background-color: #a4c4e000;
    margin-top: 47px;
    margin-left: 6px;
}

@media ( min-width : 1920px) {
   .center {
      max-width: 360px;
   }
}

#fix2 {
    position: fixed;
    top: 0px;
    width: 100%;
    bottom: 50px;
}

#title {
        position: relative;
    left: -8px;
    font-size: 24px;
    font-weight: bold;
    top: -3px;
}


/* 숨겨진 상태에서는 왼쪽으로 이동합니다. */
.deleteFriendButton {
        background-color: #3498db;
    color: #fff;
    border: none;
    border-radius: 5px;
    padding: 5px 10px;
    cursor: pointer;
    transition: transform 0.3s ease-in-out;
    transform: translateX(-100%);
    left: 191px;
    position: relative;
    bottom: 17px;
}
}

/* 나타난 상태에서는 이동하지 않습니다. */
.deleteFriendButton.active {
    transform: translateX(0);
}

/* 삭제 버튼에 클릭시 스타일 변경  */
.deleteFriendButton:hover {
   background-color: #87CEFA;
}

#contact2 {
   width: 300px;
}
#pro{
	 width: 32px;
    height: 32px;
    margin-right: 11px;
    position: fixed;
    right: 79px;
    border-radius: 50%;
    bottom: 26px;
    border: 1.8px solid black;
}
#menu {
 display: flex;
    position: absolute;
    top: 654px;
    left: -33px;
    right: 0px;
    width: 353px;
    height: 70px;
    background: #fff;
    overflow: hidden;
    z-index: 2;
        }


        #menu li {
			
           width: 129px;
    display: block;
    /* border-right: 1px solid #acacac; */
    padding: 6px 3%;
    font-size: 10px;
    text-align: center;
    cursor: pointer;
}
        }

        #menu li.on {
            background: #eee;
        }

        #menu li:hover {
            background: #eee;
            margin-left: -1px;
        }

        #menu li:last-child {
            margin-right: 0;
            border-right: 0;
        }

        #menu li span {
            display: block;
            margin: 0 auto 3px;
            width: 27px;
            height: 28px;
        }

        #menu li .menu_bg.new-icon1 {
            margin-top: 7px;
            background: url("images/친구2.png") no-repeat;
            background-size: contain;
                width: 24px;

        }

        #menu li .menu_bg.new-icon2 {
            margin-top: 7px;
            background: url("images/게시판5.png") no-repeat;
            background-size: contain;
                width: 24px;

        }

        #menu li .menu_bg.new-icon3 {
            margin-top: 7px;
            background: url("images/채팅.png") no-repeat;
            background-size: contain;
                width: 24px;

        }

        #menu li .menu_bg.new-icon4 {
            margin-top: 7px;
            background-size: contain;
                width: 1px;

        }
        #menu li .menu_bg.new-icon5 {
            margin-top: 7px;
            background: url("images/지도3.png") no-repeat;
            background-size: contain;
                width: 24px;

        }


</style>



<body class="center">

   <div id=fix>

      <span id="clock"></span> <img src="images/인터넷.png" id="internet">
      <img src="images/LTE.png" id="lte"> <img src="images/배터리.png"
         id="battery">


   </div>
	
   <%
   String id = (String) session.getAttribute("memberid");
   MemberDAO dao = new MemberDAO();
   ArrayList<MemberDTO> info = new ArrayList<>();
   info = dao.getmember(id);
   session.setAttribute("info", info);
   String memberId = info.get(0).getMember_Id();
   FriendListDAO friendDao = new FriendListDAO();
   ArrayList<String> friendList = friendDao.friendlist(memberId);

   ChattingListDAO Chatdao = new ChattingListDAO();
   ArrayList<ChattingListDTO> chatList = new ArrayList<>();
   chatList = Chatdao.chatlist(memberId);

   ArrayList<FriendListDTO> Allfriend = new ArrayList<>();
   FriendListDAO frdao = new FriendListDAO();
   Allfriend = frdao.friendlist();
   %>
   
      <div id="fix2">
      <button class="material-symbols-outlined" id="back"
         style="color: gray;">arrow_back_ios</button>
      <span id="title">친구 목록</span> 
      
      <img src="images/검색.png" id="search"> 
      <input type="text" id="searchInput"
         placeholder="친구 ID입력" /><span id="clearSearch"
         class="material-symbols-outlined"> close </span> <img
         id="friendAddButton" src="images/friendadd.png" alt="친구 추가" />
   </div>
   
   

   <div class="contacts">

      <%
      if (friendList != null && !friendList.isEmpty()) {
         for (int i = 0; i < friendList.size(); i++) {
      %>


      <div class=contact
         onclick="window.location.href='goChat?room=<%=Allfriend.get(i).getFriendchat_room_num()%>'">
         <div class="pic">
            <%
            String friendId = friendList.get(i);
            ArrayList<MemberDTO> info_friend = dao.getmember(friendId);
            if (!info_friend.isEmpty()) {
               String profileImage = info_friend.get(0).getM_Profile();
            %>
            <img class="pic" src="file/<%=profileImage%>"
               onerror="this.src='images/default.jpg'">
            <%
            } else {
            %>
            <img class="pic" src="images/default.jpg">
            <%
            }
            %>
         </div>
         <div class="name">
            <%=Chatdao.nName(friendId)%>

         </div>
         <div class="message">
            <button class="deleteFriendButton" data-friend="<%=friendId%>">삭제</button>
         </div>
      </div>
      <%
      }
      } else {
      %>
      <p>친구가 없습니다.</p>
      <%
      }
      %>
	
   </div>
	<div>
	<ul id="menu">
			<li id="A1" data-order="0"><span id="friendLink"
				class="menu_bg new-icon1"></span> 친구</li>
			<li id="A2" data-order="1"><span id="boardLink"
				class="menu_bg new-icon2"></span>게시판</li>
			<li id="A3" data-order="2"><span id="chatLink"
				class="menu_bg new-icon3"></span> 채팅</li>
			<li id="A4" data-order="3"><span class="menu_bg new-icon4"><img id="pro" src="images/<%=info.get(0).getM_Profile()%>" ></span>
				마이</li>
			<li id="A5" data-order="4"><span class="menu_bg new-icon5"></span>
				지도</li>
		</ul>
	</div>
	<script src="assets/js/menuFix.js"></script>
   <script>
   $(document).ready(function () {
	    $('.contact').on('click', function () {
	        // 클릭된 연락처에서 삭제 버튼을 나타나게 하기 위해 'active' 클래스를 추가합니다.
	        $(this).find('.deleteFriendButton').addClass('active');
	    });

	    $('.deleteFriendButton').on('click', function () {
	        event.stopPropagation();
	        let friendId = $(this).data('friend');
	        if (confirm('친구를 삭제하시겠습니까?')) {
	            $.ajax({
	                url: 'FriendDeleteProgram',
	                type: 'POST',
	                data: {
	                    friendId: friendId
	                },
	                success: function (response) {
	                    console.log('서버 응답:', response);
	                    location.reload(); // 페이지 새로 고침
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    console.error('Request failed: ' + textStatus + ', ' + errorThrown);
	                    alert('친구 등록 실패');
	                }
	            });
	        }
	    });

	    // 문서의 다른 부분을 클릭하면 삭제 버튼을 숨깁니다.
	    $(document).on('click', function () {
	        $('.deleteFriendButton').removeClass('active');
	    });
	});
   
   $('#back').click(function() {
        window.history.back(); // 뒤로 가기
   });
      // 검색어 입력란에 입력이 있을 때 실행
      $("#searchInput").on("input", function() {
         var query = $(this).val().toLowerCase();

         // 모든 연락처 숨기기
         $(".contact").hide();

         // 검색어와 일치하는 연락처만 보이기
         $(".contact").each(function() {
            var contactText = $(this).find(".name").text().toLowerCase();
            if (contactText.indexOf(query) !== -1) {
               $(this).show();
            }
         });
      });
      $("#clearSearch").click(function() {
         $("#searchInput").val("");
         $(".contact").show();
      });

      //친구추가(해결)
      $(document).ready(
         function() {$('#friendAddButton').on('click',function() {
               let friendName = $('#searchInput').val();
                  $.ajax({url : 'FriendAddProgram',
                     type : 'GET',
                                 data : {
                                    friend_name_test : friendName
                                    },
                                    success : function(response) {
                                       console.log('서버 응답:',response);
                                             window.location.href = 'goFriendList.java';
                                             location.reload(); // 페이지 새로 고침
                                             },
                                             error : function(
                                                   jqXHR,
                                                   textStatus,
                                                   errorThrown) {
                                                console
                                                      .error('Request failed: '
                                                            + textStatus
                                                            + ', '
                                                            + errorThrown);
                                                location.reload(); // 페이지 새로 고침
                                             }
                                          });
                                 });
                  });
   </script>

<script>
      //친구 삭제 버튼
      $(document).ready(
            function() {
               $('.deleteFriendButton').on(
                     'click',
                     function() {
                        event.stopPropagation();
                        let friendId = $(this).data('friend');
                        if (confirm('친구를 삭제하시겠습니까?')) {
                           $.ajax({
                              url : 'FriendDeleteProgram',
                              type : 'POST', // POST 방식으로 변경
                              data : {
                                 friendId : friendId
                              },
                              success : function(response) {
                                 console.log('서버 응답:', response);
                                 //window.location.href = 'goFriendList.java';
                                 location.reload(); // 페이지 새로 고침
                              },
                              error : function(jqXHR, textStatus,
                                    errorThrown) {
                                 console.error('Request failed: '
                                       + textStatus + ', '
                                       + errorThrown);
                                 alert('친구 등록 실패');
                              }
                           });
                        }
                     });
            });
   </script>





</body>

</html>