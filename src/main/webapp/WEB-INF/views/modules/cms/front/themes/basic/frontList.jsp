<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>${category.name}</title>
<meta name="decorator" content="cms_default_${site.theme}" />
<meta name="description" content="${category.description}" />
<meta name="keywords" content="${category.keywords}" />
</head>
<body>
<div class="clear"></div>
<div class="main1">
	<div class="left-bar">
		<div class="hot10">
			<h2>最热TOP10</h2>
			<div class="left-bar-cont">
				<ul>
					<cms:frontArticleHitsTop category="${category}"/>
				</ul>
			</div>
		</div>
		<div class="hot10">
			<h2>推荐TOP10</h2>
			<div class="left-bar-cont">
				<ul>
					<cms:frontArticleHitsWeight category="${category}"/>
				</ul>
			</div>
		</div>
	</div>
	<div class="newlist">
		<h1>${category.name}</h1>
		<div class="newlist1">
			<ul>
			<c:forEach items="${page.list}" var="article">
				<li><a href="${article.url}"><c:if test="${fn:contains(article.posid,'1') }"><b style="color: red">[顶]</b></c:if><c:if test="${fn:contains(article.posid,'2') }"><b style="color: ${article.color}">[荐]</b></c:if>${article.title }</a><span><fmt:formatDate value="${article.updateDate}" pattern="MM.dd"/></span></li>
			</c:forEach>
			</ul>
		</div>
		<div class="fenye">
		<c:if test="${page.last>1 }">	
			<c:forEach var="num" end="${page.last }" begin="1">
			<a href="${ctx}/list-${category.id}${urlSuffix}?pageNo=${num }&pageSize=${page.pageSize }" current>${num }</a>
			</c:forEach>
		</c:if>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div class="clear"></div>
</body>
</html>