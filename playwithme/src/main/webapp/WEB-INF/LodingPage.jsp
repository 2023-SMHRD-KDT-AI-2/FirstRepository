<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    .image-container {
    position: relative; /* 부모 요소를 relative로 설정합니다. */
    width: 100%;
    height: 100vh; /* 수직 가운데 정렬을 위해 컨테이너의 높이를 화면 높이로 설정합니다. */
    display: flex; /* 수직 가운데 정렬을 위해 flex를 사용합니다. */
    justify-content: center; /* 수직 가운데 정렬을 위해 내용을 가로로 중앙 정렬합니다. */
    align-items: center;
}
    
    #drop{
        position:absolute;
        top: 0;
        max-width: 300px;
        padding-top: 30px;
        animation: down 1.4s ease-in-out forwards;
      }

    .hidden{
        display: none;
        position:absolute;
      }
      
    @keyframes down{
        from{
          transform: translatey(0px);
          opacity: 3;
        }
        to{
            transform: translatey(300px);
            opacity: 0;
            
        }
      }
      </style>
      
</head>
<body>
    <div class="image-container">
        <img src="images/물방울.png" alt="물방울" id="drop">
        <img src="images/로고.png" alt="로고" class="hidden" width="100px">
    </div>    

    <script
        src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>


    <script>
        const images = document.querySelectorAll('.image-container img');
        let currentIndex = 0;
        let intervalId; // 추가: setInterval 식별자를 저장할 변수

        function changeImage() {
            images[currentIndex].classList.add('hidden');
            images[currentIndex].classList.remove('visible');

            currentIndex = (currentIndex + 1) % images.length;

            images[currentIndex].classList.remove('hidden');
            images[currentIndex].classList.add('visible');

            if (currentIndex === 1) {
                setTimeout(() => {
                    images[currentIndex].classList.add('hidden');
                    images[currentIndex].classList.remove('visible');
                }, 1500);

                // 추가: 이미지가 한 번 변경되면 setInterval 중지
                clearInterval(intervalId);
            }
        }

        // 초기에는 첫 번째 이미지를 보이게 설정합니다.
        images[currentIndex].classList.remove('hidden');
        images[currentIndex].classList.add('visible');

        // setInterval을 시작하고 해당 식별자를 저장
        intervalId = setInterval(changeImage, 1500);


        // 5초 후에 페이지 이동
        setTimeout(function() {
            window.location.href = "goLogin"; // 이동할 페이지의 URL을 여기에 입력
        }, 3000); // 3초를 밀리초로 계산하여 지정 











    </script>
</body>
</html>