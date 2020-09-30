<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fs.model.vo.Member,com.fs.model.vo.Performance,com.fs.model.vo.Booking, java.sql.Date, java.util.List" %>	

<% 
	String perfName=(String)request.getAttribute("perfName");
	String perfNo=(String)request.getParameter("perfNo");
	//List<Booking> bkList=(List)request.getAttribute("bkList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>오성티켓-리뷰페이지</title>
<script src="js/jquery-3.5.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
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

        section input[type="reset"]{
            width:100px;
            height:40px;
            color: lightcoral;
            background-color:white;
            border:1px lightcoral solid;
            border-radius: 10px;
        }
        section input[type="submit"]{
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
            background-image: url(image/ico-star-off.png);
        }
        .off{
            background-image: url(image/ico-star-off.png); 

            width: 30px;
            height: 30px;
        }
        .on{
            background-image: url(img/ico-star-on.png); 
            width: 30px;
            height: 30px;
            background-repeat:no-repeat;
        }
    </style>
    
</head>
<body>
	<section>
		<form action="<%=request.getContextPath() %>/review/reviewWirteEnd.do" mothod="post">
			<div>
				<br>
				<table id="revieWrite">
					<tr>
						<th colspan="2">
							공연명<%-- <%=perf.getPerfName() %> --%>
						</th>
					</tr>
					<tr>
						<th>관람일시</th>
						<td></td>
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
							
							<input type="hidden" id="revScore" name="revScore" >
						</td>
					</tr>

					<%-- <input type="hidden" name="memberNo" value="<%=loginMember.getMemberNo()%>"> --%>
						
					<tr>
						<th>작성내용</th>
						<td>
							<textarea name="reviewtext" id="reviewtext" cols="80" rows="20" resize=none required></textarea>
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
				<input type="reset" value="취소">&nbsp;&nbsp;&nbsp;
				<input type="submit" value="등록" onclick="fn_close();">
			</div>
		</form>
	</section>
</body>
<script>
	//별점 부여
	$(function(){
		$(".star").on('click', function() {
			var idx = $(this).index();
			$(".star").removeClass("on");
			for (let i = 0; i <= idx; i++) {
				$(".star").eq(i).addClass("on");
				
				var count=idx+1
				document.getElementById("revScore").val() = count;
				}
		});
		
		function fn_close(){
			
			close(); 
		}
	})
</script>
</html>