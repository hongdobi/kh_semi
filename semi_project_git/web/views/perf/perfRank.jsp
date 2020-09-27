<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.fs.model.vo.Performance,com.fs.model.vo.PerfSsn,java.util.List,java.util.ArrayList,java.text.SimpleDateFormat" %>
<%@ include file="/views/common/header.jsp"%>
<% 
	List <Performance>list=(List)request.getAttribute("list");
	SimpleDateFormat sdf=new SimpleDateFormat("MM월 dd일");
%>
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
	
	background-color: lightpink;
	border-radius: 10px;
}
/* 순위박스 */
div.Rank-content>div {
	margin: 20px;
	width: 280px;	
	height:380px;
	display: inline-block;
	background-color: black;
	border-radius: 10px;
	text-align: center;
	position: relative;
	
}
div.rk>p{
	color:white;
	font-weight:bolder;
	font-size:20px;
	padding:3px;
}
/*포스터*/
div.Rank-content>div img {
	position: absolute;
	height:280px;
	width:220px;
	top:70px;
	left:30px;
}
/*마우스 오버시 나타날 공연정보창*/
 div.rk div.in{
 	
	height:255px;
	width:220px;
	color:white;
	text-align: center;
	line-height:30px;
	padding-top: 30px;
   	background-color:rgba(0,0,0,0.6);
	margin:auto;
   
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


.rk:hover .in {
  opacity:1;
  transform:scale(1);
}

</style>
<script>

$(function(){
	
	let month=null;
	let cate=null;
	
    
	$(".rk-li").each((i,v) => {
		 $(v).click(e=>{
			$(e.target).parents().children('li').attr("style","background-color:white; color: black;");
           	$(e.target).attr("style","background-color:lightcoral; color: white;");
			let c=$(e.target).html();
			if(c=='전체') cate="ALL";
			else if(c=='뮤지컬')cate="M";
			else if(c=='연극') cate="S";
			else if(c=='전시') cate="E";
			console.log(cate,month);
		    $.ajax({
			   	url:"<%=request.getContextPath()%>/perf/rankingEnd.do", 
			   	data:{"month":month,"cate":cate},
			   	type:"post",
			   	dataType:"json",
			   	success: data=>{fn_rankList(data);}
		 	 });	
            
        });	 
    });
	
	$("input#rankMonth").change(e =>{ 
		month=$("input#rankMonth").val();
		console.log(cate,month);
		    $.ajax({
		   	url:"<%=request.getContextPath()%>/perf/rankingEnd.do", 
		   	data:{"month":month,"cate":cate},
		   	type:"post",
		   	dataType:"json",
		   	success: data=>{fn_rankList(data);}
		  });	
	});
	
	
	
	
	function fn_rankList(data){
		$(".Rank-content").html("");
			for(let i=0;i<data.length;i++){
			let div=$("<div class='rk'>");
			let p=$("<p>").html("TOP"+(i+1));
			let a=$("<a>").attr("href","<%=request.getContextPath()%>/perf/perfView.do?perfNo="+data[i]["perfNo"]);
			let img=$("<img>").attr("src","<%=request.getContextPath()%>/image/perf/"+data[i]["perfNo"]+"/"+data[i]["poster"]);
			let indiv=$("<div class='in'>").html("<h3>"+data[i]["perfName"]+"</h3>"+data[i]["start"]+"~"+data[i]["end"]+"<br>"+data[i]["location"]+"<br><br>"+"<button>예약하기</button>");
			a.append(indiv);
			div.append(p);
			div.append(img);
			div.append(a);
			$('div.Rank-content').append(div);
		}	
	} 

});
	
</script>
<section>
	<div id="title">
		<h1>
			<span style="color: lightcoral">오성티켓</span> 랭킹
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
		<input type="month" id="rankMonth" min="2020-09"
			style="font-size: 20px">
	</div>
	<br>
	<br>
	<div class="Rank-content">
		<% if(list!=null){
			int i=1;%>
			<%for(Performance perf:list){%>
			<div class="rk">
				<p>TOP <%=(i)%></p>
				<img src="<%=request.getContextPath()%>/image/perf/<%=perf.getPerfNo()%>/<%=perf.getPerfPoster()%>" alt="<%=request.getContextPath() %>/<%=perf.getPerfName() %>">
				<a href="<%=request.getContextPath()%>/perf/perfView.do?perfNo=<%=perf.getPerfNo()%>">
					<div class="in">					
						<h3><%=perf.getPerfName() %></h3>
						<%=sdf.format(perf.getPerfStart()) %>~
						<%=sdf.format(perf.getPerfEnd()) %>
						<br>
						<%=perf.getPerfLocation()%><br><br>
						<button>예약하기</button>						
					</div>
				</a>
				
			</div>
			<%i++;
			} 
		}%>

	</div>

</section>


<%@ include file="/views/common/footer.jsp"%>