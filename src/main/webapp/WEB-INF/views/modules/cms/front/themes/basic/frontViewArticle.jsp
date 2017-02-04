<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>${article.title} - ${category.name}</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${article.description} ${category.description}" />
	<meta name="keywords" content="${article.keywords} ${category.keywords}" />
</head>
<body>
    <div class="main1">
        <div class="left-bar">
        <div class="hot10"><h2>最热TOP10</h2>
	        <div class="left-bar-cont">
	            <ul>
		            <cms:frontArticleHitsWeight category="${category}"/>
		        </ul>
	        </div>
        </div>
        <div class="hot10"><h2>最新TOP10</h2>
	        <div class="left-bar-cont">
		        <ul>
		            <cms:frontArticleHitsTop category="${category}"/>
		        </ul>
	        </div>
        </div>
		</div>
        <div class="news-content"><h1>${article.title}</h1>
            <p class="news-sm"><small>时间：</small><fmt:formatDate value="${article.createDate}" pattern="yyyy/MM/dd HH:mm:ss"/><small>点击：</small>${article.hits }</p>
            <div class="news-content1">
            ${article.articleData.content}
            </div>
            <div class="n-p-news">
            <c:if test="${not empty beforeArticle }">
            <a class="p-news" href="${ctx}/view-${beforeArticle.category.id}-${beforeArticle.id}${urlSuffix}"> <span>上一篇：</span>${beforeArticle.title }</a>
            </c:if>
            <c:if test="${not empty afterArticle }">
            <a class="n-news" href="${ctx}/view-${afterArticle.category.id}-${afterArticle.id}${urlSuffix}"> <span>下一篇：</span>${afterArticle.title }</a>
            </c:if>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</body>
</html>