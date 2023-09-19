/**
 * 
 */
document.addEventListener("DOMContentLoaded", function () {
	        // id가져오기
	       	let chatSpan = document.getElementById("chatLink");
	
	        // 클릭 리스너 이벤트
	        chatSpan.addEventListener("click", function () {
	            //  goChattingList.jsp이동
	        	window.location = "goChattingList";
	        });
	    });

	    
		document.addEventListener("DOMContentLoaded", function () {
	        // id가져오기
	       	let chatSpan = document.getElementById("boardLink");
	
	        // 클릭 리스너 이벤트
	        chatSpan.addEventListener("click", function () {
	            //  goBoardList.jsp이동
	        	window.location = "goBoardList";
	        });
	    });


		//친구 목록 가기
		document.addEventListener("DOMContentLoaded", function () {
	        // id가져오기
	       	let chatSpan = document.getElementById("friendLink");
	
	        // 클릭 리스너 이벤트
	        chatSpan.addEventListener("click", function () {
	            //  goChattingList.jsp이동
	        	window.location = "goFriendList";
	        });
	    });
	    
	     let btn4= document.getElementById("A4");
        btn4.addEventListener("click",function(){
			window.location = "goProfile"
		})
	    let btn5=  document.getElementById("A5");
        btn5.addEventListener("click",function(){
			window.location = "goMain"
		})