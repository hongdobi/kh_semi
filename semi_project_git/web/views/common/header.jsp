<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.fs.model.vo.Member" %>
<%
	//로그인 된 상태 LoginEndServlet에서 지정한 session값으로 불러오기
	Member loginMember = (Member)session.getAttribute("loginMember");
	String myImg="http://tkfile.yes24.com/imgNew/common/pf-ticket-b.png";
	String buttonImg="http://tkfile.yes24.com/imgNew/common/pf-srch-w.png";
	//if(request.getContextPath().subString)

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--폰트 스타일-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css"></link>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/slick/slick.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/slick/slick-theme.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/slick/slick.min.js"></script>
<style>
      	#crown{
       	height:20px;
       	width:30px;
       	position:relative;
       	top:5px;
       	}
</style>
</head>
<body>
	<!-- <div class="top-content">
		<div class="top-content-right">
			<a href="#">마이페이지</a>
		</div>
	</div> -->
    <header>
        <h1><a href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath() %>/image/logo.png" alt="오성티켓" width="250px"></a></h1>
        <ul>
            <li><a href="<%=request.getContextPath()%>/perf/categoryView?cate=M">뮤지컬</a></li>
            <li><a href="<%=request.getContextPath()%>/perf/categoryView?cate=E">전시</a></li>
            <li><a href="<%=request.getContextPath()%>/perf/categoryView?cate=S">연극</a></li>
            <li><a href="<%=request.getContextPath()%>/perf/RankList">랭킹</a></li>
        </ul>
        <div style="display:flex;">
        	<%-- <form action="<%=request.getContextPath() %>/search.do" method="get" class="searchForm">
            	<input class="inputText" type="text" name="keyword">
            	<input class="inputSubmit" type="submit" value="">
            </form> --%>
            <form action="<%=request.getContextPath() %>/search.do" class="search-bar" method="get">
				<input type="search" name="keyword" pattern=".*\S.*" class="searchText" placeholder="검색어를 입력하세요."autocomplete="off">
				<button class="search-btn" type="submit" style="margin-right:10px;">
				<img src="<%=buttonImg%>" id="buttonImg">
				</button>
			</form>
            
            <!-- 사람모양 아이콘 클릭 -->
            <% if(loginMember==null) {%>
	            <!-- 로그인 안 했을 때 -> 로그인페이지로 이동 -> 메인으로 이동 -->
	            <a href="<%=request.getContextPath()%>/loginSignup"><img src="<%=myImg %>" alt="로그인" id="login_alarm"></a>
            <%} else if(loginMember.getManagerYn().equals("Y")){ %>
            	<a href="<%=request.getContextPath() %>/adminPage">
            	<img src="https://www.flaticon.com/svg/static/icons/svg/773/773634.svg" id="crown"></a>
            	<input type="button" onclick="location.replace('<%=request.getContextPath()%>/logout')" value="로그아웃">
            <%} else {%>
            <!-- 로그인했을 때만 header에 로그아웃버튼 생성, 로그아웃 시 뒤로가기를 하면 안되서 replace로 이동 -->
            	<a href="<%=request.getContextPath()%>/member/myPage" style="display:inline-block;"><img src="<%=myImg%>" alt="마이페이지"id="myImg"></a>
	            <a onclick="location.replace('<%=request.getContextPath()%>/logout')"><img src="<%=request.getContextPath()%>/image/logout.png" width="30px" height="30px"></a>
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