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
    <title>1:1 문의</title>
  </head>
  
 <style>
    ul>li{
      list-style-type:none;
    }
    	div#wrap-inquiry{
		margin: 0 auto;
    	padding: 57px 0 60px;
    	border: solid 1px #d8d8d8;
    	background-color: #fff;
	}
	div#inquiry-container{
		width:500px;
		height:200px;
		text-align:center;
		border-radius:3px;
		background-color: #f8f8f8;
	}
	table#tbl-inquiry tr td{
		text-align:center;
	}
 </style>
  
  <body>
    <section>
      <form name="" action="<%=request.getContextPath()%>/admin/inquiryViewEnd" method="post">
        <div>
          <ul>
            <li>평일 오후 5시 이후 문의는 당일 답변이 어려울 수 있습니다.</li>
            <li>토,일요일 및 공휴일 문의는 평일 운영 시간 내 순차적으로  답변드리겠습니다.</li>
          </ul>
        </div>
        <div name="request_table" id="request-table">
          <table border="1">
            <tr>
              <td>문의유형</td>
              <td><%=iq.getInqCategory() %></td>
            </tr>
            <tr>
              <td>문의 제목</td>
              <td><%=iq.getInqTitle() %></td>
            </tr>
            <tr>
              <td>문의 내용</td>
              <td><%=iq.getInqContent() %></td>
                <ul>
                  <li>문의 내용을 구체적으로 작성해주시기 바랍니다. 정확하고 빠른 답변에 도움이 됩니다.</li>
                  <li>주민등록번호를 포함한 개인정보는 꼭 필요한 경우가 아닌 경우 기재를 삼가하시길 바랍니다</li>
                </ul>
              </td>
            </tr>
            <tr>
              <td>파일첨부</td>
              <td>
                <input type="file" id="fileName" name="fileName" accept="image/png",image/jpeg>
                <ul>
                  <li>첨부가능 파일 확장자 : jpg,jpeg</li>
                  <li>첨부파일 중 개인 정보가 포함되어있는 파일은 상담 외의 목적으로는 사용되지 않습니다.</li>
                </ul>
              </td>
            </tr>
            <%if(iq.getInqAnswer()!=null) {%>
	            <tr>
	              <td>답변</td>
            		<td><%=iq.getInqAnswer() %></td>
	            </tr>
            <%}else{ %>
            	<tr>
            		<td>답변</td>
	              <td>
	              	<textarea rows="15" cols="60" name="inqAnswer" placeholder="답변을 작성해주세요" onKeyUp="javascript:fnChkByte(this,'1000')"></textarea>
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
          <input type="button" value="닫기" onclick="self.close();"/>
          <input type="submit" value="등록"/>
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



    });//function 끝
  </script>
</html>