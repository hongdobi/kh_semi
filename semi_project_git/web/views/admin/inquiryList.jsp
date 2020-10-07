<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.fs.model.vo.Inquiry" %>
    
<%
	List<Inquiry> list = (List)request.getAttribute("list");
	String pageBar = (String)request.getAttribute("pageBar");
%>

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
		width:1100px;
		height:500px;
		border:3px solid gainsboro;
		display: inline-block;
		text-align:center;
	}
    table#table-inquiry{
		width:100%; 
		margin:0 auto; 
		border:1px solid grey; 
		border-collapse:collapse;
	}
    table#table-inquiry th, table#table-inquiry td {
		border:1px solid; 
		padding: 5px 0; 
		text-align:center;
		font-size:17px;
	}
	#pageBar{
		margin:auto;
		padding:20px;
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
			<li class="rk-li"><a href="">공연 등록/삭제</a></li>
			<li class="rk-li"><a href="">회원관리</a></li>
			<li class="rk-li"><a href="">리뷰관리</a></li>
			<li class="rk-li"><a href="">FAQ</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/inquiryList">1:1문의</a></li>
		</ul>
	</nav>
	<div id="adminView">
	<h2>1:1문의</h2>
	<table id="table-inquiry">
		<tr>
			<td>번호</td>
			<td>문의유형</td>
			<td>제목</td>
			<td>문의날짜</td>
			<td>답변여부</td>
		</tr>
	<% for(Inquiry iq : list) {%>
		<tr>
			<td><%=iq.getInqNo() %></td>
			<td><%=iq.getInqCategory() %></td>
			<td><%=iq.getInqTitle() %></td>
			<td><%=iq.getInqDate() %></td>
			<td><%=iq.getInqYn() %></td>
		</tr>
	<%} %>
	</table>
	<div id="pageBar">
		<%=pageBar %>	
	</div>
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