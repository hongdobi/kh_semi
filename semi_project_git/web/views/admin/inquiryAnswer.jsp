<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fs.model.vo.Inquiry" %>    
<%
	Inquiry iq = (Inquiry)request.getAttribute("inquiry");
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css"></link>
    <script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
    <title>1:1 문의 답변</title>
  </head>
  
 <style>
    h2{
      font-family:Noto Sans KR;
      /* font-weight: 300; */
    }
    table#table-inquiry{
      width:100%;
      border:1px solid grey;
      border-collapse: collapse;
      font-family:Noto Sans KR;
      font-weight: 300;
    }
    table#table-inquiry th{
      font-size:15px;
      border:1px solid grey;
      text-align: center;
      width:15%;
      padding:7px 0;
    }
    table#table-inquiry td{
      font-size:15px;
      border:1px solid grey;
      padding:7px;
    }
    #btn-submit{
      margin:auto;
      text-align: center;
    }
 </style>
  
  <body>
    <section>
        <div>
			<h2>1:1 문의내역</h2>
        </div>
        <div name="wrap-inquiry" id="wrap-inquiry">
          <table id="table-inquiry">
            <tr>
              <th>문의유형</th>
              <td><%=iq.getInqCategory() %></td>
            </tr>
            <tr>
              <th>문의 제목</th>
              <td><%=iq.getInqTitle() %></td>
            </tr>
            <tr>
              <th>문의 내용</th>
              <td><%=iq.getInqContent() %></td>
            </tr>
            <%if(iq.getInqAnswer()!=null) {%>
	            <tr>
	              <th>답변</th>
            		<td><%=iq.getInqAnswer() %></td>
	            </tr>
            <%}else{ %>
            	<tr>
            		<th>답변</th>
	              <td>답변이 등록되지 않았습니다</td>
            	</tr>
           	<%} %>  
          </table>
        </div>
        <br>
        <div id="btn-submit">
        	<input type="hidden" name="inqNo" value="<%=iq.getInqNo() %>">
        	<input type="hidden" name="inqYn" value="<%=iq.getInqYn() %>">
          <input type="button" value="닫기" onclick="self.close();"/>
        </div>
    </section>
  </body>
  
</html>