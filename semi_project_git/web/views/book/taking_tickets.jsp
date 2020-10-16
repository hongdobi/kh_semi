<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.fs.model.vo.Member" %>    

<%
	String dateChoice=(String)request.getAttribute("dateChoice");
	String ssnChoice=(String)request.getAttribute("ssnChoice");
	int discount=Integer.parseInt((request.getAttribute("discount")).toString());
	int notk=Integer.parseInt((request.getAttribute("notk")).toString());
	Member m=(Member)request.getAttribute("m");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Step 4 수령방법</title>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
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
                <p id="showStepTitle">수령방법</p>
            </div>
            <form action="<%=request.getContextPath() %>/book/payment" method="post">
                <div id="rank_choice">수령방법선택
                    <div id="box">
                    현장수령<input type="radio" value="R" checked>
                    </div>
                </div>
                <div>
                    <table id="order_check_t">
                        <thead>
                            <tr>
                                <td colspan="2">주문자 확인</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>이름 </td>
                                <td><input class="input" type="text" value="<%=m.getMemberName() %>" readonly required></td>
                            </td>
                            <tr>
                                <td>긴급연락처</td>
                                <td><input class="input" type="text" name="phone" value="<%=m.getPhone() %>" readonly required></td>
                            </tr>
                            <tr>
                                <td>e-mail</td>
                                <td><input class="input" type="email" value="<%=m.getEmail() %>" readonly required></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <input type="hidden" name="dateChoice" value="<%=dateChoice %>">
                <input type="hidden" name="ssnChoice" value="<%=ssnChoice %>">
                <input type="hidden" name="discount" value="<%=discount %>">
                <input type="hidden" name="notk" value="<%=notk %>">
                <input type="submit" id="btn" onclick="return fn_checkPhone();" value="확인">
            </form>
            <script>
            	function fn_checkPhone(){            		
            		if($("input[name=phone]").val()==null){
            			alert("연락처를 기재해주세요");
            			return false;
            		}
            	}
            </script>
            <div id="warning_container">
                <div id="warning">
                    <h4><b>주의사항</b> * 부정확한 정보 입력으로 인한 문제 발생 시 오성티켓(주) 는 책임을 지지 않습니다.</h4>
                    <ol>
                        <li><span>배송 선택 시 티켓 수령자의 배송지 정보를 정확히 입력해주시기 바랍니다.</span></li>
                        <li><span>티켓은 유가증권으로 관람인이 직접 소지해야하며, 분실된 티켓은 재발권 되지 않습니다.</span></li>
                        <li><span>긴급연락처는 공연 취소와 같은 유사 시 안내 받으실 연락처이므로 정확히 입력해주시기 바랍니다.</span></li>
                        <li>
                            이메일 정보 미 입력 시 예매 관련 안내 메일을 받을 수 없으니 이메일 받기를 원하시는 경우
                            마이페이지에서 회원정보를 수정해주시기 바랍니다.
                        </li>
                    </ol>
                </div>
            </div>
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
            font-size:14px;
        }
        #headerMenu{
            margin-left:110px;
            margin-bottom:-2px;
            margin-top:-2px;
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
            margin-bottom:-5px;
        }
        #showStepTitle{
            padding-top:15px;
            padding-bottom:3px;
            padding-left:35px;
            margin-left: 130px;
            background-color:white;
            font-weight: bolder;
            font-size:17px;
            border-radius: 4px;
            height:36px;
            width:107px;
        }
        #rank_choice{
            padding-left: 10px;
            padding-top:10px;
            padding-bottom: 10px;
            margin-left:130px;
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
            width:540px;
        }
        #order_check_t{
            border-collapse: collapse;
            margin-left:130px;
            margin-top:3px;
            width:712px;
        }
        #order_check_t thead{
            background-color: white;
            font-weight: bolder;
        }
        #order_check_t thead td{
            padding-left: 10px;
        }
        #order_check_t tbody{
            background-color: white;
            opacity: 0.7;
            text-align:left;
        }
        #order_check_t tr{
            height:37px;
        }
        #order_check_t tbody td:first-of-type{
            padding-left: 10px;
            width:100px;
        }
        .input{
            width:220px;
        }
        #btn{
            padding:10px;
            padding-left:40px;
            padding-right:40px;
            background-color: dodgerblue;
            color:azure;
            font-size: 16px;
            border-radius: 4px;
            margin-left:410px;
            margin-top:13px;
            margin-bottom: 10px;
        }
        #warning_container{
            margin-left:80px;
            height:210px;
        }
        #warning{
            border: 1px lightgray solid;
            background-color:rgba(87, 85, 85, 0.473);
            opacity:0.9;
            color:aliceblue;
            width:800px;
            padding-left:20px;
        }
        #warning li span{
            color:red;
        }
        
    </style>
</body>
</html>