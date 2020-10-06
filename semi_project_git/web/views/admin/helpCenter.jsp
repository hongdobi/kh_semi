<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="java.util.List, com.fs.model.vo.FAQ,java.util.ArrayList"%>


<%
       List<FAQ> list = (List) request.getAttribute("FAQ");
%>
<style>
    .tabs {
        display: flex;
        flex-wrap: wrap;
        padding: 50px;
	   text-align: center;
	   margin: auto;
      } 
      
      .tabs label {
       width: 200px;
	padding: 12px;
	list-style-type: none;
	display: inline-block;
	font-size: 20px;
	border: 1px lightgray solid;
	text-align: center;
	cursor: pointer;     
	font-family: Noto Sans KR;   
      }
      
      
      .tab label:hover{
      clor:pink;
      opacity:1;
      transform:scale(1);
      }
      
      /*박스배경*/
      .tabs .tab {
        order: 99;
        flex-grow: 1;
        display: none;
        padding: 1rem;
        background: white;
      }
      .tabs input[type="radio"] {
        display: none;
      }
      .tabs input[type="radio"]:checked + label + .tab {
        display: block;
      }
      .tabs {
        display: flex;
        flex-wrap: wrap; 
      }
    
      /*박스배경*/
      .tabs .tab {
        order: 99;
        flex-grow: 1;
        width: 100%;
        display: none;
        padding: 1rem;
        background: white;
        text-align: center;
      }
      .tabs input[type="checkbox"] {
        display: none;
      }
      
    
      .tabs input[type="checkbox"]: label {
        background: pink;
        text-align: center;
      }
      .tabs input[type="checkbox"]:checked + label + .tab {
        display: block;
      }
    
  section#FAQ-container {   
  width: 600px;   margin: 0 auto;   
  text-align: center; height:575px; min-height: 100%; 
  position: relative; padding-bottom: 200px;}
   section#FAQ-container h2 {   margin: 10px 0;}
   div#faq-container{ width:100%;height:400px;}
   div#tbl-FAQ {width:60%; margin: 0 auto;   border: 1px solid ivory; border-collapse: collapse;}
   div#tbl-FAQ div, div#tbl-notice p {   border: 1px solid ivory;   padding: 5px 0;   text-align: center;}
   div#tbl-notice p{font-size: 50px;} 
   div#tbl-FAQ div, div#title{width:100%; height:30px; background-color: pink; cursor:pointer;}
   div#tbl-FAQ div+p{display:none; width:100%; height:auto; }
   

  
</style>
<script type="text/javascript">


   
$(function(){
	$("#faq-container div, div#title").click(function(){
		$("#faq-container p").slideUp("slow");
		if(!$(this).next().is(":visible"))
		{
			$(this).next().slideDown();
		}
	})
 

  
     $("input[name=tab]").click(e=>{
    	 let key=$(e.target).val();
    	 console.log(key);
		 location.href="<%=request.getContextPath()%>/admin/helpCenter?keyword="+key;

     });
   })
   
</script>


<section style="text-align:center; id="FAQ-container">
   <h2>자주하는 질문</h2>
   
   <div class="tabs">
   
      <input type="checkbox" name="tab" id="tab1" value="회원" checked />
      <label for="tab1"> 회원 </label>
      <div class="tab">
     
   
   <div id="faq-container">
      <div id="tbl-FAQ">
         <%if (list != null) {
            for (FAQ f : list) {%>
            <div id=title><%=f.getFaqTitle()%></div>
         <p class="content"><%=f.getFaqContent()%></p>
         
            <%}
         }%>
      </div>
   </div>
   
   </div>
   
   <input type="checkbox" name="tab" id="tab2" value="티켓수령" />
      <label for="tab2"> 티켓수령 </label>
      <div class="tab">
   
   <div id="faq-container">
      <div id="tbl-FAQ">
         <%if (list != null) {
            for (FAQ f : list) {%>
            <div><%=f.getFaqTitle()%></div>
         <p id=content><%=f.getFaqContent()%></p>
         
            <%}
         }%>
      </div>
   </div>
   
   </div>
   
    <input type="checkbox" name="tab" id="tab3" value="예매/결제" />
      <label for="tab3"> 예매/결제  </label>
      <div class="tab">
   
   <div id="faq-container">
      <div id="tbl-FAQ">
         <%if (list != null) {
            for (FAQ f : list) {%>
            <div><%=f.getFaqTitle()%></div>
         <p><%=f.getFaqContent()%></p>
         
            <%}
         }%>
      </div>
   </div>
   </div>
   
    <input type="checkbox" name="tab" id="tab4" value="취소/환불"  />
      <label for="tab4"> 취소/환불 </label>
      <div class="tab">
   
   <div id="faq-container">
      <div id="tbl-FAQ">
         <%if (list != null) {
            for (FAQ f : list) {%>
            <div><%=f.getFaqTitle()%></div>
         <p><%=f.getFaqContent()%></p>
         
            <%}
         }%>
      </div>
   </div>
   </div>
   
    <input type="checkbox" name="tab" id="tab5" value="기타" />
      <label for="tab5"> 기타 </label>
      <div class="tab">
   
   <div id="faq-container">
      <div id="tbl-FAQ">
         <%if (list != null) {
            for (FAQ f : list) {%>
            <div><%=f.getFaqTitle()%></div>
         <p><%=f.getFaqContent()%></p>
         
            <%}
         }%>
      </div>
   </div>
   
   </div> 
   
   </div>
   
</section>

   <%@ include file="/views/common/footer.jsp" %>