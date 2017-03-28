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
	<title>标题</title>
	<meta name="keywords" content="关键字">
    <meta name="description" content="">
	<link rel="stylesheet" type="text/css" href="${ctxStaticFront}/css/incstyle.css" media="all">
	<link rel="stylesheet" type="text/css" href="${ctxStaticFront}/css/index.css" media="all">
</head>
<body>
	<header class="grouping_header clearfix">
		<span class="fl">
			<a href="${ctx }/${frontPath}match${urlSuffix}">
				<img src="${ctxStaticFront}/images/r-arrow.png">
			</a>
		</span>
		<span>排名</span>
	</header>
	<section>
		<div class="match_topll_thir">
			<form>
				<div>
					<input class="inputl" type="text" placeholder="搜索">
					<input class="submitll" type="submit" value="搜索">
				</div>
			</form>
		</div>
		<div class="raning_list">
			<ul>
				<c:forEach var="people" items="${fns:getPeopleSort(match.id,type,stype) }">
					<li class="clearfix one">
					<span class="fl left">
						<span class="name">第一名</span>
						<span>张三</span>
					</span>
					<span class="fl content">
						<img src="${ctxStaticFront}/images/one.png">
					</span>
					<span class="fr right">21局21胜</span>
				</li>
				</c:forEach>
				<li class="clearfix one">
					<span class="fl left">
						<span class="name">第一名</span>
						<span>张三</span>
					</span>
					<span class="fl content">
						<img src="${ctxStaticFront}/images/one.png">
					</span>
					<span class="fr right">21局21胜</span>
				</li>
				<li class="clearfix two">
					<span class="fl left">
						<span class="name">第二名</span>
						<span>李四</span>
					</span>
					<span class="fl content">
						<img src="${ctxStaticFront}/images/two.png">
					</span>
					<span class="fr right">21局20胜</span>
				</li>
				<li class="clearfix three">
					<span class="fl left">
						<span class="name">第三名</span>
						<span>王武</span>
					</span>
					<span class="fl content">
						<img src="${ctxStaticFront}/images/three.png">
					</span>
					<span class="fr right">21局18胜</span>
				</li>
			</ul>
		</div>
	</section>