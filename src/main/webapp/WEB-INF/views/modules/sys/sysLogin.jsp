<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta name="decorator" content="blank"/>
<title>${fns:getSettingContent('systemTitle')}</title>
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<link href="${ctxStatic}/modules/sys/css/incstyle.css" rel="stylesheet" />
<link href="${ctxStatic}/modules/sys/css/index.css" rel="stylesheet" />
<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
<link rel="icon" href="${ctxStatic}/modules/sys/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="${ctxStatic}/modules/sys/images/favicon.ico" type="image/x-icon" />
<link rel="bookmark" href="${ctxStatic}/modules/sys/images/favicon.ico" type="image/x-icon" />
<style>
<!--
*{margin:0px auto; padding:0px; border:0px;}
-->
</style>
<style type="text/css">
      .form-signin{position:relative;text-align:left;width:300px;padding:25px 29px 29px;margin:0 auto 20px;background-color:#fff;border:1px solid #e5e5e5;
        	-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px;-webkit-box-shadow:0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:0 1px 2px rgba(0,0,0,.05);box-shadow:0 1px 2px rgba(0,0,0,.05);}
      .form-signin .checkbox{margin-bottom:10px;color:#0663a2;} .form-signin .input-label{font-size:16px;line-height:23px;color:#999;}
      .form-signin .input-block-level{font-size:16px;height:auto;margin-bottom:15px;padding:7px;*width:283px;*padding-bottom:0;_padding:7px 7px 9px 7px;}
      .form-signin .btn.btn-large{font-size:16px;} .form-signin #themeSwitch{position:absolute;right:15px;bottom:10px;}
      .form-signin div.validateCode {padding-bottom:15px;} .mid{vertical-align:middle;}
      .header{height:80px;padding-top:20px;} .alert{position:relative;width:300px;margin:0 auto;*padding-bottom:0px;}
      label.error{background:none;width:270px;font-weight:normal;color:inherit;margin:0;}
    </style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#loginForm").validate({
			rules: {
				validateCode: {remote: "${pageContext.request.contextPath}/servlet/validateCodeServlet"}
			},
			messages: {
				username: {required: "请填写用户名."},
				password: {required: "请填写密码."},
				validateCode: {remote: "验证码不正确.", required: "请填写验证码."}
			},
			errorLabelContainer: "#messageBox",
			errorPlacement: function(error, element) {
				error.appendTo($("#loginError").parent());
			} 
		});
	});
	// 如果在框架或在对话框中，则弹出提示并跳转到首页
	if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
		alert('未登录或登录超时。请重新登录，谢谢！');
		top.location = "${ctx}";
	}
</script>
</head>
<body>
<!--[if lte IE 6]><br/><div class='alert alert-block' style="text-align:left;padding-bottom:10px;"><a class="close" data-dismiss="alert">x</a><h4>温馨提示：</h4><p>你使用的浏览器版本过低。为了获得更好的浏览体验，我们强烈建议您 <a href="http://browsehappy.com" target="_blank">升级</a> 到最新版本的IE浏览器，或者使用较新版本的 Chrome、Firefox、Safari 等。</p></div><![endif]-->
	<div id="messageBox" class="alert alert-error ${empty message ? 'hide' : ''}"><button data-dismiss="alert" class="close">×</button>
		<label id="loginError" class="error">${message}</label>
	</div>
<div class="top">
	<div class="topa">
	  <div class="topal">${fns:getSettingContent('systemDes') }</div>
	  <div class="topar"><a href="javascript:window.external.addFavorite(location.href,document.title);">收藏本站</a> | <a href="" target="_blank">联系我们</a></div>
	</div>
</div>
<div align="center">
 <table cellpadding="0" bgcolor="#DDDDDD" cellspacing="0" border="0" width="100%">
    <tr>
    	<td height="18" align="center" ></td>
    </tr>
  </table>
