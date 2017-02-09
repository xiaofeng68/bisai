<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/mobile/modules/bisai/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>JeeSite</title>
	<meta name="description" content="JeeSite" />
	<meta name="keywords" content="JeeSite" />
	<link rel="stylesheet" type="text/css" href="${ctxStaticFront }/css/incstyle.css" media="all">
	<link rel="stylesheet" type="text/css" href="${ctxStaticFront }/css/index.css" media="all">
	<script type="text/javascript" src="${ctxStaticFront }/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctxStaticFront }/js/yf.js"></script>
</head>
<body>
	<header class="grouping_header clearfix">
		<span class="fl">
			<a href="#">
				<img src="${ctxStaticFront }/images/r-arrow.png">
			</a>
		</span>
		<span>申请举办比赛</span>
	</header>
	<section>
		<div class="apply_form">
			<form>
				<ul>
					<li>
						<span class="namell">比赛名称</span>
						<input class="textll" type="text" name="name" placeholder="请输入比赛名称">
					</li>
					<li>
						<span class="namell">报名时间</span>
						<input class="textll" type="text" placeholder="报名时间">
					</li>
					<li>
						<span class="namell">比赛时间</span>
						<input class="apply_input1" type="text" placeholder="开始时间">
						<span class="apply_text">至</span>
						<input class="apply_input1" type="text" placeholder="结束时间">
					</li>
					<li class="clearfix">
						<span class="namell fl v-m">地　　址</span>
						<span class="fl clearfix apply_address v-m">
							<img src="${ctxStaticFront }/images/fixed.png">
							<span class="add_text fl">点击选择</span>
							<input class="apply_input" type="text" placeholder="天津市">
							<input class="apply_input" type="text" placeholder="天津市">
							<input class="apply_input" type="text" placeholder="南开区">
							<span class="fr add_butt">重新选择</span>
						</span>

					</li>
					<li>
						<span class="namell">详细地址</span>
						<input class="textll" type="text" placeholder="XX街道">
					</li>
										<li class="clearfix">
						<span class="namell">主办单位</span>
						<input class="textll1" type="text" placeholder="请输入主办单位">
						<span class="apply_butt">+</span>
						<div class="apply_border">&nbsp;&nbsp;&nbsp;&nbsp; 
							<span class="apply_borderll">
								<span>天津体育局</span>
								<em></em>
							</span>
							<span class="apply_borderll">
								<span>天津体育局</span>
								<em></em>
							</span>

						</div>
					</li>
					<li class="clearfix">&nbsp;&nbsp;&nbsp; 
						<span class="namell">承办单位</span>
						<input class="textll1" type="text" placeholder="请输入主办单位">
						<span class="apply_butt">+</span>
						<div class="apply_border">
							<span class="apply_borderll">
								<span>天津体育联盟1</span>
								<em></em>
							</span>
							<span class="apply_borderll">
								<span>天津体育联盟2</span>
								<em></em>
							</span>
							<span class="apply_borderll">
								<span>天津体育联盟3</span>
								<em></em>
							</span>
						</div>
					</li>
					<li class="clearfix">
						<span class="namell">赞助商</span>
						<input class="textll1" type="text" placeholder="赞助商名称">
						<span class="apply_butt">+</span>
						<div class="apply_border">
							<span class="apply_borderll">
								<span>天津体育局</span>
								<em></em>
							</span>
							<span class="apply_borderll">
								<span>天津体育局</span>
								<em></em>
							</span>
							<span class="apply_borderll">
								<span>天津体育局</span>
								<em></em>
							</span>
							<span class="apply_borderll">
								<span>天津体育局</span>
								<em></em>
							</span>
						</div>
					</li>
					<li class="clearfix">
						<div class="clearfix" style="line-height:13px; padding-bottom:0.7rem">
							<span class="namell fl">比赛类型</span>
							<div class="substance fl" style="width:80%;">
								<div class="label js-check clearfix fl"> 
									<em class="unchecked fl"></em>
									<span class="fl">男单</span>
								</div>
								<div class="label js-check clearfix fl"> 
									<em class="unchecked fl"></em>
									<span class="fl">女单</span>
								</div>
								<div class="label js-check clearfix fl"> 
									<em class="unchecked fl"></em>
									<span class="fl">男双</span>
								</div>
								<div class="label js-check clearfix fl"> 
									<em class="unchecked fl"></em>
									<span class="fl">女双</span>
								</div>
								<div class="label js-check clearfix fl"> 
									<em class="unchecked fl"></em>
									<span class="fl">混双</span>
								</div>
							</div>
						</div>
					</li>
					
					<li style="margin-top:0.3rem;">
						<span class="namell v-t">比赛说明</span>
						<textarea></textarea>
					</li>
					<li>
						<span class="namell">联系人</span>
						<input class="textll" type="text" placeholder="请输入联系人姓名">
					</li>
					
					<li>
						<span class="namell">联系号码</span>
						<input class="textll" type="text" placeholder="请输入联系号码">
					</li>
				</ul>
				<div class="apply_submit">
					<input type="submit" value="提交申请">
				</div>
			</form>
		</div>
	</section>
</body>
</html>