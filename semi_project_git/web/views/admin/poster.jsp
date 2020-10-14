<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fs.model.vo.Performance, javax.servlet.http.HttpServletResponse" %>
<%
	Performance perf = (Performance)request.getAttribute("perf");
	String msg = (String)request.getAttribute("msg");
	String loc = (String)request.getAttribute("loc");
	request.getSession().removeAttribute("perfNo");
	request.getSession().setAttribute("perfNo", perf.getPerfNo());
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%= perf.getPerfNo() %></h1>
	<form action="<%=request.getContextPath() %>/admin/posterUpload" method="post" enctype="multipart/form-data">
		<input type="file" name="perfPoster">
		<input type="text" name="perfNo" id="perfNo" value="<%=perf.getPerfNo() %>" readonly>
		<input type="submit" value="저장">
	</form>
	
	<script>
		alert('<%=msg%>');
	</script>

</body>
</html>