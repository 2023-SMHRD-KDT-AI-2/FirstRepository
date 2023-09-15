/**
 * 
 */

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