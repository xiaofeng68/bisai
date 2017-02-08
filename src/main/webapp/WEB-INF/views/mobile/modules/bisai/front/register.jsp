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
	<header>
		<div class="login_top">
			注册
		</div>
	</header>
	<section>
		<div class="login_form">
			<form action="${ctx}/${frontPath}/regist" method="post">
				<div class="background">
					<div>
						<input class="tell1" type="text" placeholder="手机号码">
						<div class="hint">*手机号码输入不正确</div>
					</div>
					<div class="clearfix login_xinxi">
						<span class="fl">
							<span>
								<img src="${ctxStaticFront}/images/xinxi.png">
							</span>
							<input class="textll" type="text" placeholder="验证码">
						</span>
						<input class="fr login_xinxi_sub" type="submit" value="获取验证码">
					</div>
					<div>
						<input class="tell2" type="password" placeholder="密码">
					</div>
					<div>
						<input class="tell2" type="password" placeholder="再次密码">
						<div class="hint">*两次输入密码不一致</div>
					</div>
				</div>
				<div class="login_butt">
					<input class="submit" type="submit" value="注册">
				</div>
			</form>
		</div>
	</section>
</body>
</html>