<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fs.model.vo.Member" %>

<%
	//로그인 된 상태 LoginEndServlet에서 지정한 session값으로 불러오기
	Member loginMember = (Member)session.getAttribute("loginMember");

%>
<style>
	table{
		width: 90%;
		position:relative;
		left:20px;
		top:50px;
	}
	table, th, td{
		border: 3px solid gainsboro;
		padding:15px;
	}
	tr{
		height:80px;
	}
	td{
		background-color:white;
	}
	th{
		width:80px;
		background-color:ghostwhite;
	}
	.button{
		position:relative;
		left:250px;
		top:50px;
		background-color:lightpink;
		border:3px solid gainsboro;
		font-size:15px;
		padding:10px;
		border-radius:10px;
		font-weight: bold;
	}
	#quit{
		position:relative;
		left:280px;
	}
	input{
		border: 3px solid gainsboro;
	}
	span{
		font-size: 10px;
	}
	
</style>

<form action="<%=request.getContextPath() %>/member/editMember" method="post" name="mainForm">
	<table>
		<tr>
			<th>아이디</th>
			<td><%=loginMember.getMemberId()%><input type="hidden" name="memberId" id="memberId" value="<%=loginMember.getMemberId()%>" readonly></td>
		<tr>
			<th>비밀번호</th>
			<td id="password">
			<pre>
<strong>기존 비밀번호</strong>     <input type="password" name="memberPw" id="memberPw"><br>
<strong>변경할 비밀번호</strong>   <input type="password" placeholder="변경할 비밀번호" name= "newPw" id="newPw"><br>
<span id="result1"></span><br>
<strong>비밀번호 확인</strong>     <input type="password" placeholder="비밀번호 확인" id="checkPw">		
<span id="result2"></span>
			</pre>
			</td>
			
			
		</tr>
		<tr>
			<th>이름</th>
			<td><%=loginMember.getMemberName() %><input type="hidden" name="memberName" id="memberName" value="<%=loginMember.getMemberName()%>"></td>	
		</tr>
		<tr>
			<th>전화번호</th>
			<td id="phone"><input type="text" name="Phone" id="Phone" value="<%=loginMember.getPhone() %>"></td>	
		</tr>
		<tr>
			<th>이메일</th>
			<td id="email">
			<input type="text" name="Email" id="Email" value="<%=loginMember.getEmail() %>"><br>
			<span id="result4"></span>
			</td>	
		</tr>
		<tr>
			<th>생년월일</th>
			<td><%=loginMember.getBday() %><input type="hidden" name="Bday" id="Bday" value="<%=loginMember.getBday()%>"></td>	
		</tr>
	</table>
	<div>
		<br><br><br>
	</div>
			<input type="submit" value="회원정보 변경" class="button" onclick="return invalidate();">
			<input type="button" value="회원탈퇴" class="button" id="quit">	
</form>

<!-- <script>
	$("#changePw").click(e=>{
		$("#password").html("<input type='text' name='changedPw'>");
		$("#password").parent().append("<button class='cancel'>취소</button>");
		
	});
	$("#changePhone").click(e=>{
		$("#phone").html("<input type='text' name='changedPhone'>");
		$("#phone").parent().append("<button class='cancel'>취소</button>");
		
	});
	$("#changeEmail").click(e=>{
		$("#email").html("<input type='text'name='changedEmail'>");
		$("#email").parent().append("<button class='cancel'>취소</button>");
		
	});


</script> -->


<script>
	//정규표현식 비밀번호
	var memberPwck = RegExp(/^.*(?=^.{8,15})(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%%^&*()]).*$/);
	$("#newPw").keyup(function(){
	  if(!memberPwck.test($("#newPw").val())){
	    $("#result1").html("영문 숫자/특수문자 조합 8자 이상 입력해주세요").css("color","lightcoral");
	    return false;
	  }else{
	    $("#result1").html("사용가능");
	  }
	});
	
	//비밀번호 확인
	$("#checkPw").keyup(function(){
	  let pw = $("#newPw").val().trim();
	  let pwck = $(this).val().trim();
	
	  if(pw==pwck){
	    $("#result2").html("비밀번호가 일치합니다").css("color","grey");
	  }else{
	    $("#result2").html("비밀번호가 불일치합니다").css("color","lightcoral");
	  }
	});
	
	//정규표현식 이메일
	var emailck = RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);
	$("#Email").keyup(function(){
	  if(!emailck.test($("#Email").val())){
	    $("#result4").html("이메일 형식에 맞춰 입력해주세요").css("color","lightcoral");
	    return false;
	  }else{
	    $("#result4").html("사용 가능한 이메일 입니다");
	  }
	});
	
	function invalidate(){		
		let newPw = $("#newPw").val();
		let checkPw = $("#checkPw").val();
		const memberPw = "<%= loginMember.getMemberPw()%>";
		let oldPw = $("#memberPw").val();
		/* if(oldPw.trim() != memberPw.trim()){
			alert("비밃번호를 잘못 입력하였습니다");
			return false;
		}else  */
		if(newPw.trim() != checkPw.trim()){
			alert("비밀번호가 일치하지 않습니다");
			return false;
		}else if(!emailck.test($("#Email").val())){
			alert("이메일 형식에 맞춰 입력해 주세요");
			return false;
		}else if(!memberPwck.test($("#newPw").val())){
			alert("영문 숫자/특수문자 조합 8자 이상 입력해주세요");
			return false;
		}else{
			mainForm.submit();
			let msg = request.getAttribute("msg");
			alert(msg);
		}
	}
	
		
		
		
/* 	$("#newPw").focus(e=>{
		$(e.target).val("");
	});
	$("#checkPw").focus(e=>{
		$(e.target).val("");
	}); */

</script>