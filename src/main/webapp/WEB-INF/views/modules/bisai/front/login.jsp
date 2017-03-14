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
	<link rel="stylesheet" type="text/css" href="${ctxStaticFront}/css/lunbo.css" media="all">
	<script type="text/javascript" src="${ctxStaticFront}/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="${ctxStaticFront}/js/pub.js"></script>
	<script src="${ctxStaticFront}/js/js-box.js" type="text/javascript"></script>
	<script type="text/javascript">
		function checkAccount(){
			if(!validatemobile($("#phone").val())){
				return false;
			}
			if(!$("#password").val()||$("#password").val().length<6) {
				alert("密码不能低于6位！");
				return false;
			}
			
			return true;
		}
	</script>
</head>
<body>
	<header class="grouping_header clearfix">
		<span class="fl">
			<a href="${ctx }/${frontPath}">
				<img src="${ctxStaticFront }/images/r-arrow.png">
			</a>
		</span>
		<span>登录</span>
	</header>
	<section>
		<div class="login_logo">
			<img src="${ctxStaticFront}/images/logo.png">
		</div>
		<div class="login_form">
			<form action="${ctx}/${frontPath}login" method="post" onsubmit="return checkAccount()">
				<div class="background">
					<div>
						<input class="tell1" name="phone" id="phone" type="text" placeholder="手机号码">
						<div class="hint" style='display:${accountError?"":"none"}'>*手机号码输入不正确</div>
					</div>
					<div>
						<input class="tell2" name="password" id="password" type="password" placeholder="密码">
						<div class="hint" style='display:${passwdtError?"":"none"}'>*密码输入不正确</div>
					</div>
				</div>
				<div class="login_butt">
					<input class="submit" type="submit" value="登录">
				</div>
			</form>
		</div>
		<div class="login_link clearfix">
			<span class="fl">
				<a href="${ctx }/${frontPath}regist${urlSuffix}">注册</a>
			</span>
			<span class="fr">
				<a href="${ctx }/${frontPath}wxoauth${urlSuffix}">
					<img src="${ctxStaticFront}/images/weixin.png">
					<span>使用微信登录</span>
				</a>
			</span>			
		</div>
	</section>
</body>
</html>