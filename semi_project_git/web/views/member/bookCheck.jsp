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
	#bookings{
		width: 90%;
		position:relative;
		left:20px;
		top:50px;
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

<section id="bookings">
	<h1><%=m.getMemberName() %>님</h1>
	<form action="<%=request.getContextPath() %>/member/cancel" method="post">
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
					
					<td><%=list.get(i).getBookNo() %><input type="hidden" name="bookNo" id="bookNo"></td>
					<td><%=list.get(i).getBookDate() %></td>
					<td><%=pN[i] %></td>
					<td><%=list.get(i).getPerfDate() %></td>
					<td><%=list.get(i).getBuyTicket() %></td>
					<td><%=list.get(i).getBookYn() %></td>
					<td><input type="submit" id="cancel" value="취소"></td>
				</tr>
			
		<%}
		}%>
		
           </tbody>
	</table>
	</form>
	

</section>

<script>
	$("#cancel").click(e=>{
		let bookNo=$(e.target).closest("tr").find("td:eq(0)").text();
		alert("예매를 취소하시겠습니까?");
		$("#bookNo").val(bookNo);
		
	});
	
</script>