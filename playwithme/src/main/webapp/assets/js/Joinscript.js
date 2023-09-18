/**
 * 
 */
//회원가입 기능 페이지
const form = document.getElementById('form');
const joinSubmit = document.getElementById('joinSubmit');
const loginSubmit = document.getElementById('loginSubmit');
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
/*const isValidEmail = (email) => {
  const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  if (re.test(email.value)) {
    showSuccess(email)
  } else {
    showError(email, '유효하지 않은 이메일주소입니다');
  }
}*/

// Get field name
const getFieldName = (input) => {
  return input.id.charAt(0).toUpperCase() + input.id.slice(1);
}

// Check required fields
/*const checkRequired = (inputArr) => {
  inputArr.forEach(input => {
    if (input.value.trim() === '') {
      showError(input, `${getFieldName(input)}을 확인하세요`);
    } else {
      showSuccess(input);
    }
  })
}*/

// 입력 길이 제한 체크하기 --> 비밀번호에서만 6자 이상 25자 미만
/*const checkLength = (input, min, max) => {
  if (input.value.length < min) {
    showError(input, `${getFieldName(input)} ${min}자 이상 입력하세요`)
  } else if (input.value.length > max) {
    showError(input, `${getFieldName(input)} ${max}자 미만으로 입력하세요`)
  }
}*/
/*const checkLength = (input, min, max) => {
  if (input.value.length === 0) {
    showError(input, `${getFieldName(input)}을 확인하세요`);
  } else if (input.value.length < min) {
    showError(input, `${getFieldName(input)} ${min}자 이상 입력하세요`);
  } else if (input.value.length > max) {
    showError(input, `${getFieldName(input)} ${max}자 미만으로 입력하세요`);
  } else {
    showSuccess(input);
  }
}*/

// 선웅
/////////////////////
// checkLength 함수는 입력 필드의 길이가 제한 내에 있는지 확인하고 결과를 반환합니다.
function checkLength(input, min, max) {
  if (input.value.length === 0) {
    showError(input, `${getFieldName(input)}을 확인하세요`);
    return false;
  } else if (input.value.length < min) {
    showError(input, `${getFieldName(input)} ${min}자 이상 입력하세요`);
    return false;
  } else if (input.value.length > max) {
    showError(input, `${getFieldName(input)} ${max}자 미만으로 입력하세요`);
    return false;
  } else {
    showSuccess(input);
    return true;
  }
}
/////////////////////


/*// 비밀번호 일치 확인 
const checkPasswordsMatch = (input1, input2) => {
  if(input1.value !== input2.value) {
    showError(input2, '비밀번호를 확인하세요');
  }
}*/

// 선웅
////////////////////
// checkPasswordsMatch 함수는 두 비밀번호 필드가 일치하는지 확인하고 결과를 반환합니다.
function checkPasswordsMatch(input1, input2) {
  if(input1.value !== input2.value) {
    showError(input2, '비밀번호를 확인하세요');
    return false;
  } else {
    showSuccess(input2);
    return true;
  }
}
////////////////////

////////////////////
// 선웅
function checkRequired(inputArr) {
  let valid = true;
  inputArr.forEach(input => {
    if (input.value.trim() === '') {
      showError(input, `${getFieldName(input)}을 확인하세요`);
      valid = false;
    } else {
      showSuccess(input);
    }
  });
  return valid;
}
////////////////////
// Event listeners -> 회원가입 버튼 클릭 시 
////////////////////
//선웅
////////////////////
/*joinSubmit.addEventListener('click', e => {
  // 아래 조건에 충족하지 않을 경우 넘어가지 못하도록
  e.preventDefault();
  checkRequired([username, email, password, password2]);
  checkLength(username);
  checkLength(password, 6, 25);
  isValidEmail(email);
  checkPasswordsMatch(password, password2);
  // 충족 시 보내줌 
  form.submit();
});*/
/*joinSubmit.addEventListener('click', e => {
  e.preventDefault();
  // 필수 입력 체크
  if(checkRequired([username, email, password, password2]) &&
     // 길이 체크
     checkLength(username) &&
     checkLength(password, 6, 25) &&
     // 이메일 체크
     isValidEmail(email) &&
     // 비밀번호 확인
     checkPasswordsMatch(password, password2)) {
    // 모든 조건 충족 시 폼 제출
    form.submit();
  }
});*/
document.addEventListener('DOMContentLoaded', () => {
  const joinSubmit = document.getElementById('joinSubmit');

  if (joinSubmit) {
    joinSubmit.addEventListener('click', e => {
      e.preventDefault();
      // 이곳에 실행할 코드 추가
      checkRequired([username, email, password, password2]);
      checkLength(username);
      checkLength(password, 6, 25);
      checkPasswordsMatch(password, password2);

      if (checkRequired([username, email, password, password2]) &&
          checkLength(username) &&
          checkLength(password, 6, 25) &&
          checkPasswordsMatch(password, password2)) {
        form.submit();
      }
    });
  }
});
// Event listeners -> 로그인 버튼 클릭 시 
/*loginSubmit.addEventListener('click', e => {
  e.preventDefault();
  
  checkRequired([email, password]);
  checkLength(password, 6, 25);
  isValidEmail(email);
  form.submit();
});*/