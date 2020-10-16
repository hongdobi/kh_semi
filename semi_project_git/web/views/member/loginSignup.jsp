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
              <input type="submit" value="Log In" class="forms_buttons-action">
            </div>
          </form>
          
            <div class="info">
              <br/>
              <br/>
              <br/>
              <h3>간단하게 오성티켓에 가입하세요 :-)</h3>
            </div>
        </div>

        
       <!-- 회원가입 form -->
        <div class="user_forms-signup">
          <h2 class="forms_title">Sign Up</h2>
         <form class="forms_form" action="<%=request.getContextPath() %>/signupEnd" method="post">
            <fieldset class="forms_fieldset">
              <div class="forms_field">
                <input type="text" name="memberId" id="memberId_" placeholder="아이디:영소문자 또는 숫자로 시작, 5~15자 이내" class="forms_field-input" required>
                <input type="button" id="idcheck" class="selfcheck" value="중복확인"><br>
                <span id="result1"></span>
              </div>
              <div class="forms_field">
                <input type="password" name="memberPw" id="memberPw_" placeholder="비밀번호:영문 숫자/특수문자 조합 8자 이상" class="forms_field-input" required><br>
                <span id="result2"></span>
              </div>
              <div class="forms_field">
                <input type="password" id="memberPw_2" placeholder="비밀번호확인" class="forms_field-input" required><br>
                <span id="result3"></span>
              </div>
              <div class="forms_field">
                <input type="email" name="email" id="email" placeholder="Email" class="forms_field-input" required>
                <input type="button" id="emailck" class="selfcheck" value="중복확인"><br>
                <span id="result4"></span>
              </div>
              <div class="forms_field">
                <input type="text" name="phone" id="phone" placeholder="휴대폰:-없이 입력" class="forms_field-input" required><br>
                <span id="result5"></span>
              </div>
              <div class="forms_field">
                <input type="text" name="bday" id="bday" placeholder="생년월일:8자리 입력(YYYYMMDD)" class="forms_field-input" required><br>
                <span id="result6"></span>
              </div>
              <div class="forms_field">
                <input type="text" name="memberName" placeholder="이름" class="forms_field-input" required>
              </div>
            </fieldset>
            <div class="forms_buttons">
              <input type="submit" id="signup" value="Sign up" class="forms_buttons-action" >
            </div>

            <!--아이디, 비밀번호 중복확인 체크-->
            <input type="hidden" name="idcheck" value="">
            <input type="hidden" name="emailcheck" value="">

          </form>
        </div>
      </div>
    </div>
  </section>
  <script>
    const signupButton = document.getElementById("signup-button"),
      loginButton = document.getElementById("login-button"),
      userForms = document.getElementById("user_options-forms");

    //Sign up 
    signupButton.addEventListener("click",() => {
        userForms.classList.remove("bounceRight");
        userForms.classList.add("bounceLeft");
      },false
    );

    //Login
    loginButton.addEventListener("click",() => {
        userForms.classList.remove("bounceLeft");
        userForms.classList.add("bounceRight");
      },false
    );
    

    $(function(){
      //정규표현식 아이디
      var memberIdck = RegExp(/^[a-z0-9]{5,15}$/);
      $("#memberId_").keyup(function(){
        if(!memberIdck.test($("#memberId_").val())){
          $("#result1").html("영문소문자 또는 숫자로 시작하는 아이디, 5~15자 이내 입력해주세요").css("color","lightcoral");
        }else{
          $("#result1").html("");
        }
      });
    
      //정규표현식 비밀번호
      var memberPwck = RegExp(/^.*(?=^.{8,15})(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%%^&*()]).*$/);
      $("#memberPw_").keyup(function(){
        if(!memberPwck.test($("#memberPw_").val())){
          $("#result2").html("영문 숫자/특수문자 조합 8자 이상 입력해주세요").css("color","lightcoral");
        }else{
          $("#result2").html("");
        }
      });
    
      //비밀번호 확인
      $("#memberPw_2").keyup(function(){
        let pw = $("#memberPw_").val().trim();
        let pwck = $(this).val().trim();

        if(pw==pwck){
          $("#result3").html("비밀번호가 일치합니다").css("color","grey");
        }else{
          $("#result3").html("비밀번호가 불일치합니다").css("color","lightcoral");
        }
      });

      //정규표현식 이메일
      var emailck = RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);
      $("#email").keyup(function(){
        if(!emailck.test($("#email").val())){
          $("#result4").html("이메일 형식에 맞춰 입력해주세요").css("color","lightcoral");
        }else{
          $("#result4").html("");
        }
      });

      //정규표현식 휴대폰
      var phoneck = RegExp(/^[0-9]{10,11}$/);
      $("#phone").keyup(function(){
        if(!phoneck.test($("#phone").val())){
          $("#result5").html("-없이 숫자로만 입력해주세요").css("color","lightcoral");
        }else{
          $("#result5").html("");
        }
      })

      //정규표현식 생년월일
      var bdayck = false;
      $("#bday").keyup(function(){
    	 var dateStr = $("#bday").val();
    	 var year = Number(dateStr.substr(0,4));
    	 var month = Number(dateStr.substr(4,2));
    	 var day = Number(dateStr.substr(6,2));
    	 var today = new Date();
    	 var yearNow = today.getFullYear();
    	 
    	 if(dateStr.length<=8){
    		 if(1900>year||year>yearNow){
    			 $("#result6").html("생년월일을 확인해주세요").css("color","lightcoral");
    		 }else if(month<1||month>12){
    			 $("#result6").html("생년월일을 확인해주세요").css("color","lightcoral");
    		 }else if(day<1||day>31){
    			 $("#result6").html("생년월일을 확인해주세요").css("color","lightcoral");
    		 }else if((month==4||month==6||month==9||month==11)&&day==31){
    			 $("#result6").html("생년월일을 확인해주세요").css("color","lightcoral");
    		 }else if(month==2){
    			 var isleap = (year%4==0 && (year%100!=0||year%400==0));
    			 if(day>29||(day==29&&!isleap)){
    				 $("#result6").html("생년월일을 확인해주세요").css("color","lightcoral");
    			 }else{
    				 $("#result6").html("");
    				 bdayck = true;
    			 }
    		 }else{
    			 $("#result6").html("");
    			 bdayck = true;
    		 }
    	 }else{
    		 $("#result6").html("생년월일을 확인해주세요").css("color","lightcoral");
    	 }
    	  
      });
      
      
      //아이디 중복확인
      $("#idcheck").click(function(){
        if(!memberIdck.test($("#memberId_").val())){
          alert("아이디 형식에 맞춰 입력해주세요");
        }else{
          $("input[name=idcheck]").val("yes");

          $.ajax({
            url:"<%=request.getContextPath()%>/member/idDuplicate",
            data:{"memberId":$("#memberId_").val()},
            success:function(data){
              $("#result1").html(data);
            }
          });
        }
      });

      //이메일 중복확인
      $("#emailck").click(function(){
        if(!emailck.test($("#email").val())){
          alert("이메일 형식에 맞춰 입력해주세요");
        }else{
          $("input[name=emailcheck]").val("yes");

          $.ajax({
            url:"<%=request.getContextPath()%>/member/emailDuplicate",
            data:{"email":$("#email").val()},
            success:function(data){
              $("#result4").html(data);
            }
          });
        }
      });
      
      //아이디, 이메일 중복확인 체크여부
      $("#signup").click(function(){
        if($("input[name='idcheck']").val()==""){
        	alert("아이디 중복확인을 해주세요");
          $("input[name='idcheck']").focus();
          return false;
        }else if($("input[name='emailcheck']").val()==""){
        	alert("이메일 중복확인을 해주세요");
          $("input[name='emailcheck']").focus();
          return false;
        }
      	
        //가입 전 유효성검사가 되었는지 확인 
        var arr_check = new Array(5).fill(false);
        
        if(memberIdck.test($("#memberId_").val())){
        	arr_check[0] = true;
        }else{
        	arr_check[0] = false;
        	alert("아이디를 양식에 맞게 입력해주세요");
        }
        
        if(memberPwck.test($("#memberPw_").val())){
        	arr_check[1] = true;
        }else{
        	arr_check[1] = false;
        	alert("비밀번호를 일치시켜주세요");
        }
        
        if(emailck.test($("#email").val())){
        	arr_check[2] = true;
        }else{
        	arr_check[2] = false;
        	alert("이메일을 양식에 맞게 입력해주세요");
        }
        
        if(phoneck.test($("#phone").val())){
        	arr_check[3] = true;
        }else{
        	arr_check[3] = false;
        	alert("핸드폰을 양식에 맞게 입력해주세요");
        }
        
        if(bdayck){
        	console.log(bdayck);
        	arr_check[4] = true;	
        }else{
        	console.log(bdayck);
        	arr_check[4] = false;
        	alert("생년월일을 양식에 맞게 입력해주세요");
        }
        
        var allcheck = true;
        for(var i=0; i<arr_check.length; i++){
        	if(arr_check[i]==false){
        		allcheck=false;
        	}
        }
        
        if(allcheck){
        	//alert("입력성공");
        }else{
        	//alert("입력한 정보들을 다시 확인해주세요");
        	return false;
        }
        
      });


        
      
    });//function() 끝

    

    
    
  </script>
</body>
</html>