<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.fs.model.vo.Member" %>    

<%
	List<Member> memList = (List)request.getAttribute("memList");
	String type = request.getParameter("searchType");
	String key = request.getParameter("searchKeyword");
%>
<%@ include file="/views/common/header.jsp" %>
<style>
	table{
		width:100%;
	}
	table, tr, th, td{
		border: 3px solid gainsboro;
		padding: 5px;
	}
	.button{
		background-color: lightpink;
		border: 3px solid gainsboro;
	}
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
		width:70%;
		height:700px;
		border:3px solid gainsboro;
		display: inline-block;
		position:relative;
		left:45px;
		
	}
	div#search_memberId{display:inline-block;}
	div#search_memberName{display:none;}

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
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/memberMG">회원관리</a></li>
			<li class="rk-li">리뷰관리</li>
			<li class="rk-li">FAQ</li>
			<li class="rk-li">1:1문의</li>
		</ul>
	</nav>
	<div id="adminView">
		<h1>회원관리</h1>
		<select id="searchType">
			<option value="memberId" <%=type!=null&&type.equals("memberId")?"selected":"" %>>아이디</option>
			<option value="memberName"<%=type!=null&&type.equals("memberName")?"selected":"" %>>이름</option>
		</select>
		<div id="search_memberId">
			<form action="<%=request.getContextPath() %>/admin/searchMember">
				<input type="hidden" name="searchType" value="member_id">
				<input type="text" name="searchKeyword" placeholder="아이디 검색" size="25"
				value="<%=key!=null&&type!=null&&type.equals("userId")?key:""%>">
				<button type="submit" class="button">검색</button>
				
			</form>		
		</div>
		<div id="search_memberName">
			<form action="<%=request.getContextPath() %>/admin/searchMember" method="post">
				<input type="hidden" name="searchType" value="member_name">
				<input type="text" name="searchKeyword" placeholder="이름 검색" size="25" 
				value="<%=key!=null&&type!=null&&type.equals("userName")?key:""%>">
				<button type="submit" class="button">검색</button>				
			</form>		
		</div>
		<section>
			<form action="<%=request.getContextPath()%>/admin/authMG" method="post" id="authMGForm">
				<table>
				<thead>
					<tr>
						<th>회원번호</th>
						<th>아이디</th>	
			<!-- 			<th>비밀번호</th>			 -->
						<th>이름</th>			
						<th>전화번호</th>
						<th>이메일</th>
						<th>생년월일</th>			
						<th>관리자 여부</th>			
					</tr>
				</thead>
				<tbody>
					<%for(Member m : memList){ %>
					<tr>
						<td><%=m.getMemberNo() %></td>
						<td><%=m.getMemberId() %><input type="hidden" name="member_id" id="member_id"></td>
			<%-- 			<td><%=memList.get(i).getMemberPw() %></td> --%>
						<td class="memberName"><%=m.getMemberName() %></td>
						<td><%=m.getPhone() %></td>
						<td><%=m.getEmail() %></td>
						<td><%=m.getBday() %></td>
						<td><%=m.getManagerYn() %> 
						<%if(m.getManagerYn().equals("N")){ %>
							<button type="submit" class="auth, button" onclick="auth();">권한 부여</button>
						<%}else{ %>
							<button type="submit" class="auth, button" onclick="delAuth();">권한 회수</button>
						<%} %>
						</td>
					</tr>
					<%} %>
				</tbody>
					
				</table>
			</form>
			<div id="pagebar">
				<%=request.getAttribute("pageBar") %>
			</div>
		</section>
	</div>
	<!-- <a href="#" class="pageNo">hello</a> -->
</section>




<script>
	function auth(){
		$('#authMGForm').attr('action', "<%=request.getContextPath()%>/admin/authMG");
		let memberId = $(event.target).parent().parent().children(":nth-child(2)").text();
		$("#member_id").val(memberId);
		alert(memberId + "님에게 관리자 권한을 부여하시겠습니까?");
		$("#authMGForm").attr("memberId", memberId);
		location.href="<%=request.getContextPath()%>/admin/authMG";
	}
	function delAuth(){
		$('#authMGForm').attr('action', "<%=request.getContextPath()%>/admin/delAuth");
		let memberId = $(event.target).parent().parent().children(":nth-child(2)").text();
		$("#member_id").val(memberId);
		alert(memberId + "님의 관리자 권한을 회수하시겠습니까?");
		$("#authMGForm").attr("memberId", memberId);
		location.href="<%=request.getContextPath()%>/admin/delAuth";
	}
<%-- 	$(".pageNo").click(function(event){
		let pageNo = $(event.target).text();		
		let msg = "<%=request.getContextPath()%>/admin/memberMG?cPage=" + pageNo;
		alert(msg);
		$(event.target).attr("href", msg);
		$.ajax({
			url:msg,
			type:"get",
			success:function(data){
				$("body").html(data);
			}
		})
		
	}); --%>
	$(function(){
		let memberId=$("#search_memberId");
		let memberName=$("#search_memberName")
		$("#searchType").change(e=>{
			memberId.css("display", "none");
			memberName.css("display", "none");
			let v=$(e.target).val();
			$("#search_"+v).css("display", "inline-block");
		});
		$("#searchType").change();
	});

</script>


<%@ include file="/views/common/footer.jsp" %>








