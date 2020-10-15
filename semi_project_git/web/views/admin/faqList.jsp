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

	.button{
		background-color: lightpink;
		border: 3px solid gainsboro;
	}
	section {
		padding: 50px;
		text-align: center;
		margin: auto;
		font-family: 'Noto Sans KR';
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
		font-family:Noto Sans KR;
		font-weight: 300;
	}
		div#faq-container{
		height: auto;
    	 text-align: center; 
    	padding: 15px;
	}
 table#table-faq{
		width:100%; 
		border:3px solid gainsboro;
		border-collapse:collapse;
	}
    table#table-faq th, table#table-faq td {
		border:1px solid; 
		padding: 7px 0; 
		/* text-align:center; */
		font-size:15px;
		border:3px solid gainsboro;
	}

div#search-hashtag {
	display: inline-block;
}

</style>

<section>


<div id="title">
         <h1>
			<span style="color: lightcoral">오성티켓</span> 관리자 페이지
		</h1>
	</div>
	<br>
	<nav>
		<ul class="Rank-nav">
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/perfEnroll">공연 등록/삭제</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/memberMG">회원관리</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/faqList">FAQ</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/inquiryList">1:1문의</a></li>
		</ul>
	</nav>

<div id="faqView">

	<h2 >FAQ 관리하기</h2>

<div id="faq-container">
	<button type="button" onclick="fn_move_view()" class="button">FAQ 등록하기</button>	
			<br>
			<br>
	<script>
	function fn_move_view(){
		location.replace("<%=request.getContextPath()%>/admin/faqWrite");
	}
	</script>
	

<div id="search-hashtag">

  <form action="<%=request.getContextPath() %>/admin/searchFaq">
  <input type="text" name="searchKeyword" placeholder="해시태그검색">
  <button type="submit" class="button">검색</button>
  </form>
</div>
<br>
<br>



	<table id="table-faq" >

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
			<td><%=f.getFaqNo()%></td>
			<td><%=f.getFaqHashTag()%></td>
			<td><div
					style="text-overflow: ellipsis; overflow: ellipsis; overflow: hidden; white-space: nowrap; text-align: left;">
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
</section>

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

<%@ include file="/views/common/footer.jsp"%>