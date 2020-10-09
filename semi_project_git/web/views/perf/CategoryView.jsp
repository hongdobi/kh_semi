<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fs.model.vo.Performance,com.fs.model.vo.Banner,java.util.List, java.util.ArrayList"%>
<%@ include file="/views/common/header.jsp"%>

<% 	
	String cate=(String)request.getAttribute("cate");
	List<Banner> list=(List)request.getAttribute("list");
%>
<style>
/*오성티켓 pick*/
div#pick{
	width: 900px;
	height: 700px;
	margin: auto;
	margin-top: 30px;
	
}
table#pickTbl{
	border-collapse: collapse;
	margin:auto;
}

table#pickTbl td{	
	text-align: center;
	position: relative;
}
img#poster{
	width: 250px;
	height: 250px;
}
td:hover .in{
  opacity:0.9;
}
div.in{
	position: absolute;
	width: 230px;
	height: 230px;
	color:white;
	text-align: center;
	line-height:20px;
   	background-color:rgba(0,0,0,0.6);
	opacity:0; /*불투명정도: 기본값:1*/
  	transition:all .6s linear;
  	top: 0px;
  	border:10px rgba(255,255,255,0.6) double;
} 
div.in h3{
	margin-top: 30px;
}

/*동영상 잡지 출력화면*/
div#perfContent{
	width:100%;
	height:500px;
	background-color:black;
}
#imgContainer>img{
	width: 300px;
	height: 300px;
	position : relative;
}
#slide{
	height: 350px;
	border: 1px blue solid;
	margin: auto;
	position: relative;
	min-width: 1000px;
	width:1000px;
   	overflow: hidden;
   	text-align: center;
}
.banner{
	height: 380px;
	width: 380px;
	border: 1px yellow solid;
	position : absolute;
	display:inline-block;
	
}
.banner img{
height: 380px;
	width: 380px;

}
div#prev{	
	background-image: url(<%=request.getContextPath()%>/image/ico-star-on.png);
	position : absolute;
	top:200px;
	left:10px;
	border:none;
	width:50px;
	height:100px;
	background-repeat:no-repeat;
}
div#next{
	background-image: url(<%=request.getContextPath()%>/image/ico-star-on.png);
	position : absolute;
	top:200px;
	right:0px;
	border:none;
	width:50px;
	height:100px;
	background-repeat:no-repeat;
}
</style>
<script>
$(function(){
	//페이지 로드시 카테고리
	let cate="<%=cate%>";
	
	//관리자 배너 등록 팝업창 열기
	$("#addBtn").on("click",e=>{
	    const url="<%=request.getContextPath()%>/admin/bannerAdd"; 
	    const status="width=800px, height=600px, top=100px, left=300px";
	 	open(url,"",status);	
    });
	
	//페이지 로드시 오성티켓's pick
	$.ajax({
		url:"<%=request.getContextPath()%>/perf/perfPick", 
		data:{"cate":cate},
	   	type:"post",
	   	dataType:"json",
		success: function(data){ 
			$("table#pickTbl").children().remove();
			let tr1=$("<tr>");
			let tr2=$("<tr>");
			for(let i=0;i<6;i++){
				let td=$("<td>");
				let div=$("<div>");
				if(i<data.length){
					let a=$("<a>").attr("href","<%=request.getContextPath()%>/perf/perfView?perfNo="+data[i]["perfNo"]);
					let img=$("<img id='poster'>").attr("src","<%=request.getContextPath()%>/image/perf/"+data[i]["perfNo"]+"/"+data[i]["poster"]);
					let indiv=$("<div class='in'>").html("<h3>"+data[i]["perfName"]+"</h3>"+data[i]["perfStart"]+"<br>"+"~"+"<br>"+data[i]["perfEnd"]+"<br>"+data[i]["location"]);
					a.append(indiv);
					div.append(img);
					div.append(a);
				}else{
					div.html("준비중입니다."+"<br>"+"-오성티켓-");
				}
				td.append(div);
				if(i<3){
					tr1.append(td);
				}else if(i<6){
					tr2.append(td);
				}
			}  
			
			$("table#pickTbl").append($("<caption>").html($("<h1>").html("오성티켓's PICK"))); 
			$("table#pickTbl").append(tr1); 
			$("table#pickTbl").append(tr2); 
		}
	});
	
/* 	setInterval(()=>{ 
     $("#banner").last().prependTo($("#banner"));
   	},3000); */
   

		
})


    
</script>


<section>

<%if(loginMember!=null&&loginMember.getManagerYn().equals("Y")){ %>
	<button id="addBtn">배너 등록/수정</button>
<%} %>  

<div id="slide">
	<div class="bn1 banner"><img src="<%=request.getContextPath()%>/image/perf/M2/poster.jpg"></div>
	<div class="bn2 banner"></div>
	<div class="bn3 banner"></div>
	<div class="bn4 banner"></div>
	<div class="bn5 banner"></div>
	<div class="bn6 banner"></div>
	<div id="prev"></div>
	<div id="next"></div>
</div>

<br>
<br>

<div id="pick">
	<table id="pickTbl">
	</table>
</div>

<br>
<br>

<div id="perfContent">
<%if(list!=null){%>
	<% for(Banner b:list){ %>
		<img alt="" src="<%=request.getContextPath()%>/image/banner/<%=b.getBanner2()%>">
	<%}
} %>

<!--뮤지컬일때는 동영상, 아닐때는 잡지 -->
<%if(cate.equals("M")){ %>
	<div id="contentText">
		<!-- 공연정보 등록하는 곳  -->
		
	</div>
	<!-- 홍보 동영상 등록하는 곳  -->
	
	
<%}else{ %>
	<div id="magazine">

	</div>
<%}%>
</div>

</section>



<%@ include file="/views/common/footer.jsp"%>