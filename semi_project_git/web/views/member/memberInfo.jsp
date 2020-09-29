<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fs.model.vo.Member" %>

<%
	//로그인 된 상태 LoginEndServlet에서 지정한 session값으로 불러오기
	Member loginMember = (Member)session.getAttribute("loginMember");

%>

<form action="<%=request.getContextPath() %>/member/editMember" method="post">
	<table>
		<tr>
			<th>아이디</th>
			<td><%=loginMember.getMemberId()%><input type="hidden" name="memberId" id="memberId" value="<%=loginMember.getMemberId()%>" readonly></td>
		<tr>
			<th>비밀번호</th>
			<td id="password"><input type="text" name="memberPw" id="memberPw" value="<%=loginMember.getMemberPw() %>"></td>
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
			<td id="email"><input type="text" name="Email" id="Email" value="<%=loginMember.getEmail() %>"></td>	
		</tr>
		<tr>
			<th>생년월일</th>
			<td><%=loginMember.getBday() %><input type="hidden" name="Bday" id="Bday" value="<%=loginMember.getBday()%>"></td>	
		</tr>
	</table>
	<br><br><br>
	<input type="submit" value="회원정보 변경">
	<input type="button" value="회원탈퇴">
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