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
			<a href="#">
				<img src="${ctxStaticFront }/images/r-arrow.png"></a>
		</span>
		<span>四人分组</span>
	</header>
	<section>
		<div class="block_section">
			<div id="divselect1" class="div_select" div-select-val="1">
				<cite>淘汰赛</cite>
				<ul>
					<li>
						<a href="javascript:;" selectid="1">晋级赛</a>
					</li>
					<li>
						<a href="javascript:;" selectid="2">淘汰赛</a>
					</li>
				</ul>
			</div>
			<input name="" type="hidden" value="" id="inputselect1"/>
		</div>
		<div class="block_table">
			<form>
				<table>
					<tr>
						<td>第一局</td>
						<td>第二局</td>
					</tr>
					<tr>
						<td>
							<input type="text" placeholder="杨过">
						</td>
						<td>
							<input type="text" placeholder="令狐冲">
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" placeholder="杨过">
						</td>
						<td>
							<input type="text" placeholder="令狐冲">
						</td>
					</tr>
				</table>
				<div class="block_submit">
					<input type="submit" value="保存">
				</div>
			</form>
		</div>
	</section>
</body>
</html>