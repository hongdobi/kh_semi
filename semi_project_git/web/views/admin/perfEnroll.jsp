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
	div#enroll-container{
		height: auto;
        padding: 15px;
	}

	/*관리자페이지용 스타일 */
	div#wrap-enroll{
		/* display: grid;
		justify-content:center; */
		/* align-items:center; */
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
	div.wrap-category{
        margin: 7px 0px 7px 0px;
        text-align: left;
    }
    .div_input{
        margin:0;
        padding:4px 0px 4px 0px;
        font-size:13px;
    }
    .span_input{
        position:relative;
        line-height:20px;        
        border: solid 1px #ebebeb;
        border-top-color: #d8d8d8;
        border-left-color: #d8d8d8;
        background-color: #fff;
    }
    .span_textarea{
        position:relative;
        padding:8px;
        width:auto;
        border: solid 1px #ebebeb;
        border-top-color: #d8d8d8;
        border-left-color: #d8d8d8;
        background-color: #fff;
        display: inline-block;
        width:400px;
        height:100px;
    }
    input[type=text], input[type=number]{
        border:none;
    }
    input[type=date]{
        border: solid 1px #ebebeb;
        border-top-color: #d8d8d8;
        border-left-color: #d8d8d8; 
        padding:0px 4px 0px 4px;
    }
    input[type=text]:focus, input[type=number]:focus, input[type=date]:focus{
        outline:none;
    }
    input[type=button]{
    	font-family: 'Noto Sans KR';
    }
    div>ul{
        margin:0px;
        padding:10px 20px 10px 20px;
    }
    #adminView div>ul>li{
        font-size:12px;
        list-style-type: disc;
        padding: 3px;
    }
    textarea{
        width: 99%;
        height: 98%;
        resize: none;
        border:none;
    }
    textarea:focus{
        outline:none;
    }
    #submit{
        position:relative;
    }
    #result1{
    	font-size:13px;
    }
