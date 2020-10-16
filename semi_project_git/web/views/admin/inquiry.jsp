<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fs.model.vo.Member" %>    
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
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
    select#inqCategory{
      font-family:Noto Sans KR;
      font-weight: 300;
    }
    p{
      font-size:14px;
      font-family:Noto Sans KR;
      font-weight: 300;
    }
    #btn-submit{
      margin:auto;
      text-align: center;
    }
    input[type=text]{
      font-family:Noto Sans KR;
      font-weight: 300;
    }
    textarea{
      font-family:Noto Sans KR;
      font-weight: 300;
    }
  </style>
  
  <body>
    <section>
      <form action="<%=request.getContextPath()%>/admin/InquiryEnd" name="" method="post" enctype="multipart/form-data">
        <div>
          <h2>1:1 문의하기</h2>
            <p>평일 오후 5시 이후 문의는 당일 답변이 어려울 수 있습니다.</p>
            <p>토,일요일 및 공휴일 문의는 다음주 월요일 운영 시간 내 순차적으로 답변드리겠습니다.</p>
        </div>
        <div name="wrap-inquiry" id="wrap-inquiry">
          <table id="table-inquiry">
            <tr>
              <th>문의유형</th>
              <td>
                <select id="inqCategory" name="inqCategory">
                  <option value="회원정보">회원정보</option>
                  <option value="공연정보">공연정보</option>
                  <option value="주문/결제">주문/결제</option>
                  <option value="취소/반품">취소/반품</option>
                  <option value="기타">기타</option>
                </select>
              </td>
            </tr>
            <tr>
              <th>문의 제목</th>
              <td><input type="text" name="inqTitle" placeholder="문의제목을 입력해주세요"></td>
            </tr>
            <tr>
              <th>문의 내용</th>
              <td>
                <textarea rows="15" cols="50" name="inqContent" placeholder="문의내용을 입력해주세요" onKeyUp="javascript:fnChkByte(this,'1000')"></textarea>
                <span id="byteInfo">0</span> 1000bytes
                  <p>문의 내용을 구체적으로 작성해주시기 바랍니다.</p>
                  <p>정확하고 빠른 답변에 도움이 됩니다.</p>
                  <p>주민등록번호를 포함한 개인정보는 꼭 필요한 경우가 아닌 경우 기재를 삼가하시길 바랍니다.</p>
              </td>
            </tr>
            <tr>
              <th>파일첨부</th>
              <td>
                <input type="file" id="inqFileName" name="inqFileName">
                  <p>첨부파일 중 개인 정보가 포함되어있는 파일은 상담 외의 목적으로는 사용되지 않습니다.</p>
                  <p>최대 파일 크기는 10MB입니다.</p>
              </td>
            </tr>
          </table>
        </div>
        <br>
        <div id="btn-submit">
          <input type="hidden" value="<%=loginMember.getMemberNo() %>" name="memberNo">
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

    $(function(){
      $("#inqCategory").change(function(){
        var inqCategory = $(this).val();
      }); 


    });//function 끝
  </script>
</html>
