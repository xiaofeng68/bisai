<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/mobile/modules/bisai/front/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
	<title><sitemesh:title default="欢迎光临"/></title>
	<%@ include file="/WEB-INF/views/mobile/modules/bisai/front/include/head.jsp"%>
	<sitemesh:head/>
</head>
<body>
<sitemesh:body/>
<footer class="index_footll" style="display:none;">
	<ul class="clearfix">
		<li class="active">
			<a href="index.html">
				<em class="img1"></em>
				<p>首页</p>
			</a>
		</li>
		<li class="">
			<a href="#">
				<em class="img27"></em>
				<p>消息</p>
			</a>
		</li>
		<li class="">
			<a href="${ctx }/${frontPath}match${urlSuffix}">
				<em class="img2"></em>
				<p>赛事</p>
			</a>
		</li>
		<li class="">
			<a href="${ctx }/${frontPath}my${urlSuffix}">
				<em class="img3"></em>
				<p>我的</p>
			</a>
		</li>
		<li class="">
			<a href="about.html">
				<em class="img28"></em>
				<p>关于</p>
			</a>
		</li>
	</ul>
</footer>	
</body>
</html>