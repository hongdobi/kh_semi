<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fs.model.vo.Member" %>

<%
	//로그인 된 상태 LoginEndServlet에서 지정한 session값으로 불러오기
	Member loginMember = (Member)session.getAttribute("loginMember");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--폰트 스타일-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css"></link>
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
</head>
<body>
    <header>
        <h1><a href="/"><img src="http://tkfile.yes24.com/imgNew/common/pf-logo.png" alt="YES24티켓"></a></h1>
        <ul>
            <li><a href="">콘서트</a></li>
            <li><a href="">뮤지컬</a></li>
            <li><a href="">전시</a></li>
            <li><a href="">연극</a></li>
            <li><a href="">랭킹</a></li>
            <li><a href="">이벤트</a></li>
        </ul>
        <div>
        	<form action="<%=request.getContextPath() %>/search.do" method="get">
            <input type="text" name="keyword">
            <input type="submit" value="검색">
            </form>
            
            <!-- 사람모양 아이콘 클릭 -->
            <% if(loginMember==null) {%>
	            <!-- 로그인 안 했을 때 -> 로그인페이지로 이동 -> 메인으로 이동 -->
	            <a href="<%=request.getContextPath()%>/loginSignup"><img src="http://tkfile.yes24.com/imgNew/common/pf-ticket-w.png" alt="로그인" id="login_alarm"></a>
            
            <%} else {%>
            <!-- 로그인 했을 때 -> 마이페이지로 이동, -->
            <!-- 로그인했을 때만 header에 로그아웃버튼 생성, 로그아웃 시 뒤로가기를 하면 안되서 replace로 이동 -->
            	<a href="<%=request.getContextPath()%>/member/myPage"><img src="http://tkfile.yes24.com/imgNew/common/pf-ticket-w.png" alt="마이페이지"></a>
	            <input type="button" onclick="location.replace('<%=request.getContextPath()%>/logout')" value="로그아웃">
            <%} %>
        </div>
    </header>

    <script>
        $(function(){
            $("#login_alarm").click(function(){
                alert("로그인을 먼저 해주세요");
            });
        });

    </script>
    
</body>
</html>