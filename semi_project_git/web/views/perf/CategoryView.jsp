<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<% 	
	String cate=request.getParameter("cate");
%>
<style>
div#pick{
	width: 950px;
	height: 600px;
	margin: auto;
	border: 1px red solid;
}
table#pickTbl{
	margin:auto;
}
td>*{
	width: 250px;
	height: 250px;
	border: 1px red solid;
}
</style>
<script>
$(function(){
	let cate="<%=cate%>";
	$.ajax({
		url:"<%=request.getContextPath()%>/perf/perfPick", 
		data:{"cate":cate},
		dataType:"html",
		success: function(data){ 
			$("table#pickTbl").children().remove();
			let tr1=$("<tr>");
			let tr2=$("<tr>");
			
			for(let i=0;i<data.length;i++){
				let td=$("<td>");
				let div=$("<div>");
				let a=$("<a>").attr("href","<%=request.getContextPath()%>/perf/perfView?perfNo="+data[i]["perfNo"]);
				let img=$("<img id='poster'>").attr("src","<%=request.getContextPath()%>/image/perf/"+data[i]["perfNo"]+"/"+data[i]["poster"]);
				let indiv=$("<div class='in'>").html("<h3>"+data[i]["perfName"]+"</h3>"+data[i]["start"]+"~"+data[i]["end"]+"<br>"+data[i]["location"]);
				a.append(indiv);
				div.append(img);
				div.append(a);
				td.append(div);
				if(i<3){
					tr1.append(td);
				}else if(i<6){
					tr2.append(td);
				}
			}  
			
			$("table#pickTbl").append($("<caption>").html($("<h3>").html("오성티켓 PICK"))); 
			$("table#pickTbl").append(tr1); 
			$("table#pickTbl").append(tr2); 
		}
	});
	
	
<%-- 		$("#searchBtn").on("click",e=>{
			let perfName=$("input[name=perfSearch]").val();
			if(perfName.length==0){
				alert('등록하실 공연이름을 입력해주세요.');
				return;
			}
			console.log(perfName);
			$.ajax({
				url:"<%=request.getContextPath()%>/admin/perfSearch", 
				data:{"name":perfName,"cate":cate},
				dataType:"html",
				success: function(data){ 
					$("#searchResult").html(data);
					
				}
			});
		}); --%>
		
	
		
})


    
</script>


<section>
<%-- 
	<%if(loginMember!=null&&loginMember.getManagerYn().equals("Y")){%> 
		<div id="searchDiv">
			<input type="search" name="perfSearch" id="perfSearch">
			<button id="searchBtn">검색</button>
			<div id="searchResult"></div>
		</div>
 	<%} %> --%>


<div id="pick">
	<table id="pickTbl">
	</table>
</div>
</section>

<%@ include file="/views/common/footer.jsp"%>