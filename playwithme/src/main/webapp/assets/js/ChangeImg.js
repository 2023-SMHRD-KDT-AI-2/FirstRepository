/**
 * 
 */

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
		// HTML에서 파일 입력 필드와 이미지 미리보기 요소를 가져옵니다.
		const fileInput = document.getElementById('changeImg');
		const imagePreview = document.getElementById('img');

		// 파일 입력 필드에 변경 사항이 있을 때 호출되는 이벤트 핸들러를 설정합니다.
		fileInput.addEventListener('change', function() {
	    // 선택한 파일을 가져옵니다.
	    const selectedFile = fileInput.files[0];
	
	    // FileReader를 사용하여 선택한 파일을 읽고 미리보기 요소의 src 속성에 설정합니다.
	    const reader = new FileReader();
	    reader.onload = function(event) {
	        imagePreview.src = event.target.result; // 이미지 URL을 설정합니다.
	    };
	
	    // 파일을 읽습니다.
	    if (selectedFile) {
	        reader.readAsDataURL(selectedFile);
	    }
	   
});
		document.getElementById('icon').addEventListener('click', function() {
	        const inputText = document.getElementById('chn');
	        inputText.removeAttribute('disabled');
	        inputText.focus(); // 활성화된 상태에서 포커스 설정
	    });