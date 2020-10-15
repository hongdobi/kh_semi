<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<style>
    section {
		padding: 50px;
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
    #adminView {
        width: 1200px;
        height: auto;
        border: 3px solid gainsboro;
        font-weight: 300;
    }
    #wrap-out{
        margin: auto;
        display: table;
    }
    div#wrap-enroll {
        padding: 15px;
    }
    table {
        border-spacing: 2px;
        border-collapse: collapse;
        border: solid 1px #d8d8d8;
    }
    th,td {
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
    div>ul {
        margin: 0px;
        padding: 10px 20px 10px 20px;
    }
    #adminView div>ul>li {
        font-size: 12px;
        list-style-type: disc;
        padding: 3px;
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
    /* #result1 {
        font-size: 13px;
    } */
    table#searchTbl{
        margin: 7px auto 7px 0px;
    }
    div.wrap-category{
        margin: 7px 0px 7px 0px;
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
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/perfEnroll">공연 등록/삭제</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/memberMG">회원관리</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/faqList">FAQ</a></li>
			<li class="rk-li"><a href="<%=request.getContextPath()%>/admin/inquiryList">1:1문의</a></li>
		</ul>
	</nav>
    <div id="adminView">
        <h2 style="text-align:center">공연회차 등록/삭제</h2>
        <p style="text-align:center">회차정보가 없는 상시공연의 경우 아래 화면은 작성하지 않습니다.</p>
        <div id="wrap-out">
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
                                <div>
                                    <span id="result1">공연회차 확인 : <input type="text" name="perfNo" required="required"></p>
                                </div>    
                            </td>
                        </tr>
                        <tr id="resultTR">  
                        </tr>
                        <!-- <tr>
                            <th><label for="perf_start">공연시작날짜</label></th>
                            <td><input type="date" name="perfStart" min="2020-10-01" max="2021-12-31"></td>
                        </tr>
                        <tr>
                            <th><label for="perf_end">공연종료날짜</label></th>
                            <td><input type="date" name="perfEnd" min="2020-10-01" max="2021-12-31"></td>
                        </tr> -->
                        <tr>
                            <th>공연시간</th>
                            <td>
                                <div class="wrap-category">
                                    <!-- <select name="weekChoice" id="weekChoice">
                                        <option value="월">월</option>
                                        <option value="화">화</option>
                                        <option value="수">수</option>
                                        <option value="목">목</option>
                                        <option value="금">금</option>
                                        <option value="토">토</option>
                                        <option value="일">일</option>
                                    </select>
                                    <input type="time" name="timeChoice" id="timeChoice">
                                    <input type="button" id="timeResult" value="확인"><br> -->
                                    <input type="datetime-local" name="timeChoice" id="timeChoice">
                                    <input type="button" id="btn_time" value="확인"><br>
                                </div>
                                <span style="display:inline-block;">선택한 요일/시간 : <span id="result2"></span></span>
                                <div class="li_class">
                                    <ul>
                                        <li>요일 및 시간을 선택하게 되면 공연시작날부터 공연종료일까지 자동적으로 매주 공연이 반복됩니다</li>
                                    </ul>
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

    $(function(){
        //요일 받아오기
        $("#btn_time").click(function(){
            var dateTime = new Date($("#timeChoice").val()).toISOString().substring(0,16);
            $("#result2").html(dateTime);
        });
    });
</script>

</html>