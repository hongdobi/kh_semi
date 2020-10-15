<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<style>
    section {
		padding: 50px;
        text-align: center;
		margin: auto;
		font-family: 'Noto Sans KR';
	}
	/*오성티켓 관리자페이지 타이틀*/
	section>div#title {
		font-size: 30px;
		text-align: center;
		min-width: 1000px;
	}
	/*랭킹 카테고리*/
	ul.Rank-nav {
		min-width: 1000px;
	}
	ul.Rank-nav li {
		width: 200px;
		padding: 12px;
		list-style-type: none;
		display: inline-block;
		font-size: 20px;
		border: 1px lightgray solid;
		text-align: center;
	}

	#adminView{
		width:1200px;
		border:3px solid gainsboro;
		display: inline-block;
		font-weight: 300;
	}
    div#ssn-container{
        height: auto;
        padding: 15px;
    }
    div#wrap-enroll {
        height:auto;
        padding:15px;
    }
    table#table-enroll{
        width: 100%;
        border-spacing: 2px;
        border: solid 1px #d8d8d8;
        border-collapse: collapse;
    }
    table#table-enroll th, table#table-enroll td {
        border: solid 1px #d8d8d8;
        padding: 7px;
    }
    .div_input {
        margin: 0;
        padding: 4px 0px 4px 0px;
        font-size: 13px;
    }
    .span_input {
        position: relative;
        line-height: 20px;
        border: solid 1px #ebebeb;
        border-top-color: #d8d8d8;
        border-left-color: #d8d8d8;
        background-color: #fff;
    }
    .span_textarea {
        position: relative;
        padding: 8px;
        width: auto;
        border: solid 1px #ebebeb;
        border-top-color: #d8d8d8;
        border-left-color: #d8d8d8;
        background-color: #fff;
        display: inline-block;
        width: 400px;
        height: 100px;
    }
    input[type=text],
    input[type=number] {
        border: none;
        font-weight: 300;
    }
    input[type=date] {
        border: solid 1px #ebebeb;
        border-top-color: #d8d8d8;
        border-left-color: #d8d8d8;
        padding: 0px 4px 0px 4px;
    }
    input[type=text]:focus,
    input[type=number]:focus,
    input[type=date]:focus {
        outline: none;
    }
    /* div>ul {
        margin: 0px;
        padding: 10px 20px 10px 20px;
    } */
    #adminView div>ul>li {
        font-size: 20px;
        list-style-type: disc;
        padding: 7px;
    }
    textarea {
        width: 99%;
        height: 98%;
        resize: none;
        border: none;
    }
    textarea:focus {
        outline: none;
    }
    #submit {
        position: relative;
    }
    table#searchTbl{
        margin: 7px auto 7px 0px;
    }
    div.wrap-category{
        margin: 7px 0px 7px 0px;
        text-align: left;
    }

    /* 공연정보바 */
    #perf-nav-out{
        margin:auto;
        display:table;
        font-size: 13px;
    }
    .perf-nav{
        padding: 20px 0 10px 0
    }
    .perf-nav li{
        list-style-type: none;
		display: inline-block;
    }
   
