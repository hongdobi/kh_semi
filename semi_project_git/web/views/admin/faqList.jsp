<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page
	import="java.util.List, com.fs.model.vo.FAQ,java.util.ArrayList"%>

<%
List<FAQ> list = (List) request.getAttribute("FAQ");
String key = request.getParameter("searchKeyword");
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

	#faqView{
		width:1200px;
		border:3px solid gainsboro;
		display: inline-block;
		text-align:center;
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
	text-align: center;
}

section#faq-container h2 {
	margin: 10px 0;
}

table#tbl-faq {
	width: 100%;
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
	clear: both;
}

table#tbl-faq th, table#tbl-faq td {
	border: 1px solid;
	padding: 5px 0;
	text-align: center;
}


div#pageBar {
	margin-top: 15px;
	text-align: center;
	
}

div#pageBar span.cPage {
	color: pink;
}

div#search-container {
	margin: 0 0 10px 0; padding 3px;
	bacground-color: pink;
}

div#search-hashtag {
	display: inline-block;
}

div#faq-container{

padding:15px;


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

<div id="faqView">

	<h2 align="center">FAQ 관리하기</h2>


	<button type="button" onclick="fn_move_view()" class="button">FAQ 등록하기</button>	
			<br>
			<br>
	<script>
	function fn_move_view(){
		location.replace("<%=request.getContextPath()%>/admin/faqWrite");
	}
	</script>
	

<div id="search-container"> 


<div id="search-hashtag">

  <form action="<%=request.getContextPath() %>/admin/searchFaq">
  <input type="text" name="searchKeyword" placeholder="해시태그검색">
  <button type="submit" class="button">검색</button>
  </form>
</div>
<br>
<br>


<div id="faq-container">
	<table id="tbl-faq" style="table-layout: fixed;" >

		<tr>
			<td>번호</td>
			<td style="word-break: break-all;">해시태그</td>
			<td>제목</td>
		</tr>

		<tr>
			<%
				if (list != null) {
				for (FAQ f : list) {
			%>
			<td><div><%=f.getFaqNo()%></div></td>
			<td><div><%=f.getFaqHashTag()%></div></td>
			<td><div
					style="text-overflow: ellipsis; overflow: ellipsis; overflow: hidden; white-space: nowrap;">
					<a
						href="<%=request.getContextPath()%>/admin/faqview?no=<%=f.getFaqNo()%>">
						<%=f.getFaqTitle()%></a>
				</div></td>

		</tr>
		<%
			}
		}
		%>

	</table>
	</div>
	
	<div id="pageBar">
		<%=request.getAttribute("pageBar")%>
	</div>
	</div>
	</div>
</section>
<br>
<br>
<script>

$("#numPerPage").change(e => {
	let cPage=<%=request.getParameter("cPage")%>;
	let numPerPage=$(e.target).val();
	location.replace("<%=request.getContextPath()%>/admin/memberList?cPage="+cPage+"&numPerPage="+numPerPage);
});


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

</script>

<%@ include file="/views/common/footer.jsp"%>