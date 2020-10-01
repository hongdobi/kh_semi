<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.fs.model.vo.Performance,com.fs.model.vo.PerfSsn,java.util.List,java.util.ArrayList,java.text.SimpleDateFormat" %>
<%@ include file="/views/common/header.jsp"%>
<% 
	List <Performance>list=(List)request.getAttribute("list");
	SimpleDateFormat sdf=new SimpleDateFormat("MM월 dd일");
%>
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
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

</style>
<script>

$(function(){
	
	//이번달까지만 랭킹조회 가능하게 구성
 	let date=new Date();
    let yyyy=date.getFullYear();
    let mm=date.getMonth()+1>9?date.getMonth()+1:"0"+(date.getMonth()+1);
    $("input#rankMonth").attr("max",yyyy+"-"+mm);
    console.log($("#rankMonth").attr("max"));
	
	
	
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
			   	url:"<%=request.getContextPath()%>/perf/rankingEnd", 
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
		   	url:"<%=request.getContextPath()%>/perf/rankingEnd", 
		   	data:{"month":month,"cate":cate},
		   	type:"post",
		   	dataType:"json",
		   	success: data=>{fn_rankList(data);}
		  });	
	});
	
	//ajax성공시 실행할 함수
	function fn_rankList(data){
		$(".Rank-content").html("");
		let divOut1=$("<div class=rkOut>");
		let divOut2=$("<div class=rkOut>");
		for(let i=0;i<data.length;i++){
			let div=$("<div class='rk'>");
			let p=$("<h3>").html("TOP"+(i+1));
			let a=$("<a>").attr("href","<%=request.getContextPath()%>/perf/perfView?perfNo="+data[i]["perfNo"]);
			let img=$("<img id='poster'>").attr("src","<%=request.getContextPath()%>/image/perf/"+data[i]["perfNo"]+"/"+data[i]["poster"]);
			let indiv=$("<div class='in'>").html("<h3>"+data[i]["perfName"]+"</h3>"+data[i]["start"]+"~"+data[i]["end"]+"<br>"+data[i]["location"]+"<br><br>"+"<button>예약하기</button>");
			a.append(indiv);
			div.append(p);
			div.append(img);
			div.append(a);
			if(i<3){
				divOut1.append(div);
			}else{
				divOut2.append(div);
			}
		}  
		$("div.Rank-content").append(divOut1); 
		$("div.Rank-content").append(divOut2); 
		
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
		<%List <Performance>listA=new ArrayList();
		List <Performance>listB=new ArrayList();
		for(int i=0;i<list.size();i++){
			if(i<3) listA.add(list.get(i));
			else listB.add(list.get(i));
        }
		for(int j=0;j<2;j++){
        	List<Performance> rkList=new ArrayList();
        	if(j==0){rkList=listA;}
        	else{rkList=listB;}%>
        	<div class="rkOut">
        	<%for(int k=0;k<rkList.size();k++){ //랭킹순위가 6개가 안되더라도 오류나지 않도록 변경
        		Performance perf=rkList.get(k);
        		int a=k;%>
        		<div class="rk">
					<h3>TOP <%=(j==0)?a+1:a+4 %></h3>
					<img id="poster" src="<%=request.getContextPath()%>/image/perf/<%=perf.getPerfNo()%>/<%=perf.getPerfPoster()%>" alt="<%=request.getContextPath() %>/<%=perf.getPerfName() %>">
					<a href="<%=request.getContextPath()%>/perf/perfView?perfNo=<%=perf.getPerfNo()%>">
						<div class="in">					
							<h3><%=perf.getPerfName() %></h3>
							<%=sdf.format(perf.getPerfStart()) %>~<%=sdf.format(perf.getPerfEnd()) %>
							<br>
							<%=perf.getPerfLocation()%><br><br>
							<button>예약하기</button>						
						</div>
					</a>
				</div>
        	<%} %>
        	</div>
        <%} %>
	</div>

</section>


<%@ include file="/views/common/footer.jsp"%>