<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/mobile/modules/bisai/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta content="telephone=no" name="format-detection">
	<title>${siteTitle }</title>
    <meta name="keywords" content="${siteKeywords }">
    <meta name="description" content="${siteDescription }">
	<link rel="stylesheet" type="text/css" href="${ctxStaticFront}/css/incstyle.css" media="all">
	<link rel="stylesheet" type="text/css" href="${ctxStaticFront}/css/index.css" media="all">
</head>
<body>
	<header class="grouping_header clearfix">
		<span class="fl">
			<a href="${ctx }/${frontPath}${fromURL}">
				<img src="${ctxStaticFront}/images/r-arrow.png">
			</a>
		</span>
		<span>排名</span>
	</header>
	<section>
		<div class="raning_list">
			<ul>
				<c:forEach var="type" items="${fns:getMatchTypes(match.id) }">
				<c:forEach var="dic" items="${fns:getDictList('MatchTypeNote_type')}">
                <c:if test="${type.type==dic.value }">
                <li class="clearfix one">${dic.label }  </li>          
				<c:forEach var="result" items="${fns:getPeopleSort(match.id,type.btype,type.type) }" end="2" varStatus="num">
					<li class="clearfix one">
					<span class="fl left">
						<span class="name">第${util:numToUpper(num.index+1) }名</span>
						<c:choose>
							<c:when test="${type.btype==2  }">
								<span>${result.people.orgname }</span>
							</c:when>
							<c:otherwise>
								<span>${result.people.name }</span>
							</c:otherwise>
						</c:choose>
					</span>
					<span class="fl content">
						<img src="${ctxStaticFront}/images/result${num.index+1 }.png">
					</span>
					<span class="fr right">${result.jushu }局${result.shengju }胜</span>
				</li>
				</c:forEach>
				</c:if>
                </c:forEach>
				</c:forEach>
			</ul>
		</div>
	</section>