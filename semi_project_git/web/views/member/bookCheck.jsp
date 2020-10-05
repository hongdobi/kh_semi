<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fs.model.vo.Booking, com.fs.model.vo.Member, java.util.List, java.util.Arrays" %>
 
<%
	List<Booking> list = (List)request.getAttribute("bookingList");
	Member m = (Member)session.getAttribute("loginMember");
	String perfName = (String)request.getAttribute("perfName");
	String pN[] = perfName.split(",");
%>
<style>
	table, th, td{
		border: 1px solid black;
	}
	table{
		width: 90%;
		position:relative;
		left:20px;
		top:20px;
	}
	td{
		text-align:center;
	}
</style>
<section id="bookings">
	<h1><%=m.getMemberName() %></h1>
	<table id="bookTBL">
		<thead>
		<tr>
			<th>예매번호</th>
			<th>예매날짜</th>
			<th>공연명</th>
			<th>관람일시</th>				
			<th>매수</th>			
			<th>예매상태</th>	
			<th>예매취소</th>	
		</tr>	
		</thead>
		<tbody>
		<%if(list.isEmpty()){ %>    
			<tr>
				<td colspan="7">조회된 예매내역이 없습니다</td>
			</tr>
		<%}else{
				for(int i = 0; i < list.size(); i++){
			%>
			<tr>
				<td><%=list.get(i).getBookNo() %></td>
				<td><%=list.get(i).getBookDate() %></td>
				<td><%=pN[i] %></td>
				<td><%=list.get(i).getPerfDate() %></td>
				<td><%=list.get(i).getBuyTicket() %></td>
				<td><%=list.get(i).getBookYn() %></td>
				<td><button onclick="cancel()">취소</button></td>
			</tr>
		<%}
		}%>
		
           </tbody>
	</table>
	

</section>

<script>
	function cancel(){
		alert("안됑 니 돈 내꺼");
	}
</script>