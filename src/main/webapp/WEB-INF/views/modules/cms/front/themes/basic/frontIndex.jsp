<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="JeeSite ${site.description}" />
	<meta name="keywords" content="JeeSite ${site.keywords}" />
</head>
<body>
	<div class="lc">
    <ul>
    	<c:set var="cmsIndexMParentId" value="${fns:getSettingContent('cmsIndexMParentId') }"></c:set>
    	<c:forEach items="${fnc:getMainNavList(site.id,cmsIndexMParentId)}" var="category" varStatus="status">
    	<c:if test="${status.index lt 6}">
        <c:choose>
    	<c:when test="${empty category.href }">
    	<li><a href="${category.url}"><img src="${category.image }" /><p>${category.name }</p></a></li>
    	</c:when>
        <c:otherwise>
        <li><a href="${category.href }" target="${category.target }"><img src="${category.image }" /><p>${category.name }</p></a></li>
        </c:otherwise>
        </c:choose>
        </c:if>
        </c:forEach>
    </ul>
    </div>
	<c:set var="cmsIndexParentId" value="${fns:getSettingContent('cmsIndexParentId') }"></c:set>
	<c:forEach items="${fnc:getMainNavList(site.id,cmsIndexParentId)}" var="category" varStatus="status" begin="1">
	<c:if test="${status.index lt 7}">
	<div class="zixun" <c:if test="${status.index%3==0}">style="padding-right:0;"</c:if>><h2>${category.name }<a href="${category.url }">>>更多</a></h2>
        <img src="${category.image }" style="width:100%"/>
        <ul>
        	<c:forEach items="${fnc:getArticleList(site.id, category.id, 6, '')}" var="article">
			<li><a href="${article.url}">|<b style="color:${article.color}"><c:if test="${fn:contains(article.posid,'1') }">[顶]</c:if><c:if test="${fn:contains(article.posid,'2') }">[荐]</c:if></b>${fns:abbr(article.title,58)}</a><span><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></span></li>
			</c:forEach>
        </ul>
    </div>
    </c:if>
    </c:forEach>
    <div class="zixun1" id="zixun1-left"><h2>图文资讯</h2>
		<div id="marquee" class="marquee">
			<div class="ul" style="height:240px;overflow:hidden;">
				<c:forEach items="${fnc:getLinkList(site.id, 'bb503641b0e949bf8f94ea098670a692', 10, '')}" var="link">
				<div class="li"><a href="javascript:void(0);" rel="group1"><img src="${link.image }" style="width:500px;height:240px;" /></a></div>
				</c:forEach>
			</div>
		</div>
    </div>
    <script src="${ctxStaticTheme}/js/marquee.js" type="text/javascript"></script>
	<script type="text/javascript">
    $(function() {
        $('#marquee').marquee();
    })
	</script>
	<div class="zixun1" id="zixun1-right" style="padding-right:0;"><h2>品牌信誉</h2>
        <ul>
        	<c:forEach items="${fnc:getLinkList(site.id, 'c2db9e9f26144fb198388f26cedb47ce', 10, '')}" var="link">
            <li><a href="javascript:void(0);" rel="group2"><img src="${link.image }" /></a></li>
            </c:forEach>
        </ul>
    </div>
   	<script type="text/javascript">$("a[rel=group1]").fancybox(); $("a[rel=group2]").fancybox();</script>
</body>
</html>