</style>

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
	<h2 style="text-align:center">공연 등록/삭제</h2>
	<p style="text-align:center">모든 공연은 한 번 등록되면 삭제만 가능합니다. 이 점 주의해서 작성해주시기 바랍니다.</p>
	<div id="enroll-container">
		<form class="forms_form" action="<%=request.getContextPath() %>/admin/perfEndEnroll" method="post">
			<div id="wrap-enroll">
				<table id="table-enroll">
					<tr>
						<th>카테고리</th>
						<td>
							<div class="wrap-category">
								<select name="perfNo" id="perfNo">
									<option value="S">연극</option>
									<option value="E">전시</option>
									<option value="M">뮤지컬</option>
								</select>
								<span id="result1" style="display:inline-block;">선택한 공연 카테고리 : S</span>
							</div>
						</td>
					</tr>
					<tr>
						<th><label for="perf_name" scope="row">공연제목</label></th>
						<td>
							<div class="wrap-category">	
								<span class="span_input"><input type="text" name="perfName" id="perf_name" placeholder="예)노트르담의 파리"></span>
							</div>
						</td>
					</tr>
					<tr>
						<th><label for="perf_location">공연장소</label></th>
						<td>
							<div class="wrap-category">
								<span class="span_input"><input type="text" name="perfLocation" id="perf_location" placeholder="예)샤롯데시어터"></span>
							</div>
						</td>
					</tr>
					<tr>
						<th><label for="perf_start">공연시작날짜</label></th>
						<td>
							<div class="wrap-category">
								<input type="date" name="perfStart" min="2020-10-01" max="2021-12-31">
							</div>
						</td>	
					</tr>
					<tr>
						<th><label for="perf_end">공연종료날짜</label></th>
						<td>
							<div class="wrap-category">
								<input type="date" name="perfEnd" min="2020-10-01" max="2021-12-31">
							</div>	
						</td>
					</tr>
					<tr>
						<th><label for="perf_pg">공연등급</label></th>
						<td>
							<div class="wrap-category">
								<span class="span_input"><input type="number" name="perfPg" id="perf_pg" min="0" placeholder="예)15"></span>세 이상관람
							</div>
							<div class="wrap-category">
								<div class="li_class">
									<ul>
										<li>공연관람등급을 숫자로 입력해주세요</li>
										<li>전체관람의 경우 : 0을 입력</li>
										<li>8세이상관람의 경우 : 8을 입력</li>
									</ul>
								</div>
							</div>	    
						</td>
					</tr>
					<tr>
						<th><label for="perf_timeinfo">공연시간안내</label></th>
						<td>
							<div class="wrap-category">
								<div class="div_input">
									<span class="span_textarea">
										<textarea name="perfTimeinfo" id="perf_timeinfo" placeholder="예)평일 : 오후 7시30분@주말 : 오후 3시"></textarea>
									</span>
								</div>
							</div>	
							<div class="wrap-category">
								<div class="li_class">
									<ul>
										<li>공연시간안내를 입력해주세요</li>
										<li>줄바꿈의 경우 @를 입력해주세요</li>
									</ul>
								</div>
							</div>	
						</td>
					</tr>
					<tr>
						<th><label for="perf_priceinfo">가격안내</label></th>
						<td>
							<div class="wrap-category">
								<div class="div_input">
									<span class="span_textarea">
										<textarea name="perfPriceinfo" id="perf_priceinfo" placeholder="예)VIP : 160,000원@R석 : 130,000원"></textarea>
									</span>
								</div>
							</div>			
							<div class="wrap-category">
								<div class="li_class">
									<ul>
										<li>가격안내를 입력해주세요</li>
										<li>줄바꿈의 경우 @를 입력해주세요</li>
									</ul>
								</div>
							</div> 
						</td>
					</tr>
					<tr>
						<th><label for="perf_runtime">관람시간</label></th>
						<td>
							<div class="wrap-category">
								<div class="div_input">
									<span class="span_input"><input type="number" name="perfRuntime" id="perf_runtime" min="0" placeholder="예)160"></span>분
								</div>
							</div>
							<div class="wrap-category">
								<div class="li_class">
									<ul>
										<li>공연관람시간을 숫자로 입력해주세요</li>
										<li>160분 관람인 경우 : 160을 입력</li>
									</ul>
								</div>
							</div>    
						</td>
					</tr>
					<tr>
						<th>공연장 주소</th>
						<td>
							<div class="wrap-category">
								<div class="div_input">
									<span class="span_textarea">
										<textarea name="perfAddress" id="perf_address" placeholder="예)서울 송파구 올림픽로 240"></textarea>
									</span>
								</div>
							</div>	
							<div class="wrap-category">
								<div class="li_class">
									<ul>
										<li>공연장 주소를 도로명까지 입력해주세요</li>
									</ul>
								</div>
							</div> 
						</td>
					</tr>
					<tr>
						<th>공연 좌석수</th>
						<td>
							<div class="wrap-category">
								<div class="div_input">
									<span class="span_input"><input type="number" name="perfCapacity" id="perf_capacity" min="0" value="300" ></span>석
								</div>
							</div>
							<div class="wrap-category">
								<div class="li_class">
									<ul>
										<li>공연 좌석수를 숫자로 입력해주세요</li>
										<li>기본 좌석수는 300석으로 입력되어있습니다</li>
										<li>300석인 경우 : 300을 입력</li>
										<li>별도의 지정좌석이 없는 경우 0을 입력해주세요</li>
									</ul>
								</div>	 
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
				<br>
<!-- 				<input type="button" value="다음" onclick="fn_poster();"> -->
			</div>
		</form>

    </div>
</section>
    
<script>
	//카테고리 마우스호버
	$(function(){
		$(".rk-li").hover(function(){
			$(this).css("background-color","lightcoral");
		},
		function(){
			$(this).css("background-color","initial");
		});
	});

	
    $(function(){
        //줄바꿈 테스트 부분
        /* $("#test").click(function(){
            var str = $("#perf_timeinfo").val();
            //result = str.replace("\r\n","@");
            result = str.replace("@","\r\n");
            $("#test-container").html(result);
        }); */

        //공연번호 확인 
		$("#perfNo").change(function(){
			$("#result1").html("선택한 공연 카테고리 : "+$("#perfNo").val());
			//$("#result1").html($("#perfNo").val());
			
    	});
	});//function 끝

	
	function fn_poster(){
		location.replace("<%=request.getContextPath()%>/admin/poster");
	}

    
   
    
</script>

<%@ include file="/views/common/footer.jsp" %>