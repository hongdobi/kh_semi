<%@page import="com.fs.model.vo.PerfSsn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fs.model.vo.Performance,com.fs.model.vo.PerfFile,com.fs.model.vo.Member,com.fs.model.vo.Booking, 
	com.fs.model.vo.Review, java.util.List, java.util.ArrayList, java.util.Date"%>
<%@ include file="/views/common/header.jsp"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a77949d7c0700b7221c0e03857ac002&libraries=services"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">
<!-- jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
<%
	//해당 공연정보 가져오기
	Performance perf = (Performance)request.getAttribute("performance");
	//공연 상세이미지 가져오기
	List<PerfFile> fList = (List) request.getAttribute("fList");
	//해당 공연 리뷰목록 가져오기
	List<Review> rvList=(List)request.getAttribute("rvList");
	//회원이 예약한 예약내역 가져오기(작성할 리뷰가 있는 지 확인)
	List<Booking>bkList=new ArrayList();
	if(request.getAttribute("bkList")!=null){
		bkList=(List)request.getAttribute("bkList");
	}
	//해당공연 예매가능일 가져오기
	List dateList=(List)request.getAttribute("dateList");
	

	
	//공연번호로 카테고리만들기
	String category = "";
	String cg = "";
	if (perf != null) {
		String perfNo = perf.getPerfNo();
		cg = perfNo.substring(0, 1);
		switch (cg) {
			case "M" :category = "뮤지컬";break;
			case "S" :category = "연극";break;
			case "E" :category = "전시";break;
		}
	}

%>
<style>
section {
	padding: 50px;
	min-width: 1000px;
	max-width: 1200px;
	margin: auto;
}

/* a태그 밑줄없애기 */
a {text-decoration: none;}
/* 구분선 */
section hr {
	width: 100%;
	height: 0;
	border: 1px lightcoral solid;
	background-color: lightcoral;
}

/* 메인포스터 */
div.poster {
	display: inline-block;
	margin-left: 20px;
	margin-right: 50px;
	text-align: center;
}

div.poster>img {
	width: 350px;
	height: 500px;
}
/* 상단 공연정보*/
div.perfInfo {
	min-width: 1100px;
}

div.poster+div {
	display: inline-block;
}

div.perfInfo>div>table {
	width: 600px;
	height: 500px;
}

div.perfInfo>div>table th {
	width: 200px;
	font-size: 15px;
	text-align: left;
}

div.perfInfo>div>table td {
	padding-left: 20px;
	font-size: 20px;
	
}
div.perfInfo ul {
	padding: 0;
	padding-left: 0;
	margin: 0;
}
div.perfInfo ul>li {
	padding-bottom: 10px;
	font-size:18px;
}

div#cal{
	min-width:1000px;
}
/*예약버튼*/
button#bookBtn{
	background-color: lightcoral;
	border: none;
	border-radius: 10px;
	width: 400px;
	height: 45px;
	font-size: 20px;
	color: white;
	font-weight:bolder;
	margin: 20px;
	letter-spacing: 10px;
}
/*공연 마감 안내*/
div#cancel{
 	text-align:center; 
	font-weight:bolder;
  	background-color: gray;
  	height: 50px;
  	color:white;
  	line-height:50px;
  	padding:5px;
  	width:800px;
  	border-radius:10px;
  	margin:auto;
}
/*상시상품 날짜 지정불필요 안내문 박스*/
div#calNo{
	text-align:center; 
	font-weight:bolder;
  	background-color: lightgray;
  	height: 100px;
  	line-height:100px;
  	padding:5px;
  	width:800px;
  	border-radius:10px;
  	margin:auto;
}
/*예약버튼 박스*/
div#cal+div,div#calNo+div {
	margin: auto;
	text-align: center;
	min-width: 1000px;
	max-width: 1200px;
} 

/* 상세페이지 navi */
div#navi>a {
	text-decoration: none;
	font-size: 25px;
	margin-right: 30px;
	margin-left: 20px;
	color:lightcoral;
	font-weight: bolder;
}

/* 서브타이틀 */
div.subTitle {
	display: flex;
	justify-content: space-between;
	font-family: Noto Sans KR;
	padding-left: 15px;
	min-width: 1000px;
	max-width: 1200px;
}

/* 공연 상세정보 */
div#info>div:nth-of-type(2) {
	text-align: center;
}

div#info>div:nth-of-type(2)>img {
	margin: -3px;
	padding: 0;
}

/* 오시는 길 */
div#mapBox>div:nth-of-type(2) {
	padding: 30px;
	text-align: center;
	margin: auto;
}
/* 지도 넣을 공간 */
div#map {
	display: inline-block;
}
/*공연장명*/
#placeName {
	font-size: 30px;
}

