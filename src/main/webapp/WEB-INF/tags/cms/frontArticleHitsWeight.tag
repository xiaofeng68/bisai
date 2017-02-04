<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ attribute name="category"
	type="com.thinkgem.jeesite.modules.cms.entity.Category" required="true"
	description="栏目对象"%>
<%@ attribute name="pageSize" type="java.lang.Integer" required="false"
	description="页面大小"%>
<c:forEach
	items="${fnc:getArticleList(category.site.id, null, not empty pageSize?pageSize:10, 'posid:2, orderBy: \"weight desc\"')}"
	var="article">
	<li><a
		href="${ctx}/view-${article.category.id}-${article.id}${urlSuffix}"
		style="color:${article.color}" title="${article.title}">${article.title}</a></li>
</c:forEach>