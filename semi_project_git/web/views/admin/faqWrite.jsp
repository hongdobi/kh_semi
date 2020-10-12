<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page
	import="java.util.List, com.fs.model.vo.FAQ,java.util.ArrayList"%>


 <style>
	div#board-container
	{
		width:600px;
		margin:0 auto;
		text-align:center;
	}
	div#board-container h2
	{
		margin:10px 0;
	}
	table#tbl-board
	{
		width:500px;
		margin:0 auto;
		border:1px solid black;
		border-collapse:collapse;
	}
	table#tbl-board th
	{
		width:125px;
		border:1px solid;
		padding:5px 0;
		text-align:center;
	}
	table#tbl-board td
	{
		border:1px solid;
		padding:5px 0 5px 10px;
		text-align:left;
	}

</style>
<script>
	
</script>

	<section id='board-container'>
		<h2 align="center">FAQ 등록하기</h2>
		<form action='<%=request.getContextPath()%>/admin/faqWriteEnd' method="post" 
		 >
			<table id='tbl-board'>
				
				<tr>
					<th>질문</th>
					<td><input type="text" cols="30" rows="4" name="faqTitle"></textarea></td>
				</tr>
				<tr>
					<th>답변</th>
					<td><textarea cols="30" rows="4" name="faqContent"></textarea></td>
				</tr>
				<tr>
					<th>해시태그</th>
					<td name="faq_hashtag">
					<input tpye="text" name="faqHashTag">
					<!--  <select name="hashtag">
					<option value="">회원</option>
					<option value="">예매/결제</option>
					<option value="">티켓수령</option>
					<option value="">취소/환불</option>
					<option value="">기타</option>
					</select>  -->
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="등록">
					</th>
				</tr>
				
			</table>
		</form>
	</section>
	<br>
	
	<%@ include file="/views/common/footer.jsp"%>