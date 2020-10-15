<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,com.fs.model.vo.Performance,java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" %>

<%
	ArrayList<Performance> list = (ArrayList)request.getAttribute("list");
	String keyword = (String)request.getAttribute("keyword");
	int m = 0;
	int s = 0;
	int e = 0;
	boolean b = false;
	Date now = new Date();
	
	if(list!=null){
		for(Performance p : list){
			if(p.getPerfNo().substring(0,1).equals("M")){
				m++;
			}else if(p.getPerfNo().substring(0,1).equals("S")){
				s++;
			}else{
				e++;
			}
		}
	}
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
        <%if(list.size()>0){ %>
    <div class="area-top">
      <div class="inner">
        <h2>검색 결과</h2>
        <p><span class="word-search">'<%=keyword %>'</span>에 대한 검색결과 '<%=list.size() %>'건 입니다.</p>
        <p></p>
        <div class="box-input">
        <form action="<%=request.getContextPath()%>/search.do">
          <input type="text" name="keyword"placeholder="검색어를 입력하세요">
          <button class="btn-search" type="submit">search</button>
          </form>
        </div>
      </div>
    </div>
    <div class="area-contents">
      <div class="inner">
        <dl class="list-result">
          <dt class="title-result">
            <h3>연극(<%=s %>건)</h3>
          </dt>
          <%for(Performance p : list) {%>
          <%if(p.getPerfNo().substring(0,1).equals("S")){ %>
          <dd class="detail-result">
            <div class="box-poster">
              <a href="<%=request.getContextPath() %>/perf/perfView?perfNo=<%=p.getPerfNo()%>">
                <img src="<%=request.getContextPath() %>/image/perf/<%=p.getPerfNo()%>/<%=p.getPerfPoster() %>" alt="" class="poster">
              </a>
            </div>
            <div class="box-text">
              <div class="wrap-text main">
              <%if(now.getTime()<p.getPerfEnd().getTime()){ %>
                <span class="visitable">판매중</span>
              <%}else { %>
              	<span class="unvisitable">판매종료</span>
              <%} %>
              <a href="<%=request.getContextPath() %>/perf/perfView?perfNo=<%=p.getPerfNo()%>">
                <h4>[연극]<%=p.getPerfName() %></h4>
                <p><%=p.getPerfPg() %>세 이상</p>
              </a>
              </div>
              <div class="wrap-text sub">
                <p><%=p.getPerfStart() %> - <%=p.getPerfEnd()%></p>
              </div>
              <div class="wrap-text sub">
                <p><%=p.getPerfAddress() %></p>
              </div>
            </div>
          </dd>
          <%} %>
          <%} %>
          <dt class="title-result">
            <h3>뮤지컬(<%=m %>건)</h3>
          </dt>
          <%for(Performance p : list) {%>
          <%if(p.getPerfNo().substring(0,1).equals("M")){ %>
          <dd class="detail-result">
            <div class="box-poster">
              <a href="<%=request.getContextPath() %>/perf/perfView?perfNo=<%=p.getPerfNo()%>">
                <img src="<%=request.getContextPath() %>/image/perf/<%=p.getPerfNo()%>/<%=p.getPerfPoster() %>" alt="" class="poster">
              </a>
            </div>
            <div class="box-text">
              <div class="wrap-text main">
                <%if(now.getTime()<p.getPerfEnd().getTime()){ %>
                <span class="visitable">판매중</span>
              <%}else { %>
              	<span class="unvisitable">판매종료</span>
              <%} %>
                <a href="<%=request.getContextPath() %>/perf/perfView?perfNo=<%=p.getPerfNo()%>">
                <h4>[뮤지컬]<%=p.getPerfName() %></h4>
                <p><%=p.getPerfPg() %>세 이상</p>
              </a>
              </div>
              <div class="wrap-text sub">
                <p><%=p.getPerfStart() %> - <%=p.getPerfEnd()%></p>
              </div>
              <div class="wrap-text sub">
                <p><%=p.getPerfAddress() %></p>
              </div>
            </div>
          </dd>
          <%} %>
          <%} %>
          <dt class="title-result">
            <h3>전시(<%=e %>건)</h3>
          </dt>
          <%for(Performance p : list) {%>
          <%if(p.getPerfNo().substring(0,1).equals("E")){ %>
          <dd class="detail-result">
            <div class="box-poster">
              <a href="<%=request.getContextPath() %>/perf/perfView?perfNo=<%=p.getPerfNo()%>">
                <img src="<%=request.getContextPath() %>/image/perf/<%=p.getPerfNo()%>/<%=p.getPerfPoster() %>" alt="" class="poster">
              </a>
            </div>
            <div class="box-text">
              <div class="wrap-text main">
              <%if(now.getTime()<p.getPerfEnd().getTime()){ %>
                <span class="visitable">판매중</span>
              <%}else { %>
              	<span class="unvisitable">판매종료</span>
              <%} %>
                <a href="<%=request.getContextPath() %>/perf/perfView?perfNo=<%=p.getPerfNo()%>">
                <h4>[전시]<%=p.getPerfName() %></h4>
                <p><%=p.getPerfPg() %>세 이상</p>
              </a>
              </div>
              <div class="wrap-text sub">
                <p><%=p.getPerfStart() %> - <%=p.getPerfEnd()%></p>
              </div>
              <div class="wrap-text sub">
                <p><%=p.getPerfAddress() %></p>
              </div>
            </div>
          </dd>
          <%} %>
          <%} %>
        </dl>
      </div>
    </div>
  </div>
<%} else{%>
 <div class="area-top">
      <div class="inner">
        <h2>검색 결과</h2>
        <p><span class="word-search">'<%=keyword %>'</span>에 대한 검색결과가 없습니다.</p>
        <p></p>
        <div class="box-input">
        <form action="<%=request.getContextPath()%>/search.do">
          <input type="text" name="keyword"placeholder="검색어를 입력하세요">
          <button class="btn-search" type="submit">search</button>
          </form>
        </div>
      </div>
  </div>
  
<%} %>
<%@ include file="/views/common/footer.jsp" %>
</body>
<style>
    body{
	    font-family: 'Noto Sans KR';
    }
    .area-top{
    	padding-top: 105px;
    }
  body, html, div,h1,h2,h3,h4,p,dl,dt,dd{margin: 0; padding: 0}
  button{appearance: none; background-color: transparent; border: none;}
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
  .visitable{color: orange; margin-bottom:10px;height: 5px; border:1px solid orange;}
  .unvisitable{color: gray; margin-bottom:10px;height: 5px; border:1px solid gray;}
  .area-top h2 + p{margin-top: 20px; font-size: 20px; color:white;}
  .area-top p .word-search{font-size: 1.3em; font-weight: bold;}
  .area-top .box-input{display: flex; justify-content: center; margin-top: 20px;}
  .area-top .box-input input{width: 240px; padding: 10px; border: 1px solid #ccc; }
  .area-top .box-input .btn-search{padding: 10px; background-color: #fff; border: 1px solid #ccc;}
  .area-top .box-input input + .btn-search{margin-left: 10px;}

  /* contents */
  .area-contents{padding: 70px 0;}
  .area-contents .inner{width: 1120px; margin: 0 auto;}
  .list-result .title-result{padding-bottom: 15px; font-size: 24px; border-bottom: 1px solid #ccc;}
  .list-result .detail-result + .title-result{margin-top: 80px;}
  .list-result .detail-result{display: flex; padding: 20px 0; border-top: 1px lightpink solid; border-bottom: 1px lightpink solid;}
  .list-result .title-result + .detail-result{border-top-width: 2px;}
  .list-result .detail-result .box-poster{width: 120px; margin-right: 40px;}
  .list-result .detail-result .box-poster img{width: 100%;}
  
  /* text 영역 */
  .detail-result .box-text{display: flex; align-items: center; flex: 1;}
  .detail-result .box-text p{line-height: 1.5;}
  .detail-result .box-text .wrap-text{word-break: keep-all;}
  .detail-result .box-text .wrap-text.main{width: 40%;}
  .detail-result .box-text .wrap-text.sub{flex: 1; text-align: center;}
  .detail-result .box-text h4{font-size: 20px; margin-top:10px}
  .detail-result .box-text h4 + p{margin-top: 10px;}
</style>

</html>