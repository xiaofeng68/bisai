<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta name="author" content="${telphone }"/>
<meta http-equiv="X-UA-Compatible" content="IE=7,IE=9,IE=10" />
<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<c:choose>
    <c:when test="${site.theme eq 'basic'}">
        <link href="${ctxStaticTheme}/css/fancybox.css" type="text/css" rel="stylesheet" />
		<link href="${ctxStaticTheme}/css/reset.css" type="text/css" rel="stylesheet" />
		<link href="${ctxStaticTheme}/css/style.css" type="text/css" rel="stylesheet" />
		<script src="${ctxStaticTheme}/js/script.js" type="text/javascript"></script>
		<script src="${ctxStaticTheme}/js/jQuery.current.js" type="text/javascript"></script>
		<script src="${ctxStaticTheme}/js/jquery.fancybox-1.3.1.pack.js" type="text/javascript"></script>
    </c:when>
    <c:when test="${site.theme eq 'jkxy'}">
    	<link rel="stylesheet" href="${ctxStaticTheme}/css/register.css"/>
		<link rel="stylesheet" href="${ctxStaticTheme}/css/common_sync0_libs_4f30de2.css" />
		<link rel="stylesheet" href="${ctxStaticTheme}/css/common_sync1_libs_4637308.css" />
		<link rel="stylesheet" href="${ctxStaticTheme}/css/header_d41d8cd.css" />
		<link rel="stylesheet" href="${ctxStaticTheme}/css/index_sync0_libs_e853418.css" /></head>
		<link rel="stylesheet" href="${ctxStaticTheme}/css/header.css" />
		<link rel="stylesheet" href="${ctxStaticTheme}/css/footer.css" />
		<script src="${ctxStaticTheme}/js/browser.js" type="text/javascript"></script>
		<script src="${ctxStaticTheme}/js/footer.js" type="text/javascript"></script>
    </c:when>
    <c:otherwise>
        <link href="${ctxStatic}/bootstrap/2.3.1/css_${not empty cookie.theme.value ? cookie.theme.value : 'cerulean'}/bootstrap.min.css" type="text/css" rel="stylesheet" />
		<script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js" type="text/javascript"></script>
		<!--[if lte IE 6]><link href="${ctxStatic}/bootstrap/bsie/css/bootstrap-ie6.min.css" type="text/css" rel="stylesheet" />
		<script src="${ctxStatic}/bootstrap/bsie/js/bootstrap-ie.min.js" type="text/javascript"></script><![endif]-->
		<link href="${ctxStatic}/common/jeesite.min.css" type="text/css" rel="stylesheet" />
		<link href="${ctxStaticTheme}/style.css" type="text/css" rel="stylesheet" />
		<script src="${ctxStaticTheme}/script.js" type="text/javascript"></script>
    </c:otherwise>
</c:choose>