<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/mobile/modules/bisai/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>${siteTitle }</title>
	<meta name="keywords" content="${siteKeywords }">
    <meta name="description" content="${siteDescription }">
	<link rel="stylesheet" type="text/css" href="${ctxStaticFront }/css/incstyle.css" media="all">
	<link rel="stylesheet" type="text/css" href="${ctxStaticFront }/css/index.css" media="all">
	<script type="text/javascript" src="${ctxStaticFront }/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctxStaticFront }/js/yf.js"></script>
	<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".apply_border em").live('click',function (){
				var text = ","+$(this).prev().text()+',';
				var id = $(this).parent().parent().prev().prev().attr("id");
				var input = ","+$("#"+id).val()+",";
				input = input.replace(text,'');
				if(","==input.substr(0, 1)){
					input = input.substr(1);
				}else if(","==input.substr(input.length-1)){
					input = input.substr(0,input.length-1);
				}
				$("#"+id).val(input);
				$(this).parent().remove();
			});
		}); 
		function addOrgItems(input,cls,input){
			var name = $("#"+input).val();
			var html = '<span class="apply_borderll"><span>'+name+'</span><em></em></span>';
			$("."+cls).append(html);
			$("#"+input).val("");
			var value = $("#"+input).val();
			if(value){
				value = value+",";
			}
			$("#"+input).val(value+name);
		}
		function resetValue(){
			var contractorStr = "";
			$(".contractordic").find("span").each(function(){
				var val = $(this).find("span").html();
				if(val)
					contractorStr+=val;
			});
			$("#contractor").val(contractorStr);
			var orgsStr = "";
			$(".orgsdic").find("span").each(function(){
				var val = $(this).find("span").html();
				if(val)
					orgsStr+=val;
			});
			$("#orgs").val(orgsStr);
			var sponsorStr = "";
			$(".sponsordic").find("span").each(function(){
				var val = $(this).find("span").html();
				if(val)
					sponsorStr+=val;
			});
			$("#sponsors").val(sponsorStr);
			var typeStr = "";
			$(".typecheck").each(function(){
				if($(this).hasClass('checked'))
					typeStr += $(this).next().html()+",";
			});
			$("#type").val(typeStr.substring(0,typeStr.lengen-1));
			return true;
		}
	</script>
