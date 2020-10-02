<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String msg = (String)request.getAttribute("msg");
	String loc = (String)request.getAttribute("loc");
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지 출력!</title>
</head>
<body>
	<script>
		alert('<%=msg%>');
		<%if(request.getAttribute("opener")!=null){%>
			location.replace('<%=request.getContextPath()%><%=request.getAttribute("opener")%>);
		<%}%>
		<%=request.getAttribute("script")!=null? request.getAttribute("script"):""%>
		location.replace('<%=request.getContextPath()%><%=loc%>');
	</script>

</body>
</html>