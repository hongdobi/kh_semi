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
<%@ include file="/views/common/header.jsp" %>
<style>
	/*오성티켓 관리자페이지 타이틀*/
	section>div#title {
		font-size: 30px;
		text-align: center;
		min-width: 1000px;
	}
	/*랭킹 카테고리*/
	ul.Rank-nav {
		min-width: 1000px;
		position:relative;
		left:20%;
	}
	ul.Rank-nav li {
		width: 200px;
		padding: 12px;
		list-style-type: none;
		display: inline-block;
		font-size: 20px;
		border: 1px lightgray solid;
		text-align: center;
	}
    
    div>ul {
        margin: 0px;
        padding: 10px 20px 10px 20px;
    }
    #adminView div>ul>li {
        font-size: 12px;
        list-style-type: disc;
        padding: 3px;
    }
    textarea {
        width: 99%;
        height: 98%;
        resize: none;
        border: none;
    }
    textarea:focus {
        outline: none;
    }
   
    div.wrap-category{
        margin: 7px 0px 7px 0px;
    }
    #posterDiv{
    	position:relative;
    	left: 25%;
    	height: 250px;
    	width: 850px;
    	border: 3px solid gainsboro;
    	margin: 20px 0px 50px -10px;
    }
    table, tr{
    	border: 3px solid gainsboro;
    	margin: 30px 0px 00px 70px
    }
    table{
    	width: 700px;
    }
    th, td{
    	text-align:left;
    }
    #next{
    	position:relative;
    	left:10%;
    	width:700px;
    }
    
</style>


<section>
	<div id="title">
		<h1>
			<span style="color: lightcoral">오성티켓</span> 관리자페이지
		</h1>
	</div>
	<br>
	<nav>
		<ul class="Rank-nav">
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/perfEnroll">공연 등록/삭제</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/memberMG">회원관리</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/faqList">FAQ</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/inquiryList">1:1문의</a></li>
		</ul>
	</nav>
		<div id="posterDiv">
			
			<form action="<%=request.getContextPath() %>/admin/posterUpload" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<th>공연번호</th>
						<td><h1><%= perf.getPerfNo() %></h1></td>
						<th>공연제목</th>
						<td><h1><%= perf.getPerfName() %></h1></td>
					</tr>
					<tr height=50>
						<th>공연 포스터 등록</th>
						<td colspan=3><input type="file" name="perfPoster"></td>
					</tr>
					
				</table>
				<input type="hidden" name="perfNo" id="perfNo" value="<%=perf.getPerfNo() %>" readonly>
				<br><br><br>
				<input type="submit" value="다음" id="next">
			</form>
		</div>
		
	
</section>

	<script>
		alert('<%=msg%>');
	</script>
<%@ include file="/views/common/footer.jsp" %>