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
</head>
<body>
	<header class="grouping_header clearfix">
		<span class="fl">
			<a href="#">
				<img src="${ctxStaticFront }/images/r-arrow.png">
			</a>
		</span>
		<span>分组名单</span>
        
	</header>
    <Div>
    <div class="fr clearfix sheet_table_title_r">
						<div class="fr sheet_table_title_r_l">
							<div id="divselect1" class="div_select" div-select-val="1">
								<cite>男单</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">混双</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">男单</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">女单</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">男单</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect1"/>
						</div>
					</div>
                  </Div>
    

	<section>
		<div class="grouping_table">
			<p>第一组</p>
			<table>
				<tr>
					<td>对战<br></td>
					
				</tr>
				<tr>
					<td>[210]张三1 vs [211]李四1<br></td>
				</tr>
				<tr>
					<td>[210]张三1 vs [212]王五1<br></td>
				</tr>
				<tr><td valign="top">[211]李四1 vs [212]王五1</td>
			</tr>
			</table>
		</div>
		<div class="grouping_table">
			<p>第二组</p>
			<table>
				<tr>
					<td>对战<br></td>
					
				</tr>
				<tr>
					<td>[210]张三1 vs [211]李四1<br></td>
				</tr>
				<tr>
					<td>[210]张三1 vs [212]王五1<br></td>
				</tr>
				<tr><td valign="top">[211]李四1 vs [212]王五1</td>
			</tr>
			</table>
		</div>
        		<div class="grouping_table">
			<p>第三组</p>
			<table>
				<tr>
					<td>对战<br></td>
					
				</tr>
				<tr>
					<td>[210]张三1 vs [211]李四1<br></td>
				</tr>
				<tr>
					<td>[210]张三1 vs [212]王五1<br></td>
				</tr>
				<tr><td valign="top">[211]李四1 vs [212]王五1</td>
			</tr>
			</table>
		</div>
		<!-- 
		<div class="grouping_table">
			<p>第二组</p>
			<table>
				<tr>
					<td>姓名</td>
					<td>编号</td>
					<td>性别</td>
					<td>备注</td>
				</tr>
				<tr>
					<td>杨过</td>
					<td>110</td>
					<td>男</td>
					<td>无</td>
				</tr>
				<tr>
					<td>杨过</td>
					<td>110</td>
					<td>男</td>
					<td>无</td>
				</tr>
			</table>
		</div>
		<div class="grouping_table">
			<p>第三组</p>
			<table>
				<tr>
					<td>姓名</td>
					<td>编号</td>
					<td>性别</td>
					<td>备注</td>
				</tr>
				<tr>
					<td>杨过</td>
					<td>110</td>
					<td>男</td>
					<td>无</td>
				</tr>
				<tr>
					<td>杨过</td>
					<td>110</td>
					<td>男</td>
					<td>无</td>
				</tr>
			</table>
		</div>
		 -->
	</section>
</body>
</html>