<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.fs.model.vo.Review" %>
<%
	List<Review> list = (List)request.getAttribute("rvList");
	String perfName = (String)request.getAttribute("perfName");
	String pN[] = perfName.split(",");
%>
<style>
/* 	table, th, td{
		border: 1px solid black;
	}
	table{
		width: 90%;
		position:relative;
		left:20px;
		top:20px;
	} */
	td{
		text-align:center;
	}
	#reviews{
		width: 90%;
		position:relative;
		left:20px;
		top:50px;
	}
	table{
		width: 750px;
	}
	table, th, td{
		border: 3px solid gainsboro;
		padding:15px;
	}
	tr{
		height:80px;
	}
	td{
		background-color:white;
	}
	th{
		width:80px;
		background-color:ghostwhite;
	}
	.button{
		position:relative;
		left:250px;
		top:50px;
		background-color:lightpink;
		border:3px solid gainsboro;
		font-size:15px;
		padding:10px;
		border-radius:10px;
		font-weight: bold;
	}
	#quit{
		position:relative;
		left:280px;
	}
	input{
		border: 3px solid gainsboro;
	}
	span{
		font-size: 10px;
	}
	
</style>

<section id="reviews">
	<h1>나의 리뷰</h1>
	<%-- <h1><%=m.getMemberName() %></h1> --%>
	<table id="bookTBL">
		<thead>
		<tr>
			<th>공연명</th>
			<th>리뷰 내용</th>
			<th>리뷰 점수</th>
			<th>리뷰 날짜</th>								
		</tr>	
		</thead>
		<tbody>
		<%if(list.isEmpty()){ %>    
			<tr>
				<td colspan="6">조회된 리뷰내역이 없습니다</td>
			</tr>
		<%}else{
				for(int i = 0; i < list.size(); i++){
			%>
			<tr>
				<td><%=pN[i] %></td>
				<td><%=list.get(i).getRevContent() %></td>
				<td><%=list.get(i).getRevScore() %></td>
				<td><%=list.get(i).getRevDate() %></td>
			</tr>
		<%}
		}%>
		
           </tbody>
	</table>
	

</section>