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
		width:1200px;
		border:3px solid gainsboro;
		display: inline-block;
		text-align:center;
	}
	div#inquiry-container{
		height: auto;
    	text-align: center;
    	padding: 15px;
	}
    table#table-inquiry{
		width:100%; 
		border:3px solid gainsboro;
		border-collapse:collapse;
	}
    table#table-inquiry th, table#table-inquiry td {
		border:1px solid; 
		padding: 7px 0; 
		text-align:center;
		font-size:15px;
		border:3px solid gainsboro;
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
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/perfEnroll">공연 등록/삭제</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/memberMG">회원관리</a></li>
			<li class="rk-li"><a href="">리뷰관리</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/faqList">FAQ</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/inquiryList">1:1문의</a></li>
		</ul>
	</nav>
	<div id="adminView">
	<h2>1:1문의</h2>
	<div id="inquiry-container">
		<table id="table-inquiry">
			<tr>
				<td>번호</td>
				<td>문의유형</td>
				<td>제목</td>
				<td>문의날짜</td>
				<td>답변여부</td>
				<td>답변날짜</td>
			</tr>
		<% for(Inquiry iq : list) {%>
			<tr>
				<td><%=iq.getInqNo() %></td>
				<td><%=iq.getInqCategory() %></td>
				<td><a href="<%=request.getContextPath()%>/admin/inquiryView?inqNo=<%=iq.getInqNo()%>" onclick="open(this.href,'','top=100px, left=300px, width=600px, height=400px, scrollbars=no');return false;"><%=iq.getInqTitle() %></a></td>
				<td><%=iq.getInqDate() %></td>
				<td><%=iq.getInqYn() %></td>
				<% if(iq.getInqYn().equals("N")){%>
					<td>미답</td>			
				<%}else {%>
					<td><%=iq.getInqAnsDate() %></td>
				<%} %>
			</tr>
		<%} %>
		</table>
	</div>
	<div id="pageBar">
		<%=pageBar %>	
	</div>
	</div>
</section>

<script>
	//카테고리 hover 효과
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