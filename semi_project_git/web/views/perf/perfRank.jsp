<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<script src="js/jquery-3.5.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<style>
section {
	padding: 50px;
	text-align: center;
	margin: auto;
}

section>div:first-of-type {
	font-size: 30px;
	text-align: center;
	min-width: 1000px;
	font-family: Noto Sans KR;
}

ul.Rank-nav {
	min-width: 1000px;
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

ul.Rank-nav li:hover {
	background-color: lightcoral;
	color: white;
	border-style: outset;
}

div#month-check {
	text-align: center;
	min-width: 1000px;
}

div>input[type="month"] {
	margin: auto;
}
/* 순위 콘텐츠 전체 박스 */
div.Rank-content {
	padding: 50px;
	width: 1000px;
	margin: auto;
	background-color: rgb(228, 225, 225);
	border-radius: 10px;
	justify-content: space-around;
}
/* 순위박스 */
div.Rank-content>div {
	margin: 20px;
	width: 280px;
	height: 330px;
	display: inline-block;
	background-color: black;
	border-radius: 10px;
	text-align: center;
	padding-top: 30px;
}

div.Rank-content>div>img {
	
}
</style>
<section>
	<div>
		<h1>
			<span style="color: lightcoral">오성티켓</span> 이달의 랭킹
		</h1>
	</div>
	<br>
	<nav>
		<ul class="Rank-nav">
			<li>전체</li>
			<li>뮤지컬</li>
			<li>연극</li>
			<li>전시</li>
		</ul>
	</nav>
	<br>
	<br>
	<div id="month-check">
		<input type="month" name="RankMonth" min="2020-08"
			style="font-size: 20px">
	</div>
	<br>
	<br>
	<div class="Rank-content">

		<div id="rk1">
			<a href="<%=request.getContextPath()%>/perf/perfView.do?perfNo=M2"><img
				src="img/notredameP.jpg" alt="" height="300px"></a>
		</div>
		<div id="rk2">
			<a href=""><img src="img/나의ps파트너PT.jpg" alt="" height="300px"></a>
		</div>
		<div id="rk3">
			<a href=""><img src="img/베르테르.jpg" alt="" height="300px"></a>
		</div>
		<br>
		<div id="rk4">
			<a href=""><img src="img/베르테르.jpg" alt="" height="300px"></a>
		</div>
		<div id="rk5">
			<a href=""><img src="img/notredameP.jpg" alt="" height="300px"></a>
		</div>
		<div id="rk6">
			<a href=""><img src="img/베르테르.jpg" alt="" height="300px"></a>
		</div>

	</div>

</section>


<%@ include file="/views/common/footer.jsp"%>