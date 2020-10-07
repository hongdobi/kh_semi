<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<style>
	section {
		padding: 50px;
		text-align: center;
		margin: auto;
	}
	/*랭킹타이틀*/
	section>div#title {
		font-size: 30px;
		text-align: center;
		min-width: 1000px;
		font-family: Noto Sans KR;
	}
	/*랭킹 카테고리*/
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
	
	div#month-check {
		text-align: center;
		min-width: 1000px;
	}
	div>input#rankMonth {
		margin: auto;
	}
	
	/* 순위 콘텐츠 전체 박스 */
	div.Rank-content {
		width: 1000px;
		margin: auto;
		background-color: lightpink;
		border-radius: 10px;
	}
	/*랭킹 1,2층*/
	.rkOut{
	  width: 980px;
	  height: 400px;
	  padding: 20px;
	}
	/* 순위박스 */
	div.Rank-content div.rk {
		margin: 20px;
		width: 280px;	
		height:360px;
		display: inline-block;
		background-color: black;
		border-radius: 10px;
		text-align: center;
		position: relative;
	}
	/*순위 박스 랭킹*/ 
	div.rk>h3{color:white; text-align:center;}
	/*포스터*/
	div.rk>img {
		height:280px;
		width:220px;
		position: absolute;
		left:30px;
	}
	/*마우스 오버시 나타날 공연정보창*/
	div.rk div.in{
		position: absolute;
		height:280px;
		width:220px;
		color:white;
		text-align: center;
		line-height:30px;
	   	background-color:rgba(0,0,0,0.6);
		left:30px;
		opacity:0; /*불투명정도: 기본값:1*/
	  	transition:all .6s linear;
	} 
	div.rk div.in>button{
		font-wieght:bolder;
		font-size:25px;
		background-color: lightcoral;
		color:white;
		border:none;
		border-radius: 100px;
		height:50px;
	}
	/*랭킹박스에 hover시 불투명도 높이기*/
	.rk:hover .in{
	  opacity:0.9;
	}
	/*예매 퍼센트*/
	div.count{
		font-size:20px;
		line-height:20px;
		width:150px;
		margin:auto;
		color: yellow;
		margin-top:10px;
	}
	#adminView{
		width:800px;
		height:500px;
		border:3px solid gainsboro;
		display: inline-block;
		
	}
	
</style>
<section>
	<div id="title">
		<h1>
			<span style="color: lightcoral">오성티켓</span> 랭킹
		</h1>
	</div>
	<br>
	<nav>
		<ul class="Rank-nav">
			<li class="rk-li">공연 등록/삭제</li>
			<li class="rk-li">회원관리</li>
			<li class="rk-li">리뷰관리</li>
			<li class="rk-li">FAQ</li>
			<li class="rk-li">1:1문의</li>
		</ul>
	</nav>
	<div id="adminView">
		<br>
		<br>
		<br>
		<br>
		<h1>내용</h1>
	</div>

</section>
      


<%@ include file="/views/common/footer.jsp" %>