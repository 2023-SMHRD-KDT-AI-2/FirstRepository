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
      $('#button').hover(
    		    function() {
    		        $(this).css('backgroundColor', '#40a9f2');
    		    },
    		    function() {
    		        $(this).css('backgroundColor', ''); // 마우스 아웃 시 배경색 초기화
    		    }
    			);
      $('#back').click(function () {
  		location.href = 'goProfile';
  	})
  	document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("form"); // 폼 엘리먼트 가져오기
    const checkboxes = document.querySelectorAll(".check"); // 체크박스 엘리먼트 모두 가져오기

    form.addEventListener("submit", function(event) {
        const selectedCheckboxes = Array.from(checkboxes).filter(checkbox => checkbox.checked);

        if (selectedCheckboxes.length < 3) {
            alert("관심사를 3개 이상 선택하세요.");
            event.preventDefault(); // 폼 제출 방지
        }
    });
});