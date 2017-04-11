<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/mobile/modules/bisai/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${siteTitle }</title>
    <meta name="decorator" content="bisai"/>
    <meta name="description" content="${siteDescription }"/>
    <meta name="keywords" content="${siteKeywords }"/>
</head>
<body>
<bisai:message content="${message}"/>
<section class="match_sectionll">
    <div class="match_topll_thir">
        <form action="${ctx }/${frontPath}allmatchSearch${urlSuffix}">
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
</section>
</body>
</html>