/**
 * 
 */

   
   
        // JavaScript로 그래프를 업데이트하는 함수
        function updateGraph(percentage) {
            const graphBar = document.querySelector(".graph-bar");
            const graphLabel = document.querySelector(".graph-label");
            const arrow = document.querySelector(".arrow");
            
            // 그래프 바 업데이트
            graphBar.style.width = percentage + "%";
            
            // 그래프 라벨와 화살표의 너비와 위치를 그래프 바에 맞게 설정
            
            // 그래프 라벨 업데이트
            graphLabel.textContent =percentage +"℃";
        }
        
       
        
     // "매너온도" 문구 추가
        const mannerTemperature = document.createElement("span");
        mannerTemperature.className = "manner-temperature";
        mannerTemperature.textContent = "매너온도";
        document.querySelector(".graph-container").appendChild(mannerTemperature);
        
        $('#back').click(function () {
			location.href = 'goMain'; // 뒤로 가기
		})
		function updateMargin() {
	    const nameElement = document.getElementById("name");
	    const idElement = document.getElementById("myid");
	    
	    // name 요소의 폭을 가져오기
	    const nameWidth = nameElement.offsetWidth;
	    
	    // id 요소의 margin-left 설정
	    idElement.style.marginLeft = nameWidth + 145 + "px"; // 예시로 10px 여백 추가
      }
      
		
		// 페이지 로드 시 초기 설정
		window.onload = function () {
		    updateMargin(); // 초기 설정
		};
		
		// name 요소의 크기가 변경될 때마다 margin 업데이트
		window.addEventListener("resize", function () {
		    updateMargin();
		});