</div>
<div class="web_index">
  <table cellpadding="0" cellspacing="0" border="0" width="1100">
    <tr>
      <td width="650"></td>
	  <td width="354" valign="top">
	   <form id="loginForm" action="${ctx}/login" method="post">
	  	    <table border="0" cellpadding="0" cellspacing="0" id="login">
            <tr>
              <td width="32"></td>
			  <td height="45" align="left" class="meduium_font_white font_strong">登录管理系统</td>
              <td width="29"></td>
            </tr>
			<tr>
                <td width="32"></td>
				<td bgcolor="#eeeeee" height="1"></td>
				<td width="29"></td>
			</tr>			
		    <!-- 测试登录使用程序  start -->
		    <tr>
              <td width="32" height="30"></td>
			  <td width="239" align="left" valign="middle" class="mini_font_white">用户名：</td>
			  <td width="29"></td>
            </tr>
			<tr>
              <td width="32" height="30"></td>
              <td width="239" align="left" valign="middle">
              <input id="username" name="username" value="${username}" type="text" class="xlarge  input-block-level required" />
              </td>
			  <td width="29"></td>
            </tr>
            <tr>
              <td width="32" height="30"></td>
			  <td align="left" valign="middle" class="mini_font_white">密&#12288;码：</td>
			  <td width="29"></td>
            </tr>
			<tr>
              <td width="32" height="30"></td>
              <td align="left" valign="middle">
              <input type="password" id="password" name="password" class="xlarge input-block-level required"/>
              </td>
			  <td width="29"></td>
            </tr>
			<c:if test="${isValidateCodeLogin}"><div class="validateCode">
            <tr>
             <td width="32" height="30"></td>
			 <td align="left" class="mini_font_white">验证码：</td>
           	  <td width="29"></td>
		    </tr>
			<tr>
             <td width="32" height="30"></td>
			 <td colspan="2" align="left" class="small_font_black">
			 <sys:validateCode name="validateCode" inputCssStyle="margin-bottom:0;"/>
			 </td>
		    </tr>
		    </c:if>
		    <!-- 测试登录使用程序  end -->
            <tr>
                <td width="32"></td>
			    <td height="80">
			    <input name="s1" type="submit" class="btn btn-middle btn-primary" value=" 登 录 " />&#12288;
			    <label for="rememberMe" title="下次不需要再登录"><input type="checkbox" id="rememberMe" name="rememberMe" ${rememberMe ? 'checked' : ''} /> 记住我</label>
			    </td>
            	<td width="29"></td>
			</tr>
        </table>
         </form>
	  </td>
    </tr>
  </table>
  <div id="btm_links">
		<div class="w1024">
			<a class="btm_link_1 fl"><i class="icon"><img src="${ctxStatic}/modules/sys/images/btmlink1.png"></i><span class="text"><span class="ti">大数据集</span>积累数据</span></a>
			<a class="btm_link_2 fl"><i class="icon"><img src="${ctxStatic}/modules/sys/images/btmlink2.png"></i><span class="text"><span class="ti">站群系统</span>功能齐全</span></a>
			<a class="btm_link_3 fl"><i class="icon"><img src="${ctxStatic}/modules/sys/images/btmlink3.png"></i><span class="text"><span class="ti">一键会员</span>通用通行</span></a>
			<a class="btm_link_4 fl"><i class="icon"><img src="${ctxStatic}/modules/sys/images/btmlink4.png"></i><span class="text"><span class="ti">智能排版</span>展示形式丰富</span></a>
			<a class="btm_link_5 fl"><i class="icon"><img src="${ctxStatic}/modules/sys/images/btmlink5.png"></i><span class="text"><span class="ti">领先行业</span>绝无仅有</span></a>
			<div class="cl"></div>
		</div>
	</div>
</div>
</body>
<script src="${ctxStatic}/flash/zoom.min.js" type="text/javascript"></script>
</body>
</html>