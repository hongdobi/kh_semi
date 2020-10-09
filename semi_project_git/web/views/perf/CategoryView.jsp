<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fs.model.vo.Performance,com.fs.model.vo.Banner,java.util.List, java.util.ArrayList,java.text.SimpleDateFormat"%>
<%@ include file="/views/common/header.jsp"%>

<% 	
	String cate=(String)request.getAttribute("cate");
	List<Banner> list=(List)request.getAttribute("list");
	List<Banner> vList=(List)request.getAttribute("vList");
	List<Banner> cateList=new ArrayList();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 MM월 dd일");

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

/*콘텐츠 박스*/
div#perfContent{
	background-color:black;
	color:white;
	display:flex;
    align-items:center;
	justify-content: space-around;
	height:500px;
	
}
div.contentInfo{
	min-width: 400px;
	width: 400px;
	height:500px;
	position: relative;	
}
div.videoText{
	width: 400px;
	height:500px;	
	color:white;
	background-color: rgba(0,0,0,0.3);
	position: absolute;
	
}
div.videoText>h1{
	margin-top:130px;
	
}
img.contetnPoster{
	opacity: 0.5;
	width: 400px;
	height:500px;	
	position: absolute;
}
div.video{
	text-align:center;
	width:900px;
	height:500px;
	background-image: url(<%=request.getContextPath()%>/image/무대배경.jpg);
	background-repeat:no-repeat;
	background-size:cover;
	
}
div#perfContent iframe{
	margin-top: 50px;
	width:750px;
	height:400px;
	
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
	<% for(Banner b:vList){ %>
		<div class="video">
		<%=b.getSrc()%>
		</div>
		<div class="contentInfo">
			<img class="contetnPoster" src="<%=request.getContextPath()%>/image/perf/<%=b.getPerfNo()%>/<%=b.getPerfPoster()%>" alt="<%=request.getContextPath() %>/<%=b.getPerfName() %>">		
			<a href="<%=request.getContextPath()%>/perf/perfView?perfNo=<%=b.getPerfNo()%>">
			<div class="videoText">
				<h1 style="font-size:50px"><%=b.getPerfName() %></h1>
				<h4><%=sdf.format(b.getPerfStart()) %> ~ <%=sdf.format(b.getPerfEnd()) %></h4>
				<h3><span style="color:coral">'<%=b.getLocation() %>'</span>에서 만나요~</h3>
			</div>
			</a>
		</div>  
	<%}
} %>
</div>

</section>



<%@ include file="/views/common/footer.jsp"%>