<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너/프로모션관리 -관리자-</title>
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<style>
		body{
	     font-family: Noto Sans KR;
	     background-color: lightgray;
	    }
	    section{
	      padding: 30px;
	      margin:auto;
	      text-align: center;
	    }
        table{
            width:700px;
            height:300px;
            margin:auto;
            border-collapse: collapse; 
            min-width: 600px;
            border: 1px black solid;
            background-color:white;
        }
        
        table th{
            width:200px;
            text-align: left;
            color:black;
            padding-left:10px;
            font-size: 13px;
            border-bottom: 1px black solid;
            height: 25px;
            background-color: lightcoral;
            color:white;
            width:130px;
        }
        table td{
            margin-left:30px;
            padding:15px;
            text-align: left;
            border-bottom: 1px black solid;
            height: 25px;      
        }
        tr:last-of-type>td{
        	text-align: center;
        }
		div#imgContainer{
			margin:auto;
			text-align: center;
			width: 600px;
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
        #submit{
            width:100px;
            height:40px;
            background-color: lightcoral;
            color:white;
            border:none;
            border-radius: 10px;
        }
		table#searchTbl{
			margin:auto;
			width: 600px;
			font-size:12px;
		}
		table#searchTbl th{
			background-color:lightcoral;
			color:white;
			line-height: 18px;
			text-align:center;
		}
		table#searchTbl td{
			text-align:center;
			border-bottom: 1px lightcoral solid;
			line-height: 15px;
		} 
	table#boxTbl{
		margin:auto;
		width: 600px;
		font-size:12px;
	}
</style>
<script>
$(function(){
	//선택한 category를 다른곳에서 선택가능하게 히든값에 담기
	$("#category").change(e=>{ 
        let v= $(e.target).val();
        console.log(v);
	   $("input[name=cate]").val(v); 
	});
	
	//공연검색
	$("#searchBtn").on("click",e=>{
		let perfName=$("input[name=perfSearch]").val();
		if(perfName.length==0){
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
							$("#inPerfNo").children().remove();
							let v=$(e.target).parent().parent().children().html();
							console.log(v);
							$("#inPerfNo").append($("<input>").attr({"type":"text","id":"perfNo","value":v})); 
						});
						let tr=$("<tr>").append($("<td>").html(data[i]["perfNo"]))
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

	//등록된 배너 리스트
	$("#category2").change(e=>{ 
        let v= $(e.target).val();
        console.log(v)
		$.ajax({
			url:"<%=request.getContextPath()%>/banner/bannerList", 
			data:{"cate":v},
			type:"post",
			dataType:"json",
			success: function(data){ 
				fn_bannerList(data);
			}
		}); 
	});	
	
	
	
	//파일 업로드시 해당 그림 미리보기 출력하기
	$("#upload").change(e=>{
		let reader=new FileReader();
		reader.onload=e=>{
			let width=$("#w").val();
			let height=$("#h").val();
			let img=$("<img>").attr({"src":e.target.result,"width":width,"height":height});
			$("#imgContainer").html("");
			$("#imgContainer").append(img);
		}
		reader.readAsDataURL($(e.target)[0].files[0]);
	});
		

	//전송 클릭시 실행할 로직
	$("#submit").click(e=>{
		let form=new FormData();
 		if($("input[name=cate]").val()=== undefined){
        	alert('배너 페이지를 선택해주세요');
        }
		form.append("choice",$("input[name='choice']:checked").val());
		form.append("link",$("textarea#link").val());
		form.append("perfNo",$("input[name=perfNo]").val());
		form.append("upload",$("#upload")[0].files[0]);
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/bannerUpload",
			data:form, 
			type:"post",
			processData:false,
			contentType:false,
			success:data=>{
				if(data>0){
					alert("배너등록성공");				
					window.opener.location.reload(); 
					self.close();
				}else{
					alert("배너등록실패! 해당 공연 배너가 등록있는지 확인해주세요");
				}
			}
		});
	});	
	
	
	function fn_bannerList(data){
		
		let table=$("<table id='boxTbl'>");
		let th=$("<tr>").append($("<th>").html("공연넘버"))
			.append($("<th>").html("메인배너"))
			.append($("<th>").html("카테고리배너"))
			.append($("<th>").html("동영상주소"))
			.append($("<th>").html("등록선택"))
		table.append(th);
		
		if(data.length<1){
			let tr=$("<tr>").append($("<td colspan='5'>").html("등록된 배너가 없습니다."));
			table.append(tr);
		}else{
			for(let i=0;i<data.length;i++){	
				let btn1=$("<button>").attr({"type":"button","class":"updateBtn"}).html("수정");
				let btn2=$("<button>").attr({"type":"button","class":"deleteBtn"}).html("삭제");
				btn1.click(e=>{

				});
				btn2.click(e=>{

				});
				
				let tr=$("<tr>").append($("<td>").html(data[i]["perfNo"]));
				
				if(data[i]["banner1"]!=null){						
					tr.append($("<td>").html(data[i]["banner1"]));
				}else{
					tr.append($("<td>").html("없음"));
				}
				
				if(data[i]["banner2"]!=null){
					
					tr.append($("<td>").html(data[i]["banner2"]));
				}else{
					tr.append($("<td>").html("없음"));
				}
				
				if(data[i]["link"]!=null){
					tr.append($("<td>").html("영상있음"));
				}else{
					tr.append($("<td>").html("없음"));
				}
				
				let td=$("<td>");
				tr.append(td.append(btn1));
				tr.append(td.append(btn2));
				
				table.append(tr);

			}
		}
		
		$("#boxTblDiv").html("");
		$("#boxTblDiv").html(table);
	}
	
});
</script>
</head>

