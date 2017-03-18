<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include
	file="/WEB-INF/views/mobile/modules/bisai/front/include/taglib.jsp"%>
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
	<link rel="stylesheet" type="text/css" href="${ctxStaticFront }/css/incstyle.css" media="all">
	<link rel="stylesheet" type="text/css" href="${ctxStaticFront }/css/index.css" media="all">
	<script type="text/javascript" src="${ctxStaticFront }/js/jquery.js"></script>
	<script type="text/javascript" src="${ctxStaticFront }/js/divselect.js"></script>
	<script type="text/javascript">
$(function(){
	$(".div_select").each(function(){
		var selid = $(this).attr('div-select-val');
		var divselectid = "#divselect" + selid;
		var inputselectid = "#inputselect" + selid;
		$.divselect(divselectid,inputselectid);
	});

});
</script>
</head>
<body>
	<header class="grouping_header clearfix">
		<span class="fl">
			<a href="javascript:history.go(-1)">
				<img src="${ctxStaticFront }/images/r-arrow.png">
			</a>
		</span>
		<span>${match.name }</span>
	</header>
	<section>
		<div class="term_table">
			<form action="${ctx }${frontPath}/match/grouping-${match.id}-${type}${urlSuffix}" method="post">
				<table>
					<tr>
						<td>赛项</td>
						<td>报名人</td>
						<td>人数</td>
						<td>赛制</td>
						<td>局数</td>
						<td>组出线</td>
					</tr>
					<c:forEach var="typeNode" items="${fns:getMatchTypeNote(match.id,type) }">
					<c:forEach var="dic" items="${fns:getDictList('MatchTypeNote_type')}">
					<c:if test="${typeNode.type==dic.value }">
					<tr>
						<td>${dic.label }</td>
						<td>${typeNode.counts }</td>
						<td>
							<div id="divselect1${typeNode.type }" class="div_select" div-select-val="1${typeNode.type }">
								<cite>5</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">2</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">3</a>
									</li>
									<li>
										<a href="javascript:;" selectid="3">4</a>
									</li>
									<li>
										<a href="javascript:;" selectid="4">6</a>
									</li>
									<li>
										<a href="javascript:;" selectid="5">7</a>
									</li>
									<li>
										<a href="javascript:;" selectid="5">8</a>
									</li>
									<li>
										<a href="javascript:;" selectid="5">9</a>
									</li>
									<li>
										<a href="javascript:;" selectid="5">10</a>
									</li>
								</ul>
							</div>
							<input name="peoples${typeNode.type }" type="hidden" value="2" id="inputselect1${typeNode.type }"/>	
						</td>
						<td>
							<div id="divselect2${typeNode.type }" class="div_select" div-select-val="2${typeNode.type }">
								<cite>循环</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">循环</a>
									</li>
									<li>
										<a href="javascript:;" selectid="1">淘汰</a>
									</li>
								</ul>
							</div>
							<input name="saizhi${typeNode.type }" type="hidden" value="0" id="inputselect2${typeNode.type }"/>
						</td>
						<td>
							<div id="divselect3${typeNode.type }" class="div_select" div-select-val="3${typeNode.type }">
								<cite>3</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">2</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">4</a>
									</li>
									<li>
										<a href="javascript:;" selectid="3">5</a>
									</li>
									<li>
										<a href="javascript:;" selectid="4">6</a>
									</li>
									<li>
										<a href="javascript:;" selectid="5">7</a>
									</li>
								</ul>
							</div>
							<input name="jushu${typeNode.type }" type="hidden" value="2" id="inputselect3${typeNode.type }"/>
						</td>
						<td>
							<div id="divselect4${typeNode.type }" class="div_select" div-select-val="4${typeNode.type }">
								<cite>3</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">2</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">4</a>
									</li>
									<li>
										<a href="javascript:;" selectid="3">5</a>
									</li>
									<li>
										<a href="javascript:;" selectid="4">6</a>
									</li>
									<li>
										<a href="javascript:;" selectid="5">7</a>
									</li>
								</ul>
							</div>
							<input name="zuchuxian${typeNode.type }" type="hidden" value="2" id="inputselect4${typeNode.type }"/>
						</td>
					</tr>
					</c:if>
					</c:forEach>
					</c:forEach>
				</table>
				<div class="term_table_sub">
					<a href="javascript:void(0);"><input type="submit" value="点击开始分组"></a>
				</div>
			</form>
		</div>
	</section>
</body>
</html>