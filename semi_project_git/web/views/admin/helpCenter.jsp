<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<%@ page import="java.util.List, com.fs.model.vo.FAQ"%>
<%@ page import="com.fs.model.vo.Inquiry" %>

<%
   List<FAQ> list = (List)request.getAttribute("FAQ");
	List<Inquiry> list2 = (List)request.getAttribute("Inquiry");
%>

<style>
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
	.nodata{
		font-family:"Noto Sans KR";
		font-size:14px;
		padding:70px 0 20px 0;
	}
	.btn{
		margin-top:10px;
		border:1px solid grey;
		
	}
	
</style>

<section>
<%--   <div>
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
  </div> --%>


  <div id="wrap-inquiry">
	  <h2>1:1 문의내역</h2>
	  <input type="button" onclick="fn_inquiry();" class="btn" value="문의하기">
	  <div id="inquiry-container">
	    <table id="tbl-inquiry">
	    	<tr>
		      <%if(list2.isEmpty()) {%>
		      	<tr>
		      		<p class="nodata">문의하신 내역이 없습니다.<br>
		      		오성티켓에 대한 모든 궁금증은 1:1 문의하기로 부담없이 확인하세요.
		      		</p>
		      	</tr>
		    <%}else{
		          for (Inquiry iq : list2) {%>
		        <tr>  
			      	<td><%=iq.getInqTitle() %></td>
			      	<td><%=iq.getInqContent() %></td>
			      	<td><%=iq.getInqDate() %></td>
	        	</tr>
		      	<%}
		    }%>   
	    </table>  
	  </div>
  </div>  

</section>

<script>
  //1:1 문의하기로 이동
  function fn_inquiry() {
    const url = "<%=request.getContextPath()%>/admin/inquiry?memberNo=<%=loginMember.getMemberNo()%>";
    const status = "top=100px, left=300px, width=600px, height=400px";
    open(url, "", status);
  }

</script>


<%@ include file="/views/common/footer.jsp" %>