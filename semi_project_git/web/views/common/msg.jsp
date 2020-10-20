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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
.swal-button 
{
	background-color: lightcoral;
	font-size: 12px;
	text-shadow: 0px -2px 0px rgba(0, 0, 0, 0.3);
}
 .swal-overlay {
 	background-color: rgba(0,0,0,0.1);
 }
</style>
</head>
<body>
	<script>
		swal({
			  title: "",
			  text: "<%=msg%>",
			  closeOnClickOutside: false,
			  button:"확인",
			  icon: "success",
		})
		.then(function(){
			<%=request.getAttribute("opener")!=null? request.getAttribute("opener"):""%>
			<%=request.getAttribute("script")!=null? request.getAttribute("script"):""%>
			location.replace('<%=request.getContextPath()%><%=loc%>');
		      
		});
		
		
	</script>
	
</body>
</html>