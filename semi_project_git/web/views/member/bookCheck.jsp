<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<%
	String memberNo = (String)session.getAttribute("memberNo");
%>
<section id="bookings">
	<h1><%=memberNo %></h1>
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
            <%-- <%if(list.isEmpty()) {%>
            	<tr>
            		<td colspan="9">조회되 회원이 없습니다!</td>
            	</tr>
            <%}else{ 
            	for(Member m : list){
            %>
				<tr>
					<td><%=m.getUserId() %></td>
					<td><%=m.getUserName() %></td>
					<td><%=m.getGender() %></td>
					<td><%=m.getAge() %></td>
					<td><%=m.getEmail() %></td>
					<td><%=m.getPhone() %></td>
					<td><%=m.getAddress() %></td>
					<td><%=m.getHobby() %></td>
					<td><%=m.getEnrollDate() %></td>
				</tr>
			<%} 
			}%> --%>
            </tbody>
	</table>
	

</section>