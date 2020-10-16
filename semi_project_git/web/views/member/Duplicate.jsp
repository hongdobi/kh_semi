<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fs.model.vo.Member" %>
<%
	String str = (String)request.getAttribute("str");
%>

<span><%=str %></span>

<style>
span{
      font-family: "Noto Sans KR";
      font-size: 0.7rem;
      font-weight: 300;
      letter-spacing: 0.15rem;
      color:lightcoral;
}
</style>
