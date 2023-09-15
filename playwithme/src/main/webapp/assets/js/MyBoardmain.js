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
		location.href = 'goProfile';
	})

