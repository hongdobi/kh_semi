<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html>
<html lang="ko">
 -->
<body>
	<%@ include file="/views/common/header.jsp" %>
    <div class="container">
        <div class="top-picture"
             style="background-color:rgb(205, 190, 158); height: 700px; margin-top: -100px; background-image: url(http://tkfile.yes24.com/Upload2/Display/202007/20200721/wel_mv_cdbe9e.jpg/dims/quality/70/); background-size: auto 100%; background-repeat: no-repeat; background-position: center;">
        </div>
        <div class="box-guide">
            <div class="ranking">
                <h2>RANKING</h2>
                <ul class="tab-list">
                    <li><a href="">#뮤지컬</a></li>
                    <li><a href="">#연극</a></li>
                    <li><a href="">#전시</a></li>
                    <li><a href="<%=request.getContextPath()%>/perf/RankList.do">#랭킹</a></li>
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

</html>