<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fs.model.vo.Performance,com.fs.model.vo.Banner,java.util.List, java.util.ArrayList,com.fs.banner.model.service.BannerService,com.fs.perfSsn.model.service.PerfSsnService,com.fs.perf.model.service.PerfService" %>
<!DOCTYPE html>
<%
	List<Banner> list = new BannerService().selectBannerList("All");
	List<Performance> rank = new PerfSsnService().rank();
	List<Performance> musical = new PerfService().mainPoster("M");
	List<Performance> show= new PerfService().mainPoster("S");
	List<Performance> exhibition = new PerfService().mainPoster("E");
	int ranking = 1;
%>
<html lang="ko">
<%
	
%>

<body>
	<%@ include file="/views/common/header.jsp" %>
	<% 
		//myImg="http://tkfile.yes24.com/imgNew/common/pf-ticket-w.png";
 		//buttonImg="http://tkfile.yes24.com/imgNew/common/pf-srch.png";
	%>
	<script>
		document.getElementById("header").className="mainHeader";
		
		document.getElementById("buttonImg").setAttribute("src","http://tkfile.yes24.com/imgNew/common/pf-srch.png");
		<%if(loginMember!=null){%>
			document.getElementById("logoutBtn").setAttribute("src","<%=request.getContextPath()%>/image/logoutw.png");
		//document.getElementById("login_alarm").setAttribute("src","http://tkfile.yes24.com/imgNew/common/pf-ticket-w.png");
			<%if(loginMember.getManagerYn().equals("Y")){%>
				document.getElementById("crown").setAttribute("src","<%=request.getContextPath()%>/image/crown-w.png");
			<%}else{%>
				document.getElementById("login_alarm").setAttribute("src","http://tkfile.yes24.com/imgNew/common/pf-ticket-w.png");
			<%}%>
		<%}else{%>
			document.getElementById("login_alarm").setAttribute("src","http://tkfile.yes24.com/imgNew/common/pf-ticket-w.png");
			//document.getElementById("login_alarm").setAttribute("src","http://tkfile.yes24.com/imgNew/common/pf-ticket-w.png"); 
		<%}%>
		
	</script>
    <div class="container">
        <div class="top-picture"
             style="background-color:salmon; height: 700px; margin-top: -100px; /* background-image: url(http://tkfile.yes24.com/Upload2/Display/202007/20200721/wel_mv_cdbe9e.jpg/dims/quality/70/); */ background-size: auto 100%; background-repeat: no-repeat; background-position: center;">
             <!-- <div><img src="http://tkfile.yes24.com/Upload2/Display/202009/20200925/wel_mv_37154.jpg/dims/quality/70/"></div>
             <div><img src="http://tkfile.yes24.com/Upload2/Display/202009/20200924/wel_mv_hope.jpg/dims/quality/70/"></div>
             <div><img src="http://tkfile.yes24.com/Upload2/Display/202009/20200925/wel_mv_000.jpg/dims/quality/70/"></div>
             <div><img src="http://tkfile.yes24.com/Upload2/Display/202010/20201007/wel_mv_si.jpg/dims/quality/70/"></div> -->
             <%for(Banner b : list) {%>
             	<%if(b.getBanner1()!=null) {%>
             		<div><a href="<%=request.getContextPath() %>/perf/perfView?perfNo=<%=b.getPerfNo()%>"><img src="<%=request.getContextPath()%>/image/banner/<%=b.getBanner1()%>" width="100%" height="700"></a></div>
            		<%} %>
             <%} %>
        </div>
				<div class="box-guide">
					<section class="section-main ranking">
						<h2 class="title">월간 예매랭킹</h2>
						<%-- <ul class="tab-list">
									<li><a href="">#뮤지컬</a></li>
									<li><a href="">#연극</a></li>
									<li><a href="">#전시</a></li>
									<li><a href="<%=request.getContextPath()%>/perf/RankList.do">#랭킹</a></li>
						</ul> --%>
						<ul class="list-column">
							<%if(rank!=null) {%>
							<% for(Performance p : rank){%>
							<li>
								<a href="<%=request.getContextPath() %>/perf/perfView?perfNo=<%=p.getPerfNo()%>">
									<div class="area-img bg-clone" style="background-image:url('<%=request.getContextPath() %>/image/perf/<%=p.getPerfNo()%>/<%=p.getPerfPoster() %>')">
										<img src="<%=request.getContextPath() %>/image/perf/<%=p.getPerfNo()%>/<%=p.getPerfPoster() %>" alt="" class="poster">
									</div>
									<div class="area-text">
										<span class="text-fire-1"><%=ranking %>위</span>
										<h3> <%=p.getPerfName() %> </h3>
										<span class="text-small-1"><%=p.getPerfStart() %>~<%=p.getPerfEnd() %></span>
									</div>
								</a>
							</li>
							<%ranking++;}%>
							<%} %>
						</ul>
						<a href="<%=request.getContextPath()%>/perf/RankList" class="rankBtn"><span>more ranking+</span></a>
					</section>
					<section class="section-main">			
						<h2 class="title">MUSICAL</h2>
						<ul class="list-column">
							<%for(Performance p : musical) {%>
							<li>
								<a href="<%=request.getContextPath() %>/perf/perfView?perfNo=<%=p.getPerfNo()%>">
									<div class="area-img basic">
										<img src="<%=request.getContextPath() %>/image/perf/<%=p.getPerfNo()%>/<%=p.getPerfPoster() %>" alt="" class="poster">
									</div>
									<div class="area-text">
										<h3> <%=p.getPerfName()%> </h3>
										<span class="text-small-1">><%=p.getPerfStart() %>~<%=p.getPerfEnd() %></span>
									</div>
								</a>
							</li>
							<%} %>
						</ul>
					</section>
					<section class="section-main">
						<h2 class="title">EXHIBITION</h2>
						<ul class="list-column">
							<%for(Performance p : exhibition) {%>
							<li>
								<a href="<%=request.getContextPath() %>/perf/perfView?perfNo=<%=p.getPerfNo()%>">
									<div class="area-img basic">
										<img src="<%=request.getContextPath() %>/image/perf/<%=p.getPerfNo()%>/<%=p.getPerfPoster() %>" alt="" class="poster">
									</div>
									<div class="area-text">
										<h3> <%=p.getPerfName()%> </h3>
										<span class="text-small-1">><%=p.getPerfStart() %>~<%=p.getPerfEnd() %></span>
									</div>
								</a>
							</li>
							<%} %>
						</ul>
					</section>
					<section class="section-main">		
						<h2 class="title">SHOW</h2>
						<ul class="list-column">
							<%for(Performance p : show) {%>
							<li>
								<a href="<%=request.getContextPath() %>/perf/perfView?perfNo=<%=p.getPerfNo()%>">
									<div class="area-img basic">
										<img src="<%=request.getContextPath() %>/image/perf/<%=p.getPerfNo()%>/<%=p.getPerfPoster() %>" alt="" class="poster">
									</div>
									<div class="area-text">
										<h3> <%=p.getPerfName()%> </h3>
										<span class="text-small-1">><%=p.getPerfStart() %>~<%=p.getPerfEnd() %></span>
									</div>
								</a>
							</li>
							<%} %>
						</ul>
					</section>
				</div>
    </div>
    <a href="views/error404.jsp">없는페이지 이동</a>
    <a href="views/common/500.jsp">500 페이지 이동</a>
	<%@ include file="/views/common/footer.jsp" %>
</body>
<script type="text/javascript">
    $(document).ready(function(){
      $('.top-picture').slick({
        dots: true,
        infinite: true,
        autoplay: true,
        speed:500,
        fade:true
      });
    });
    </script>

</html>