/* 각 리뷰 */
div#review li {
	padding: 5px;
}
/*관람후기버튼*/
button#addBtn {
	width: 120px;
	height: 50px;
	background-color: lightcoral;
	border-radius: 10px;
	color: white;
	border: none;
}
/*리뷰출력시 상단*/
div.reviewInfo>span {
	margin-right: 20px;
	line-height: 30px;
	margin-bottom: 5px;
	
}
/*리뷰 관람일자정보*/
div.reviewInfo>span:nth-of-type(4) {
	color:gray;
	font-size:12px;
}
/*리뷰 작성일자정보*/
div.reviewInfo>span:nth-of-type(2) {
	color:gray;
	font-size:12px;
}
/*리뷰 별점*/
span.star {
	color: lightcoral;
	font-size: 20px;
	letter-spacing: -3px;
}
/*리뷰글*/
div.reviewText {
	font-family: Nato Sans 300;
}
/*리뷰수정, 삭제버튼*/
button.del,button.update{
	font-size:10px;
	color:white;
	background-color:lightcoral;
	border-radius:10px;
	border:none;
}
/* 예매하기버튼으로 빠른이동버튼 */
a[href="#cal"] {
	margin-right: 20px;
	color: lightcoral;
}
/*페이지번호바*/
div#pageBar{
	text-align: center;
}
/*datepicker*/
.ui-datepicker table>thead{font-size: 20px; background-color:#f6f6f6;}
.ui-datepicker {
	background-color: #fff;
	width: 500px; 
	padding: 0; 
	border: 0; 
	margin: auto;
}
.ui-datepicker .ui-widget-header {font-size:25px; padding: 6px; border: 0; background: lightcoral; color: #fff; }
.ui-widget.ui-widget-content { border: 0; border-radius: 10px; overflow: hidden; background: #fff; box-shadow: 0 0 8px rgba(0,0,0,0.3) }
/*날짜 칸*/
.ui-widget-content .ui-state-default {
	border: 0px;
	text-align: center;
	background: #fff;
	font-weight: normal;
	color: #000;
	font-size: 25px;
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
	background-color: lightcoral;
	color: #fff;
}
</style>
<script>
$(function(){
	//오늘날짜 예약가능 최소 날짜로 넣기, 공연 마지막날짜도 불러와서 똑같이 할용
 	let date=new Date();
    let yyyy=date.getFullYear();
    let mm=date.getMonth()+1>9?date.getMonth()+1:"0"+(date.getMonth()+1);
    let dd=date.getDate()>9?date.getDate():"0"+date.getDate();
  
	//예매하기 버튼 누르면 나이 체크후 예매창 팝업 띄우기   
	$('#bookBtn').on("click",e=>{
		<%if(loginMember!=null){%>
			let bDay=new Date("<%=loginMember.getBday()%>");
			let bDayYear=bDay.getFullYear();
			let age=yyyy-bDayYear;
			let okAge="<%=perf.getPerfPg()%>";
			if(age<okAge){
				alert('해당공연의 관람 연령에 적합하지 않습니다.');
				return;
			}
			const url="<%=request.getContextPath()%>/book/booking"; 
            const title="bookSelect";
            const status="width=800px, height=600px, top=100px, left=300px";
 			open("",title,status);
 			bookSelect.action=url;              
 			bookSelect.target=title;
 			bookSelect.method="post";
 			bookSelect.submit(); 
	        
		<%}else{%>
		    alert('로그인 후 이용가능합니다.');
		    return;
		<%}%>
		
	});
		 
	//리뷰작성 팝업창 (띄우기전 로그인, 공연관람여부, 리뷰작성여부 확인)
	$("#addBtn").on("click",e=>{
        <%if(loginMember!=null){%>
        	<%if(bkList.size()>0){%>
	        	const url="<%=request.getContextPath()%>/review/reviewWrite"; 
	            const title="revform";
	            const status="width=800px, height=600px, top=100px, left=300px";
	 			open("",title,status);
	 			revform.action=url;
		        revform.target=title;
		        revform.method="post";
		        revform.submit(); 
        	<%}else{%>
	        	alert('작성할 리뷰가 없습니다. 관람 후에 작성이 가능합니다.');
	        	return;	
        	<%}
         }else{%>
	        alert('로그인 후 이용가능합니다.');
	    	return;
		<%}%>
    });
 
 	//리뷰 삭제버튼클릭시 
	$(".del").on("click",e=>{
		let bNo=$(e.target).parent().children("input[name=bNo]").val();
		console.log(bNo);
		 let result=confirm("해당 관람후기를 삭제하시겠습니까?");
         if(result==false){
             return false;
         }else{
        	 location.replace("<%=request.getContextPath()%>/review/reviewDelete?bNo="+bNo+"&perfNo=<%=perf.getPerfNo()%>");
         }
		
  	}); 
    //리뷰 수정버튼
    $(".update").one("click",e=>{
    	
    	let bNo=$(e.target).parent().children("input[name=bNo]").val();
    	const url="<%=request.getContextPath()%>/review/reviewUpdate?bNo="+bNo+"&perfName=<%=perf.getPerfName()%>"; 
        const status="width=800px, height=600px, top=100px, left=200px";
		open(url,"",status);

  	});

    

    
  //선택가능 날짜 
	var availableDates = [];
    <%if(dateList.size()>0){
	    for(int i=0;i<dateList.size();i++){%>
	   		availableDates.push("<%=dateList.get(i)%>");
		<%}
	    }%>
	
		function available(date) {
			var thismonth = date.getMonth()+1;
			var thisday = date.getDate();
			if(thismonth<10){
				thismonth = "0"+thismonth;
			}
			if(thisday<10){
				thisday = "0"+thisday;
			}
		    ymd = date.getFullYear() + "-" + thismonth + "-" + thisday;
		    if ($.inArray(ymd, availableDates) >= 0) {
		        return [true,"",""];
		    } else {
		        return [false,"",""];
		    }
		}

    //datepicker설정하기
	$('#datepicker').datepicker({
        dateFormat: 'yyyy-mm-dd' 
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시             
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] 
        <%int com=perf.getPerfStart().compareTo(new Date());
     	if(com<0){ %>
    		,minDate:"-0D"
    	<%}else{ %> 
    		,minDate:new Date("<%=perf.getPerfStart()%>")
    		
    	<%}%>
        	
		,maxDate: new Date("<%=perf.getPerfEnd()%>") //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
		<%if(dateList!=null){%>
			//조건에 맞는 날짜,
			,beforeShowDay:available
		<%}%> 
		//선택한 날짜
		,onSelect: function(dateText, inst) { 
	          let d=dateText.substring(4);
	          $("input[name=day]").val(d);
	          console.log($("input[name=day]").val());
	     }
		 
	});  
    

});        
</script>



<section>

	<form id="revform" name="revform">
		<%int result=0;
		if(loginMember!=null){
			result=loginMember.getMemberNo();
		}%>
		<input type="hidden" id="memberNo" name="memberNo" value="<%=result%>">
		<input type="hidden" id="perfNo" name="perfNo" value="<%=perf.getPerfNo()%>">
	</form> 
	<div>
		<p><%=category%></p>
		<h1>
			&lt;<%=perf.getPerfName()%>&gt;
		</h1>

	</div>
	<hr>
	<div class="perfInfo">
		<div class="poster">
			<img
				src="<%=request.getContextPath()%>/image/perf/<%=perf.getPerfNo()%>/<%=perf.getPerfPoster()%>"
				alt="<%=perf.getPerfName()%>포스터" height="500px">
		</div>
		<div>
			<table>
				<tr>
					<th>공연장소</th>
					<td><%=perf.getPerfLocation()%></td>
				</tr>
				<tr>
					<th>공연기간</th>
					<td><%=perf.getPerfStart()%>~<%=perf.getPerfEnd()%></td>
				</tr>
				<tr>
					<th>등급</th>
					<td>
						<%if (perf != null && perf.getPerfPg() != 0) {%> 
						<%=perf.getPerfPg()%>세 이상
						<%} else {%> 전체연령가 <%}%>
					</td>
				</tr>
				<%if (perf.getPerfRuntime() > 0) {%>
				<tr>
					<th>관람시간</th>
					<td><%=perf.getPerfRuntime()%>분</td>
				</tr>
				<%}%>
				<tr>
					<th>공연시간 안내</th>
					<td>
						<ul>
							<%for (String time : perf.getPerfTimeInfo().split("@")) {%>
							<li><%=time%></li>
							<%}%>
						</ul>
					</td>
				</tr>
				<tr>
					<th>가격</th>
					<td>
						<ul>
							<%for (String price : perf.getPerfPriceInfo().split("@")) {%>
								<li><%=price%></li>
							<%}%>
						</ul>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<hr>
	<!-- 공연마감일이 오늘날짜보다 앞설경우 공연 마감안내하기 -->
 	<%int compare=perf.getPerfEnd().compareTo(new Date());
	if(compare<0){ %>
		<div id="cancel">현재 해당 공연예매는 마감되었습니다.</div>
	<%}else{ %> 
	<div id="calBox">
		<div class="subTitle">
			<h2>예매가능 일자</h2>
		</div>
		<form id="bookSelect" name="bookSelect">
			<!-- 공연일 리스트에 null값이 있을 경우 날짜지정 불필요 안내  -->
			<%if(dateList.size()<1){ %>
				<div id="cal">
					<p> 불편을 드려 죄송합니다. 공연정보가 준비되지 못했습니다. 관리자에게 문의바랍니다.</p>
				</div>
			<%}else{ %>
				<%if(dateList.get(0)!=null){ %>
					<div id="cal">
						<div id="datepicker"></div>
					</div>
				<%}else if(dateList.get(0)==null){ %>
					<div id="calNo">상시상품으로 날짜지정이 별도로 없습니다. 하단의 예매하기를 눌러 예매를 진행해주세요</div>
				<%}
			}%>
			 <div>
			 	<%if(loginMember!=null){ %>
					<input type="hidden" name="memberNo" value="<%=loginMember.getMemberNo() %>">
				<%} %>
				<input type="hidden" name="perfNo" value="<%=perf.getPerfNo() %>">
				<input type="hidden" name="day">
				<button id="bookBtn" type="button">예매하기</button>
			</div> 
		</form>
	</div>
 	<%} %>
	<hr>
	<br>
	<div id="navi">
		<a href="#info">#상세정보</a> <a href="#mapBox">#오시는 길</a> <a href="#review">#관람후기</a>
	</div>
	<br>
	<hr>
	<br>
	<div id="info">
		<div class="subTitle">
			<h2>상세정보</h2>
		</div>
		<div>
			<%if (fList != null) {
				for (PerfFile pf : fList) {
					String fName = pf.getPerfFileName();%>
					<img src="<%=request.getContextPath()%>/image/perf/<%=perf.getPerfNo()%>/<%=fName%>"
					alt="공연상세정보" width="80%"> <img>
				<%}
			}%>
		</div>
		<div>
			<a href="#cal">△예매하기</a>
		</div>
	</div>
	<hr>
	<br>
	<div id="mapBox">
		<div class="subTitle"> <h2>오시는 길</h2> </div>
		<div>
			<p id="placeName"><%=perf.getPerfLocation()%></p>
			<p id="address"><%=perf.getPerfAddress()%></p>
			<br>
			<div class="mapWrap">
				<div id="map" style="width: 70%; height: 400px;"></div>
			</div>
			<div id="coordXY"></div>
		</div>
		<div>
			<a href="#cal">△예매하기</a>
		</div>
	</div>
	<br>
	<hr>
	<br>
	<div id="review">
		<div class="subTitle">
			<h2>관람후기</h2>
			<button type="button" id="addBtn">관람후기 등록</button>
		</div>
		<ul>
		<%if(rvList.size()>0){
			for(Review rv: rvList){%>
			<li id="reviewResult">
				<div class="reviewInfo">
					<span class="userId"><%=rv.getMemberId()%></span> 
					<span class="revDate"><%=rv.getRevDate()%></span> 
					<span class="star">
						<%for(int i=0;i<5;i++){
							if(i<rv.getRevScore()){%>★<%}
							else{%>☆<%}
						} %>
					</span>
					<span class="perfDate">(관람일시:<%=rv.getPerfDate() %>)</span>
					<span>
					<%if(loginMember!=null){
						 if(loginMember.getManagerYn().equals("Y")){ %>
						 	<input type="hidden" name="bNo" value="<%=rv.getBookNo() %>">
							<%if(loginMember.getMemberNo()==rv.getMemberNo()){ %>
								<button type="button" class="update">수정</button>
							<%} %>
							<button type="button" class="del">삭제</button>
						<%}else if(loginMember.getMemberNo()==rv.getMemberNo()){%>
							<input type="hidden" id="bNo" name="bNo" value="<%=rv.getBookNo() %>">
							<button type="button" class="update">수정</button> <button type="button" class="del">삭제</button>
							
						<%}%>
					 <%} %>
					</span>
				</div>
				<div class="reviewText"><%=rv.getRevContent() %></div>
			</li>
				
			<%}%>
				<br>	
				<br>
				<div id="pageBar">
					<%=(String)request.getAttribute("pageBar")%>
				</div>
				
		<%}else{ %>
			<div style="text-align:center; font-weight:bolder">등록된 리뷰가 없습니다.</div>
		<%} %>
		</ul>
		<br>
		<div>
			<a href="#cal">△예매하기</a>
		</div>
	</div>
	<br>
	<hr>
	<br>

</section>

<script>
	/*카카오 지도API*/
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	var address='<%=perf.getPerfAddress()%>';
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(address, function(result, status) {
	
	// 정상적으로 검색이 완료됐으면 
	if (status === kakao.maps.services.Status.OK) {
	
	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	// 결과값으로 받은 위치를 마커로 표시합니다
	var marker = new kakao.maps.Marker({
	     map: map,
	     position: coords
	});
	
	// 인포윈도우로 장소에 대한 설명을 표시합니다
	var infowindow = new kakao.maps.InfoWindow({
	     content: '<div style="width:150px;text-align:center;padding:6px 0;font-size:10px;"><%=perf.getPerfLocation()%></div>'
	});
	infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>

<%@ include file="/views/common/footer.jsp"%>