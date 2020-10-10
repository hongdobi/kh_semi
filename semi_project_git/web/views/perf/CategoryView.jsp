<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fs.model.vo.Performance,com.fs.model.vo.Banner,java.util.List, java.util.ArrayList,java.text.SimpleDateFormat"%>
<%@ include file="/views/common/header.jsp"%>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/slick/slick.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/slick/slick-theme.css">
 
<% 	
	String cate=(String)request.getAttribute("cate");
	List<Banner> list=(List)request.getAttribute("list");
	List<Banner> vList=(List)request.getAttribute("vList");
	List<Banner> cateList=new ArrayList();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 MM월 dd일");

%>
<style>
#addBtn{
	width: 120px;
	height: 40px;
	background-color: lightcoral;
	color:white;
	border-radius: 10px;
	border:none;
	margin: 40px;
}
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
table#pickTbl img#poster{
	width: 250px;
	height: 250px;
}
table#pickTbl td:hover .in{
  opacity:0.9;
}
table#pickTbl div.in{
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
table#pickTbl div.in h3{
	margin-top: 30px;
}

/*콘텐츠 박스*/
div.perfContent{
	background-color:black;
	color:white;
	width: 1400px;
	height:500px;
	margin: auto;
}
div.vBox{
	height:500px;
	display: -webkit-flex;
	display: flex;
	width: 1400px;
}
div.contentInfo{
	justify-content: space-around; 
	width: 400px;
	height:350px;
	border: 1px lime solid;
}

div.perfContent .slick-slide {
     margin: 0px 20px;
  }

div.perfContent .slick-slide img {
      width: 100%;
 }


 div.videoText{

	width: 400px;
	height:500px;	
	color:white;
	background-color: rgba(0,0,0,0.6);
	text-align:center;
}
div.videoText>h1{
	margin-top:130px;
}
img.contetnPoster{
	opacity: 0.4;
	width: 400px;
	height:500px;	
} 

div.video{
	justify-content: space-around; 
	text-align:center;
	width:800px;
	height:500px; 
	background-image: url(<%=request.getContextPath()%>/image/무대배경.jpg);
	background-repeat:no-repeat; 
	background-size:cover; 
}
/*유튜브 동영상 프레임*/
div.perfContent iframe{
	width:750px;
	height:400px;
	margin-top:50px;	

}

div.perfContent .slick-prev:before,
div.perfContent .slick-next:before {
      color: beige;
}

.slider1 {
	width: 1300px;
	margin: auto;
	min-width:1300px;
}

.slider1 .slick-slide {
     margin: 0px 20px;
  }

.slider1 .slick-slide img {
     width: 100% ;
 }

.slider1 .slick-prev:before,
.slider1 .slick-next:before {
    color: black;
}

.slider1 .slick-slide {
    transition: all ease-in-out .3s;
    opacity: .3;
}
    
.slider1 .slick-active {
   opacity: .7;
    	
}

.slider1 .slick-current {
     opacity: 1;
     
}
.slider1 .slick-current img{
     transform:scale(1.1);
}    
.slider1 img.banner{
    width:350px;
    height:350px;
}

 .slider1 div.bannerText{  
 	position: absolute;
    text-align: center;
    bottom: 0px;
    margin:auto;
    width:350px;
    background-color: rgba(0,0,0,0.2);
   } 
   
 .slider1 div.pannel{
 	text-align: center;
 	position: relative;
 	color:white;
 }
 
 
 
 /*티켓 오픈*/
 div#ticketOpen{
 	text-align:center;
 	margin:auto;
 }
