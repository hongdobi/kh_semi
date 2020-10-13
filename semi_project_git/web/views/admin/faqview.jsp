<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page
	import="java.util.List, com.fs.model.vo.FAQ,java.util.ArrayList"%>


<%
	FAQ f = (FAQ) request.getAttribute("FAQ");
/*  List<FAQ> list = (List) request.getAttribute("FAQ"); */
%>

<style>
 table{
		width:100%;
	}
	table, tr, th, td{
		border: 3px solid gainsboro;
		padding: 5px;
	}
	.button{
		background-color: lightpink;
		border: 3px solid gainsboro;
	}
		section {
		padding: 50px;
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

	#faqView{
		width:1200px;
		border:3px solid gainsboro;
		display: inline-block;
	}
    table#table-faq{
		width:100%; 
		margin:0 auto; 
		border:1px solid grey; 
		border-collapse:collapse;
	}
    table#table-faq th, table#table-faq td {
		border:1px solid; 
		padding: 5px 0; 
		text-align:center;
		font-size:17px;
	}
section#faq-container {
	width: 600px;
	margin: 0 auto;
	
}

section#faq-container h2 {
	margin: 10px 0;
}
[contenteditable="ture"]{
 color:#C00;
}
[contenteditable="true"] {
  color: #C00;
}

</style>

<div id="title">
		<h1 align="center">
			<span style="color: lightcoral">오성티켓</span> 관리자 페이지
		</h1>
	</div>
	<br>
	<nav>
		<ul class="Rank-nav">
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/perfEnroll">공연 등록/삭제</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/memberMG">회원관리</a></li>
			<li class="rk-li">리뷰관리</li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/faqList">FAQ</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/inquiryList">1:1문의</a></li>
		</ul>
	</nav>


<section>

	<div id="faq-container">
<%-- 	<form action="<%=request.getContextPath()%>/admin/deleteFaq" method="post" id="deleteform"> --%>
		<form action="" method="post" id="deleteform">
		<h2 align="center">FAQ</h2>
		<div id="editor" ></div>
		<table id="tbl-faq">

			<tr>
				<th>번호</th>
				<td ><%=f.getFaqNo()%><input name="faqNo" id="faqNo" value="<%=f.getFaqNo()%>">
				</td>
			</tr>
			<tr>
				<th>해시태그</th>
				<td name="faqHashTag" contenteditable="true"><%=f.getFaqHashTag()%></td>
			</tr>
			<tr>
				<th>질문</th>
				<td name="faqTitle" contenteditable="true"><%=f.getFaqTitle()%></td>
			</tr>
			<tr>
				<th>답변</th>
				<td name="faqContent" contenteditable="true"><%=f.getFaqContent()%></td>
			</tr>

			<tr>
				<th colspan="2">
				<button type="button" class="button" onclick="fn_move_list()">목록</button>
			   <input type="button" class="button" value="수정" onclick="return invalidate();">
				<button type="button" class="button" onclick="fn_move_delete()">삭제</button>
				</th>
			</tr>
			</div>
			</form>
			<%-- <form action="<%=request.getContextPath()%>/admin/faqDelete" >
				<input type="hidden" value="<%=f.getFaqNo() %>" name="no">
			</form>
		 --%>
           <script>
           function fn_move_list(){
        	   location.replace("<%=request.getContextPath()%>/admin/faqList");
           }
           
           function fn_move_delete(){
        	$("#deleteform").attr("action", "<%=request.getContextPath()%>/admin/deleteFaq"); 
        	/*  let faqNo = $(event.target).parent().parent().children(":nth-child(2)").text(); */
       		$("#faqNo").val(faqNo);
       		alert(<%=f.getFaqNo()%> + " 번게시글을 삭제하시겠습니까?");
       		$("#deleteform").attr("faqNo", faqNo);
       		location.href="<%=request.getContextPath()%>/admin/deleteFaq"; 
       	}
           </script>
		</table>

	</div>
</section>
<br>
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


<%@ include file="/views/common/footer.jsp"%>