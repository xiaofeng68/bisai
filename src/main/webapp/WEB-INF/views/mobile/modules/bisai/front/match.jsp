<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/mobile/modules/bisai/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>${siteTitle }</title>
	<meta name="decorator" content="bisai" />
	<meta name="description" content="${siteDescription }" />
	<meta name="keywords" content="${siteKeywords }" />
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
		</div>
		<div class="match_topll_sec">
			<ul class="clearfix">
				<li class="active"> <em class="sec_bg2"></em>
					<span>所有赛事</span>
				</li>
				<li> <em class="sec_bg1"></em>
					<span>我的赛事</span>
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
			<c:forEach items="${page.list}" var="match">
				<li>
					<a href="${ctx }/${frontPath}activity${urlSuffix}?id=${match.id}">
						<div class="clearfix">
							<div class="fl clearfix suggestll">
								<c:choose>
									<c:when test="${match.state==2 }">
									<img class="img24 fl" src="${ctxStaticFront}/images/img25-2.png">
									</c:when>
									<c:when test="${match.state==-1 }">
									<img class="img24 fl" src="${ctxStaticFront}/images/img26.png">
									</c:when>
									<c:otherwise>
									<img class="img24 fl" src="${ctxStaticFront}/images/img24.png">
									</c:otherwise>
								</c:choose>
								<div class="fl suggestlx">
									<p class="ellipsis">${match.name }</p>
									<p class="ellipsis">${ fn:split(match.orgs, ',')[0] }</p>
								</div>
							</div>
							<div class="fr namell"><!-- 20km --></div>
						</div>
						<div>
							<span class="timell"><fmt:formatDate value="${match.starttime }" pattern="M月d日"/>-<fmt:formatDate value="${match.endtime }" pattern="M月d日"/></span>
						</div>
						<div class="suggestlx1">${match.address }${match.detailAddress }</div>
						<div class="positionll">
							<em class="em1"></em>
							<p>人数：${match.counts }人</p>
						</div>
					</a>
				</li>
			</c:forEach>
			</ul>
		</div>
		<div class="match_fourll" style="display:none">
		<ul>
			<c:forEach items="${page.list}" var="match">
				<li>
					<a href="${ctx }/${frontPath}activity${urlSuffix}?id=${match.id}">
						<div class="clearfix">
							<div class="fl clearfix suggestll">
								<c:choose>
									<c:when test="${match.state==2 }">
									<img class="img24 fl" src="${ctxStaticFront}/images/img25-2.png">
									</c:when>
									<c:when test="${match.state==-1 }">
									<img class="img24 fl" src="${ctxStaticFront}/images/img26.png">
									</c:when>
									<c:otherwise>
									<img class="img24 fl" src="${ctxStaticFront}/images/img24.png">
									</c:otherwise>
								</c:choose>
								<div class="fl suggestlx">
									<p class="ellipsis">${match.name }</p>
									<p class="ellipsis">${match.orgs }</p>
								</div>
							</div>
							<div class="fr namell"></div>
						</div>
						<div>
							<span class="timell"><fmt:formatDate value="${match.starttime }" pattern="M月d日"/>-<fmt:formatDate value="${match.endtime }" pattern="M月d日"/></span>
						</div>
						<div class="suggestlx1">${match.address }${match.detailAddress }</div>
						<div class="positionll">
							<em class="em1"></em>
							<p>人数：${match.counts }人</p>
						</div>
					</a>
				</li>
			</c:forEach>
			</ul>
		</div>
	</section>
</body>
</html>