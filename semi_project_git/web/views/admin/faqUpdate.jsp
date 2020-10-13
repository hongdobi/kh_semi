<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page
	import="java.util.List, com.fs.model.vo.FAQ,java.util.ArrayList"%>


<%
	/* FAQ f = (FAQ) request.getAttribute("FAQ"); */
   List<FAQ> list = (List) request.getAttribute("FAQ"); 
%>

<style>
section#board-container {
	width: 600px;
	margin: 0 auto;
	text-align: center;
}

section#board-container h2 {
	margin: 10px 0;
}

table#tbl-board {
	width: 500px;
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
	clear: both;
}

table#tbl-board th {
	width: 125px;
	border: 1px solid;
	padding: 5px 0;
	text-align: center;
}

table#tbl-board td {
	border: 1px solid;
	padding: 5px 0 5px 10px;
	text-align: left;
}
</style>

<section>

	<div id="board-container">
		<h2 align="center">FAQ</h2>
		<table id="tbl-board">
            <%
				if (list != null) {
				for (FAQ f : list) {
			%>
			<tr>
				<th>번호</th>
				<td><%=f.getFaqNo()%></td>
			</tr>
			<tr>
				<th>해시태그</th>
				<td><%=f.getFaqHashTag()%></td>
			</tr>
			<tr>
				<th>질문</th>
				<td><%=f.getFaqTitle()%></td>
			</tr>
			<tr>
				<th>답변</th>
				<td><%=f.getFaqContent()%></td>
			</tr>

             <%
			}
		}
		%>
              
			<tr>
				<th colspan="2">
				
					<button type="button" onclick="">수정완료</button>
				</th>
			</tr>
           
		</table>

	</div>

</section>
<br>


<%@ include file="/views/common/footer.jsp"%>