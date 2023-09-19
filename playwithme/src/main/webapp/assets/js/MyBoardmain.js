(function($) {

	"use strict";

	$('[data-toggle="tooltip"]').tooltip()

})(jQuery);
function delOk(){
      if(confirm('삭제하시면 복구할수 없습니다. \n 정말로 삭제하시겠습니까??')){
    	  return true;
      } else {
        location.href = 'goMyBoard';
        return false;
      }
  }
  function fixOk(){
      if(confirm('수정하시겠습니까?')){
    	  return true;
      } else {
        location.href = 'goMyBoard';
        return false;
      }
  }
  $('#back').click(function () {
		window.history.back(); // 뒤로 가기
	})


$('.first').hover(
		function() {
		$(this).css('backgroundColor', '#40a9f2');
		},
		function() {
		$(this).css('backgroundColor', ''); // 마우스 아웃 시 배경색 초기화
		}
	);
$('.second').hover(
		function() {
			$(this).css('backgroundColor', '#b50202');
		},
		function() {
			$(this).css('backgroundColor', ''); // 마우스 아웃 시 배경색 초기화
		}
		);
$(document).ready(function() {
    // 검색어 입력 시 실행될 함수
    function filterTableRows(query) {
        // 검색어를 소문자로 변환
        query = query.toLowerCase();

        // 모든 행을 숨김
        $("#accordion tbody tr").hide();

        // 검색어와 일치하는 행을 표시
        $("#accordion tbody tr").each(function(index) {
            var rowText = $(this).text().toLowerCase();
            if (rowText.indexOf(query) !== -1) {
                $(this).show();

                // 검색 결과 행부터 다음 행까지도 표시
                var nextRow = $(this).next("tr");
                while (nextRow.length > 0 && !nextRow.is(":visible")) {
                    nextRow.show();
                    nextRow = nextRow.next("tr");
                }
            }
        });
    }

    // 검색어 입력란에 입력이 있을 때 실행
    $("#searchInput").on("input", function() {
        var query = $(this).val();
        filterTableRows(query);
    });

    // 검색 초기화 버튼 클릭 시 검색어 초기화 및 모든 행 표시
    $("#clearSearch").click(function() {
        $("#searchInput").val("");
        $("#accordion tbody tr").show();
    });
});