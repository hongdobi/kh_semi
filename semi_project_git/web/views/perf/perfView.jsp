<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.fs.model.vo.Performance,com.fs.model.vo.PerfFile,com.fs.model.vo.Member, 
	com.fs.model.vo.Review,com.fs.model.vo.Booking, java.util.List"%>

<%@ include file="/views/common/header.jsp"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a77949d7c0700b7221c0e03857ac002&libraries=services"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<%
	
	//해당 공연정보 가져오기
	Performance perf = (Performance)request.getAttribute("performance");
	//공연 상세이미지 가져오기
	List<PerfFile> fList = (List) request.getAttribute("fList");
	//해당 공연 리뷰목록 가져오기
	List<Review> rvList=(List)request.getAttribute("rvList");
	//회원의 공연 관람일시 가져오기
	//Booking book=(Booking)request.getAttribute("book");
	
	
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
a {
	text-decoration: none;
}
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
	font-size: 18px;
	text-align: left;
}

div.perfInfo>div>table td {
	padding-left: 20px;
	font-size: 20px;
	font-family: Noto Sans KR;
}
/* 예매가능일자 */
div#cal {
	padding: 10px;
	text-align: center;
}

div#cal>p {
	font-size: 30px;
	margin-bottom: 5px;
}

div#cal>input {
	width: 300px;
	font-size: 25px;
}
/* div#cal>table{
            width: 500px;
            margin: auto; 
            border-collapse: collapse;
            margin-bottom: 30px;
        }
        div#cal>table th{
           
            background-color: lightcoral;
            color:white;
            height:60px;
        }
        div#cal>table td{
            background-color:white;
            height:50px;
            border-bottom:  0.5px lightcoral solid;
        } */
/*예매하기 버튼*/
div#cal+div>input {
	background-color: lightcoral;
	border: none;
	border-radius: 10px;
	width: 200px;
	height: 45px;
	font-size: 30px;
	color: white;
}

div#cal+div {
	text-align: center;
	margin: auto;
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

/* 리뷰 */
div#review>div:nth-of-type(2) {
	padding: 30px;
}

button#addBtn {
	width: 120px;
	height: 50px;
	background-color: lightcoral;
	border-radius: 10px;
	color: white;
	border: none;
}

div.reviewInfo>span {
	margin-right: 30px;
}

span.star {
	color: lightcoral;
	font-size: 20px;
}

div.reviewText {
	font-family: Nato Sans 300;
}

/* 예매하기버튼으로 빠른이동버튼 */
a[href="#cal"] {
	margin-right: 20px;
	color: lightcoral;
}

div.perfInfo ul {
	padding: 0;
	padding-left: 0;
	margin: 0;
}

div.perfInfo ul>li {
	padding-bottom: 10px;
}
div#pageBar{
	text-align: center;
}
</style>



<script>
$(function(){

		 //예매하기 버튼 누르면 나이 체크후 예매창 팝업 띄우기   

		    
        //오늘날짜 예약가능 최소 날짜로 넣기, 공연 마지막날짜도 불러와서 똑같이 할용
         	let date=new Date();
            let yyyy=date.getFullYear();
            let mm=date.getMonth()+1>9?date.getMonth()+1:"0"+(date.getMonth()+1);
            let dd=date.getDate()>9?date.getDate():"0"+date.getDate();
            $("input[type=date]").attr("min",yyyy+"-"+mm+"-"+dd);
            console.log($("input[type=date]").attr("min"));

        //리뷰작성 팝업창 (띄우기전 로그인, 공연관람여부 확인 함수 추가 필요)
    <%--     $("#addBtn").on("click",e=>{
        	if(loginMember!=null){
	
             let review=open("<%=request.getContextPath()%>/review/reviewWrite?perfNo=<%=perf.getPerfNo()%>","","width=800, height=600");
    
        	}            
               
        }); --%>
       
</script>
<section>

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
	<div id="calBox">
		<div class="subTitle">
			<h2>예매가능 일자</h2>
		</div>
		<form action="">
			<div id="cal">
				<P>예매날짜를 선택해주세요</P>
<%-- 				<input type="date" name="day" max="">
				<%if (m != null && perf != null) {%>
				<input type="hidden" value="<%=m.getMemberId()%>" name="memberId">
				<input type="hidden" value="<%=perf.getPerfNo()%>" name="perfNo">
				<%}%> --%>
				<br>
				<br>
				<!-- <table>
					<tr>
						<th>일</th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th>토</th>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					
				</table> -->
			</div>
			<div>
				<input type="submit" value="예매하기" onclick="return fn_book();">
			</div>
		</form>
	</div>
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
		<div class="subTitle">
			<h2>오시는 길</h2>
		</div>
		<div>
			<p id="placeName"><%=perf.getPerfLocation()%></p>
			<p id="address"><%=perf.getPerfAddress()%></p>
			<br>
			<!-- <div id="map" style="width: 500px; height: 400px;"></div> -->
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
			<button id="addBtn">관람후기 등록</button>
		</div>
		<div>
			<%if(rvList!=null){
				for(Review rv: rvList){%>
			<div>
				<div class="reviewInfo">
					<span class="userId"><%=rv.getMemberId()%></span> <span class="date">관람일시:<%=rv.getRevDate() %></span>
					
					<span class="star">
						<%for(int i=0;i<5;i++){
							if(i<rv.getRevScore()){%>
								★
							<%}else{%>
								☆
							<%}
						} %>
					</span>
				</div>
				<div class="reviewText">
					<%=rv.getRevContent() %>
				</div>
			</div>
			<br>
				<%}%>
			<br>	
			<br>
			
			<div id="pageBar">
				<%=request.getAttribute("pageBar") %>
			</div>
			
			<%}else{ %>
				<div>등록된 리뷰가 없습니다.</div>
			<%} %>
		</div>
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

/*지도*/
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
     content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=perf.getPerfLocation()%></div>'
});
infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>

<%@ include file="/views/common/footer.jsp"%>