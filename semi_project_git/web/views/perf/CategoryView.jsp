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
	background-color: rgba(0,0,0,0.6);
	position: absolute;
	text-align:center;
	
}
div.videoText>h1{
	margin-top:130px;
	
}
img.contetnPoster{
	opacity: 0.4;
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
/*유튜브 동영상 프레임*/
div#perfContent iframe{
	margin-top: 50px;
	width:750px;
	height:400px;	
}

/* 화살표 */
.slick-arrow{
  z-index: 2; /* prev버튼은 위치 이동시 이미지 뒤로 숨겨짐 */
  position:absolute;  /* 원하는 위치에 지정  */
  top: 40%; 
  width: 50px; 
  height: 50px; 
  transform: translateY(-25px);
}
.slick-prev.slick-arrow{ /* prev 이전 */
	left: 0;
}
.slick-next.slick-arrow{ /* next 다음 */
	right: 0;
}

/* 아래점 */
.slick-dots{ 
	text-align: center;
}
.slick-dots li{
  display: inline-block; 
  margin: 0 5px;
}
div.slider.slick-initialized.slick-slider img{

	height: 350px;
	width: 350px; 
	margin:0px;
}
div.slick-slide.slick-current.slick-active.slick-center img{
	height: 400px;
	width:400px;
	
}
div.slider{
	width: 100%;
    max-width: 1920px;
    min-width: 1300px;
    overflow: hidden;
    margin: 0 auto;
    height: 400px;
    position: relative;
 }
 div.bannerText{   position: absolute;
    text-align: center;
    bottom: 20px;
    width: 100%;
    transition: 0.3s all;} 
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
	


	  $('.slider').slick({
		  centerMode: true,
		  centerPadding: '50px',
		  slidesToShow: 3,
		  speed:300, // 슬라이드 스피드
		  autoplay: true, //자동플레이 유무( false시 자동플레이 안됨 )
		  autoplaySpeed:4000, // 자동플레이 스피드
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
})


    
</script>


<section>

<%if(loginMember!=null&&loginMember.getManagerYn().equals("Y")){ %>
	<button id="addBtn">배너 등록/수정</button>
<%} %>  


<div class="slider">
	<%if(list!=null){
		for(Banner b:list){%>
			<div>
			<a href="<%=request.getContextPath()%>/perf/perfView?perfNo=<%=b.getPerfNo()%>">
			<img class="banner" src="<%=request.getContextPath()%>/image/banner/<%=b.getBanner2()%>">
			<div class="bannerText">
				<h2 style="font-size:50px"><%=b.getPerfName() %></h2>
				<p><%=sdf.format(b.getPerfStart()) %> ~ <%=sdf.format(b.getPerfEnd()) %></p>
				<p><%=b.getLocation() %></p>
			</div>
			</a></div>
		<%}
	} %>
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
<%if(vList!=null){
	for(Banner b:vList){ %>
		<div class="video"><%=b.getSrc()%></div>
		<div class="contentInfo">
			<img class="contetnPoster" src="<%=request.getContextPath()%>/image/perf/<%=b.getPerfNo()%>/<%=b.getPerfPoster()%>" alt="<%=request.getContextPath() %>/<%=b.getPerfName() %>">		
			<a href="<%=request.getContextPath()%>/perf/perfView?perfNo=<%=b.getPerfNo()%>">
<%-- 			<div class="videoText">
				<h1 style="font-size:50px"><%=b.getPerfName() %></h1>
				<h4><%=sdf.format(b.getPerfStart()) %> ~ <%=sdf.format(b.getPerfEnd()) %></h4>
				<h3><span style="color:coral">'<%=b.getLocation() %>'</span>에서 만나요~</h3>
			</div> --%>
			</a>
		</div>  
	<%}
} %>
</div>

</section>



<%@ include file="/views/common/footer.jsp"%>