</style>
</head>
<section>
    <div id="title">
		<h1>
			<span style="color: lightcoral">오성티켓</span> 관리자페이지
		</h1>
	</div>
	<br>
	<nav>
		<ul class="Rank-nav">
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/perfEnroll">공연 등록</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/memberMG">회원관리</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/faqList">FAQ</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/inquiryList">1:1문의</a></li>
		</ul>
	</nav>
    <div id="adminView">
        <h2 style="text-align:center">공연회차 등록</h2>
        <p style="text-align:center">공연등록(3/3)단계</p>
        <p style="text-align:center">현재 페이지는 공연회차를 등록하는 화면입니다. 회차정보가 없는 상시공연의 경우 아래 화면은 작성하지 않습니다.</p>
        <div id="ssn-container">
            <form class="forms_form" action="<%=request.getContextPath() %>/admin/perfSsnEnd" method="post">
                <div id="wrap-enroll">
                    <table id="table-enroll">
                        <tr>
                            <th>공연번호검색</th>
                            <td colspan="2">
                                <div class="wrap-category">
                                    <select name="category" id="category">
                                        <option value="All">All</option>
                                        <option value="S">연극</option>
                                        <option value="E">전시</option>
                                        <option value="M">뮤지컬</option>
                                    </select>
                                    &nbsp
                                    공연명 : <input type="search" name="perfSearch" id="perfSearch" placeholder="공연명을 입력해주세요">
                                    <input type="button" id="searchBtn" value="검색">
                                    <div id="searchResult" style="overflow:auto; width:750px; max-height:150px;"></div>
                                </div>
                                <div class="wrap-category">
                                    <span id="result1">공연회차 확인 : <input type="text" name="perfNo" required="required"></p>
                                </div>     
                            </td>
                        </tr>
                        <tr id="resultTR">  
                        </tr>
                        <tr>
                            <th>공연시간</th>
                            <td>
                                <div class="wrap-category">
                                    <input type="datetime-local" name="timeChoice" id="timeChoice">
                                    <input type="button" id="btn_time" value="확인"><br>
                                </div>
                                <div class="wrap-category">
                                    <span style="display:inline-block;">선택한 요일/시간 : <span id="result2"></span></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th colspan="2">
                                <input type="submit" value="등록">
                                <input type="reset" value="취소">
                            </th>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
    </div>
</section>
<script>
    $(function(){
    	//공연검색[공연번호찾기]
    	$("#searchBtn").on("click",e=>{
    		let perfName=$("input[name=perfSearch]").val();
    		if(perfName.length<1){
    			alert('등록하실 공연이름을 입력해주세요.');
    			return;
    		}
    		$.ajax({
    			url:"<%=request.getContextPath()%>/admin/perfSearch", 
    			data:{"name":perfName,"cate":$("input[name=cate]").val()},
    			type:"post",
    			dataType:"json",
    			success: function(data){ 
    				let table=$("<table id='searchTbl'>");
    				let th=$("<tr>").append($("<th>").html("공연넘버"))
    					.append($("<th>").html("공연제목"))
    					.append($("<th>").html("시작일"))
    					.append($("<th>").html("종료일"))
    					.append($("<th>").html("공연장"))
    					.append($("<th>").html("등록선택"))
    				table.append(th);
    				if(data.length<1){
    					let tr=$("<tr>").append($("<td colspan='6'>").html("검색된 결과가 없습니다."));
    					table.append(tr);
    				}else{
    					for(let i=0;i<data.length;i++){	
    						let btn=$("<button>").attr({"type":"button","class":"pBtn"}).html("선택");
    						btn.click(e=>{
    							$("#result1").children().remove();
    							let v=$(e.target).parent().parent().children("#no").text();
    							console.log(v);
    							$("#result1").append($("<input>").attr({"type":"text","name":"perfNo","value":v,"required":"required"})); 
    						});
    						let tr=$("<tr>").append($("<td id='no'>").html(data[i]["perfNo"]))
    						.append($("<td>").html(data[i]["perfName"]))
    						.append($("<td>").html(data[i]["perfStart"]))
    						.append($("<td>").html(data[i]["perfEnd"]))
    						.append($("<td>").html(data[i]["location"]))
    						.append($("<td>").html(btn));
    						table.append(tr);
    					}
    				}
    				$("#searchResult").html(table);
    			}
    		});
    	});  
    	
    	$.ajax({
    		url:"<%=request.getContextPath()%>/banner/bannerList", 
    		data:{"cate":"All"},
    		type:"post",
    		dataType:"json",
    		success: function(data){ 
    			fn_bannerList(data);
    		}
    	});

    });
	//여기까지
	
	//카테고리 마우스호버
	$(function(){
		$(".rk-li").hover(function(){
			$(this).css("background-color","lightcoral");
		},
		function(){
			$(this).css("background-color","initial");
		});
	});
	
	//공연네비바 마우스호버
	$(function(){
		$(".pf-li").hover(function(){
			$(this).css("color","lightcoral");
		},
		function(){
			$(this).css("color","initial");
		});
	});
   	
    //요일 받아오기
    $(function(){
        $("#btn_time").click(function(){
            $("#result2").html($("#timeChoice").val());
        });
	});

</script>

</html>