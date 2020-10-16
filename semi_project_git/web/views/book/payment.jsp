<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.fs.model.vo.Performance, com.fs.model.vo.PerfSsn, com.fs.model.vo.Booking, com.fs.model.vo.Seat,
				java.util.List" %>

<%
	Performance perf=(Performance)session.getAttribute("perf");
	List<PerfSsn> list=(List)session.getAttribute("list");
	Booking book=(Booking)session.getAttribute("book");
	Seat seat=(Seat)session.getAttribute("seat");
	String dateChoice1=(String)request.getAttribute("dateChoice1");
	String dateChoice2=(String)request.getAttribute("dateChoice2");
	String ssnChoice=(String)request.getAttribute("ssnChoice");
	int netDiscount=Integer.parseInt((request.getAttribute("netDiscount")).toString());	
%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Step 5 결제방법</title>
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
                    <p id="showStepTitle">결제방법</p>
                </div>
                <form action="<%=request.getContextPath() %>/book/bookingEnd" method="post">
                    <div id="pay_div">
                        <table>
                            <!-- <tr>
                                <td>                                
                                    <span>포인트</span>&nbsp;&nbsp;
                                    <input type="number" min="0" max="" name="point" value="">
                                    <input type="checkbox"> 전액사용
                                </td>
                            </tr> -->
                            <tr>
                                <td>
                                    <span>결제방법선택</span>&nbsp;&nbsp;
                                    <input type="radio" name="pay_method" id="p1" value="신용카드"><label for="p1">신용카드</label>
                                    <input type="radio" name="pay_method" id="p2" value="무통장 입금"><label for="p2">무통장 입금</label>&nbsp;
                                    <!-- <input type="text" list="bank_choice" placeholder="입금은행 선택"> -->
                                    <select name="bank_choice" id="bank_choice">
                                        <option value="" disabled selected>입금은행 선택</option>
                                        <option value="기업은행">기업은행</option>
                                        <option value="신한은행">신한은행</option>
                                        <option value="국민은행">국민은행</option>
                                        <option value="우리은행">우리은행</option>
                                        <option value="농협">농협</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <script>
	                        $(function(){
	                    		$("#p1").click(e=>{	                    			
	                    			$("#bank_choice").attr('disabled',true);	                    			
	                    		});
	                    		$("#p2").click(e=>{	                    			
	                    			$("#bank_choice").attr('disabled',false);	                    			
	                    		});;
	                        });
                        </script>
                    </div>
                    <div id="agree_div">
                        <input id="first_checkbox" type="checkbox"> <span><label for="first_checkbox">취소수수료 및 취소기한을 확인하였으며, 이에 동의합니다.</label></span>
                        <br>
                        <input id="third_party" type="checkbox"> <span><label for="third_party">제3자 정보제공 내용에 동의합니다.</label></span>
                    </div>
                    <input id="btn" type="submit" onclick="return fn_check();" value="결제하기">
                </form>
                <script>
                	function fn_check(){
                		if(!($("#p1").is(':checked')||$("#p2").is(':checked')&&$("#bank_choice").val()!=null)){
                			alert("결제방법을 선택해주세요. 무통장 입금 시, 입금은행을 꼭 선택해주세요");
                			return false;
                		}
                		if(!(($("#first_checkbox").is(':checked'))&&$("#third_party").is(':checked'))){
                			alert("필수 동의항목에 동의해주세요");
                			return false;
                		}
                	}
                </script>
                <div id="warning">
                    <div id="cancel_time_div">
                        <span>취소 가능 마감시간 :</span> <span><%=dateChoice2%> 17:00 까지</span>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>내용</th>
                                <th>취소수수료</th>
                                <th>비고</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>에매 후 7일 이내</td>
                                <td>없음</td>
                                <td rowspan="5">
                                    <ul>
                                        <li>취소 시 예매수수료는 예매 당일 밤 12시 이전까지만 환불됩니다.</li>
                                        <li>예매 후 7일 이내라도 취소시점이 관람일로부터 10일 이내라면 그에 해당하는 취소수수료가 부과됩니다.</li>
                                        <li>관람 당일 취소 가능 상품의 경우 관람 당일 취소 시 티켓금액의 90%가 취소수수료로 부과됩니다.</li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td>예매 후 8일 ~ 관람일 10일 전까지</td>
                                <td>
                                    뮤지컬: <b>장당 4000원</b> /<br>
                                    연극, 전시: <b>장당 2,000원</b><br>
                                    (단, 티켓 금액의 10% 이내)
                                </td>                       
                            </tr>
                            <tr>
                                <td>관람일 9일 전 ~ 관람일 7일 전까지</td>
                                <td>티켓 금액의 <b>10%</b></td>
                            </tr>
                            <tr>
                                <td>관람일 6일 전 ~ 관람일 3일 전까지</td>
                                <td>티켓 금액의 <b>20%</b></td>
                            </tr>
                            <tr>
                                <td>관람일 2일 전 ~ 관람일 1일 전까지</td>
                                <td>티켓 금액의 <b>30%</b></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
        <div id="super">
            <div id="show_title">
                <img src="<%=request.getContextPath() %>/image/perf/<%=perf.getPerfNo() %>/<%=perf.getPerfPoster() %>" alt="공연포스터" id="poster" width="100" height="140" >
                <div>
                    <h4><%=perf.getPerfName() %></h4>
                    <p><%=dateChoice1%></p>
                    <p><%=ssnChoice%></p>
                </div>
            </div>
            <div id="s_record">
                <h4>선택내역</h4>
                <table>
                    <tr>
                        <th>날짜</th>
                        <td><%=dateChoice1%></td>
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
                        <td><%=seat.getSeatChoice() %></td>
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
	                        <td id="promotion"><%=netDiscount %>원</td>
	                    </tr>
	                    <!-- <tr>
	                        <th>포인트</th>
	                        <td>0</td>
	                    </tr> -->
	                    <tr>
	                        <th>총 할인금액(-)</th>
	                        <% int netPrice=chargedPrice-netDiscount; %>
	                        <td id="netP"><%=netPrice %>원</td>
	                    </tr>
	                </table>
	            </div>            
	            <div id="total_pay">
	                <span>최종 결제금액</span>&nbsp;<span><%=netPrice %>원</span>
	            </div>            
            </div>            
        </div>
    </div>
    <style>
        #cover{
            display:inline-flex;
        }
        #super{            
            height:710px;
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
        div#s_record td{
        	text-align:right;
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
            margin-bottom:-2px;
            margin-top:-15px;
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
            margin-bottom:-5px;
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
        #pay_div{
            margin-left:376px;
            background-color: rgba(219, 208, 208, 0.904);
            text-align:center;
            width:700px;
        }
        #pay_div table{
            padding-left:10px;
            width:680px;
        }
        #pay_div table tr{
            height:44px;
        }
        #pay_div table tr:first-child>td{
            border-bottom: 1px lightgray solid;
        }
        #pay_div table tr td{
            text-align: justify;
            padding-left:15px;
        }
        #agree_div{
            margin-left:390px;
            color:white;
            font-weight: 530;
            padding-top:10px;
            font-size:14px;
        }
        #first_checkbox{
            margin-bottom: 8px;
        }
        #btn{
            padding:10px;
            padding-left:40px;
            padding-right:40px;
            background-color: dodgerblue;
            color:azure;
            font-size: 16px;
            border-radius: 4px;
            margin-left:670px;
            margin-top:5px;
            margin-bottom: 10px;
        }
        div#warning{
            margin-left:376px;
            background-color:rgba(87, 85, 85, 0.473);
            opacity:0.9;
            width:810px;
            height:276px;
            border:1px lightgray solid;
            padding-top:10px;
            padding-bottom:40px;
        }
        #cancel_time_div{
            border:1px darkgray solid;
            padding-left:10px;
            margin-left:20px;
            height:32px;
            width:420px;
            background-color:rgb(71, 67, 67);
            font-size:14px;
        }
        #cancel_time_div span{
            vertical-align: middle;
            line-height: 32px;
            color:aliceblue;
            font-weight: bolder;
        }
        #cancel_time_div span:last-of-type{
            color:red;
            font-size:17px;
        }
        #warning table{
            margin:10px;
            border-top:2px lightgray solid;
            border-collapse: collapse;
            width:788px;
            color:gainsboro;
        }
        #warning table th{
            color:black;
            background-color: dimgray;
            opacity: 0.8;
        }
        #warning table th,td{
            border-bottom:1px darkgray solid;
        }
        #warning table td:nth-child(1){
            width:260px;
            text-align: center;
            font-size: 14px;
        }
        #warning table td:nth-child(2){
            width:220px;
            text-align: center;
            font-size: 14px;
        }
        #warning table b{
            color:rgb(98, 138, 20);
        }
        #warning table td:nth-child(3){
            padding-left:2px;
            border-left:1px darkgray solid;
            font-size: 14px;
        }
        #warning table td:nth-child(3) ul{
            list-style-type: square;
        }
    </style>
</body>
</html>