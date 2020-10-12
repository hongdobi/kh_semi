<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ 
	page import="java.util.Date, com.fs.model.vo.Performance, com.fs.model.vo.PerfSsn,
				java.util.List, java.text.SimpleDateFormat" 
%>

<%
	Performance perf=(Performance)request.getAttribute("perf");
	List<PerfSsn> list=(List)request.getAttribute("list");
	int memberNo=Integer.parseInt((request.getAttribute("memberNo")).toString());
	String perfNo=(String)request.getAttribute("perfNo");
	Date bookDate=(Date)request.getAttribute("bookDate");
	int nofTicket=Integer.parseInt((request.getAttribute("nofTicket")).toString());
	SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
	SimpleDateFormat sdf2=new SimpleDateFormat("YYYY-MM-dd");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Step 2 좌석선택</title>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
    <div id="container">
        <header>
        </header>
        <section>
            <form action="<%=request.getContextPath() %>/book/promo" method="post">
                <img src="<%=request.getContextPath() %>/image/logo_book.png" alt="오성티켓" id="logo" width="250" height="66">
                <!-- 여기엔 공연시작/종료날 불러오면됨 -->
                <div id="date_choice_div">           
                    관람일 변경 <input type="date" id="date_choice" name="date_choice" value="<%=sdf2.format(bookDate) %>" max="<%=perf.getPerfEnd() %>" 
                    <%
                		int com=perf.getPerfStart().compareTo(new Date());
			      		if(com<0){ 
			    	%>
                    	min="<%=new Date()%>">&nbsp;&nbsp;
                    <%}else { %>
                    	min="<%=perf.getPerfStart()%>">&nbsp;&nbsp;
                    <%} %>
                    회차변경 <select name="ssn_choice" id="ssn_choice">               
                    <%if(list!=null) {
                 		int n=0;
                 		for(PerfSsn ssn: list) {
                 			n++;
		            %>
                        <option value="<%=n%>회차 <%=sdf.format(ssn.getDateTime())%>" 
                        <%=sdf.format(bookDate).equals(sdf.format(ssn.getDateTime()))?"selected":"" %>><%=n%>회차 <%=sdf.format(ssn.getDateTime())%></option>                    
                    	<%} %>
                    <%} %>
                    </select>
                </div>
                <nav>
                    <ul id="headerMenu">
                        <li>step 1<br>관람일/회차</li>
                        <li>step 2<br>좌석선택</li>
                        <li>step 3<br>할인선택</li>
                        <li>step 4<br>수령방법</li>
                        <li>step 5<br>결제방법</li>
                    </ul>
                </nav>
        
                <div id="showStepDiv">
                    <p id="showStepTitle">좌석선택</p>
                </div>
                <div id="seats">
                    <div id="seat_choice_div">
                        <!-- 여기 각 row마다 for문 - div늘려  -->
                        <%-- <div class="s0 or s1" id="10001<%=seatNo%>" name="seat" value="<%=r%>열 <%=n%>번" grade=""></div> --%>
                        <img src="<%=request.getContextPath() %>/image/seat-img.jpg" alt="공연배치도" id="seat-img" height="440">
                    </div>
                    <!-- 좌석 좍 나온다음에 -->
                    <div>
                        <div id="seat_desc">좌석등급/가격
                            <div id="seat_rank">  
                            	<ul>
                                <% for(String price:perf.getPerfPriceInfo().split("@")) {%>
                                	<li><%=price %></li>
                                <%} %>
                                </ul>
                            </div>                           
                        </div>                        
                        <div id="btns">
                            <input class="btn" type="button" value="이전화면" onclick="location.assign('<%=request.getContextPath()%>/book/booking')">
                            <input class="btn" type="reset" value="좌석 다시선택">
                        </div>
                        <div>
                            <input type="submit" id="submit" value="좌석선택 완료" onclick="return fn_checkSeat();">
                        </div>
                    </div>
                    <div>
                    	<div>                    	
                    	<%
                    		int no=0;
                    		for(int i=0;i<nofTicket;i++){ 
                    			no++;
                    	%>
                    		<div>
	                           <span>좌석선택</span><br>	                           
	                           <select name="seat_row<%=no %>" id="seat_row<%=no %>" class="seat_pick">
	                               <%-- <option value="<%=n열 %>">n열</option> --%>
	                               <option value="" selected disabled hidden>열 선택</option>
	                               <option value="10">10열</option>
	                           </select>
	                           <select name="seat_column<%=no %>" id="seat_column<%=no %>" class="seat_pick">
	                               <%-- <option value="<%=nn번 %>">nn번</option> --%>
	                               <option value="" selected disabled hidden>좌석선택</option>
	                               <option value="19">19번</option>
	                               <option value="20">20번</option>
	                               <option value="21">21번</option>
	                               <option value="22">22번</option>
	                           </select>	                           
	                   		</div>
                   		<%} %>        
                       </div>
                       <input type="hidden" name="nofTicket" value="<%=nofTicket %>">
                       <input type="hidden" name="memberNo" value="<%=memberNo %>">
                       <input type="hidden" name="perfNo" value="<%=perfNo %>">                      
                    </div>
                </div>
            </form>
            <script>                   	
            	function fn_checkSeat() {
            		let rArray=[];
            		let cArray=[];  
            		let no=0;
            		for(let i=0;i<<%=nofTicket%>;i++){
            			no++;
	            		rArray.push($("#seat_row"+no).val());
	            		cArray.push($("#seat_column"+no).val());            			
            		}
            		console.log(rArray);
            		console.log(cArray);           
            		if(rArray.includes(null)||cArray.includes(null)) {
            			alert("좌석을 선택해주세요");
            			return false;
            		}     		
            	}
            </script>
        </section>
    </div>
    <style>
        #container{
            background-image:url('<%=request.getContextPath() %>/image/curtain.jpg');
            background-size:contain;
            min-width:1000px;
        }
        #headerMenu{
            margin-left:350px;
            margin-bottom:-5px;
        }
        #headerMenu li{
            color:white;
            background-color:rgb(85, 82, 82);
            opacity:0.8;
            display:inline-block;
            border-radius: 5px;
            justify-content: center;
            text-align: center;
            padding-left:40px;
            padding-right:40px;
            padding-top:20px;
            padding-bottom:20px;
            margin-right:7px;
        }
        #showStepDiv{
            display:flex;
            margin-bottom:-8px;
        }
        #showStepTitle{
            padding-top:15px;
            padding-bottom:3px;
            padding-left:35px;
            margin-left: 376px;
            background-color:white;
            font-weight: bolder;
            font-size:17px;
            border-radius: 4px;
            height:36px;
            width:107px;
        }
        #date_choice_div{
            margin-left:480px;
            color:rgba(240, 255, 255, 0.829);
            font-size:17px;
            margin-top:-28px;
        }
        #date_choice{
            margin-left:8px;
            margin-right:50px;
            font-size:14px;
        }
        #ssn_choice{
            margin-left:8px;
            font-size:16px;
        }
        #seats{
            display:flex;
        }
        #seat_choice_div{
            margin-left:376px;
            margin-bottom:30px;
            width:470px;
            height:440px;
            background-color: aliceblue;
        }
        #seats>div:nth-child(2){
            margin-left:15px;
        }
        #seats>div:last-child{
            /* background-color: aqua; */
            margin-left:12px;
            color:white;
            opacity:0.8;
            height:292px;
        }
        #seats>div:last-child>div{
            background-color:rgb(85, 82, 82);
            padding:3px;
        }
        #seats>div:last-child>div>div{
            margin:8px;
            padding:7px;
            border: 1px lightgray solid;
        }
        #seat_desc{
            margin-left:20px;
            background-color: rgb(85, 82, 82);
            opacity:0.8;
            width:200px;
            height:302px;
            color:rgba(240, 255, 255, 0.829);
            text-align: center;
            padding-top:10px;
        }      
        #seat_rank>ul li{
        	list-style: square;
            font-size:14px;
        }
        #seat_desc div:last-child{
            margin-top:10px;
            margin:8px;
            height:220px;
            text-align:left;
            border:1px darkgray solid;
        }
        #seat_desc div:last-child>span{
            color:aliceblue;
        }
        .seat_pick{
            font-size:14px;
        }
        #btns{
            margin-top:20px;
        }
        .btn{
            padding:12px;
            background-color:antiquewhite;
            font-size: 16px;
            border-radius: 4px;
        }
        #submit{
            margin-top:8px;
            padding:12px;
            padding-left:61px;
            padding-right:61px;
            background-color:dodgerblue;
            color:azure;
            font-size: 16px;
            border-radius: 4px;
        }
    </style>

</body>
</html>