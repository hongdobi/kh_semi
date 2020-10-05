<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
	#sidebar{
		background-color:ghostwhite;
		width:200px;
		position:fixed;
		top:30%;
		left:3%;
		border: 3px solid lightpink;
		text-align:center;
		display:flex;
		flex-direction:column;
		font-weight:bolder;
	}
		
	#result{
		width: 800px;
		height: 500px;
/* 		border: 3px solid; */
		position:relative;
		left:300px;
		top:100px;
	}
</style>


<%@ include file="/views/common/header.jsp" %>

<div id="sidebar">
	<div>
		<h1>MY PAGE</h1>
	</div>
	<div>
		<p><%=loginMember.getMemberName() %>님</p>
		<p>포인트: 000점</p>
	</div>
	<div>
		<p id="bookCheck">예매확인 / 취소</p>
		<p id="myReview">나의 리뷰</p>
	</div>
	<div>
		<p id="memberInfo">회원정보 수정</p>
		<p id="helpCenter">고객센터</p>	
	</div>
</div>

<div id="result">

</div>

<script>
	
	$("#bookCheck").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/member/bookChecker",
			type:"get",
			data:{"memberId":"<%=loginMember.getMemberId()%>"},
			success:function(data){
				$("#result").html(data);
			}
		})
	});
	$("#myReview").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/member/myReview",
			type:"get",
			data:{"memberId":"<%=loginMember.getMemberId()%>"},
			success:function(data){
				$("#result").html(data);
			}
		})
	});
	$("#memberInfo").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/member/memberInfo",
			type:"get",
			data:{"memberId":"<%=loginMember.getMemberId()%>"},
			success:function(data){
				$("#result").html(data);
			}
		})
	});
	$("#helpCenter").click(e=>{
		    location.href="<%=request.getContextPath()%>/admin/helpCenter";
	});


	$(document).ready(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/member/memberInfo",
			type:"get",
			data:{"memberId":"<%=loginMember.getMemberId()%>"},
			success:function(data){
				$("#result").html(data);
			}
		})
	});


</script>
<div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>


<%@ include file="/views/common/footer.jsp" %>
