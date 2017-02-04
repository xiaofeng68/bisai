<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html>
<head>
<title><sitemesh:title default="欢迎光临" /> - ${site.title} </title>
<%@include file="/WEB-INF/views/modules/cms/front/include/head.jsp"%>
<c:if test="${not empty site.statisticsCode }">
		${site.statisticsCode!""}
</c:if>
<sitemesh:head />
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<div class="w-1000 relative">
				<a href="${ctx }/${frontPath }index-${site.id }${urlSuffix }" class="logo">
					<img src="${site.logo }" height="40" width="109" />
				</a>
				<!--nav-->
				<nav>
					<ul class="header-nav">
						<li><a href="${ctx }/${frontPath }index-${site.id }${urlSuffix }">首页</a></li>
						<li>职业学院<i class="arrow-icon"></i>
							<div class="submenu school-list">
								<h3>前端学院</h3>
								<a href="http://www.jikexueyuan.com/zhiye/web"><i class="web-icon"></i>Web 前端工程师</a>
								<h3>后端学院</h3>
								<a href="http://www.jikexueyuan.com/zhiye/python"><i class="python-icon"></i>Python Web工程师</a>
								<a href="http://www.jikexueyuan.com/zhiye/go"><i class="go-icon"></i>Go语言工程师</a>
								<h3>移动学院</h3>
								<a href="http://www.jikexueyuan.com/zhiye/ios"><i class="ios-icon"></i>iOS工程师</a>
							</div>
						</li>
						<li>会员课程<i class="arrow-icon"></i>
							<div class="submenu vip-lesson">
								<a href="http://www.jikexueyuan.com/course/"><i class="kck-icon"></i>课程库<span>2500+</span></a> 
								<a href="http://ke.jikexueyuan.com/zhiye/"><i class="zyljt-icon"></i>职业路径图<span>9</span></a> 
								<a href="http://www.jikexueyuan.com/path/"><i class="zstxt-icon"></i>知识体系图<span>24</span></a> 
								<a href="http://ke.jikexueyuan.com/xilie/"><i class="xlkc-icon"></i>系列课程<span>101</span></a> 
								<a href="http://www.jikexueyuan.com/tag/"><i class="kcbq-icon"></i>课程标签<span>4000+</span></a>
								<a href="http://www.jikexueyuan.com/vip/"><i class="vip-icon"></i>VIP会员购买<span>30/月 260/年</span></a>
							</div>
						</li>
						<li>极客社区<i class="arrow-icon"></i>
							<div class="submenu vip-lesson">
								<a href="http://wenda.jikexueyuan.com"><i class="jswd-icon"></i>技术问答<span>20000+</span></a>
								<a href="http://wiki.jikexueyuan.com"><i class="wiki-icon"></i>Wiki<span>351</span></a>
								<a href="http://qun.jikexueyuan.com"><i class="sq-icon"></i>社群<span>7000+</span></a>
								<a href="http://download.jikexueyuan.com"><i class="zygx-icon"></i>资源下载<span>3000+</span></a>
							</div>
						</li>
					</ul>
				</nav>
				<!--nav end-->
				<!--login-->
				<div class="icon-box">
					<span class="search-icon" id="search-btn"></span> <span
						class="app-icon loginlist relative" id="appicon">
						<div class="submenu">
							<i class="top-icon"></i> <img src="${ctxStaticTheme }/images/heade-rwm.png" />
						</div>
					</span> <span class="relative loginlist login-icon" id="loginlist"> 
					<dl class="submenu">
							<i class="top-icon"></i>
							<dd><a href="http://passport.jikexueyuan.com/sso/reg_phone" class="reg-btn">注册</a>|<a href="http://passport.jikexueyuan.com/sso/login" class="login-btn">登录</a></dd>
							<dd><a href="#"><i class="xxzx-icon"></i>学习中心</a></dd>
							<dd><a href="http://my.jikexueyuan.com/"><i class="grzy-icon"></i>个人主页</a></dd>
							<dd><a href="http://www.jikexueyuan.com/member/notifications/"><i class="xxtz-icon"></i>消息通知</a></dd>
							<dd><a href="http://my.jikexueyuan.com/setting/user/"><i class="zhsz-icon"></i>账号设置</a></dd>
						</dl>
					</span>
				</div>
				<!--login-->
				<!--searchbox-->
				<div class="searchbox" id="searchbox">
					<i class="close-icon" id="close-btn"></i> 
					<i class="search-icon" id="search-btn"></i> 
					<input id="web_search_header" placeholder="搜索课程、问答或Wiki" value="">
					<div class="tagbox">
						<a href="http://search.jikexueyuan.com/course/?q=Android">Android</a>
						<a href="http://search.jikexueyuan.com/course/?q=iOS">iOS</a> 
						<a href="http://search.jikexueyuan.com/course/?q=HTML5">HTML5</a>
					</div>
				</div>
			</div>
		</div>
		<sitemesh:body/>
		<div id="footer" class="mar-t50">
			<div class=" jkinfor-block">
				<div class="jkinfor cf">
					<div class="jk-logo">
						<img src="${ctxStaticTheme }/images/jk-logo-footer.png">
						<p>极客学院，编程是一种信仰！</p>
					</div>
					<dl>
						<dt>职业学院</dt>
						<dd>
							<a target="_blank" href="http://www.jikexueyuan.com/zhiye/web">Web前端工程师</a>
						</dd>
						<dd>
							<a target="_blank" href="http://www.jikexueyuan.com/zhiye/python">Python
								Web工程师</a>
						</dd>
						<dd>
							<a target="_blank" href="http://www.jikexueyuan.com/zhiye/go">Go语言工程师</a>
						</dd>
						<!--<dd><a target="_blank" href="http://j.jikexueyuan.com/train/android?huodong=jiuye_android_in">Android学院</a></dd>-->
						<dd>
							<a target="_blank" href="http://www.jikexueyuan.com/zhiye/ios">iOS工程师</a>
						</dd>
					</dl>
					<dl>
						<dt>会员课程</dt>
						<dd>
							<a target="_blank" href="http://www.jikexueyuan.com/course/">课程库</a>
						</dd>
						<dd>
							<a target="_blank" href="http://www.jikexueyuan.com/path/">知识体系图</a>
						</dd>
						<dd>
							<a target="_blank" href="http://ke.jikexueyuan.com/zhiye/">职业路径图</a>
						</dd>
						<dd>
							<a target="_blank" href="http://ke.jikexueyuan.com/xilie/">系列课程</a>
						</dd>
						<dd>
							<a target="_blank" href="http://www.jikexueyuan.com/tag/">课程标签</a>
						</dd>
					</dl>
					<dl>
						<dt>极客社区</dt>
						<dd>
							<a target="_blank" href="http://wenda.jikexueyuan.com/">技术问答</a>
						</dd>
						<dd>
							<a target="_blank" href="http://wiki.jikexueyuan.com/">Wiki</a>
						</dd>
						<dd>
							<a target="_blank" href="http://download.jikexueyuan.com/">资源下载</a>
						</dd>
						<dd>
							<a target="_blank" href="http://qun.jikexueyuan.com/">社群</a>
						</dd>
					</dl>
					<dl>
						<dt>其他</dt>
						<dd>
							<a target="_blank" href="http://help.jikexueyuan.com/">关于我们</a>
						</dd>
						<dd>
							<a target="_blank" href="http://help.jikexueyuan.com/join.html">加入我们</a>
						</dd>
						<dd>
							<a target="_blank"
								href="http://press.jikexueyuan.com/evangelist/apply.html">讲师合作</a>
						</dd>
						<dd>
							<a target="_blank"
								href="http://help.jikexueyuan.com/contact.html">联系我们</a>
						</dd>
						<dd>
							<a target="_blank"
								href="http://www.jikexueyuan.com/friendlink.html">友情链接</a>
						</dd>
					</dl>
					<div class="jk-down">
						<p class="hot-tel">服务热线:${telphone_j1 }</p>
						<div class="downCon down-ios">
							<img src="${ctxStaticTheme }/images/app.png" class="twoCode" alt="下载二维码">
							iPhone
						</div>
						<div class="downCon down-and">
							<img src="${ctxStaticTheme }/images/app.png" class="twoCode" alt="下载二维码">
							Android
						</div>
					</div>
				</div>
			</div>
			<div class="w-1000 copyright">
				${site.copyright }
			</div>
		</div>
		<div class="gotop" id="gototop">
			<span class="top" style="display: block;"></span> 
			<span class="erwma" style="display: none"> 
				<img src="${ctxStaticTheme}/images/erwma.png" style="display: none;">
			</span> 
			<a href="http://www.jikexueyuan.com/app" alt="${site.title }" target="_blank"> 
				<span class="jk-app"><div class="appewm"></div></span>
			</a> 
			<a href="javascript:;" id="diaochaid" class="diaocha"></a>
		</div>
	</div>
</body>
</html>
