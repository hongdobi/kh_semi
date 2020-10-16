<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page
	import="java.util.List, com.fs.model.vo.FAQ,java.util.ArrayList"%>


 <style>
 
	.button{
		background-color: lightpink;
		border: 3px solid gainsboro;
		display: flex;
        justify-content: center;
       
			}
		section {
		padding: 50px;
		text-align: center;
		margin: auto;
	}

	/*오성티켓 관리자페이지 타이틀*/
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

	#faqView{
		width:800px;
		border:3px solid gainsboro;
		display: inline-block;
		/* text-align:center; */
		font-family:Noto Sans KR;
		font-weight: 300;
	}
     div#faq-container{
		height: auto;
    	padding: 15px;
	}
	
    table#table-faq{
		width:100%; 
		border:3px solid gainsboro;
		border-collapse:collapse;
		text-align:left;
	}
    table#table-faq th, table#table-faq td {
		border:1px solid; 
		padding: 7px 0; 
		/* text-align:center; */
		font-size:15px;
		border:3px solid gainsboro;
	}


</style>

<section>
<div id="title">
		<h1>
			<span style="color: lightcoral">오성티켓</span> 관리자 페이지
		</h1>
	</div>
	<br>
	<nav>
		<ul class="Rank-nav">
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/perfEnroll">공연 등록</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/memberMG">회원관리</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/faqList">FAQ</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/inquiryList">1:1문의</a></li>
		</ul>
	</nav>

   <div id="faqView">
		<h2 >FAQ 등록하기</h2>
		<div id="faq-container">
		<form action='<%=request.getContextPath()%>/admin/faqWriteEnd' method="post" >
			<table id='table-faq'>
				<tr>
					<th weight="20" >해시태그</th>
					<td name="faq_hashtag">
					 <select name="faqHashTag">
					<option value="회원">회원</option>
					<option value="예매/결제">예매/결제</option>
					<option value="티켓수령">티켓수령</option>
					<option value="취소/환불">취소/환불</option>
					<option value="기타">기타</option>
					</select> 
					</td>
				</tr>
				<tr>
					<th>질문</th>
					<td><input type="text" cols="30" rows="4" name="faqTitle"></textarea></td>
				</tr>
				<tr>
					<th>답변</th>
					<td><textarea cols="30" rows="4" name="faqContent"></textarea></td>
				</tr>
				
				<tr>
					<th colspan="2" align="center"">
						<input type="submit" class="button"  value="등록">
					</th>
				</tr>
			</table>
		</form>
		</div> 
		</div>
	</section>
	<br>
	<script>
	//카테고리 hover 효과
	$(function(){
		$(".rk-li").hover(function(){
			$(this).css("background-color","lightcoral");
		},
		function(){
			$(this).css("background-color","initial");
		});
	});
	
	</script>
	<%@ include file="/views/common/footer.jsp"%>