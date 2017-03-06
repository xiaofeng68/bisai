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
	<title>标题</title>
	<meta name="keywords" content="关键字">
    <meta name="description" content="">
	<link rel="stylesheet" type="text/css" href="css/incstyle.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/index.css" media="all">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/divselect.js"></script>
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
				<img src="images/r-arrow.png">
			</a>
		</span>
		<span>天津某某俱乐部羽毛球比赛</span>
	</header>
	<section>
		<form>
			<div class="sheet_table">
				<div class="clearfix sheet_table_title">
					<span class="fl sheet_table_title_l">
						第一轮
					</span>
					<div class="fr clearfix sheet_table_title_r">
						<div class="fl sheet_table_title_r_l">
							<div id="divselect1" class="div_select" div-select-val="1">
								<cite>混双</cite>
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
						<div class="fl sheet_table_title_r_l">
							<div id="divselect2" class="div_select" div-select-val="2">
								<cite>第一组</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">第二组</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">第三组</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect2"/>					
						</div>
					</div>
				</div>
				<table width="100%">
					<tr>
						<td>
							<img src="images/img31.png">
						</td>
						<td>第一局</td>
						<td>第二局</td>
						<td>第三局</td>
						<td>第四局</td>
						<td>第五局</td>
					</tr>
					<tr>
						<td>
							<p>姑　姑</p>
						</td>
						<td>
							<div id="divselect3" class="div_select" div-select-val="3">
								<cite>10</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">11</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">12</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">13</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">14</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect3"/>
						</td>
						<td>
							<div id="divselect4" class="div_select" div-select-val="4">
								<cite>10</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">11</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">12</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">13</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">14</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect4"/>
						</td>
						<td>
							<div id="divselect5" class="div_select" div-select-val="5">
								<cite>10</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">11</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">12</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">13</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">14</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect5"/>
						</td>
						<td>
							<div id="divselect6" class="div_select" div-select-val="6">
								<cite>10</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">11</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">12</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">13</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">14</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect6"/>
						</td>
						<td>
							<div id="divselect7" class="div_select" div-select-val="7">
								<cite>10</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">11</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">12</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">13</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">14</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect7"/>
						</td>
					</tr>
					<tr>
						<td>
							<p>令狐冲</p>
						</td>
						<td>
							<div id="divselect8" class="div_select" div-select-val="8">
								<cite>10</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">11</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">12</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">13</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">14</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect8"/>
						</td>
						<td>
							<div id="divselect9" class="div_select" div-select-val="9">
								<cite>10</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">11</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">12</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">13</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">14</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect9"/>
						</td>
						<td>
							<div id="divselect10" class="div_select" div-select-val="10">
								<cite>10</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">11</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">12</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">13</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">14</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect10"/>
						</td>
						<td>
							<div id="divselect11" class="div_select" div-select-val="11">
								<cite>10</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">11</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">12</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">13</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">14</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect11"/>
						</td>
						<td>
							<div id="divselect12" class="div_select" div-select-val="12">
								<cite>10</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">11</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">12</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">13</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">14</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect12"/>
						</td>
					</tr>
					<tr>
						<td>
							<p>令狐冲</p>
						</td>
						<td>
							<div id="divselect13" class="div_select" div-select-val="13">
								<cite>10</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">11</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">12</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">13</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">14</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect13"/>
						</td>
						<td>
							<div id="divselect14" class="div_select" div-select-val="14">
								<cite>10</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">11</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">12</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">13</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">14</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect14"/>
						</td>
						<td>
							<div id="divselect15" class="div_select" div-select-val="15">
								<cite>10</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">11</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">12</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">13</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">14</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect15"/>
						</td>
						<td>
							<div id="divselect16" class="div_select" div-select-val="16">
								<cite>10</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">11</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">12</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">13</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">14</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect16"/>
						</td>
						<td>
							<div id="divselect17" class="div_select" div-select-val="17">
								<cite>10</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">11</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">12</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">13</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">14</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect17"/>
						</td>
					</tr>
					<tr>
						<td>
							<p>令狐冲</p>
						</td>
						<td>
							<div id="divselect18" class="div_select" div-select-val="18">
								<cite>10</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">11</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">12</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">13</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">14</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect18"/>
						</td>
						<td>
							<div id="divselect19" class="div_select" div-select-val="19">
								<cite>10</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">11</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">12</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">13</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">14</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect19"/>
						</td>
						<td>
							<div id="divselect20" class="div_select" div-select-val="20">
								<cite>10</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">11</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">12</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">13</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">14</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect20"/>
						</td>
						<td>
							<div id="divselect21" class="div_select" div-select-val="21">
								<cite>10</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">11</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">12</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">13</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">14</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect21"/>
						</td>
						<td>
							<div id="divselect22" class="div_select" div-select-val="22">
								<cite>10</cite>
								<ul>
									<li>
										<a href="javascript:;" selectid="1">11</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">12</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">13</a>
									</li>
									<li>
										<a href="javascript:;" selectid="2">14</a>
									</li>
								</ul>
							</div>
							<input name="" type="hidden" value="" id="inputselect22"/>
						</td>
					</tr>
				</table>
			</div>
			<div class="sheet_submit">
				<input type="submit" value="保存">
			</div>
		</form>
	</section>
</body>
</html>