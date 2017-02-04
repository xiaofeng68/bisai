<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
	<title><sitemesh:title default="欢迎光临"/> - ${site.title}</title>
	<%@include file="/WEB-INF/views/modules/cms/front/include/head.jsp" %>
	<c:if test="${not empty site.statisticsCode }">
		${site.statisticsCode!""}
	</c:if>
	<sitemesh:head/>
</head>
<body>
<div class="header">
    <div class="header-top">
        <div class="header-top1">你好！欢迎来到本站</div>
    </div>
    <div class="header-nav">
        <div class="logo">
            <img src="${site.logo }" />
        </div>
        <c:set var="cmsIndexParentId" value="${fns:getSettingContent('cmsIndexParentId') }"></c:set>
        <div class="nav fl" id="nav">
            <ul>
            	<c:forEach items="${fnc:getMainNavList(site.id,cmsIndexParentId)}" var="category" varStatus="status">
            	<c:if test="${status.index lt 9}">
            	<c:choose>
            	<c:when test="${empty category.href }">
            	<li class="n1"><span></span><a href="${category.url}" target="${category.target}">${category.name }</a></li>
            	</c:when>
                <c:otherwise>
                <li class="n1"><span></span><a href="${category.href }" target="${category.target }">${category.name }</a></li>
                </c:otherwise>
                </c:choose>
                </c:if>
                </c:forEach>
            </ul>
            <div class="clear"></div>
        </div>
        <c:set var="phoneLink" value="${fnc:getLink('f1c46fea7aa54d269c31ca0dbe432aff')}"/>
        <div class="phone"><img src="${phoneLink.image }" /><br /><span>${fns:getSettingContent('telphone') }</span></div>
    </div>
</div>
<div class="clear"></div>
	<c:set var="banner1Link" value="${fnc:getLink('671a04a351ad428bbfd3d732b1e71b82')}"/>
    <div class="banner"><div class="banner1"><img src="${banner1Link.image }" /></div></div>
    <div class="main">
    <div class="clear"></div>
	<sitemesh:body/>
    <div class="clear"></div>
    </div>
    <div class="footer1"><div class="footer2">
    <div class="foot-nav"><h2>关于我们</h2><ul>
    <li><a href="view-e023e3a6e33044b091274d5f9fc3a320-ddee6edf129445fb839fbbaf629a2d89.html">公司简介</a></li>
    <li><a href="view-e023e3a6e33044b091274d5f9fc3a320-03dda698f67342f280ed2e88ba3db705.html">加入我们</a></li></ul></div>
    <div class="foot-nav"><h2>服务支持</h2><ul>
    <li><a href="view-e023e3a6e33044b091274d5f9fc3a320-66711f3e8ecf416b85352804253a05ec.html">合作洽谈</a></li>
    <li><a href="view-e023e3a6e33044b091274d5f9fc3a320-f64ad55c26734b6abd760a79abd7ac94.html">招商代理</a></li></ul></div>
    <div class="foot-nav"><h2>法律声明</h2><ul>
    <li><a href="view-e023e3a6e33044b091274d5f9fc3a320-f6159c0200354ed9b61d598a473360e9.html">免责声明</a></li>
    <li><a href="view-e023e3a6e33044b091274d5f9fc3a320-be79be12e436479cb33f29fad3231a36.html">投诉建议</a></li></ul></div>
    <div class="foot-nav2">
    	<c:set var="androidLink" value="${fnc:getLink('f24babb08f5841da954ca1092b36411a')}"/>
        <a href="${androidLink.href }"><img src="${androidLink.image }" alt="" /></a>
        <c:set var="isoLink" value="${fnc:getLink('eddb233e7ce346fbb33fda34d95079bb')}"/>
        <a href="${isoLink.href }"><img src="${isoLink.image }" alt="" style="margin-top:20px;"/></a>
    </div>
    <div style="padding:50px 0 0 50px;width:150px;height:190px;float:left;">
      <c:set var="qrcode" value="${fnc:getLink('f2caf791ed29482892f7c5671d64a93b')}"></c:set> 
      <img src="${qrcode.image }" width="140" height="140" />
	  <p style="text-align:center;font-size:12px;line-height: 24px;">安卓用户扫描下载</p>
  	  <p style="text-align:center;font-size:12px;line-height: 24px;">随时随地在线答题</p>
	 </div>
    <div class="foot-contact">
    <p class="font16">客服电话：${fns:getSettingContent('telphone') }</p>
    <p>${fns:getSettingContent('worktimes') }</p>
    <p>地址：${fns:getSettingContent('teladdress') } </p>
    </div>
    <div class="clear"></div>
</div></div>
<div class="clear"></div>
<div class="footer3"></div>
<c:set var="qqLink" value="${fnc:getLink('101f489504f04da8861073d691569744')}"/>
<div class="kefuQQ"><a href="http://wpa.qq.com/msgrd?v=3&uin=${fns:getSettingContent('telqq1') }&site=qq&menu=yes" target="_blank"><img src="${qqLink.image }" /></a></div>
</body>
</html>