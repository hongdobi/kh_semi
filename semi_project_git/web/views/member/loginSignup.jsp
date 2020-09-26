<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fs.model.vo.Member" %>

<%
	//아이디 저장하기 : LoginEndServlet에서  저장한 Cookie getName=saveId 가져오기
	Cookie[] cookies = request.getCookies();
	String saveId = null;
	if(cookies!=null){ //cookies값이 있을 경우만 가져온다
		for(Cookie c : cookies){ //여러개의 쿠키 중 getName값이 saveId인 경우만 가져오기 
			if(c.getName().equals("saveId")){
				saveId = c.getValue(); //값을 saveId에 넣는다 여기서는 체크박스 표시유무
			}
		}
	}

	
%>

<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/LSstyle.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>log in</title>
  <!--폰트 스타일-->
  <!-- <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet"> -->
</head>


<body>
  <section class="user">
    <div class="user_options-container">
      <div class="user_options-text">
        <div class="user_options-unregistered">
          <h2 class="user_unregistered-title">오성티켓에 빨리 가입하세요</h2>
          <p class="user_unregistered-text">
            지금 바로 오성 티켓의 가족이 되세요 - !
          </p>
          <button class="user_unregistered-signup" id="signup-button">
            Sign up
          </button>
        </div>

        <div class="user_options-registered">
          <h2 class="user_registered-title">Have an account?</h2>
          <p class="user_registered-text">
            오성티켓에서 가장 빠르게, 가장 쉬운 방법으로 티켓팅 하세요 -,
          </p>
          <button class="user_registered-login" id="login-button">
            Login
          </button>
        </div>
      </div>
	
	<!-- 로그인 form -->
      <div class="user_options-forms" id="user_options-forms">
        <div class="user_forms-login">
          <h2 class="forms_title">Login</h2>
          
          <form class="forms_form" action="<%=request.getContextPath() %>/loginEnd">
            <fieldset class="forms_fieldset">
              <div class="forms_field">
                <input type="text" class="forms_field-input" name="memberId" id="memberId" placeholder="아이디" required autofocus
                 value='<%=saveId!=null?saveId:""%>'>
              </div>
              <div class="forms_field">
                <input type="password" class="forms_field-input" name="memberPw" id="memberPw" placeholder="비밀번호" required>
              </div>
            </fieldset>
            <br>
            <!-- 아이디저장 값이 있을 경우 체크, 없을 경우 체크안함 -->
            <input type="checkbox" name="saveId" id="saveId" <%=saveId!=null?"checked":"" %>>
            <label for="saveId">아이디저장</label>
            <div class="forms_buttons">
              <button type="button" class="forms_buttons-forgot">아이디/비밀번호 찾기</button>
              <input type="submit" value="Log In" class="forms_buttons-action">
            </div>
          </form>
          
            <div class="info">
              <br/>
              <br/>
              <br/>
              <h3>간단하게 오성티켓에 가입하세요 :-)</h3>
            </div>
            <div class="forms_buttons_link">
              <button type="button">
                <img src="<%=request.getContextPath() %>/image/login_icons/google.png" id="google_btn">
              </button>
              <button type="button">
                <img src="<%=request.getContextPath() %>/image/login_icons/kakao.png" id="kakao_btn">
              </button>
            </div>
        </div>
        
       <!-- 회원가입 form -->
        <div class="user_forms-signup">
          <h2 class="forms_title">Sign Up</h2>
          <form class="forms_form" action="<%=request.getContextPath() %>/signupEnd" method="post">
            <fieldset class="forms_fieldset">
              <div class="forms_field">
                <input type="text" name="memberId" id="memberId_" placeholder="아이디:영문소문자/숫자 조합" class="forms_field-input" required>
                <button onclick="" name="" id="selfcheck">중복확인</button>
              </div>
              <div class="forms_field">
                <input type="password" name="memberPw" id="memberPw_" placeholder="비밀번호:영문 숫자/특수문자 조합 8자 이상" class="forms_field-input" required>
              </div>
              <div class="forms_field">
                <input type="password" id="memberPw_2" placeholder="비밀번호확인" class="forms_field-input" required>
              	<span id="result"></span>
              </div>
              <div class="forms_field">
                <input type="email" name="email" placeholder="Email" class="forms_field-input" required>
                <button onclick="" name="" id="selfcheck">중복확인</button>
              </div>
              <div class="forms_field">
                <input type="text" name="phone" placeholder="휴대폰 번호" class="forms_field-input" required>
              </div>
              <div class="forms_field">
                <input type="text" name="bday" placeholder="생년월일 : 8자리 입력(YYYYMMDD)" class="forms_field-input" required>
              </div>
              <div class="forms_field">
                <input type="text" name="memberName" placeholder="이름" class="forms_field-input" required>
              </div>
            </fieldset>
            <div class="forms_buttons">
              <input type="submit" value="Sign up" class="forms_buttons-action">
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
  <script>
    const signupButton = document.getElementById("signup-button"),
      loginButton = document.getElementById("login-button"),
      userForms = document.getElementById("user_options-forms");

    /**
     * Add event listener to the "Sign Up" button
     */
    signupButton.addEventListener("click",() => {
        userForms.classList.remove("bounceRight");
        userForms.classList.add("bounceLeft");
      },false
    );

    /**
     * Add event listener to the "Login" button
     */
    loginButton.addEventListener("click",() => {
        userForms.classList.remove("bounceLeft");
        userForms.classList.add("bounceRight");
      },false
    );
    
    //비밀번호 확인
    $(function(){
      $("#memberPw_2").keyup(function(){
        let pw = $("#memberPw_").val().trim();
        let pwck = $(this).val().trim();

        if(pw==pwck){
          $("#result").html("비밀번호가 일치합니다").css("color","grey");
        }else{
          $("#result").html("비밀번호가 불일치합니다").css("color","lightcoral");
        }
      })
    });
    
  </script>
</body>
</html>