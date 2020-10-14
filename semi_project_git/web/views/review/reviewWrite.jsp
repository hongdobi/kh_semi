<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fs.model.vo.Member,com.fs.model.vo.Performance,com.fs.model.vo.Booking, com.fs.model.vo.Review,
java.sql.Date, java.util.List,java.util.ArrayList,java.text.SimpleDateFormat" %>	

<% 
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Review revUpdate=null;
	int memberNo=0;
	Performance perf=null;
	List<Booking> bkList=new ArrayList();
	if(request.getAttribute("revUpdate")!=null){
		revUpdate=(Review)request.getAttribute("revUpdate");
	}else{
	   	memberNo=Integer.parseInt(request.getParameter("memberNo"));
		perf=(Performance)request.getAttribute("perf");
		bkList=(List)request.getAttribute("bkList");
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>오성티켓-리뷰페이지</title>
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">
    <style>
        body{
            font-family: Noto Sans KR;
        }
        section{
            padding: 30px;
            margin:auto;
            text-align: center;
        }
        table#revieWrite{
            width:700px;
            height:300px;
            margin:auto;
            border-collapse: collapse; 
        }
        
        table#revieWrite th{
            width:200px;
            text-align: left;
            color:black;
            padding-left:10px;
            font-size: 15px;
            border-bottom: 1px black solid;
            height: 25px;
            
        }
        table#revieWrite td{
            margin-left:30px;
            padding:15px;
            text-align: left;
            border-bottom: 1px black solid;
            height: 25px;
            
        }
        table#revieWrite tr:first-of-type>th{
            font-size: 30px; 
            padding-bottom: 10px;         
        }
        table#revieWrite tr:nth-of-type(5)>*{
            border-bottom: 1px lightgray solid;
        }
        textarea#reviewtext{
            width:577px; 
            height:120px; 
            resize:none;
            border-radius:10px;
            border: 1px black solid;
        }

        section input[type="button"]{
            width:100px;
            height:40px;
            color: lightcoral;
            background-color:white;
            border:1px lightcoral solid;
            border-radius: 10px;
        }
        #inputcheck{
            width:100px;
            height:40px;
            background-color: lightcoral;
            color:white;
            border:none;
            border-radius: 10px;
        }
        table#revieWrite td:last-of-type{
            font-size:0.8em;
        }
        ul#rvNtn>li{
            list-style-type: square;
        }
        section a{
            text-decoration: none;
        }
        .star{
            display:inline-block;
            width: 30px;
            height: 30px;
            cursor: pointer;
            background-image: url("<%=request.getContextPath() %>/image/ico-star-off.png");
        }
        .off{
            background-image: url("<%=request.getContextPath() %>/image/ico-star-off.png"); 

            width: 30px;
            height: 30px;
        }
        .on{
            background-image: url("<%=request.getContextPath() %>/image/ico-star-on.png"); 
            width: 30p
            height: 30px;
            background-repeat:no-repeat;
        }
    </style>

