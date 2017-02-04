<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>${article.title}</title>
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
		<div class="newlist">
            <h1>${article.title}</h1>
            <div class="newsdetail">
                <div class="">${article.articleData.content}</div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</body>
</html>