<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,com.fs.model.vo.Performance" %>
    
<%
	ArrayList<Performance> list = (ArrayList)request.getAttribute("list");
	String keyword = (String)request.getAttribute("keyword");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>
	  <div class="container">
    <div class="area-top">
      <div class="inner">
        <h2>검색 결과</h2>
        <%if(list.size()>0){ %>
        <p><span class="word-search">'<%=keyword %>'</span>에 대한 검색결과 '<%=list.size() %>'건 입니다.</p>
        <div class="box-input">
          <input type="text" placeholder="검색어를 입력하세요">
          <button class="btn-search">search</button>
        </div>
      </div>
    </div>
    <div class="area-contents">
      <div class="inner">
        <dl class="list-result">
          <dt class="title-result"><h3>연극</h3></dt>
          <%for(Performance p : list) {%>
          	<%if(p.getPerfNo().substring(0,1).equals("S")){ %>
          <dd class="detail-result">
            <div class="box-poster">
              <img src="/semiproject/image/perf/<%=p.getPerfNo()%>/<%=p.getPerfPoster() %>" alt="">
            </div>
            <div class="box-text">
              <h4><%=p.getPerfName() %></h4>
              <p><%=p.getPerfPg() %>세 이상</p>
            </div>
          </dd>
            <%} %>
          <%} %>
          <dt class="title-result"><h3>뮤지컬</h3></dt>
          <%for(Performance p : list) {%>
          	<%if(p.getPerfNo().substring(0,1).equals("M")){ %>
          <dd class="detail-result">
            <div class="box-poster">
              <img src="/semiproject/image/perf/<%=p.getPerfNo()%>/<%=p.getPerfPoster() %>" alt="">
            </div>
            <div class="box-text">
              <h4><%=p.getPerfName() %></h4>
              <p><%=p.getPerfPg() %>세 이상</p>
            </div>
          </dd>
            <%} %>
          <%} %>
          <dt class="title-result"><h3>전시</h3></dt>
          <%for(Performance p : list) {%>
          	<%if(p.getPerfNo().substring(0,1).equals("E")){ %>
          <dd class="detail-result">
            <div class="box-poster">
              <img src="/semiproject/image/perf/<%=p.getPerfNo()%>/<%=p.getPerfPoster() %>" alt="">
            </div>
            <div class="box-text">
              <h4><%=p.getPerfName() %></h4>
              <p><%=p.getPerfPg() %>세 이상</p>
            </div>
          </dd>
            <%} %>
          <%} %>
        </dl>
      </div>
    </div>
  </div>
  <%} else{%>
	  <p><span class="word-search">'<%=keyword %>'</span>에 대한 검색결과 '<%=list.size() %>'건 입니다.</p>
        <div class="box-input">
          <input type="text" placeholder="검색어를 입력하세요">
          <button class="btn-search">search</button>
        </div>
      </div>
    </div>
    <div class="area-contents">
      <div class="inner">
        <dl class="list-result">
          <dd class="detail-result">
            <div class="box-poster">
            </div>
            <div class="box-text">
              <h4>검색 결과가 없습니다.</h4>
            </div>
          </dd>
        </dl>     
      </div>
    </div>
  </div>
   <%} %>
<%@ include file="/views/common/footer.jsp" %>
</body>
<style>
    body, html, div,h1,h2,h3,h4,p,dl,dt,dd{margin: 0; padding: 0}
    button{appearance: none; background-color: transparent; border: none;}
    h3{margin-top: 20px;}
    /* top  */
    .area-top{
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      height: 300px;
      background-color: salmon;
      text-align: center;
    }
    .area-top h2 + p{margin-top: 20px; font-size: 20px;}
    .area-top p .word-search{font-size: 1.3em; font-weight: bold;}
    .area-top .box-input{display: flex; justify-content: center; margin-top: 20px;}
    .area-top .box-input input{width: 240px; padding: 10px; border: 1px solid #ccc;}
    .area-top .box-input .btn-search{padding: 10px; background-color: #fff; border: 1px solid #ccc;}
    .area-top .box-input input + .btn-search{margin-left: 10px;}

    /* contents */
    .area-contents{padding: 70px 0;}
    .area-contents .inner{width: 1120px; margin: 0 auto;}
    .area-contents .list-result .title-result{padding-bottom: 15px; font-size: 24px; border-bottom: 1px solid #ccc;}
    .area-contents .list-result .detail-result{display: flex; padding: 20px 0;}
    .area-contents .list-result .detail-result .box-poster{ width: 200px; height: 250px; }
    .area-contents .list-result .detail-result .box-text{display: flex; flex-direction: column; flex: 1; justify-content: center;  margin-left: 100px;}
    .area-contents .list-result .detail-result .box-text h4{font-size: 20px;}
    .area-contents .list-result .detail-result .box-text h4 + p{margin-top: 10px;}
  </style>
</html>