</head>
<body>
	<header class="grouping_header clearfix">
		<span class="fl">
			<a href="javascript:history.go(-1);">
				<img src="${ctxStaticFront }/images/r-arrow.png">
			</a>
		</span>
		<span>申请举办比赛</span>
	</header>
	<section>
		<div class="apply_form">
			<form action="${ctx }/${frontPath}apply_s${urlSuffix}" method="post" onsubmit="return resetValue()">
				<input type="hidden" name="id" value="${match.id }"/>
				<ul>
					<li>
						<span class="namell">比赛名称</span>
						<input class="textll" type="text" name="name" id="name" value="${match.name }" placeholder="请输入比赛名称">
					</li>
					<li>
						<span class="namell">报名时间</span>
						<fmt:formatDate value="${match.regstarttime }" var="regstarttime" pattern="yyyy-MM-dd"/>
						<input class="textll" type="text" name="regstarttime" value="${regstarttime }" id="regstarttime" placeholder="报名时间" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});">
					</li>
					<li>
						<span class="namell">比赛时间</span>
						<fmt:formatDate value="${match.starttime }" var="starttime" pattern="yyyy-MM-dd"/>
						<input class="apply_input1" name="starttime" value="${starttime }" id="starttime" type="text" placeholder="开始时间" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});">
						<span class="apply_text">至</span>
						<fmt:formatDate value="${match.endtime }" var="endtime" pattern="yyyy-MM-dd"/>
						<input class="apply_input1" name="endtime" value="${endtime }" id="endtime" type="text" placeholder="结束时间" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});">
					</li>
					<li class="clearfix">
						<span class="namell fl v-m">地　　址</span>
						<span class="fl clearfix apply_address v-m">
							<img src="${ctxStaticFront }/images/fixed.png">
							<span class="add_text fl">点击选择</span>
							<input class="apply_input" name="address" value="${match.address }" id="address" type="text" placeholder="请选择">
							<span class="fr add_butt">重新选择</span>
						</span>

					</li>
					<li>
						<span class="namell">详细地址</span>
						<input class="textll" type="text" name="detailAddress" value="${match.detailAddress }" placeholder="XX街道">
					</li>
					<li class="clearfix">
						<span class="namell">主办单位</span>
						<input class="textll1" id="addOrg" type="text" placeholder="请输入主办单位">
						<input type="hidden" name="orgs" id="orgs" value="${match.orgs }"/>
						<span class="apply_butt" onclick="addOrgItems('addOrg','orgsdic','orgs')">+</span>  
						<div class="apply_border orgsdic">
						<c:if test="${not empty match.orgs }">
							<c:forEach items='${fn:split(match.orgs,",")}' var="org">
							<span class="apply_borderll"><span>${org }</span><em></em></span>
							</c:forEach>
						</c:if>
						</div>
					</li>
					<li class="clearfix">&nbsp;&nbsp;
						<span class="namell">承办单位</span>
						<input class="textll1" id="addContractor" type="text" placeholder="请输入主办单位">
						<input name="contractor" type="hidden" id="contractor" value="${match.contractor }"/>
						<span class="apply_butt" onclick="addOrgItems('addContractor','contractordic','contractor')">+</span>
						<div class="apply_border contractordic">
						<c:if test="${not empty match.contractor }">
							<c:forEach items='${fn:split(match.contractor,",")}' var="contractor">
							<span class="apply_borderll"><span>${contractor }</span><em></em></span>
							</c:forEach>
						</c:if>
						</div>
					</li>
					<li class="clearfix">
						<span class="namell">赞助商</span>
						<input class="textll1" id="addSponsor" type="text" placeholder="赞助商名称">
						<input type="hidden" name="sponsors" id="sponsors" value="${match.sponsors }"/>
						<span class="apply_butt" onclick="addOrgItems('addSponsor','sponsordic','sponsors')">+</span>
						<div class="apply_border sponsordic">
						<c:if test="${not empty match.sponsors }">
							<c:forEach items='${fn:split(match.sponsors,",")}' var="sponsors">
							<span class="apply_borderll"><span>${sponsors }</span><em></em></span>
							</c:forEach>
						</c:if>
						</div>
					</li>
					<li class="clearfix">
						<div class="clearfix" style="line-height:13px; padding-bottom:0.7rem">
							<span class="namell fl">比赛类型</span>
							<input type="hidden" name="type" id="type">
							<div class="substance fl" style="width:80%;">
								<div style="height: 40px;font-size: 13px;color: #b4b3b3;">
									<input type="radio" name="game_type" style="-webkit-appearance: button;" onclick="bisai_change(1)" checked="checked" id="dxcRadio"><label for="dxcRadio">单项赛</label>
									<input type="radio" name="game_type" style="-webkit-appearance: button;margin-left: 50px;" onclick="bisai_change(2)" id="tdcRadio"><label for="tdcRadio">团体赛</label>
								</div>
								<div id="danxiang">
									<div class="label js-check clearfix fl">
										<em class="unchecked fl typecheck"></em>
										<span class="fl">男单</span>
									</div>
									<div class="label js-check clearfix fl">
										<em class="unchecked fl typecheck"></em>
										<span class="fl">女单</span>
									</div>
									<div class="label js-check clearfix fl">
										<em class="unchecked fl typecheck"></em>
										<span class="fl">男双</span>
									</div>
									<div class="label js-check clearfix fl">
										<em class="unchecked fl typecheck"></em>
										<span class="fl">女双</span>
									</div>
									<div class="label js-check clearfix fl">
										<em class="unchecked fl typecheck"></em>
										<span class="fl">混双</span>
									</div>
								</div>
								<div id="tuanti" style="font-size: 13px;color: #b4b3b3;display: none;">
									<div class="label js-check clearfix">比赛总场次：<select style="width: 80px;"><option>3</option><option>5</option><option>7</option><option>9</option></select></div>
									<div class="label js-check clearfix" style="margin-top: 20px;">
										<em class="unchecked fl typecheck"></em>
										<span class="fl">男单</span>
										<span class="fl" style="margin-left: 40px;margin-top: -4px;"><input type="text" style="width: 60px;border-style:solid;border-width: 1px;"></span><span class="fl">场</span>
									</div>
									<div class="label js-check clearfix" style="margin-top: 10px;">
										<em class="unchecked fl typecheck"></em>
										<span class="fl">男双</span>
										<span class="fl" style="margin-left: 40px;margin-top: -4px;"><input type="text" style="width: 60px;border-style:solid;border-width: 1px;"></span><span class="fl">场</span>
									</div>
									<div class="label js-check clearfix" style="margin-top: 10px;">
										<em class="unchecked fl typecheck"></em>
										<span class="fl">女单</span>
										<span class="fl" style="margin-left: 40px;margin-top: -4px;"><input type="text" style="width: 60px;border-style:solid;border-width: 1px;"></span><span class="fl">场</span>
									</div>
									<div class="label js-check clearfix" style="margin-top: 10px;">
										<em class="unchecked fl typecheck"></em>
										<span class="fl">女双</span>
										<span class="fl" style="margin-left: 40px;margin-top: -4px;"><input type="text" style="width: 60px;border-style:solid;border-width: 1px;"></span><span class="fl">场</span>
									</div>
									<div class="label js-check clearfix" style="margin-top: 10px;">
										<em class="unchecked fl typecheck"></em>
										<span class="fl">混双</span>
										<span class="fl" style="margin-left: 40px;margin-top: -4px;"><input type="text" style="width: 60px;border-style:solid;border-width: 1px;"></span><span class="fl">场</span>
									</div>
								</div>
							</div>
						</div>
					</li>
					<script>
						function bisai_change(val) {
							if(val==1){
							    document.getElementById("danxiang").style.display='inherit';
                                document.getElementById("tuanti").style.display='none';
							}
							if(val==2){
                                document.getElementById("danxiang").style.display='none';
                                document.getElementById("tuanti").style.display='inherit';
							}
                        }
					</script>
					<li style="margin-top:0.3rem;">
						<span class="namell v-t">比赛说明</span>
						<textarea name="des" placeholder="请输入比赛说明">${match.des }</textarea>
					</li>
					<li>
						<span class="namell">联系人</span>
						<input class="textll" type="text" name="contacts" value="${match.contacts }" id="contacts" placeholder="请输入联系人姓名">
					</li>
					
					<li>
						<span class="namell">联系号码</span>
						<input class="textll" type="text" name="phone" value="${match.phone }" id="phone" placeholder="请输入联系号码">
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