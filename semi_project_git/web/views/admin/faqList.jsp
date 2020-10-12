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
	background-color: pink;
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
</style>

</script>

<section id="faq-container">
	<h2 align="center">FAQ 관리하기</h2>


	<button type="button" onclick="fn_move_view()">FAQ 등록하기</button>	
			<br>
	<script>
	function fn_move_view(){
		location.replace("<%=request.getContextPath()%>/admin/faqWrite");
	}
	</script>
	

<div id="search-container"> 


</div>
<div id="search-hashtag">

  <form action="<%=request.getContextPath() %>/admin/searchFaq">
  <input type="text" name="searchKeyword" value="<%=key %>" placeholder="해시태그검색">
  <button type="submit">검색</button>
  </form>
</div>
<br>
<br>

	<table id="tbl-faq" style="table-layout: fixed;">

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
	<div id="pageBar">
		<%=request.getAttribute("pageBar")%>
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

</script>

<%@ include file="/views/common/footer.jsp"%>