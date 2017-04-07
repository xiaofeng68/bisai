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
	<script type="text/javascript" src="${ctxStaticFront}/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="${ctxStaticFront}/js/pub.js"></script>
	
</head>
<body>
	<header class="grouping_header clearfix">
		<span class="fl">
			<a href="${ctx }/${frontPath}my${urlSuffix}">
				<img src="${ctxStaticFront }/images/r-arrow.png">
			</a>
		</span>
		<span>注册</span>
	</header>
	<section>
		<div class="login_form">
			<c:if test="${not empty errorMsg }">
				<script type="text/javascript">alert('${errorMsg }')</script>
			</c:if>
			<c:if test="${not empty currentAccount }">
				<span>微信绑定成功，请继续</span>
			</c:if>
			<form action="${ctx}/${frontPath}regist" method="post" onsubmit="return checkRegister()">
				<div class="background">
					<div>
						<input name="phone" id="phone" class="tell1" type="text" placeholder="手机号码">
					</div>
					<div>
						<input class="tell2" type="password" name="password" id="password" placeholder="密码">
					</div>
					<div>
						<input class="tell2" type="password" id="repassword" placeholder="再次密码">
					</div>
				</div>
				<div class="login_butt">
					<input class="submit" type="submit" value="注册">
				</div>
			</form>
		</div>
	</section>
<script type="text/javascript">
	function checkRegister(){
		try{
		if(!validatemobile($("#phone").val())){
			return false;
		}
		if(!$("#password").val()||$("#password").val().length<6) {
			alert("密码不能低于6位！");
			return false;
		}
		if($("#password").val()!=$("#repassword").val()){
			alert("两次输入的密码不一致！");
			return false;
		}
		}catch(e){return false;}
		return true;
	}
</script>
</body>
</html>