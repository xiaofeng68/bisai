<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/mobile/modules/bisai/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${siteTitle }</title>
    <meta name="decorator" content="bisai"/>
    <meta name="description" content="${siteDescription }"/>
    <meta name="keywords" content="${siteKeywords }"/>
    <script type="text/javascript">
        $(function () {
            $(".div_select").each(function () {
                var selid = $(this).attr('div-select-val');
                var divselectid = "#divselect" + selid;
                var inputselectid = "#inputselect" + selid;
                divselect(divselectid, inputselectid);
            });

            //tab切换
            $(".match_topll_sec li").click(function () {
                var user = '${CURRENTACCOUNT}';
                if (user && $(this).index() == 1) {
                    $(this).addClass("active").siblings().removeClass("active");
                    $(".match_fourll").hide().eq($(this).index()).show();
                } else if ($(this).index() == 1) {
                    window.location.href = "${ctx }${frontPath}/my.html";
                } else {
                    $(this).addClass("active").siblings().removeClass("active");
                    $(".match_fourll").hide().eq($(this).index()).show();
                }
            });
            var ismy = '${ismy}';
            if (ismy == 'true') {
                var i = 0;
                $(".match_topll_sec li").each(function () {
                    if (i == 1) {
                        $(this).addClass("active").siblings().removeClass("active");
                        $(".match_fourll").hide().eq($(this).index()).show();
                    }
                    i++
                });
            }
        });
        function divselect(divselectid, inputselectid) {
            var inputselect = $(inputselectid);
            $(divselectid + " cite").click(function () {
                var ul = $(divselectid + " ul");
                if (ul.css("display") == "none") {
                    ul.slideDown("fast");
                } else {
                    ul.slideUp("fast");
                }
            });
            $(divselectid + " ul li a").click(function () {
                var txt = $(this).text();
                $(divselectid + " cite").html(txt);
                var value = $(this).attr("selectid");
                inputselect.val(value);
                $(divselectid + " ul").hide();

            });
        };
    </script>
