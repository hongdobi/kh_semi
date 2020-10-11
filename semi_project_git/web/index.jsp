<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<body>
	<%@ include file="/views/common/header.jsp" %>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/indexHeader.css"></link>
	<% 
		//myImg="http://tkfile.yes24.com/imgNew/common/pf-ticket-w.png";
 		//buttonImg="http://tkfile.yes24.com/imgNew/common/pf-srch.png";
	%>
	<script>
		document.getElementById("buttonImg").setAttribute("src","http://tkfile.yes24.com/imgNew/common/pf-srch.png");
		document.getElementById("login_alarm").setAttribute("src","http://tkfile.yes24.com/imgNew/common/pf-ticket-w.png");
	</script>
    <div class="container">
        <div class="top-picture"
             style="background-color:salmon; height: 700px; margin-top: -100px; /* background-image: url(http://tkfile.yes24.com/Upload2/Display/202007/20200721/wel_mv_cdbe9e.jpg/dims/quality/70/); */ background-size: auto 100%; background-repeat: no-repeat; background-position: center;z-index:-1">
             <div><img src="http://tkfile.yes24.com/Upload2/Display/202009/20200925/wel_mv_37154.jpg/dims/quality/70/"></div>
             <div><img src="http://tkfile.yes24.com/Upload2/Display/202009/20200924/wel_mv_hope.jpg/dims/quality/70/"></div>
             <div><img src="http://tkfile.yes24.com/Upload2/Display/202009/20200925/wel_mv_000.jpg/dims/quality/70/"></div>
             <div><img src="http://tkfile.yes24.com/Upload2/Display/202010/20201007/wel_mv_si.jpg/dims/quality/70/"></div>
        </div>
        <div class="box-guide">
            <div class="ranking">
                <h2>RANKING</h2>
                <ul class="tab-list">
                    <li><a href="">#뮤지컬</a></li>
                    <li><a href="">#연극</a></li>
                    <li><a href="">#전시</a></li>
                    <li><a href="<%=request.getContextPath()%>/perf/RankList">#랭킹</a></li>
                </ul>
                <ul class="tab-contents">
                    <li>
                        <ul class="tab-content">
                            <li>
                                <a href="">
                                    <img src="http://tkfile.yes24.com/upload2/perfblog/202007/20200720/20200720-37241_1.jpg/dims/quality/70/"
                                         alt="">
                                    <div class="area-text">
                                        <span class="text-fire-1">1위</span>
                                        <h3> 뮤지컬 -캣츠- 40주년 내한공연 </h3>
                                        <span class="text-small-1">2020.09.09~2020.11.08 샤롯데씨어터</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <img src="http://tkfile.yes24.com/upload2/perfblog/202008/20200806/20200806-37312_11.jpg/dims/quality/70/"
                                         alt="">
                                    <div class="area-text">
                                        <span class="text-fire-1">2위</span>
                                        <h3> 조선샘총사 </h3>
                                        <span class="text-small-1">2020.09.09~2020.11.08 샤롯데씨어터</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
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