//회원가입 기능 페이지

// 
const form = document.getElementById('form');
const email = document.getElementById('email');
const username = document.getElementById('username');
const gneder = document.getElementById('gender');
const password = document.getElementById('password');
const password2 = document.getElementById('password2');

// 입력 에러 메세지 
const showError = (input, message) => {
  const formControl = input.parentElement;
  formControl.className = 'form-control error';
  const small = formControl.querySelector('small');
  small.innerText = message;
}

// 입력 성공 출력
const showSuccess = (input) => {
  const formControl = input.parentElement;
  formControl.className = 'form-control success';
}

// 이메일 주소 확인 (해석 여부)
// 예외 상황 (중복된 입력 or  잘못된 입력) 
const isValidEmail = (email) => {
  const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  if (re.test(email.value)) {
    showSuccess(email)
  } else {
    showError(email, '유효하지 않은 이메일주소입니다');
  }
}

// Get field name
const getFieldName = (input) => {
  return input.id.charAt(0).toUpperCase() + input.id.slice(1);
}

// Check required fields
const checkRequired = (inputArr) => {
  inputArr.forEach(input => {
    if (input.value.trim() === '') {
      showError(input, `${getFieldName(input)} is required`);
    } else {
      showSuccess(input);
    }
  })
}

// 입력 길이 제한 체크하기 --> 비밀번호에서만 6자 이상 25자 미만
const checkLength = (input, min, max) => {
  if (input.value.length < min) {
    showError(input, `${getFieldName(input)} ${min}자 이상 입력하세요`)
  } else if (input.value.length > max) {
    showError(input, `${getFieldName(input)}  ${max}자 미만으로 입력하세요`)
  }
}


// 비밀번호 일치 확인 
const checkPasswordsMatch = (input1, input2) => {
  if(input1.value !== input2.value) {
    showError(input2, '비밀번호를 확인하세요');
  }
}

// Event listeners
form.addEventListener('joinSubmit', e => {
  e.preventDefault();

  checkRequired([username, email, password, password2]);
  checkLength(username);
  checkLength(password, 6, 25);
  isValidEmail(email);
  checkPasswordsMatch(password, password2);
});

form.addEventListener('loginSubmit', e => {
  e.preventDefault();

  checkRequired([email, password]);
  checkLength(password, 6, 25);
  isValidEmail(email);
});