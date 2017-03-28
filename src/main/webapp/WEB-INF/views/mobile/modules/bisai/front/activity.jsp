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
</head>
<body>
	<header class="grouping_header clearfix">
		<span class="fl">
			<a href="javascript:history.go(-1);">
				<img src="${ctxStaticFront}/images/r-arrow.png">
			</a>
		</span>
		<span>活动详情</span>
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
					<span class="fl li_left f14">赞助商</span>
					<span class="fl li_right f13">
					<c:forEach items="${sponsors }" var="sponsor">
						<span class="border">${sponsor }</span>
					</c:forEach>
					</span>
				</li>
				<li class="clearfix">
					<span class="fl li_left f14">主办者</span>
					<span class="fl li_right f13">
					<c:forEach items="${orgs }" var="org">
						<span class="border">${org }</span>
					</c:forEach>
					</span>
				</li>
				<li class="clearfix">
					<span class="fl li_left f14">承办单位</span>
					<span class="fl li_right f13">
					<c:forEach items="${contractors }" var="contractor">
						<span class="border">${contractor }</span>
					</c:forEach>
					</span>
				</li>
				<li class="clearfix">
					<span class="li_left f14">比赛项目 
					<label for="dxsRadio">单项赛</label>
					<label for="dxsRadio">团队赛</label>
					</span>
					<div class="li_right2 f13 clearfix">
						<div class="clearfix li_right1" style="width:100%;margin-bottom:0.4rem;">
							<div class="first-meun">
								<img class="first_img1 v-m" src="${ctxStaticFront}/images/img36-1.png">
								<span class="v-m">男单</span>
								<img class="first_img1 v-m" src="${ctxStaticFront}/images/img36-2.png">
								<span class="v-m">女单</span>
								<img class="first_img2" src="${ctxStaticFront}/images/img36-3.png">
								<span class="v-m">男双</span>
								<img class="first_img2" src="${ctxStaticFront}/images/img36-4.png">
								<span class="v-m">女双</span>
								<img class="first_img2" src="${ctxStaticFront}/images/img36-5.png">
								<span class="v-m">混双</span>
							</div>
						</div>
						<div class="clearfix li_right1" style="width:100%;margin-bottom:0.4rem;">
							<div class="first-meun">
								<img class="first_img2" src="${ctxStaticFront}/images/img36-5.png">
								<span>比赛总场次</span>
                               	<span><div style="float:right;margin-right:6rem; ">
	                               	<select>
	                               		<option>3</option>
	                               		<option>5</option>
	                               		<option>7</option>
	                               		<option>9</option>
	                               	</select></div>
                               	</span>
							</div>
							<div class="first-meun">
								<img class="first_img2" src="${ctxStaticFront}/images/img36-5.png">
								<span>比赛总场次</span>
                               	<span><div style="float:right;width:3.8rem;margin-right:2rem; ">
	                               	<select>
	                               		<option>3</option>
	                               		<option>5</option>
	                               		<option>7</option>
	                               		<option>9</option>
	                               	</select></div>
                               	</span>
								<span class="label_but">报名中</span>
								<span class="label_but active">报名列表</span>                                
							</div>
						</div>
					</div>
					
				</li>
				<li class="clearfix mtll">
					<span class="fl li_left f14">比赛时间</span>
					<span class="fl li_right1 f14">
					</span>
				</li>
				<li class="clearfix mtll">
					<span class="fl li_left f14">比赛地点</span>
					<span class="fl li_right1 f14">
					</span>
				</li>
				<li class="clearfix mtll">
					<span class="fl li_left f14">领队</span>
					<span class="fl li_right1 f14">
						${match.contacts }
					</span>
				</li>
				<li class="clearfix mtll">
					<span class="fl li_left f14">电话</span>
					<span class="fl li_right1 f14">
						${match.phone }
					</span>
				</li>
				<li class="clearfix mtll">
					<span class="fl li_left f14">地址</span>
					<span class="fl li_right1 f14">
						${match.address }${match.detailAddress }
					</span>
				</li>
				<li class="clearfix mtll">
					<span class="fl li_left f14">比赛简介</span>
					<span class="fl li_right1 f14">
					</span>
				</li>
				<li class="clearfix mtll">
					<span class="fl li_left f14">奖金奖品</span>
					<span class="fl li_right1 f14">
					</span>
				</li>
			</ul>
			<div class="acti_buttom1" onclick="history.go(-1)">返回</div>
			
		</div>
	</section>
</body>
</html>	