<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너/프로모션관리 -관리자-</title>
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">

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
	    button,input[type=button]{
	    	font-family: 'Noto Sans KR';
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
        #lastTd{
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
		
		width: 700px;
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
		width: 750px;
		font-size:12px;
	}

</style>
<script>
$(function(){
	//공연검색을 위한 선택한category를 다른곳에서 선택가능하게 히든값에 담기
	$("#category").change(e=>{ 
        let v= $(e.target).val();
        console.log(v);
	   $("input[name=cate]").val(v); 
	});
	
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
							$("#inPerfNo").children().remove();
							let v=$(e.target).parent().parent().children("#no").text();
							console.log(v);
							$("#inPerfNo").append($("<input>").attr({"type":"text","name":"perfNo","value":v,"required":"required"})); 
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
	
	
	


	
	//동영상,메인배너, 서브배너 선택
	$("input[name='choice']").change(e=>{
		$("#resultTR").html("");
		let choice=$(e.target).val();
		console.log(choice);
		if((choice==("공연"))||(choice==("메인"))){
			let td=$("<td colspan='2'>");
			let file=$("<input type='file' name='upload' id='upload'>");
			let num1=$("<input>").attr({"type":"number","name":"w","id":"w","min":1,"placeholder":"폭"});
			let num2=$("<input>").attr({"type":"number","name":"h","id":"h","min":1,"placeholder":"넓이"});
			let con=$("<div id='imgContainer'>");
			file.change(e=>{
				let width=num1.val();
				let height=num2.val();
				let reader=new FileReader();
				console.log(width);
				console.log(height);
				reader.onload=e=>{
					let img=$("<img>").attr({"src":e.target.result,"width":width,"height":height});
					$("#imgContainer").html("");
					$("#imgContainer").append(img);
				}
				reader.readAsDataURL($(e.target)[0].files[0]);
			})
			

			$("#resultTR").append(td);
			td.append("미리보기 크기");
			td.append(file);
			td.append(num1);
			td.append("*");
			td.append(num2);
			td.append(con);
		}else if(choice=="동영상"){
			let textarea=$("<textarea rows='5' cols='80' placeholder='동영상 소스코드를  넣어주세요'>").attr({"id":"link","name":"link"});
			$("#resultTR").html(textarea);
		}
	})
	

	
	//전송 클릭시 실행할 로직
	$("#submit").click(e=>{
		let form=new FormData();
        form.append("choice",$("input[name='choice']:checked").val());
		form.append("link",($("textarea#link").val()==undefined?"":$("textarea#link").val()));
		form.append("perfNo",$("input[name=perfNo]").val());
		form.append("upload",($("#upload").val()!=null?$("#upload")[0].files[0]:""));
		console.log($("upload").hasOwnProperty("files"));
		$.ajax({
			url:"<%=request.getContextPath()%>/banner/bannerUpload",
			data:form, 
			type:"post",
			processData:false,
			contentType:false,
			success:data=>{
				if(data>0){
					alert("배너등록성공");				
					window.location.reload(); 
				}else{
					alert("배너등록실패");
				}
			}
		});
	});	
	
	//등록된 배너 리스트 
	function fn_bannerList(data){
		let table=$("<table id='boxTbl'>");
		let th=$("<tr>").append($("<th>").html("공연넘버"))
			.append($("<th>").html("공연이름"))
			.append($("<th>").html("메인배너"))
			.append($("<th>").html("서브배너"))
			.append($("<th>").html("동영상"))
			.append($("<th>").html("등록선택"))
		table.append(th);
		
		if(data.length<1){
			let tr=$("<tr>").append($("<td colspan='5'>").html("등록된 배너가 없습니다."));
			table.append(tr);
		}else{
			for(let i=0;i<data.length;i++){	
				let btn1=$("<button>").attr({"type":"button","class":"updateBtn"}).html("삭제");
				btn1.click(e=>{
					let perfNo=$(e.target).parent().parent().children("#no").text();
					let b1=$(e.target).parent().parent().children("#b1").text();
					let b2=$(e.target).parent().parent().children("#b2").text();
					$.ajax({
						url:"<%=request.getContextPath()%>/banner/bannerDelete",
						data:{"perfNo":perfNo,"b1":b1,"b2":b2}, 
						type:"post",
						success:data=>{
							if(data>0){
								alert("배너삭제성공");				
								window.location.reload(); 
							}else{
								alert("배너삭제실패");
							}
						}
					});
				});
		
				let tr=$("<tr>").append($("<td id='no'>").html(data[i]["perfNo"]));
				tr.append($("<td>").html(data[i]["perfName"]));
				if(data[i]["banner1"]!=null){						
					tr.append($("<td id='b1'>").html(data[i]["banner1"]));
				}else{
					tr.append($("<td id='b1'>").html("X"));
				}
				
				if(data[i]["banner2"]!=null){
					
					tr.append($("<td id='b2'>").html(data[i]["banner2"]));
				}else{
					tr.append($("<td id='b2'>").html("X"));
				}
				
				if(data[i]["link"]!=null){
					tr.append($("<td>").html("<img alt='' src='<%=request.getContextPath() %>/image/동영상.png' height='20px'>"));
				}else{
					tr.append($("<td>").html("X"));
				}
				let td=$("<td>");
				tr.append(td.append(btn1));
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
			<table id="big">
			<caption><h1>[관리자]배너/프로모션관리</h1></caption>
				<tr ><th colspan="2">현재 배너등록상황</th></tr>
				<tr>
					<td colspan="2">
						<div>
						<select name="category2" id="category2">
							<option value="All">All</option>
							<option value="S">연극</option>
							<option value="E">전시</option>
							<option value="M">뮤지컬</option>
						</select>
						</div>
						<div id="boxTblDiv" style="overflow:auto; width:750px; height:250px;">
							<table id="boxTbl">
							</table>
						</div>
					</td>
				</tr>
				
				<tr><th colspan="2">공연번호검색</th></tr>
				<tr>
					<td colspan="2">
						<div style="background-color:lightgray;">
						<select name="category" id="category">
							<option value="All">All</option>
							<option value="S">연극</option>
							<option value="E">전시</option>
							<option value="M">뮤지컬</option>
						</select>
						공연명:<input type="search" name="perfSearch" id="perfSearch" placeholder="공연명을 입력해주세요">
						<button type="button" id="searchBtn">검색</button>
						<div id="searchResult" style="overflow:auto; width:750px; max-height:150px;"></div>
						</div>
						<p id="inPerfNo">배너 등록/수정 공연번호: <input type="text" name="perfNo" required="required"></p>
						<label><input type="radio" name="choice" value="메인" checked>메인배너</label>
						<label><input type="radio" name="choice" value="공연" >서브 배너</label>
						<label><input type="radio" name="choice" value="동영상" >동영상</label>
					</td>
				</tr>
				<tr id="resultTR">
					
				</tr>
				<tr>
					<td colspan="2" id="lastTd">
					    <input type="hidden" name="cate">
					    <input type="button" id="submit" value="수정/등록">
					    <input type="button" value="닫기" onclick="self.close();">
					</td>
				</tr>
			</table>
		</form>
    </section>
</body>
</html>