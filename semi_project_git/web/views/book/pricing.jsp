<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int netDiscount=Integer.parseInt((request.getAttribute("netDiscount")).toString());
	int chargedPrice=Integer.parseInt((request.getAttribute("chargedPrice")).toString());
%>  


<div id="ajax_div">
	<div id="pay_detail">
	    <table>
	        <tr>
	            <th>할인금액</th>
	            <td id="promotion"><%=netDiscount %>원</td>
	        </tr>
	        <!-- <tr>
	            <th>포인트</th>
	            <td>0</td>
	        </tr> -->
	        <tr>
	            <th>총 할인금액(-)</th>
	            <% int netPrice=chargedPrice-netDiscount; %>
	            <td id="netP"><%=netPrice %>원</td>
	        </tr>
	    </table>
	</div>            
	<div id="total_pay">
	    <span>최종 결제금액</span>&nbsp;<span><%=netPrice %>원</span>
	</div>
</div>