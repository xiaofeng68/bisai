<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/mobile/modules/bisai/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>JeeSite</title>
	<meta name="decorator" content="bisai" />
	<meta name="description" content="JeeSite" />
	<meta name="keywords" content="JeeSite" />
	<script type="text/javascript">
$(function(){
	$(".div_select").each(function(){
		var selid = $(this).attr('div-select-val');
		var divselectid = "#divselect" + selid;
		var inputselectid = "#inputselect" + selid;
		divselect(divselectid,inputselectid);
	});

	//tab切换
	$(".match_topll_sec li").click(function() {
		$(this).addClass("active").siblings().removeClass("active");
		$(".match_fourll").hide().eq($(this).index()).show();
	});
});
function divselect(divselectid,inputselectid) {
	var inputselect = $(inputselectid);
	$(divselectid+" cite").click(function(){
		var ul = $(divselectid+" ul");
		if(ul.css("display")=="none"){
			ul.slideDown("fast");
		}else{
			ul.slideUp("fast");
		}
	});
	$(divselectid+" ul li a").click(function(){
		var txt = $(this).text();
		$(divselectid+" cite").html(txt);
		var value = $(this).attr("selectid");
		inputselect.val(value);
		$(divselectid+" ul").hide();
		
	});
};
</script>
</head>
<body>
	<section class="match_sectionll">
		<div class="match_topll">
			<span class="fl match_topll_l">
				<a href="#">
					<img src="${ctxStaticFront}/images/r-arrow.png"></a>
			</span>
			<span class="match_topll_c">赛事列表</span>
			<div class="fr match_topll_r">
				<div id="divselect1" class="div_select" div-select-val="1">
					<cite>全部赛事</cite>
					<ul>
						<li>
							<a href="javascript:;" selectid="1">全部赛事</a>
						</li>
						<li>
							<a href="javascript:;" selectid="2">取消的赛事</a>
						</li>
						<li>
							<a href="javascript:;" selectid="2">全部赛事</a>
						</li>
						<li>
							<a href="javascript:;" selectid="2">全部赛事</a>
						</li>
					</ul>
				</div>
				<input name="" type="hidden" value="" id="inputselect1"/>
			</div>
		</div>
		<div class="match_topll_sec">
			<ul class="clearfix">
				<li class="active"> <em class="sec_bg2"></em>
					<span>赛事</span>
				</li>
				<li> <em class="sec_bg1"></em>
					<span>俱乐部</span>
				</li>
				<li>
					<em class="sec_bg3"></em>
					<span>自由</span>
				</li>
			</ul>
		</div>
		<div class="match_topll_thir">
			<form>
				<div>
					<input class="inputl" type="text" placeholder="搜索">
					<input class="submitll" type="submit" value="搜索"></div>
			</form>
		</div>
		<div class="match_fourll">
			<div class="match_link">
				<a href="${ctx }/${frontPath}apply${urlSuffix}">申请比赛</a>
			</div>
			<ul>
				<li>
					<a href="#">
						<div class="clearfix">
							<div class="fl clearfix suggestll">
								<img class="img24 fl" src="${ctxStaticFront}/images/img24.png">
								<div class="fl suggestlx">
									<p class="ellipsis">XXX羽毛球比赛</p>
									<p class="ellipsis">主办单位/会员名</p>
								</div>
							</div>
							<div class="fr namell">20km</div>
						</div>
						<div>
							<span class="timell">1月12日-1月19日</span>
						</div>
						<div class="suggestlx1">天津某某羽毛球馆</div>
						<div class="positionll">
							<em class="em1"></em>
							<p>总报名人数：10人</p>
						</div>
					</a>
				</li>
				<li>
					<a href="#">
						<div class="clearfix">
							<div class="fl clearfix suggestll">
								<img class="img24 fl" src="${ctxStaticFront}/images/img24.png">
								<div class="fl suggestlx">
									<p class="ellipsis">XXX羽毛球比赛</p>
									<p class="ellipsis">主办单位/会员名</p>
								</div>
							</div>
							<div class="fr namell">20km</div>
						</div>
						<div>
							<span class="timell">1月12日-1月19日</span>

						</div>
						<div class="suggestlx1">天津某某羽毛球馆</div>
						<div class="positionll">
							<em class="em3"></em>
							<p>总报名人数：10人</p>
						</div>
					</a>
				</li>
				<li>
					<a href="#">
						<div class="clearfix">
							<div class="fl clearfix suggestll">
								<img class="img24 fl" src="${ctxStaticFront}/images/img24.png">
								<div class="fl suggestlx">
									<p class="ellipsis">XXX羽毛球比赛</p>
									<p class="ellipsis">主办单位/会员名</p>
								</div>
							</div>
							<div class="fr namell">20km</div>
						</div>
						<div>
							<span class="timell">1月12日-1月19日</span>

						</div>
						<div class="suggestlx1">天津某某羽毛球馆</div>
						<div class="positionll">
							<em class="em4"></em>
							<p>总报名人数：10人</p>
						</div>
					</a>
				</li>
				<li>
					<a href="#">
						<div class="clearfix">
							<div class="fl clearfix suggestll">
								<img class="img24 fl" src="${ctxStaticFront}/images/img24.png">
								<div class="fl suggestlx">
									<p class="ellipsis">XXX羽毛球比赛</p>
									<p class="ellipsis">主办单位/会员名</p>
								</div>
							</div>
							<div class="fr namell">20km</div>
						</div>
						<div>
							<span class="timell">1月12日-1月19日</span>

						</div>
						<div class="suggestlx1">天津某某羽毛球馆</div>
						<div class="positionll">
							<em class="em2"></em>
							<p>总报名人数：10人</p>
						</div>
					</a>
				</li>
			</ul>
		</div>
		<div class="match_fourll" style="display:none">11111111</div>
		<div class="match_fourll" style="display:none">2222222222</div>
	</section>
</body>
</html>