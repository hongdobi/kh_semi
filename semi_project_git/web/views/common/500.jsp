<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500 ERROR</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<style type="text/css">

	body{
		background-color: #EEEEEE;
	}
	div>button{
		font-family: 'Noto Sans KR';
		border: 3px darkgray solid; 
		width: 200px;
		height: 50px;
		border-radius: 10px;
		font-size: 25px;
		margin: auto;
	}
	div>img{
		
		width:100%;
	}
	
</style>
</head>
<body>
	<div id="errorBox">
		<img alt="" src="<%=request.getContextPath() %>/image/500.jpg"><br>
	
		<div id="buttonDiv" style="text-align:center;">
			<button onclick="location.replace('/semi_project_git/')">메인화면으로</button>
		</div>
	</div>
</body>
</html>