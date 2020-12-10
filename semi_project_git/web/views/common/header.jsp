<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.fs.model.vo.Member" %>
<%
	//로그인 된 상태 LoginEndServlet에서 지정한 session값으로 불러오기
	Member loginMember = (Member)session.getAttribute("loginMember");
	String myImg="http://tkfile.yes24.com/imgNew/common/pf-ticket-b.png";
	String buttonImg="http://tkfile.yes24.com/imgNew/common/pf-srch-w.png";
	String logoutBtn=request.getContextPath()+"/image/logout.png";
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/slick/slick.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
       	
       	body{
       	 padding-top: 105px;
       	}
		#mainNav>ul>li>a{
			font-weight: bolder;
		}
		#mainNav>ul>li:after {
		  display:block;
		  content: ''; 
		  height: 10px;
		  border-bottom: solid 5px salmon;  
		  transform: scaleX(0);  
		  transition: transform 250ms ease-in-out;
		}
		#mainNav>ul>li>a:hover{
			font-size: 1.2em;
			color: lightcoral;
		}
		#mainNav>ul>li:hover:after { transform: scaleX(1); }
		#mainNav>ul>li{
			 margin-left: 30px; 
		}
		#login_alarm1,#crown,#logoutBtn{
			margin-left: 10px;
			height:30px;
       		width:30px;
		}
		#iconBox{
			display: flex;
			height: 30px;
		}
		.swal-button {
			background-color: lightcoral;
			font-size: 12px;
			text-shadow: 0px -2px 0px rgba(0, 0, 0, 0.3);
		}
		
		.swal-overlay {
		 	background-color: rgba(0,0,0,0.1);
		}
		.swal-button:focus {
		    outline: none;
		    box-shadow: 0 0 0 1px #fff, 0 0 0 3px rgba(0, 0, 0, 0.3);
		}
</style>
<script>
	var alert = function(msg) {
		swal({
			title : '',
			text : msg,
			closeOnClickOutside: false,
		});
	}

    //검색어 자동완성
		$(function() {
			$.ajax({
				url:"<%=request.getContextPath()%>/search/autoComplete",
				success:data=>{
					console.log(data);
					$( "#tag" ).autocomplete({
					      source: availableTags=data.split(",")
					});
				}
			});
		});
	</script>
</head>
<body>
	<!-- <div class="top-content">
		<div class="top-content-right">
			<a href="#">마이페이지</a>
		</div>
	</div> -->
    <header id="header">
        <div id="mainLogo"><a href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath() %>/image/logo.png" alt="오성티켓" width="250px"></a></div>
        <div id="mainNav">
	        <ul>
	            <li><a href="<%=request.getContextPath()%>/perf/categoryView?cate=M">뮤지컬</a></li>
	            <li><a href="<%=request.getContextPath()%>/perf/categoryView?cate=E">전시</a></li>
	            <li><a href="<%=request.getContextPath()%>/perf/categoryView?cate=S">연극</a></li>
	            <li><a href="<%=request.getContextPath()%>/perf/RankList">랭킹</a></li>
	        </ul>
        </div>
        <div id="iconBox">
        	<%-- <form action="<%=request.getContextPath() %>/search.do" method="get" class="searchForm">
            	<input class="inputText" type="text" name="keyword">
            	<input class="inputSubmit" type="submit" value="">
            </form> --%>
            <form action="<%=request.getContextPath() %>/search.do" class="search-bar" method="get">
				<input type="search" name="keyword" pattern=".*\S.*" class="searchText" placeholder="검색어를 입력하세요."autocomplete="off" id=tag>
				<button class="search-btn" type="submit" style="margin-right:10px;">
				<img src="<%=buttonImg%>" id="buttonImg">
				</button>
			</form>
            
            <!-- 사람모양 아이콘 클릭 -->
            <% if(loginMember==null) {%>
	            <!-- 로그인 안 했을 때 -> 로그인페이지로 이동 -> 메인으로 이동 -->
	            <a href="<%=request.getContextPath()%>/loginSignup" style="display:inline-block;"><img src="<%=myImg%>" alt="로그인" id="login_alarm"></a>
            <%} else if(loginMember.getManagerYn().equals("Y")){ %>
            	<a href="<%=request.getContextPath() %>/adminPage">
            	<img src="https://www.flaticon.com/svg/static/icons/svg/773/773634.svg" id="crown"  width="30px" height="40px"></a>&nbsp;&nbsp;
            	<%-- <input type="button" onclick="location.replace('<%=request.getContextPath()%>/logout')" value="로그아웃"> --%>
            	<a onclick="location.replace('<%=request.getContextPath()%>/logout')"><img id="logoutBtn" src="<%=request.getContextPath()%>/image/logout.png"  width="30px" height="25px" ></a>&nbsp;&nbsp;
            <%} else {%>
            <!-- 로그인했을 때만 header에 로그아웃버튼 생성, 로그아웃 시 뒤로가기를 하면 안되서 replace로 이동 -->
            	<a href="<%=request.getContextPath()%>/member/myPage" style="display:inline-block;"><img src="<%=myImg%>" alt="마이페이지" id="login_alarm"></a>
	            <a onclick="location.replace('<%=request.getContextPath()%>/logout')"><img src="<%=request.getContextPath()%>/image/logout.png" width="30px" height="25px" id="logoutBtn"></a>&nbsp;&nbsp;      
            <%} %>
        </div>
    </header>
    
    
	<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
	<style>
	.ui-menu {
		list-style: none;
		padding: 0;
		margin: 0;
		display: block;
		outline: 0;
		z-index:10001;
		position:fixed;
		width:50px;
		background-color:white;
	}
	.ui-menu .ui-menu-item {
		margin: 0;
		cursor: pointer;
		border-bottom:1px solid #a0a0a0;
	}
	.ui-menu .ui-menu-item-wrapper {
		position: relative;
		padding: 3px 1em 3px .4em;
	}
	.ui-helper-hidden-accessible {visibility: hidden;}
	</style>
</body>
</html>