</head>
<body>
	<section>
		<%if(revUpdate!=null){ %>
			<form name="reviewUpdate"action="<%=request.getContextPath() %>/review/reviewUpdateEnd" mothod="post">
		<%}else{ %>
			<form name="reviewWrite" action="<%=request.getContextPath() %>/review/reviewWirteEnd" mothod="post">
		<%} %>	
			<div>
				<br>
				<table id="revieWrite">
					<tr>
						<th colspan="2">
						<%if(revUpdate!=null){ %>
							<%=request.getAttribute("perfName") %>
						<%}else{ %>
							<%=perf.getPerfName() %>  
						<%}%>
						</th>
					</tr>
					<tr>
						<th>관람일시</th>
						<td>
							<%if(revUpdate!=null){ %>
								<%=sdf.format(revUpdate.getPerfDate()) %>
							<%}else{ %>
								<select name="perfDate" id="perfDate" required>
									<option value="">선택해주세요</option>
									<%for(Booking bk:bkList){%>
										<%String day=sdf.format(bk.getPerfDate());%>
										<option value="<%=day %>,<%=bk.getNthPerf()%>,<%=bk.getBookNo()%>"><%=day %></option>
									<%} %>
								</select>
							<%} %>
						</td>
					</tr>
					<tr>
						<th>별점</th>
						<td>
							<div class="star-box">
								<span class="star"></span> 
								<span class="star"></span> 
								<span class="star"></span> 
								<span class="star"></span> 
								<span class="star"></span>
							</div>
						</td>
					</tr>
					
					<tr>
						<th>작성내용</th>
						<td>
							<%if(revUpdate!=null){ %>
								<textarea name="reviewtext" id="reviewtext" cols=80 rows=10 resize=none maxlength=250 required><%=revUpdate.getRevContent() %></textarea>
							<%}else{ %>
								<textarea name="reviewtext" id="reviewtext" cols=80 rows=10 resize=none maxlength=250 placeholder=" 작성시  250자 이내로 적어주세요." required></textarea>
							<%} %>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<h4 style="color: lightcoral;">관람후기 작성시 유의사항</h4>
							<p>게시판 운영 규정에 위반된다고 판단되는글을 사전고지 없이 삭제될수 있습니다.</p>
							<ul>
								<li>티켓 매매 및 양도, 교환의 글</li>
								<li>전화번호, 이메일, 주소 등 회원 및 타인의 개인정보 유출이 우려되는 경우</li>
								<li>욕설, 비방, 도배성 글을 작성한 경우</li>
								<li>명예훼손, 저작권, 초상권의 권리 침해 및 음란한 사진을 게재한 경우</li>
							</ul>
						</td>
					</tr>
				</table>
			</div>
			<br>
			<div>
			<%if(revUpdate!=null){ %>
				<input type="hidden" name="revScore">
				<input type="hidden" name="memberNo" value="<%=revUpdate.getMemberNo()%>">
				<input type="hidden" name="perfNo" value="<%=revUpdate.getPerfNo()%>">
				<input type="hidden" name="bookNo" value="<%=revUpdate.getBookNo()%>">
				<input type="button" value="닫기" onclick="self.close();">&nbsp;&nbsp;&nbsp;
				<button type="button" id="inputcheck">수정</button>

			<%}else{ %>
				<input type="hidden" name="memberNo" value="<%=memberNo%>">
				<input type="hidden" name="bookNo">
				<input type="hidden" name="nthPerf">
				<input type="hidden" name="perfDate">
				<input type="hidden" name="revScore">
				<input type="hidden" name="perfNo" value="<%=perf.getPerfNo()%>">
				<input type="button" value="닫기" onclick="self.close();">&nbsp;&nbsp;&nbsp;
				<button type="button" id="inputcheck">등록</button>
			<%} %>	
			</div>
		</form>
	</section>
	<script>
	$(function(){
		
		//별점 부여
		$(".star").on("click",function() {
			$(this).parent().children(".star").removeClass("on");  
            $(this).addClass("on").prevAll(".star").addClass("on"); 
			let idx=$(".on").length;
			console.log(idx);
			$("input[name=revScore]").val(idx);	
		});
		
		$("#inputcheck").click(e=>{
			<%if(revUpdate!=null){ %>
			
				if(!$("input[name=revScore]").val()) {
					   alert("별점을 선택해주세요"); return;
				}
				if(!$("#reviewtext").val()){
					   alert("리뷰글을 입력해주세요");	 return;			
				}
					reviewUpdate.submit();
				
			<%}else{%>
				if(!$("input[name=perfDate]").val()){
					  alert("관람일자를 선택해주세요");
					  return;
				}
				if(!$("input[name=revScore]").val()) {
					   alert("별점을 선택해주세요"); return;
				}
				if(!$("#reviewtext").val()){
					   alert("리뷰글을 입력해주세요");	 return;			
				}
					reviewWrite.submit();
			<%}%>
			
		});
		
		//관람일시 선택시 히든값으로 보내기
        $("#perfDate").change(e=>{ 
        	let v= $(e.target).val();
        		let arr=v.split(",");
	        	console.log(arr[0]);
	        	console.log(arr[1]);
	        	console.log(arr[2]);
	        	$("input[name=perfDate]").val(arr[0]); 
	        	$("input[name=nthPerf]").val(arr[1]); 
	        	$("input[name=bookNo]").val(arr[2]); 
        	
        });
		
	});
</script>
</body>

</html>