table#openTbl{
 	margin:auto;
 	background:linear-gradient(45deg,lightcoral, #FFD8D8 40%,#FFEAEA 45%);
}
table#openTbl td{
  position:relative;
  padding: 40px;
  
}
table#openTbl td:hover img{
	transform:scale(1.05);
}
div.day{
	background-color: lightcoral;
	border-radius: 100%;
	width:100px;
	height:100px;
	line-height:60px;
	color:white;
	position:absolute; 
	top:260px; 
	right:30px;
	border: 3px white solid;

}
.openPoster{
	height:300px;
	width: 230px;
	
}
/*부제목 크기*/
caption>h1{
	font-size: 30px;
}
</style>
<script>
$(function(){
	//페이지 로드시 카테고리
	let cate="<%=cate%>";
	
	//관리자 배너 등록 팝업창 열기
	$("#addBtn").on("click",e=>{
	    const url="<%=request.getContextPath()%>/banner/bannerAdd"; 
	    const status="width=920px, height=600px, top=100px, left=300px";
	 	open(url,"",status);	
    });
	
	//티켓오픈
	$.ajax({
		url:"<%=request.getContextPath()%>/perf/ticketOpen",
		data:{"cate":cate},
		type:"post",
		dataType:"json",
		success:function(data){
			if(data.length>0){
			$("table#openTbl").children().remove();
			let tr=$("<tr>");
			for(let i=0;i<data.length;i++){
				let td=$("<td>");
				let a=$("<a>").attr("href","<%=request.getContextPath()%>/perf/perfView?perfNo="+data[i]["perfNo"]);
				let img=$("<img class='openPoster'>").attr("src","<%=request.getContextPath()%>/image/perf/"+data[i]["perfNo"]+"/"+data[i]["poster"]);
				let div=$("<div class='day'>").html("<h3> D-<span style='color:yellow; font-size: 40px;'>"+data[i]["dDay"]+"</span></h3>");
				let info=$("<div class='info'>").html("<h4>"+data[i]["perfName"]+"</h4> OPEN:"+data[i]["perfStart"]+"<br>"+data[i]["location"]);
				a.append(img);
				td.append(a);
				td.append(div);				
				td.append(info)
				tr.append(td);
			}
			
			$("table#openTbl").append($("<caption>").html($("<h1>").html("Ticket OPEN")));
			$("table#openTbl").append(tr);
			}
		}
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
			for(let i=0;i<8;i++){
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
				if(i<4){
					tr1.append(td);
				}else if(i<8){
					tr2.append(td);
				}
			}  
			
			$("table#pickTbl").append($("<caption>").html($("<h1>").html("오성티켓's PICK"))); 
			$("table#pickTbl").append(tr1); 
			$("table#pickTbl").append(tr2); 
		}
	});
	

	$('.slider1').slick({
		  centerMode: true,
		  centerPadding: '60px',
		  slidesToShow: 3,
	      dots: true,
		  responsive: [
		    {
		      breakpoint: 768,
		      settings: {
		        arrows: false,
		        centerMode: true,
		        centerPadding: '40px',
		        slidesToShow: 3
		      }
		    },
		    {
		      breakpoint: 480,
		      settings: {
		        arrows: false,
		        centerMode: true,
		        centerPadding: '40px',
		        slidesToShow: 1
		      }
		    }
		  ]
		});
 
    $('.perfContent').slick({
      dots: true,
      infinite: true,
      speed: 300,
      slidesToShow: 1,
      adaptiveHeight: true
    });
})


    
</script>


<section>

<%if(loginMember!=null&&loginMember.getManagerYn().equals("Y")){ %>
	<button id="addBtn">배너 등록/수정</button>
<%} %>  


<div class="slider1">
	<%if(list!=null){
		for(Banner b:list){%>
			
			<div class="pannel">
			<a href="<%=request.getContextPath()%>/perf/perfView?perfNo=<%=b.getPerfNo()%>">
			<img class="banner" src="<%=request.getContextPath()%>/image/banner/<%=b.getBanner2()%>">
			</a>
			<div class="bannerText">
				<p  style="font-weight:bolder;"><%=b.getPerfName() %></p>
				<p><%=sdf.format(b.getPerfStart()) %> ~ <%=sdf.format(b.getPerfEnd()) %></p>
				<p><%=b.getLocation() %></p>
			</div> 
			</div>
		<%}
	} %>
</div>
<br><br>

<!--티켓오픈 -->
<div id="ticketOpen">
	<table id="openTbl"></table>	
</div>

<br><br>
<!--오성티켓 pick -->
<div id="pick">
	<table id="pickTbl"></table>
</div>

<br><br>


<div class="perfContent">
<%if(vList!=null){
	for(Banner b:vList){ %>
	<div class="vBox"></div>
		<div class="video"><%=b.getSrc()%></div>
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
	</div>
	<%}
} %>
</div>

</section>



<%@ include file="/views/common/footer.jsp"%>