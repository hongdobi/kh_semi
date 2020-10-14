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
    <title>1:1 문의 답변화면</title>
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
    textarea{
      font-family:Noto Sans KR;
      font-weight: 300;
    }
 </style>
  
  <body>
    <section>
      <form name="" action="<%=request.getContextPath()%>/admin/inquiryViewEnd" method="post">
        <div>
        <h2>1:1문의 답변화면</h2>
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
            <tr>
              <th>파일첨부</th>
              	<%if(iq.getInqFileName()!=null) {%>
              		<td><a href="<%=request.getContextPath()%>/admin/inquiryFileDownload?fileName=<%=iq.getInqFileName()%>">
              			<img src="<%=request.getContextPath() %>/image/file.png" width="25" height="25"><%=iq.getInqFileName()%></a>
              		</td>
              	<%}else {%>
              		<td>첨부파일이 없습니다</td>
              	<%} %>
            </tr>
            <%if(iq.getInqAnswer()!=null) {%>
	            <tr>
	              <th>답변</th>
            		<td><%=iq.getInqAnswer() %></td>
	            </tr>
            <%}else{ %>
            	<tr>
            		<th>답변</th>
	              <td>
	              	<textarea rows="15" cols="50" name="inqAnswer" placeholder="답변을 작성해주세요" onKeyUp="javascript:fnChkByte(this,'1000')"></textarea>
	              	<span id="byteInfo">0</span> 1000bytes
	              </td>
            	</tr>
           	<%} %>  
          </table>
        </div>
        <br>
        <div>
        	<input type="hidden" name="inqNo" value="<%=iq.getInqNo() %>">
        	<input type="hidden" name="inqYn" value="<%=iq.getInqYn() %>">
          <div id="btn-submit">
            <input type="button" value="닫기" onclick="self.close();"/>
            <%if(iq.getInqAnswer()==null) {%>
              <input type="submit" value="등록"/>
            <%} %>
          </div>  
        </div>
      </form>
    </section>
  </body>
  
  <script>
    // Byte 수 체크 제한
    function fnChkByte(obj, maxByte) {
      var str = obj.value;
      var str_len = str.length;
      var rbyte = 0;
      var rlen = 0;
      var one_char = "";
      var str2 = "";

      for(var i = 0; i<str_len; i++) {
        one_char = str.charAt(i);
        if(escape(one_char).length > 4) {
          rbyte += 2; //한글2Byte
        }else{
          rbyte++; //영문 등 나머지 1Byte
        }

        if(rbyte <= maxByte){
          rlen = i + 1; //return할 문자열 갯수
        }
      }

      if(rbyte > maxByte) {
        // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
        alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.");
        str2 = str.substr(0, rlen); //문자열 자르기
        obj.value = str2;
        fnChkByte(obj, maxByte);
      }else{
        document.getElementById("byteInfo").innerText = rbyte;
      }
    }
  </script>
</html>