</head>
<body>
<bisai:message content="${message}"/>
<section class="match_sectionll">
    <div class="match_link">
        <a href="${ctx }/${frontPath}apply${urlSuffix}">申请比赛</a>
    </div>
    <div class="match_topll_sec">
        <ul class="clearfix">
            <li class="active"><em class="sec_bg2"></em>
                <span>所有赛事</span>
            </li>
            <li><em class="sec_bg1"></em>
                <span>我的赛事</span>
            </li>
        </ul>
    </div>
    <div class="match_topll_thir">
        <form action="${ctx }/${frontPath}matchSearch${urlSuffix}">
            <div>
                <input class="inputl" type="text" name="searchName" placeholder="搜索" value="${smatch.searchName }">
                <input class="submitll" type="submit" value="搜索"></div>
        </form>
    </div>
    <div class="match_fourll">
        <ul>
            <c:forEach items="${page.list}" var="match">
                <c:if test="${match.state>0 }">
                    <li>
                        <div class="clearfix">
                            <a href="${ctx }/${frontPath}activity${urlSuffix}?id=${match.id}&isall=1">
                                <div class="fl clearfix suggestll">
                                    <c:choose>
                                        <c:when test="${not empty match.account and not empty match.account.img}">
                                            <img class="img24 fl" src="${match.account.img }">
                                        </c:when>
                                        <c:otherwise>
                                            <img class="img24 fl" src="${ctxStaticFront}/images/img11.png">
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="fl suggestlx">
                                        <p class="ellipsis">${match.name }</p>
                                        <p class="ellipsis">${ fn:split(match.orgs, ',')[0] }</p>
                                    </div>
                                </div>
                            </a>
                            <div class="fr namell"><!-- 20km --></div>
                        </div>
                        <div>
                            <span class="timell"><fmt:formatDate value="${match.starttime }" pattern="M月d日"/>-<fmt:formatDate value="${match.endtime }" pattern="M月d日"/></span>
                        </div>
                        <div class="suggestlx1"><label>${match.address }${match.detailAddress }</label></div>
                        <div class="positionll">
                            <c:choose>
                                <c:when test="${match.state == 1}">
                                    <a href="${ctx }/${frontPath}activity${urlSuffix}?id=${match.id}&isall=1&baoming=1">
                                        <em class="em${match.state }"></em>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${ctx }/${frontPath}activity${urlSuffix}?id=${match.id}&isall=1">
                                        <em class="em${match.state }"></em>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                            <p>人数：${fns:getMatchPeople(match.id) }人</p>
                        </div>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
    <c:if test="${CURRENTACCOUNT!=null }">
        <div class="match_fourll" style="display:none;">
            <ul>
                <c:forEach items="${mypage.list}" var="match">
                    <li>
                        <div class="clearfix">
                            <a href="${ctx }/${frontPath}activity${urlSuffix}?id=${match.id}">
                                <div class="fl clearfix suggestll">
                                    <c:choose>
                                        <c:when test="${not empty match.account and not empty match.account.img}">
                                            <img class="img24 fl" src="${match.account.img }">
                                        </c:when>
                                        <c:otherwise>
                                            <img class="img24 fl" src="${ctxStaticFront}/images/img11.png">
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="fl suggestlx">
                                        <p class="ellipsis">${match.name }</p>
                                        <p class="ellipsis">${match.orgs }</p>
                                    </div>
                                </div>
                            </a>
                            <div class="fr namell"></div>
                        </div>
                        <div>
                            <span class="timell"><fmt:formatDate value="${match.starttime }" pattern="M月d日"/>-<fmt:formatDate value="${match.endtime }" pattern="M月d日"/></span>
                            <div class="suggestlx1">
                                <label>${match.address }${match.detailAddress }</label>
                            </div>
                            <c:choose>
                                <c:when test="${match.state==0 }">
                                    <div style="height:2.5rem;">
                                        <div class="button_update fl"><a href="${ctx }/${frontPath}match/editMatch${urlSuffix}?id=${match.id}">编辑</a></div>
                                        <div class="button_shut fl"><a href="${ctx }/${frontPath}match/closeMatch${urlSuffix}?id=${match.id}">关闭</a></div>
                                    </div>
                                </c:when>
                                <c:when test="${match.state==1 }">
                                    <c:if test="${empty match.changci or match.changci=='0'}">
                                        <div class="button"><a  href="${ctx }/${frontPath}match/matchBm${urlSuffix}?type=1&id=${match.id}">单项报名</a>
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty match.changci and match.changci!='0'}">
                                        <div class="button"><a href="${ctx }/${frontPath}match/matchBm${urlSuffix}?type=2&id=${match.id}">团体报名</a></div>
                                    </c:if>
                                </c:when>
                                <c:when test="${match.state==2 }">
                                    <c:if test="${empty match.changci or match.changci=='0'}">
                                        <div style="height:2.5rem;">
                                            <div class="button_update fl"><a
                                                    href="${ctx }/${frontPath}match/matchScore${urlSuffix}?type=1&stype=0&id=${match.id}">查看成绩</a></div>
                                            <div class="button_shut fl"><a
                                                    href="${ctx }/${frontPath}match/matchScore${urlSuffix}?type=1&stype=1&id=${match.id}">成绩录入</a></div>
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty match.changci and match.changci!='0'}">
                                        <div style="height:2.5rem;">
                                            <div class="button_update fl"><a
                                                    href="${ctx }/${frontPath}match/matchScore${urlSuffix}?type=2&stype=0&id=${match.id}">查看成绩</a></div>
                                            <div class="button_shut fl"><a
                                                    href="${ctx }/${frontPath}match/matchScore${urlSuffix}?type=2&stype=1&id=${match.id}">成绩录入</a></div>
                                        </div>
                                    </c:if>
                                </c:when>
                                <c:when test="${match.state==-1 }">
                                    <div class="button"><a
                                            href="${ctx }/${frontPath}match/matchRecreate${urlSuffix}?id=${match.id}">再次发起</a></div>
                                </c:when>
                            </c:choose>
                        </div>
                        <div class="positionll">
                            <c:choose>
                                <c:when test="${match.state == 1}">
                                    <a href="${ctx }/${frontPath}activity${urlSuffix}?id=${match.id}&baoming=1">
                                        <em class="em${match.state }"></em>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${ctx }/${frontPath}activity${urlSuffix}?id=${match.id}">
                                        <em class="em${match.state }"></em>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                            <p>人数：${fns:getMatchPeople(match.id) }人</p>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </c:if>
</section>
</body>
</html>