<body>
	<section>
		<form action="<%=request.getContextPath() %>/perf/bannerAdd" mothod="post">
			<table>
			<caption><h1>[관리자]배너/프로모션관리</h1></caption>
				<tr>
					<th>배너 위치</th>
					<td>
						<label><input type="radio" name="choice" value="메인" checked>메인</label>
						<label><input type="radio" name="choice" value="공연" >공연 카테고리</label>
						<br>
						<p id="inPerfNo">등록할 공연번호 입력:<input type="text" name="perfNo" required></p>
						<div style="background-color:lightgray; height:">
						<h5>공연번호 찾기</h5> 
						<select name="category" id="category">
							<option value="All">All</option>
							<option value="S">연극</option>
							<option value="E">전시</option>
							<option value="M">뮤지컬</option>
						</select>
						
						공연명:<input type="search" name="perfSearch" id="perfSearch" placeholder="공연명을 입력해주세요">
						<button type="button" id="searchBtn">검색</button>
						<div id="searchResult" style="overflow:auto; width:600px; height:150px;"></div>
						</div>
					</td>
				</tr>
				<tr>
					<th>
					배너등록상황
					</th>
					<td>
						<div>
						<select name="category2" id="category2">
							<option value="All">All</option>
							<option value="S">연극</option>
							<option value="E">전시</option>
							<option value="M">뮤지컬</option>
						</select>
						</div>
						<div id="boxTblDiv" style="overflow:auto; width:600px; height:150px;">
							<table id="boxTbl">
							</table>
						</div>
					</td>
				</tr>
				<tr>
					<th>동영상</th>
					<td>
						<textarea id="link" name="link" rows="5" cols="80" placeholder="동영상 소스코드를  넣어주세요" ></textarea>
					</td>
				</tr>
				<tr>
					<th>미리보기 사이즈</th>
					<td>
						<input type="number" name="w" id="w" min=1 placeholder="폭">
						*
						<input type="number" name="h" id="h" min=1 placeholder="넓이">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="file" name="upload" id="upload">
						<br><br>
						<div id="imgContainer"></div>
					    <br><br>
					    <input type="hidden" name="cate">
					    <input type="button" id="submit" value="등록">
					    <input type="button" value="닫기" onclick="self.close();">
					</td>
				</tr>
			</table>
		</form>
    </section>
</body>
</html>