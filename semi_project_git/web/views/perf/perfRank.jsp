<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.fs.model.vo.Performance,com.fs.model.vo.PerfSsn,java.util.List,java.util.ArrayList" %>
<%@ include file="/views/common/header.jsp"%>
<% 
	List <PerfSsn>rkList=(List)request.getAttribute("rkList");
	List <Performance>perfList=(List)request.getAttribute("perfList");
%>
<script src="js/jquery-3.5.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<style>
section {
	padding: 50px;
	text-align: center;
	margin: auto;
}

section>div#title {
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
	width:260px;
}

</style>
<script>
$(function(){
	
	 $(".rk-li").each((i,v) => {
		 $(v).click(e=>{
			 //선택한 리스트만 클릭시 배경색 유지
			 $(e.target).parents().children('li').attr("style","background-color:white; color: black;");
             $(e.target).attr("style","background-color:lightcoral; color: white;");
             //해당 리스트 값 받기
             let v=$(v).html();
             let cate=null;
             if(v=='전체') cate="";
             else if(v=='뮤지컬')cate="M";
             else if(v=='연극') cate="S";
             else if(v=='전시') cate="E";
             
     		$("#rankMonth").change(e =>{ 
    			$.ajax({
    				url:"<%=request.getContextPath()%>/perf/rankingEnd.do", 
    				data:{"month":$("#rankMonth").val(),"cate":cate},
    				dataType:"json",
    				success: date=>{ 
    					$("#Rank-content").html("");
    					let div=$("<div>");
    					
    					for(let i=0;i<data.length;i++){ 
    						let rk=$("<div>").append($("<div>").html(data[i]["poster"]));
    						div.append(rk);
    					}	
    					
    					$("#Rank-content").html(div);
    				}
    				
    			});
    				
    		});
     		
             
             
             
         })

     })

});
	
</script>
<section>
	<div id="title">
		<h1>
			<span style="color: lightcoral">오성티켓</span> 이달의 랭킹
		</h1>
	</div>
	<br>
	<nav>
		<ul class="Rank-nav">
			<li class="rk-li">전체</li>
			<li class="rk-li">뮤지컬</li>
			<li class="rk-li">연극</li>
			<li class="rk-li">전시</li>
		</ul>
	</nav>
	<br>
	<br>
	<div id="month-check">
		<input type="month" id="rankMonth" min="2020-08"
			style="font-size: 20px">
	</div>
	<br>
	<br>
	<div class="Rank-content">
		<% if(rkList!=null&&perfList!=null){%>
		<%for(PerfSsn ssn:rkList){%>
			<%for(Performance perf:perfList){%>
				<%if(perf.getPerfNo().equals(ssn.getPerfNo())){%> 
			
			<div class="rk">
				<a href="<%=request.getContextPath()%>/perf/perfView.do?perfNo=<%=ssn.getPerfNo()%>">
				<img src="<%=request.getContextPath()%>/image/perf/<%=ssn.getPerfNo()%>/<%=perf.getPerfPoster()%>" alt="<%=request.getContextPath() %>/<%=perf.getPerfName() %>" height="280px"></a>
			</div>
			
				<%}%>
			<%} 
			}
		}%>

	</div>

</section>


<%@ include file="/views/common/footer.jsp"%>