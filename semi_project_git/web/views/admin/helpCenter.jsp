<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<%@ page import="java.util.List, com.fs.model.vo.FAQ"%>
<%
   List<FAQ> list = (List)request.getAttribute("FAQ");
%>

<style>
input [id*="answer"] {
  display: none;
}
input[type="checkbox"] {
  display: none;
}
input[id*="answer"] + label {
  display: block;
  padding: 20px;
  border: 1px solid blueviolet;
  border-bottom: 0;
  color: whitesmoke;
  font-weight: 900;
  background-color: pink;
  cursor: pointer;
  position: relative;
}
input[id*="answer"] + label + div {
  max-height: 0;
  transition: all 0.35s;
  overflow: hidden;
  background: peru;
  font-size: 11px;
}
input[id*="answer"] + label + div p {
  display: inline-block;
  padding: 20px;
}
input[id*="answer"]:checked + label + div {
  max-height: 100px;
}
input[id*="answer"]:checked + label em {
  background-position: 0 -30px;
}

</style>
    <section>
      <div>
        <h1 align="center">고객센터</h1>
      </div>
      <div class="accordion">
        <div class="tab">
          <ul class="menus1">
            <li class="on"><a href="#a">전체</a></li>
            <li><a href="#a">주문</a></li>
            <li><a href="#a">배송</a></li>
            <li><a href="#a">취소/교환/반품</a></li>
            <li><a href="#a">회원정보</a></li>
          </ul>
        </div>
      </div>  
          
          
   <div id="faq-container">
      <div id="tbl-FAQ">
         <%if (list != null) {
            for (FAQ f : list) {%>
         <p><%=f.getFaqHashTag() %></p>
         <p><%=f.getFaqTitle() %></p>
         <p><%=f.getFaqContent() %></p>
            <%}
         }%>
      </div>
   </div>
<!-- </section>    -->
          
        
        <!-- 타입 radio 로 할지, checkbox로 할지 ?  -->
        <!-- <div class="tabs type1">
        <input type="checkbox" name="accordion" id="answer01" />
        <label for="answer01"> 컨텐츠 제목 부분</a></label>
        <div><p>여기에 추가된는 부분이 자주 묻는 질문의 답변 내용</p></div>
        </div>
        <div class="munutab">
        <input type="checkbox" name="accordion" id="answer02" />
        <label for="answer02">컨텐츠 제목 부분</label>
        <div><p>여기에 추가된는 부분이 자주 묻는 질문의 답변 내용</p></div>
      </div>
      <div class="munutab">
        <input type="checkbox" name="accordion" id="answer03" />
        <label for="answer03">컨텐츠 제목 부분</label>
        <div><p>여기에 추가된는 부분이 자주 묻는 질문의 답변 내용</p></div>
        </div>
        <div class="munutab">
        <input type="checkbox" name="accordion" id="answer04" />
        <label for="answer04">컨텐츠 제목 부분</label>
        <div><p>여기에 추가된는 부분이 자주 묻는 질문의 답변 내용</p></div>
        </div>
      </div> -->


<div class="accordion">
        <h2>1:1 문의내역</h2>
        <input type="button" value="1:1 문의하기">타입 radio 로 할지, checkbox로 할지 ? 
        <input type="checkbox" name="accordion" id="answer1" />
        <label for="answer1">컨텐츠 제목 부분</label>
        <div><p>여기에 추가된는 부분이 자주 묻는 질문의 답변 내용</p></div>
        <input type="checkbox" name="accordion" id="answer2" />
        <label for="answer2">컨텐츠 제목 부분</label>
        <div><p>여기에 추가된는 부분이 자주 묻는 질문의 답변 내용</p></div>
        <input type="checkbox" name="accordion" id="answer3" />
        <label for="answer3">컨텐츠 제목 부분</label>
        <div><p>여기에 추가된는 부분이 자주 묻는 질문의 답변 내용</p></div>
        <input type="checkbox" name="accordion" id="answer4" />
        <label for="answer4">컨텐츠 제목 부분</label>
        <div><p>여기에 추가된는 부분이 자주 묻는 질문의 답변 내용</p></div>
      </div>
      </div>
    </section> -->
    
   <%@ include file="/views/common/footer.jsp" %>