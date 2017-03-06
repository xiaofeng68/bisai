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
	<meta name="description" content="${siteDescription }" />
	<meta name="keywords" content="${siteKeywords }" />
	<link rel="stylesheet" type="text/css" href="${ctxStaticFront}/css/incstyle.css" media="all">
	<link rel="stylesheet" type="text/css" href="${ctxStaticFront}/css/index.css" media="all">
	<script type="text/javascript" src="${ctxStaticFront }/js/jquery.min.js"></script>
	<script type="text/javascript">
		function changeTab(div1,div2){
			$("#"+div1).addClass("active");
			$("#"+div2).removeClass("active");
			$("#"+div1).show();
			$("#"+div2).hide();
		}
	</script>
</head>
<body>
	<header class="grouping_header clearfix">
		<span class="fl">
			<a href="#">
				<img src="${ctxStaticFront}/images/r-arrow.png">
			</a>
		</span>
		<span>单项报名</span>
	</header>
	<section>
		<div class="activity_first">
			<p>
				<img src="${ctxStaticFront}/images/img35.png">
			</p>
			<p class="name"><fmt:formatDate value="${match.starttime }" pattern="E"/>${match.name }打球</p>
			<p class="add">${match.name }</p>
			<p class="time"><fmt:formatDate value="${match.starttime }" pattern="M月d日"/>-<fmt:formatDate value="${match.endtime }" pattern="M月d日"/></p>
		</div>
		<div class="activ_list">
			<ul>
				<li class="clearfix">
					<span class="li_left f14">比赛类型</span>
					<div class="li_right2 f13 clearfix">
						<div class="clearfix li_right1" style="width:100%;margin-bottom:0.4rem;">
							<div class="first-meun">
								<img class="first_img1 v-m" src="${ctxStaticFront}/images/img36-1.png">
								<span class="v-m">男单</span>
                                <span>（已报名${dnandannum }人）</span>
								<span class="label_but" onclick="changeTab('dnandannumDiv1','dnandannumDiv2')">报名中</span>
								<span class="label_but" onclick="changeTab('dnandannumDiv2','dnandannumDiv1')">报名列表</span>
							</div>
							<div  class="tree-second fr" id="dnandannumDiv2">
								<div class="tree_second_list">
									<div class="second_list_con clearfix">
										<span class="activity_po">
											<img src="${ctxStaticFront}/images/img37.png">
										</span>
										<span class="list_name">王二麻</span>
										<span class="list_butt fr">踢人</span>
									</div>
									<div class="second_list_con clearfix">
										<span class="activity_po">
											<img src="${ctxStaticFront}/images/img37.png">
											<em class="act_em"></em>
										</span>
										<span class="list_name">王二麻</span>
										<span class="list_butt1 fr">恢复</span>
									</div>
								</div>
							</div>
							<div  class="tree-second fr" id="dnandannumDiv1" style="display:none;">
								<div class="label1 js-check clearfix"> 
									<input type="text"  placeholder="队友电话">
									<input type="text"  placeholder="队友姓名">
									<span class="fr label_but">确定</span>
								</div>
							</div>
							
						</div>
					</div>
				</li>
			</ul>
			<div class="acti_buttom">确定</div>
			<div class="acti_buttom1">取消</div>
			
		</div>
	</section>
</body>
</html>	