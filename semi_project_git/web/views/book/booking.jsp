<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ 
	page import="com.fs.model.vo.Performance, java.util.Date, java.text.SimpleDateFormat, 
				java.util.List, com.fs.model.vo.PerfSsn"  
%>

<%
	Performance perf=(Performance)request.getAttribute("perf");
	List<PerfSsn> list=(List)request.getAttribute("list");
	int memberNo=Integer.parseInt((request.getAttribute("memberNo")).toString());
	String perfNo=(String)request.getAttribute("perfNo");
	Date bookDate=(Date)request.getAttribute("bookDate");
	Date today=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Step 1 관람일/회차</title>
    <!-- jQuery UI CSS파일  -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
    <!-- jQuery 기본 js파일 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
    <!-- jQuery UI 라이브러리 js파일 -->
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
</head>
<body>
    <!-- <img src="image/curtain.jpg" id="curtain" alt=""> -->
    <div id="container">
        <header>
            <img src="<%=request.getContextPath() %>/image/logo_book.png" alt="오성티켓" id="logo" width="208" height="55">
            <nav>
                <ul id="headerMenu">
                    <li>
                        <div>
                            step 1<br>관람일/회차
                        </div>
                    </li>
                    <li>
                        <div>
                            step 2<br>좌석선택
                        </div>
                    </li>
                    <li>
                        <div>
                            step 3<br>할인선택
                        </div>
                    </li>
                    <li>
                        <div>
                            step 4<br>수령방법
                        </div>
                    </li>
                    <li>
                        <div>
                            step 5<br>결제방법
                        </div>
                    </li>
                </ul>
            </nav>
        </header>
        <section>
            <div id="showStepDiv">
                <p id="showStepTitle">관람일/회차 선택</p>
            </div>        
            <div id="cal_div">
                <div>
                    <span>날짜/시간 선택 (공연명: <b><%=perf.getPerfName() %></b>)</span>
                </div>
                <%if(bookDate!=null) { %>
                	<form action="<%=request.getContextPath() %>/book/seating" method="post">
		                <div id="cal_flex_div">
		                    <div id="calendar">
		                        <!-- <img src="image/calendar.png" alt="" id="cpic"> -->
		                        <script>
		                            $("#calendar").datepicker({
		                                dateFormat: 'yyyy-mm-dd',
		                                prevText: '이전 달',
		                                nextText: '다음 달',
		                                currentText:'오늘',
		                                monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		                                monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		                                dayNames: ['일','월','화','수','목','금','토'],
		                                dayNamesShort: ['일','월','화','수','목','금','토'],
		                                dayNamesMin: ['일','월','화','수','목','금','토'],
		                                showMonthAfteryear: true,
		                                yearSuffix: '년',
		                                maxDate:new Date('<%=perf.getPerfEnd() %>'),		                                
		                                <%int com=perf.getPerfStart().compareTo(new Date());
			                            if(com<0){ %>
			                              minDate:"-0D"
			                           <%}else{ %> 
			                              minDate:new Date("<%=perf.getPerfStart()%>")			                              
			                           <%}%>
		                            });		                            		                          
		                            console.log(new Date("<%=perf.getPerfStart()%>"));
		                        </script>
		                    </div>
		                    <div>
			                    <select id="select_ticket" name="nofTicket">
	                                <option value="" selected disabled hidden>매수를 선택하세요</option>
	                                <option value="1">1매</option>
	                                <option value="2">2매</option>
	                                <option value="3">3매</option>
	                                <option value="4">4매</option>
	                            </select>  
		                    	<%if(list!=null) {
		                    		int n=0;
		                    		for(PerfSsn ssn: list) {
		                    			n++;
		                    	%>
		                        <input type="submit" class="ssn_blank" name="dateTime" value="<%=n%>회차 <%=sdf.format(ssn.getDateTime())%>"
		                        onclick="return fn_checkTicket();">
		                        <%-- <input type="button" onclick="switchClass();" class="ssn_blank" value="<%=ssn.getDateTime()%>"> --%>
		                        	<%} %>
		                        <%} %>
		                        <input type="hidden" name="memberNo" value="<%=memberNo %>">
		                        <input type="hidden" name="perfNo" value="<%=perfNo %>">
		                    </div>
		                </div>
					</form>		   
					<script>
						function fn_checkTicket(){							
							if($("#select_ticket").val()==""){
								alert("티켓매수를 선택해주세요");
								return false;
							}
						}
					</script>
					
                <%}else { %>
                	<form action="" method="post">
		                <div id="alternate_div">
		                    <table>
		                        <tr>
		                            <td>정가</td>
		                            <td><%="티켓가격"%></td>
		                        </tr>
		                        <tr>
		                            <td>매수</td>
		                            <td>
		                                <select name="nofTicket" id="nofTicket">
		                                    <option value="1매">1매</option>
		                                    <option value="2매">2매</option>
		                                    <option value="3매">3매</option>
		                                    <option value="4매">4매</option>
		                                    <option value="5매">5매</option>
		                                    <option value="6매">6매</option>
		                                    <option value="7매">7매</option>
		                                    <option value="8매">8매</option>
		                                </select>
		                            </td>
		                        </tr>
		                    </table>
		                    <div>
		                        *안내 <b>8매 초과 구매시 단체구매로 처리되오니 고객센터로 문의주시기 바랍니다.</b>
		                    </div>
		                </div>
		                <input type="submit" id="btn" value="확인">
		            </form>
                <% }%>
            </div>
        </section>
        <footer>
            <div id="comment">
                <div id="sideMenu"><span>유의사항</span></div>
                <ul>
                    <li>안내되어 있는 잔여석은 결제 진행 중인 좌석을 포함하고 있어 예매 가능 좌석과 다를 수 있습니다.</li>
                    <li>할인은 자동선택 되지 않으니, <u>적용 받고자 하는 할인이 있는 경우 직접 선택</u>해주시기 바랍니다.</li>
                    <li>국가유공자, 학생 할인 등 증빙서류가 필요한 경우 현장수령만 가능하며, <u>현장에서 증빙서류 미지참 시 차액 지불</u>하셔야 합니다.</li>
                    <li><u>관람 당일 공연 예매 시에는 변경/취소/환불이 불가</u>합니다.</li>
                    <li>경우에 따라 ATM 기기에서 가상계좌 입금이 안될 수 있으니 가급적 인터넷/폰뱅킹 등을 이용해주시기 바랍니다.</li>
                    <li>예매 취소 시 <u>예매수수료는 예매 당일 밤 12시 이전까지 환불되며, 그 이후 기간에는 환불되지 않습니다.</u></li>
                    <li>예매 취소 시점에 따라 취소수수료가 부과될 수 있습니다. 예매 후 취소마감시간과 함께 취소수수료를 꼭 확인해주시기 바랍니다.</li>
                </ul>
            </div>
        </footer>
    </div>
    <style>
	    /* #curtain{
	        position:relative;
	        width:100%;
	        height:100%;
	        z-index: 1;
	    } */
	    #container{
	        background-image:url('<%=request.getContextPath() %>/image/curtain.jpg');
	        background-size:contain;
	        max-height:670px;
	        max-width:1000px;
	        width:auto;
	        height:auto;
	        font-size:14px;
	    }
	    #headerMenu{
	        margin-left:130px;	       	        	        
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
	    }
	    #showStepTitle{
            padding-top:14px;
	        padding-bottom:5px;
	        padding-left:23px;	        
	        margin-left: 126px;
            background-color:white;
            font-weight: bolder;  
            font-size:16px;         
            border-radius: 4px;
            height:30px;
            width:146px; 
            margin-top:7px;          
        }
	    #cal_div{
	        margin-left:126px;
	        display:inline-block;
	        width:720px;
	        height:320px;
	    }
	    #cal_div>div:first-child{
	        border-bottom: 1px lightgray solid;
	        padding-bottom: 5px;
	        margin-bottom: 10px;
	        color:rgb(228, 220, 220);
	        font-weight: bolder;
	    }
	    #cal_div>div:first-child b{
	    	color:rgba(255, 158, 74, 0.911);
	    	font-size:15px;
	    }
	    #select_ticket{
	        margin-left:44px;	        
	        margin-bottom:20px;
	        width:240px;
	        font-size:15px;
	    }
	    #cal_flex_div{
	        display: flex;
	    }
	    #cal_flex_div>div:last-child{
	        width:350px;
	        height:215px;
	        padding-top:20px;
	    }
	    .ssn_blank{
	        padding:7px;
	        width:200px;
	        margin-left:44px;
	        background-color: gray;
	        color:azure;
	        text-align: center;
	        margin-bottom:14px;
	        border-radius: 7px;
	        font-size:15px;	        
	    }
	    .ssn_blank:hover{
	        padding:7px;
	        width:200px;
	        margin-left:44px;
	        background-color: rgba(244, 165, 96, 0.829);
	        color:aliceblue;
	        text-align: center;
	        font-weight: bolder;
	        margin-bottom:14px;
	        border-radius: 7px;
	        font-size:16px;
	    }
	    #comment{
	        margin-top:-28px;
	        margin-left:85px;
	        display:flex;
	        font-size:13px;
	        padding-bottom:3px;
	    }
	    #comment ul{
	        color:darkgrey;      
	    }
	    #sideMenu{
	        background-color:gray;
	        color:white;
	        width:20px;
	        height:80px;
	        text-align:center;
	        font-weight:bolder;
	        padding:5px;
	        padding-top:15px;
	        padding-bottom: 15px;
	        margin-top:20px;
	        font-size:15px;
	    }
	    /* #cpic{
	        width:50%; 
	        height:40%;
	        padding-left: 25%;
	    } */
	    /*datepicker*/
	    .ui-datepicker table>thead{font-size: 15px; background-color:#f6f6f6;}
	    .ui-datepicker {width: 370px; padding: 0; border: 0;}
	    .ui-datepicker .ui-widget-header {font-size:20px; padding: 2px; border: 0; background: rgba(80, 74, 74, 0.781); color: #fff; }
	    .ui-widget.ui-widget-content { border: 0; border-radius: 7px; overflow: hidden; background: #fff; box-shadow: 0 0 8px rgba(0,0,0,0.3) }
	    /*날짜 칸*/
	    .ui-widget-content .ui-state-default {
	    border: 0px;
	    text-align: center;
	    background: #fff;
	    font-weight: normal;
	    color: #000;
	    font-size: 15px;
	    border-radius:100px;
	    }
	    .ui-widget-content .ui-state-default:hover {
	    border: 0px;
	    text-align: center;
	    background-color: black;
	    font-weight: normal;
	    border-radius:100px;
	    color: #fff;
	    }
	    .ui-widget-content .ui-state-active {
	    border: 0px;
	    background-color: rgb(138, 202, 121);
	    color: #fff;
	    }
	    #alternate_div{
        margin-left:12px;
        background-color: rgba(219, 208, 208, 0.904);
        text-align:center;
        width:700px;
	    }
	    #alternate_div>table{
	        padding-left:10px;
	        width:380px;
	    }
	    #alternate_div>table tr{
	        height:44px;
	    }
	    #alternate_div>table tr:first-child>td{
	        border-bottom: 1px lightgray solid;
	    }
	    #alternate_div>div{
	        border: 1px lightgray solid;
	        background-color:rgba(87, 85, 85, 0.473);
	        opacity:0.9;
	        color:aliceblue;
	        width:678px;	        
	        padding-left:20px;
	        height:27px;
        	padding-top:5px;	  
	    }
	    #alternate_div>div>b{
	        color:rgb(206, 4, 4);
	    }
	    #btn{
	        padding:10px;
	        padding-left:40px;
	        padding-right:40px;
	        background-color: dodgerblue;
	        color:azure;
	        font-size: 16px;
	        border-radius: 4px;
	        margin-left:300px;
	        margin-top:25px;
	        margin-bottom: 10px;
	    }
	    
	</style>
    
</body>
</html>