<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.fs.model.vo.Performance,com.fs.model.vo.PerfSsn,java.util.List,java.util.ArrayList" %>
<%@ include file="/views/common/header.jsp"%>
<% 
	List <Performance>list=(List)request.getAttribute("list");
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
	/* background-color: rgb(228, 225, 225); */
	background-color: lightpink;
	border-radius: 10px;
	justify-content: space-around;
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
	
}

div.Rank-content>div img {
	height:280px;

}

div.rk p{
	color:white;
	font-wieght:bolder;
	font-size:20px;
	padding:3px;
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
		<% if(list!=null){
			int i=1;%>
			<%for(Performance perf:list){%>
			<div class="rk">
				<p>TOP <%=(i)%></p>
				<a href="<%=request.getContextPath()%>/perf/perfView.do?perfNo=<%=perf.getPerfNo()%>">
					<img src="<%=request.getContextPath()%>/image/perf/<%=perf.getPerfNo()%>/<%=perf.getPerfPoster()%>" alt="<%=request.getContextPath() %>/<%=perf.getPerfName() %>">
				</a>
			</div>
			<%i++;
			} 
		}%>

	</div>

</section>
<script>
$(function(){
	
	 $(".rk-li").each((i,v) => {
		 $(v).click(e=>{
			
			 $(e.target).parents().children('li').attr("style","background-color:white; color: black;");
             $(e.target).attr("style","background-color:lightcoral; color: white;");
             //해당 리스트 값 받기
             let c=$(e.target).html();
             let cate=null;
             if(c=='전체') cate="ALL";
             else if(c=='뮤지컬')cate="M";
             else if(c=='연극') cate="S";
             else if(c=='전시') cate="E";
             console.log(cate);
             
     		$("input#rankMonth").change(e =>{ 
    			$.ajax({
    				url:"<%=request.getContextPath()%>/perf/rankingEnd.do", 
    				data:{"month":$("input#rankMonth").val(),"cate":cate},
    				type:"post",
    				dataType:"json",
    				success: data=>{  
    					$(".Rank-content").html("");
     					for(let i=0;i<6;i++){
     						
     						let perfNo=data[i]["perfNo"];	
     						let poster=data[i]["poster"];
     						console.log(poster);
     					
     						let div=$("<div class='rk'>");
    						let p=$("<p>").html("TOP"+(i+1));
     						let a=$("<a>").attr("href","<%=request.getContextPath()%>/perf/perfView.do?perfNo="+perfNo);
     						let img=$("<img>").attr("src","<%=request.getContextPath()%>/image/perf/"+perfNo+"/"+poster);
     						a.append(img);
     						div.append(p);
     						div.append(a);
     						$('div.Rank-content').append(div);
     					}		
     					
     				}
    			});	
    		});
          
     		
      		$.ajax({
 				url:"<%=request.getContextPath()%>/perf/rankingEnd.do", 
 				data:{"cate":cate},
 				type:"post",
 				dataType:"json",
 				success: data=>{  
 					$(".Rank-content").html("");
 					for(let i=0;i<6;i++){
 						
 						let perfNo=data[i]["perfNo"];	
 						let poster=data[i]["poster"];
 						console.log(poster);
 					
 						let div=$("<div class='rk'>");
						let p=$("<p>").html("TOP"+(i+1));
 						let a=$("<a>").attr("href","<%=request.getContextPath()%>/perf/perfView.do?perfNo="+perfNo);
 						let img=$("<img>").attr("src","<%=request.getContextPath()%>/image/perf/"+perfNo+"/"+poster);
 						a.append(img);
 						div.append(p);
 						div.append(a);
 						$('div.Rank-content').append(div);
 					}	
 					
 				}
 				
 			}); 
          
     		
     		
         });
     });
	 
});
	
</script>

<%@ include file="/views/common/footer.jsp"%>