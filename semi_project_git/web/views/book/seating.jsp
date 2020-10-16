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
                <img src="<%=request.getContextPath() %>/image/logo_book.png" alt="오성티켓" id="logo" width="208" height="55">
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
                        <img src="<%=request.getContextPath() %>/image/seat-image.gif" alt="공연배치도" id="seat-img" height="430">
                        <%-- <img src="<%=request.getContextPath() %>/image/seat-img.jpg" alt="공연배치도" id="seat-img" height="440"> --%>
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
                            <input class="btn" type="button" value="이전화면" onclick="fn_alert();">
                            <input class="btn" type="reset" value="좌석 다시선택">
                        </div>
                        <script>
                        	function fn_alert(){
                        		alert("서비스 준비중에 있습니다.");
                        	}
                        </script>
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
	                           <!-- 첫번쨰 select 열을 선택하면 두번째 select option을 조정할 수 있을까? -->                       
	                           <select name="seat_row<%=no %>" id="seat_row<%=no %>" class="seat_pick">
	                               <%-- <option value="<%=n열 %>">n열</option> --%>
	                               <option value="" selected disabled hidden>열 선택</option>
	                               <%
	                               		int n=66;
	                               		for(int j=0;j<18;j++){
	                               			n++;
	                               			char r=(char)n;
	                               %>
	                               <option value="<%=r %>"><%=r %>열</option>
	                               <%	} %>
	                           </select>
	                           <script>
	                           		$("#seat_row"+<%=no %>).change(e=>{
	                           			let r=$(e.target).val().substring(0,1);
	                        			let num;	                        			
	                        			switch(r){
		                               		case "C":num=28;for(let z=1;z<=num;z++){$("#seat_column"+<%=no %>).append($("<option value="+z+">"+z+"번"+"</option>"));};break;
		                               		case "D":num=28;for(let z=1;z<=num;z++){$("#seat_column"+<%=no %>).append($("<option value="+z+">"+z+"번"+"</option>"));};break;
		                               		case "E":num=30;for(let z=1;z<=num;z++){$("#seat_column"+<%=no %>).append($("<option value="+z+">"+z+"번"+"</option>"));};break;
		                               		case "F":num=30;for(let z=1;z<=num;z++){$("#seat_column"+<%=no %>).append($("<option value="+z+">"+z+"번"+"</option>"));};break;
		                               		case "G":num=32;for(let z=1;z<=num;z++){$("#seat_column"+<%=no %>).append($("<option value="+z+">"+z+"번"+"</option>"));};break;
		                               		case "H":num=32;for(let z=1;z<=num;z++){$("#seat_column"+<%=no %>).append($("<option value="+z+">"+z+"번"+"</option>"));};break;
		                               		case "I":num=27;for(let z=1;z<=num;z++){$("#seat_column"+<%=no %>).append($("<option value="+z+">"+z+"번"+"</option>"));};break;
		                               		case "J":num=34;for(let z=1;z<=num;z++){$("#seat_column"+<%=no %>).append($("<option value="+z+">"+z+"번"+"</option>"));};break;
		                               		case "K":num=36;for(let z=1;z<=num;z++){$("#seat_column"+<%=no %>).append($("<option value="+z+">"+z+"번"+"</option>"));};break;
		                               		case "L":num=36;for(let z=1;z<=num;z++){$("#seat_column"+<%=no %>).append($("<option value="+z+">"+z+"번"+"</option>"));};break;
		                               		case "M":num=38;for(let z=1;z<=num;z++){$("#seat_column"+<%=no %>).append($("<option value="+z+">"+z+"번"+"</option>"));};break;
		                               		case "N":num=38;for(let z=1;z<=num;z++){$("#seat_column"+<%=no %>).append($("<option value="+z+">"+z+"번"+"</option>"));};break;
		                               		case "O":num=38;for(let z=1;z<=num;z++){$("#seat_column"+<%=no %>).append($("<option value="+z+">"+z+"번"+"</option>"));};break;
		                               		case "P":num=38;for(let z=1;z<=num;z++){$("#seat_column"+<%=no %>).append($("<option value="+z+">"+z+"번"+"</option>"));};break;
		                               		case "Q":num=38;for(let z=1;z<=num;z++){$("#seat_column"+<%=no %>).append($("<option value="+z+">"+z+"번"+"</option>"));};break;
		                               		case "R":num=38;for(let z=1;z<=num;z++){$("#seat_column"+<%=no %>).append($("<option value="+z+">"+z+"번"+"</option>"));};break;
		                               		case "S":num=31;for(let z=1;z<=num;z++){$("#seat_column"+<%=no %>).append($("<option value="+z+">"+z+"번"+"</option>"));};break;
		                               		case "T":num=16;for(let z=1;z<=num;z++){$("#seat_column"+<%=no %>).append($("<option value="+z+">"+z+"번"+"</option>"));};break;	                               			
	                               		}
	                           		});
	                           		
	                           </script>
	                           <select name="seat_column<%=no %>" id="seat_column<%=no %>" class="seat_pick">
	                               <%-- <option value="<%=nn번 %>">nn번</option> --%>
	                               <option value="" selected disabled hidden>좌석선택</option>	                               
	                               <!-- <option value="19">10열 19번</option>
	                               <option value="20">10열 20번</option>
	                               <option value="21">10열 21번</option>
	                               <option value="22">10열 22번</option>	 -->                               
	                           </select>	                           
	                           <script>	                           	                           		
		                           $("#seat_column"+<%=no %>).change(e=>{	                           		
		                       		let pInfo='<%=perf.getPerfPriceInfo() %>'.split('@');
			                       	console.log(pInfo);	
		                       		let rArray=[];
		                       		let cArray=[];  
		                       		let no=0;
		                       		let t=0;
		                       		for(let i=0;i<<%=nofTicket%>;i++){
		                       			no++;
		           	            		rArray.push($("#seat_row"+no).val());
		           	            		cArray.push($("#seat_column"+no).val());		           	            		
		                       		}
		                      			for(let i=0;i<<%=nofTicket%>;i++){
		                      				t++;
			           	           			if(pInfo.length==6){
			           	           				if(rArray[i]=='C'&&cArray[i]>8&&cArray[i]<21){
			           	           					$(e.target).parent().append($("<input type='hidden' name='priceInfo"+t+"' value='OP'>"));
			           	           				}else if(rArray[i]=='D'&&cArray[i]>5&&cArray[i]<24||rArray[i]=='E'&&cArray[i]>6&&cArray[i]<25||rArray[i]=='F'&&cArray[i]>6&&cArray[i]<25||rArray[i]=='G'&&cArray[i]>7&&cArray[i]<26){
			           	           					$(e.target).parent().append($("<input type='hidden' name='priceInfo"+t+"' value='VIP'>"));
			           	           				}else if(rArray[i]=='C'&&(cArray[i]<9||cArray[i]>20)||rArray[i]=='D'&&(cArray[i]<6||cArray[i]>23)||rArray[i]=='E'&&(cArray[i]<7||cArray[i]>24)||
			           	           						rArray[i]=='F'&&(cArray[i]<7||cArray[i]>24)||rArray[i]=='G'&&(cArray[i]<8||cArray[i]>25)||rArray[i]=='H'||rArray[i]=='I'){
			           	           					$(e.target).parent().append($("<input type='hidden' name='priceInfo"+t+"' value='R'>"));
			           	           				}else if(rArray[i]=='J'||rArray[i]=='K'||rArray[i]=='L'){
			           	           					$(e.target).parent().append($("<input type='hidden' name='priceInfo"+t+"' value='S'>"));
			           	           				}else if(rArray[i]=='M'||rArray[i]=='N'||rArray[i]=='O'||rArray[i]=='P'){
			           	           					$(e.target).parent().append($("<input type='hidden' name='priceInfo"+t+"' value='A'>"));
			           	           				}else if(rArray[i]=='Q'||rArray[i]=='R'||rArray[i]=='S'||rArray[i]=='T'){
			           	           					$(e.target).parent().append($("<input type='hidden' name='priceInfo"+t+"' value='B'>"));
			           	           				}
			           	           			}else if(pInfo.length==5){
			           	           				if(rArray[i]=='C'||rArray[i]=='D'||rArray[i]=='E'||rArray[i]=='F'){
			           	           					$(e.target).parent().append($("<input type='hidden' name='priceInfo"+t+"' value='VIP'>"));
			           	           				}else if(rArray[i]=='G'||rArray[i]=='H'||rArray[i]=='I'){
			           	           					$(e.target).parent().append($("<input type='hidden' name='priceInfo"+t+"' value='R'>"));
			           	           				}else if(rArray[i]=='J'||rArray[i]=='K'||rArray[i]=='L'){
			           	           					$(e.target).parent().append($("<input type='hidden' name='priceInfo"+t+"' value='S'>"));
			           	           				}else if(rArray[i]=='M'||rArray[i]=='N'||rArray[i]=='O'||rArray[i]=='P'){
			           	           					$(e.target).parent().append($("<input type='hidden' name='priceInfo"+t+"' value='A'>"));
			           	           				}else if(rArray[i]=='Q'||rArray[i]=='R'||rArray[i]=='S'||rArray[i]=='T'){
			           	           					$(e.target).parent().append($("<input type='hidden' name='priceInfo"+t+"' value='B'>"));
			           	           				}
			           	           			}else if(pInfo.length==4){
			           	           				if(rArray[i]=='C'||rArray[i]=='D'||rArray[i]=='E'||rArray[i]=='F'){
			           	           					$(e.target).parent().append($("<input type='hidden' name='priceInfo"+t+"' value='VIP'>"));
			           	           				}else if(rArray[i]=='G'||rArray[i]=='H'||rArray[i]=='I'){
			           	           					$(e.target).parent().append($("<input type='hidden' name='priceInfo"+t+"' value='R'>"));
			           	           				}else if(rArray[i]=='J'||rArray[i]=='K'||rArray[i]=='L'||rArray[i]=='M'||rArray[i]=='N'){
			           	           					$(e.target).parent().append($("<input type='hidden' name='priceInfo"+t+"' value='S'>"));
			           	           				}else if(rArray[i]=='O'||rArray[i]=='P'||rArray[i]=='Q'||rArray[i]=='R'||rArray[i]=='S'||rArray[i]=='T'){
			           	           					$(e.target).parent().append($("<input type='hidden' name='priceInfo"+t+"' value='A'>"));
			           	           				}
			           	           			}else if(pInfo.length==3){
			           	           				if(rArray[i]=='C'||rArray[i]=='D'||rArray[i]=='E'||rArray[i]=='F'||rArray[i]=='G'||rArray[i]=='H'||rArray[i]=='I'){
			           	           					$(e.target).parent().append($("<input type='hidden' name='priceInfo"+t+"' value='R'>"));
			           	           				}else if(rArray[i]=='J'||rArray[i]=='K'||rArray[i]=='L'||rArray[i]=='M'||rArray[i]=='N'){
			           	           					$(e.target).parent().append($("<input type='hidden' name='priceInfo"+t+"' value='S'>"));
			           	           				}else if(rArray[i]=='O'||rArray[i]=='P'||rArray[i]=='Q'||rArray[i]=='R'||rArray[i]=='S'||rArray[i]=='T'){
			           	           					$(e.target).parent().append($("<input type='hidden' name='priceInfo"+t+"' value='A'>"));
			           	           				}
			           	           			}else if(pInfo.length==2){
			           	           				if(rArray[i]=='C'||rArray[i]=='D'||rArray[i]=='E'||rArray[i]=='F'||rArray[i]=='G'||rArray[i]=='H'||rArray[i]=='I'){
			           	           					$(e.target).parent().append($("<input type='hidden' name='priceInfo"+t+"' value='R'>"));
			           	           				}else {
			           	           					$(e.target).parent().append($("<input type='hidden' name='priceInfo"+t+"' value='S'>"));
			           	           				}
			           	           			}else{
			           	           				$(e.target).parent().append($("<input type='hidden' name='priceInfo"+t+"' value='Free'>"));
			           	           			}           				
		                      			}
		                      				                           				                           		
		                      		});
	                           </script>	                           
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
        max-height:670px;
            max-width:980px;
            width:auto;
            height:auto;
        }
        #headerMenu{
            margin-left:90px;	       	        	        
        }
        #headerMenu li{
            color:white;
            background-color:rgb(85, 82, 82);
            opacity:0.8;
            display:inline-block;
            border-radius: 5px;
            justify-content: center;
            text-align: center;
            padding-left:26px;
            padding-right:26px;
            padding-top:14px;
            padding-bottom:14px;
            margin-right:10px;	        
        }
        #showStepDiv{
            display:flex;
            margin-bottom:-8px;
        }
        #showStepTitle{
            padding-top:14px;
            padding-bottom:5px;
            padding-left:23px;	        
            margin-left: 60px;
            background-color:white;
            font-weight: bolder;  
            font-size:16px;         
            border-radius: 4px;
            height:30px;
            width:146px; 
            margin-top:4px;          
        }
        #date_choice_div{
            margin-left:250px;
            color:rgba(240, 255, 255, 0.829);
            font-size:17px;
            margin-top:-34px;
        }
        #date_choice{
            margin-left:8px;
            margin-right:50px;
            font-size:14px;
        }
        #ssn_choice{
            margin-left:5px;
            font-size:16px;
        }
        #seats{
            display:flex;
        }
        #seat_choice_div{
            margin-left:60px;
            margin-bottom:30px;
            width:470px;
            height:440px;
            /* background-color: aliceblue; */
        }
        #seats>div:nth-child(2){
            margin-left:20px;
        }
        #seats>div:last-child{
            /* background-color: aqua; */
            margin-left:12px;
            margin-right:10px;
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
            margin-left:10px;
            background-color: rgb(85, 82, 82);
            opacity:0.8;
            width:200px;
            height:310px;
            color:rgba(240, 255, 255, 0.829);
            text-align: center;
            padding-top:3px;
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
            font-size: 14px;
            border-radius: 4px;
        }
        #submit{
            margin-top:8px;
            padding:12px;
            padding-left:57px;
            padding-right:57px;
            background-color:dodgerblue;
            color:azure;
            font-size: 14px;
            border-radius: 4px;
        }
    </style>

</body>
</html>