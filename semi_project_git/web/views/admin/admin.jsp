<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<style>
	section {
		padding: 50px;
		text-align: center;
		margin: auto;
	}
	/*오성티켓 관리자페이지 타이틀*/
	section>div#title {
		font-size: 30px;
		text-align: center;
		min-width: 1000px;
		font-family: Noto Sans KR;
	}
	/*랭킹 카테고리*/
	ul.Rank-nav {
		min-width: 1000px;
	}
	ul.Rank-nav li {
		width: 200px;
		padding: 12px;
		list-style-type: none;
		display: inline-block;
		font-size: 20px;
		border: 1px lightgray solid;
		text-align: center;
	}

	#adminView{
		width:1200px;
		height:600px;
		border:3px solid gainsboro;
		display: inline-block;
	}
	
</style>
<section>
	<div id="title">
		<h1>
			<span style="color: lightcoral">오성티켓</span> 관리자페이지
		</h1>
	</div>
	<br>
	<nav>
		<ul class="Rank-nav">
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/perfEnroll">공연 등록/삭제</a></li>
			<li class="rk-li"><a href="">회원관리</a></li>
			<li class="rk-li"><a href="">리뷰관리</a></li>
			<li class="rk-li"><a href="">FAQ</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/inquiryList">1:1문의</a></li>
		</ul>
	</nav>
	<div id="adminView">
		<br>
		<br>
		<br>
		<br>
		<h1>내용</h1>
	</div>

</section>
<script>
	$(function(){
		$(".rk-li").hover(function(){
			$(this).css("background-color","lightcoral");
		},
		function(){
			$(this).css("background-color","initial");
		});
	});

</script>      


<%@ include file="/views/common/footer.jsp" %>