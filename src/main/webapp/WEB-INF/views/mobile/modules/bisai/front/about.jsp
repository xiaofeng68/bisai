<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/mobile/modules/bisai/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>${siteTitle }</title>
	<meta name="keywords" content="${siteKeywords }">
    <meta name="description" content="${siteDescription }">
	<meta name="decorator" content="bisai" />
</head>
<body>
	<section class="about_sectionll">
		<div class="about_warpll">
			<div class="clearfix">
				<span class="fl warp_lll">
					<img src="${ctxStaticFront}/images/img10.png">
				</span>
				<span class="fr warp_rll"><a href="${ctx }/${frontPath}/logout">退出</a></span>
			</div>
			<div class="warp_headll">
				<img class="img11" src="${ctxStaticFront}/images/img11.png">
				<p>
					<span class="v-m">上次前年</span>
					<img class="img12" src="${ctxStaticFront}/images/img12.png">
				</p>
			</div>
		</div>
		<div class="about_linkll">
			<ul class="clearfix">
				<li>
					<a href="#">
						<img src="${ctxStaticFront}/images/img13.png">
						<p>我的相册</p>
					</a>
				</li>
				<li>
					<a href="#">
						<img src="${ctxStaticFront}/images/img14.png">
						<p>我的战绩</p>
					</a>
				</li>
				<li>
					<a href="#">
						<img src="${ctxStaticFront}/images/img15.png">
						<p>积分管理</p>
					</a>
				</li>
				<li>
					<a href="#">
						<img src="${ctxStaticFront}/images/img16.png">
						<p>活动报名</p>
					</a>
				</li>
			</ul>
		</div>
		<div class="about_secll">
			<div class="clearfix titlell">
				<div class="clearfix fl titlell_l">
					<img class="fl img17 v-m" src="${ctxStaticFront}/images/img17.png">
					<div class="fl">
						<p>
							<span>当前等级：</span>
							<span>球迷一星</span>
						</p>
						<p class="strip1">
							<span class="strip2"></span>
						</p>
					</div>
				</div>
				<div class="fr titlell_r tr">
					<a href="#">
						<img class="l_arrow" src="${ctxStaticFront}/images/l-arrow.png">
					</a>
				</div>
			</div>
			<ul class="secll_list clearfix">
				<li>
					<p class="col0-text fw-b">0</p>
					<p class="col6-text">总场次</p>
				</li>
				<li>
					<p class="col0-text fw-b">0</p>
					<p class="col6-text">总积分</p>
				</li>
				<li>
					<p class="col0-text fw-b">0%</p>
					<p class="col6-text">总胜率</p>
				</li>
				<li>
					<p class="col0-text fw-b">0%</p>
					<p class="col6-text">排位赛胜率</p>
				</li>
			</ul>
		</div>
		<div class="about_thirll">
			<ul>
				<li class="clearfix">
					<p class="fl">
						<img class="img18" src="${ctxStaticFront}/images/img18.png">
						<span class="v-m">修改资料</span>
					</p>
					<span class="fr">
						<a href="#">
							<img class="l_arrow" src="${ctxStaticFront}/images/l-arrow.png">
						</a>
					</span>
				</li>
				<li class="clearfix">
					<p class="fl">
						<img class="img19" src="${ctxStaticFront}/images/img19.png">
						<span class="v-m">赛事管理</span>
					</p>
					<span class="fr">
						<a href="#">
							<img class="l_arrow" src="${ctxStaticFront}/images/l-arrow.png">
						</a>
					</span>
				</li>
				<li class="clearfix">
					<p class="fl">
						<img class="img20" src="${ctxStaticFront}/images/img20.png">
						<span class="v-m">所属俱乐部</span>
					</p>
					<span class="fr">
						<a href="#">
							<img class="l_arrow" src="${ctxStaticFront}/images/l-arrow.png">
						</a>
					</span>
				</li>
			</ul>
		</div>
		<div class="about_thirll">
			<ul>
				<li class="clearfix">
					<p class="fl">
						<img class="img21" src="${ctxStaticFront}/images/img21.png">
						<span class="v-m">系统消息</span>
					</p>
					<span class="fr">
						<a href="#">
							<img class="l_arrow" src="${ctxStaticFront}/images/l-arrow.png">
						</a>
					</span>
				</li>
				<li class="clearfix">
					<p class="fl">
						<img class="img22" src="${ctxStaticFront}/images/img22.png">
						<span class="v-m">设置</span>
					</p>
					<span class="fr">
						<a href="#">
							<img class="l_arrow" src="${ctxStaticFront}/images/l-arrow.png">
						</a>
					</span>
				</li>
			</ul>
		</div>
	</section>
</body>
</html>