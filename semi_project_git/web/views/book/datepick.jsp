<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.fs.model.vo.PerfSsn, java.text.SimpleDateFormat" %>

<%
	List<PerfSsn> list=(List)request.getAttribute("list");
	SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
%>


<div id="ajax_div">
<select id="select_ticket" name="nofTicket">
          <option value="" selected disabled hidden>매수를 선택하세요</option>
          <option value="1">1매</option>
          <option value="2">2매</option>
          <option value="3">3매</option>
          <option value="4">4매</option>
      </select>  
	<%if(list!=null) {
		int n=0;
		for(PerfSsn ssn: list) {
			n++;
	%>
   <input type="submit" class="ssn_blank" name="dateTime" value="<%=n%>회차 <%=sdf.format(ssn.getDateTime())%>"
   onclick="return fn_checkTicket();">
   <%-- <input type="button" onclick="switchClass();" class="ssn_blank" value="<%=ssn.getDateTime()%>"> --%>
   	<%} %>
   <%} %>
   
</div>



