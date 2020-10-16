<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.fs.model.vo.Performance, com.fs.model.vo.PerfSsn, com.fs.model.vo.Booking, com.fs.model.vo.Seat,
				java.util.List" %>

<%
	Performance perf=(Performance)session.getAttribute("perf");
	List<PerfSsn> list=(List)session.getAttribute("list");
	Booking book=(Booking)session.getAttribute("book");
	Seat seat=(Seat)session.getAttribute("seat");
	String dateChoice=(String)request.getAttribute("dateChoice");
	String ssnChoice=(String)request.getAttribute("ssnChoice");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Step 3 할인선택</title>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
    <div id="cover">
        <div id="container">        
            <header>
                <img src="<%=request.getContextPath() %>/image/logo_book.png" alt="오성티켓" id="logo" width="208" height="55">
                <nav>
                    <ul id="headerMenu">
                        <li>step 1<br>관람일/회차</li>
                        <li>step 2<br>좌석선택</li>
                        <li>step 3<br>할인선택</li>
                        <li>step 4<br>수령방법</li>
                        <li>step 5<br>결제방법</li>
                    </ul>
                </nav>     
            </header>
            <section>
                <div id="showStepDiv">
                    <p id="showStepTitle">할인선택</p>
                </div>
                <form action="<%=request.getContextPath() %>/book/taking_tickets" method="post">
                    <div id="rank_choice">등급선택
                        <div id="box">                        
                            <input type="radio" value="<%=seat.getSeatRank()%>" checked> 좌석등급: <%=seat.getSeatRank() %>석                       
                        </div>
                    </div>
                    <div id="rank_desc">
                        <table>
                            <thead>
                                <tr>
                                    <th>할인명</th>
                                    <th>할인금액</th>
                                    <th>매수</th>
                                    <th>비고</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="radio" name="discount" class="yesDiscount" id="r1" value="14000"> <label for="r1">국가유공자 할인</label></td>
                                    <td>14,000</td>
                                    <td>
                                        <%-- <input type="number" name="notk" id="tNo1" min="0" max="<%=book.getBuyTicket() %>" step="1" value="0"> --%>
                                        <select name="notk" id="tNo1" disabled>
                                        	<option value="" selected disabled hidden>매수</option>
                                        <%
                                        	int n=0;
                                    		for(int i=0;i<book.getBuyTicket();i++){
                                    			n++;
                                        %>
                                        	<option value="<%=n %>"><%=n %>매</option>
                                        <%                                        	
                                    		}
                                        %>
                                        </select>
                                    </td>
                                    <td>현장수령 시 증명서류 제시에 한 함</td>
                                </tr>
                                <tr>
                                    <td><input type="radio" name="discount" class="yesDiscount" id="r2" value="8000"> <label for="r2">노인/학생할인</label></td>
                                    <td>8,000</td>
                                    <td>
                                        <%-- <input type="number" name="notk" id="tNo2"  min="0" max="<%=book.getBuyTicket() %>" step="1" value="0"> --%>
                                        <select name="notk" id="tNo2" disabled>
                                        	<option value="" selected disabled hidden>매수</option>
                                        <%
                                        	int m=0;
                                    		for(int i=0;i<book.getBuyTicket();i++){
                                    			m++;
                                        %>
                                        	<option value="<%=m %>"><%=m %>매</option>
                                        <%                                        	
                                    		}
                                        %>
                                        </select>
                                    </td>
                                    <td>
						                                        노인) 만 65세 이상<br>
						                                        학생) 만 19세 이하
                                    </td>
                                </tr>
                                <tr>                                                                
                                    <td><input type="radio" name="discount" id="noDiscount" value="0"> <label for="noDiscount">해당없음</label></td>                                                                
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                        <script>
                        	$(function(){
                        		$("#r1").click(e=>{
                        			$("#tNo1").focus();
                        			$("#tNo2").val(0);
                        			$("#tNo2").attr('disabled',true);
                        			$("#tNo1").attr('disabled',false);
                        			$.ajax({
                        				url:"<%=request.getContextPath()%>/book/pricing",
                        				data:{"discount":0,"notk":0,"chargedPrice":$("#chargedPrice").html()},//서버에 전달할 데이터 자바스크립트 객체형식으로 보냄{key:value...}
                        				type:"get",
                        				dataType:"html",
                        				success:data=>{
                        					$("#ajax_div").html(data);                        					
                        				},
                        				error:(request,status,error)=>{
                        					console.log(request);
                        					console.log(status);
                        					console.log(error);
                        				}
                        			});
                        		});
                        		$("#r2").click(e=>{
                        			$("#tNo2").focus();
                        			$("#tNo1").val(0);
                        			$("#tNo1").attr('disabled',true);
                        			$("#tNo2").attr('disabled',false);
                        			$.ajax({
                        				url:"<%=request.getContextPath()%>/book/pricing",
                        				data:{"discount":0,"notk":0,"chargedPrice":$("#chargedPrice").html()},//서버에 전달할 데이터 자바스크립트 객체형식으로 보냄{key:value...}
                        				type:"get",
                        				dataType:"html",
                        				success:data=>{
                        					$("#ajax_div").html(data);                        					
                        				},
                        				error:(request,status,error)=>{
                        					console.log(request);
                        					console.log(status);
                        					console.log(error);
                        				}
                        			});
                        		});
                        		$("#noDiscount").click(e=>{
                        			$("#tNo1").val(0);
                        			$("#tNo2").val(0);
                        			$("#tNo1").attr('disabled',true);
                        			$("#tNo2").attr('disabled',true);
                        			$.ajax({
                        				url:"<%=request.getContextPath()%>/book/pricing",
                        				data:{"discount":0,"notk":0,"chargedPrice":$("#chargedPrice").html()},//서버에 전달할 데이터 자바스크립트 객체형식으로 보냄{key:value...}
                        				type:"get",
                        				dataType:"html",
                        				success:data=>{
                        					$("#ajax_div").html(data);                        					
                        				},
                        				error:(request,status,error)=>{
                        					console.log(request);
                        					console.log(status);
                        					console.log(error);
                        				}
                        			});
                        		});                        		
                       			$("#tNo1").change(e=>{
                        			$.ajax({
                        				url:"<%=request.getContextPath()%>/book/pricing",
                        				data:{"discount":$("#r1").val(),"notk":$("#tNo1").val(),"chargedPrice":$("#chargedPrice").html()},//서버에 전달할 데이터 자바스크립트 객체형식으로 보냄{key:value...}
                        				type:"get",
                        				dataType:"html",
                        				success:data=>{
                        					$("#ajax_div").html(data);                        					
                        				},
                        				error:(request,status,error)=>{
                        					console.log(request);
                        					console.log(status);
                        					console.log(error);
                        				}
                        			});                        				
                       			});
                       			$("#tNo2").change(e=>{
                        			$.ajax({
                        				url:"<%=request.getContextPath()%>/book/pricing",
                        				data:{"discount":$("#r2").val(),"notk":$("#tNo2").val(),"chargedPrice":$("#chargedPrice").html()},//서버에 전달할 데이터 자바스크립트 객체형식으로 보냄{key:value...}
                        				type:"get",
                        				dataType:"html",
                        				success:data=>{
                        					$("#ajax_div").html(data);                        					
                        				},
                        				error:(request,status,error)=>{
                        					console.log(request);
                        					console.log(status);
                        					console.log(error);
                        				}
                        			});                        				
                       			}); 
                        	});
                        </script>
                        <!-- <div id="seat_desc">좌석등급/가격
                            <div id="seat_rank">

                            </div>
                        </div> -->
                    </div>
                    <input type="submit" id="btn" onclick="return fn_checkSelect();" value="다음으로">
                    <script>
                    	function fn_checkSelect(){
                    		if(!($("input[name=discount]")).is(':checked')){
                    			alert("할인을 선택해주세요! 할인사항이 없으시다면 해당없음을 선택해주세요.")
                    			return false;
                    		}else {
                    			if($(".yesDiscount").is(':checked')&&$(".yesDiscount:checked").parent().next().next().children().val()==null){
	                    			alert("매수를 선택해주세요 ");
	                    			return false;
                    			}
                    		}
                    	}
                    </script>
                    <input type="hidden" name="dateChoice" value="<%=dateChoice %>">
                    <input type="hidden" name="ssnChoice" value="<%=ssnChoice %>">
                </form>
            </section>
        </div>
        <div id="super">
        <%-- <form action="<%=request.getContextPath() %>/book/taking_tickets" method="post"> --%>
            <div id="show_title">
                <img src="<%=request.getContextPath() %>/image/perf/<%=perf.getPerfNo() %>/<%=perf.getPerfPoster() %>" alt="공연포스터" id="poster" width="100" height="140" >
                <div>
                    <h4><%=perf.getPerfName() %></h4>
                    <p><%=dateChoice%></p>
                    <p><%=ssnChoice%></p>
                </div>
            </div>
            <div id="s_record">
                <h4>선택내역</h4>
                <table>
                    <tr>
                        <th>날짜</th>
                        <td><%=dateChoice%></td>
                    </tr>
                    <tr>
                        <th>시간</th>
                        <td><%=ssnChoice%></td>
                    </tr>
                    <tr>
                        <th>매수</th>
                        <td><%=book.getBuyTicket()%>매</td>
                    </tr>
                    <tr>
                        <th>좌석</th>
                        <td><%=seat.getSeatChoice()%></td>
                    </tr>
                </table>
            </div>
            <div id="p_record">
                <h4>결제내역</h4>
                <table>
                    <tr>
                        <th>티켓금액</th>
                        <td><%=book.getTotalPrice() %>원</td>
                    </tr>
                    <tr>
                        <th>예매수수료</th>
                        <%
                        	int charge=book.getBuyTicket()*1000;
                        %>
                        <td><%=charge%>원</td>
                    </tr>
                    <tr>
                        <th>총 금액(+)</th>
                        <%
                        	int chargedPrice=book.getTotalPrice()+charge;
                        %>
                        <td id="chargedPrice"><%=chargedPrice %>원</td>
                    </tr>                    
                </table>
            </div>
            <div id="ajax_div">
	            <div id="pay_detail">
	                <table>
	                    <tr>
	                        <th>할인금액</th>
	                        <td id="promotion">0원</td>
	                    </tr>
	                    <!-- <tr>
	                        <th>포인트</th>
	                        <td>0</td>
	                    </tr> -->
	                    <tr>
	                        <th>총 할인금액(-)</th>
	                        <% int netPrice=chargedPrice-0; %>
	                        <td id="netP"><%=netPrice %>원</td>
	                    </tr>
	                </table>
	            </div>            
	            <div id="total_pay">
	                <span>최종 결제금액</span>&nbsp;<span><%=netPrice %>원</span>
	            </div>            
            </div>
	    <!-- </form> -->
        </div>
    </div>
    <style>
        #cover{
            display:inline-flex;
        }
        #super{            
            height:700px;
            width:310px;                     
            background-image:url('<%=request.getContextPath() %>/image/curtain.jpg');
            background-size:cover;
            border-left:2px rgb(85, 82, 82) solid;        
        }
        img#poster{
        	margin-top:20px;
        	margin-right:15px;
        	margin-left:10px;
        }
        #super h4, #super td{
            color:azure;
        }
        #super table{
            font-size:13px;
        }
        #super th{
        	text-align:left;
        }
        #super td{
            padding-left:60px;
            border-bottom: none;
        }       
        #super div{
            border-top:2px rgb(85, 82, 82) solid;
            width:300px;
            margin-top:5px;
        }
        div#ajax_div{
        	border-top:none;
        }            
        #show_title{
            display:flex;
            color:aliceblue;                       
        }
        #show_title p{
            font-size:13px;
        }
        #show_title>div{
        	border-top:none;
        }
        div#p_record>table tr td:last-child{
        	text-align:right;
        	padding-left:130px;
        }
        div#pay_detail>table tr td:last-child{
        	text-align:right;
        	padding-left:110px;
        }
        div#pay_detail{
        	border-top:2px rgb(85, 82, 82) dotted;
        }
        div#total_pay{
            border:1px rgb(85, 82, 82) solid; 
            width:260px;
            padding:12px;
            margin:10px; 
            color:azure;   
        }
        div#total_pay>span:last-child{
            font-weight: bolder;
            font-size:20px;
            margin-left:55px;
        }    
        #container{
            background-image:url('<%=request.getContextPath() %>/image/curtain.jpg');
            background-size:contain;
            min-width:1000px;
        }
        #headerMenu{
            margin-left:350px;
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
        #rank_choice{
            padding-left: 10px;
            padding-top:15px;
            padding-bottom: 15px;
            margin-left:376px;
            background-color:white;
            font-weight: bolder;
            border-radius: 4px;
            display:inline-block;
            width:700px;
        }
        #box{
            margin-left: 15px;
            padding-left: 5px;
            padding-top:8px;
            padding-bottom: 8px;
            background-color:cornsilk;
            display:inline-block;
            width:600px;
        }
        #rank_desc{
            display:flex;
        }
        #rank_desc table{
            border-collapse: collapse;
            margin-top:10px;
            margin-left:376px;
            width:710px;
        }
        #rank_desc thead{
            background-color: aliceblue;
        }
        #rank_desc tbody{
            background-color: white;
            text-align:center;
            opacity: 0.7;
        }
        #rank_desc tbody tr td:first-child{
            text-align: justify;
            padding-left:10px;
        }
        #rank_desc tbody td{
            border-bottom: 1px antiquewhite solid;
        }
        #rank_desc tbody tr{
            height:70px;
        }
        #seat_desc{
            margin-left:20px;
            background-color: rgb(85, 82, 82);
            opacity:0.8;
            width:160px;
            height:240px;
            color:rgba(240, 255, 255, 0.829);
            text-align: center;
            padding-top:3px;
        }
        #seat_rank{
            margin:8px;
            height:194px;
            border: 1px lightgray solid;
            text-align: left;
        }
        #btn{
            padding:15px;
            padding-left:50px;
            padding-right:50px;
            background-color: dodgerblue;
            color:azure;
            font-size: 16px;
            border-radius: 4px;
            margin-left:670px;
            margin-top:25px;
            margin-bottom:20px;
        }
    </style>
</body>
</html>