<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>比赛管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
			// 复选框
			$(".js-check em").on("click", function() {
				if ($(this).hasClass("checked")) {
					$(this).removeClass("checked").addClass("unchecked");
				} else {
					$(this).removeClass("unchecked").addClass("checked");
				}
			});
		});
		function bisai_change(val) {
			if(val==1){
			    document.getElementById("danxiang").style.display='inherit';
                document.getElementById("tuanti").style.display='none';
                $(".ttypecheck").each(function(){
    				if($(this).hasClass('checked')){
    					$(this).removeClass('checked').addClass('unchecked');
    					$(this).parent().find("input").val("");//获取场次
    				}
    			});
                $("#changci").val(0);
			}
			if(val==2){
                document.getElementById("danxiang").style.display='none';
                document.getElementById("tuanti").style.display='inherit';
                $(".typecheck").each(function(){
    				if($(this).hasClass('checked'))
    					$(this).removeClass('checked').addClass('unchecked');
    			});
			}
        }
	</script>
	<style type="text/css">
		.label .checked,.label .unchecked{
			background: url("/static/modules/bisai/images/checked.png") no-repeat;
			background-size:10px 10px;
		    border: 0.05rem solid #77cdb2;
		    border-radius: 0;
		    cursor: pointer;
		    display: inline-block;
		    height: 10px;
		    vertical-align: middle;
		    width: 10px;
		    margin-right: 3px;
		}
		.label .unchecked {
		    background: #fff;
		    border: 0.05rem solid #929292;
		    border-radius: 0.025rem;
		}
	</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/bisai/match/">比赛列表</a></li>
		<li class="active"><a href="${ctx}/bisai/match/form?id=${match.id}">比赛<shiro:hasPermission name="bisai:match:edit">${not empty match.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="bisai:match:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="match" action="${ctx}/bisai/match/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">赛事名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">主办者：</label>
			<div class="controls">
				<form:input path="orgs" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">承办者：</label>
			<div class="controls">
				<form:input path="contractor" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">赞助商：</label>
			<div class="controls">
				<form:input path="sponsors" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">比赛项目：</label>
			<div class="controls">
				<form:hidden path="type"/>
				<div class="substance fl" style="width:80%;">
					<div style="height: 40px;font-size: 13px;color: #b4b3b3;">
						<input type="radio" name="btype" value="1" style="-webkit-appearance: button;" onclick="bisai_change(1)" checked="checked" id="dxcRadio"><label for="dxcRadio">单项赛</label>
						<input type="radio" name="btype" value="2" style="-webkit-appearance: button;margin-left: 50px;" onclick="bisai_change(2)" id="tdcRadio"><label for="tdcRadio">团体赛</label>
					</div>
					<c:set var="btypes" value='${fn:split(match.type,";") }'></c:set>
					<div id="danxiang">
						<c:forEach var="type" items="${fns:getDictList('MatchTypeNote_type')}">
						<div class="label js-check clearfix fl">
							<c:set var="hasType" value="false"></c:set>
							<c:forEach var="typeNode" items="${fns:getMatchTypeNote(match.id,1) }">
								<c:if test="${typeNode.type==type.value }">
									<c:set var="hasType" value="true"></c:set>
								</c:if>
							</c:forEach>
							<c:choose>
								<c:when test='${hasType }'>
									<em class="checked fl typecheck"></em>
								</c:when>
								<c:otherwise>
									<em class="unchecked fl typecheck"></em>
								</c:otherwise>
							</c:choose>
							<span class="fl">${type.label }</span>
						</div>
						</c:forEach>
					</div>
					<div id="tuanti" style="font-size: 13px;color: #b4b3b3;display: none;">
						<div class="label js-check clearfix">比赛总场次：
						<select style="width: 80px;" name="changci" id="changci">
							<option value="0">请选择</option>
							<c:forEach var="dic" items="${fns:getDictList('MATCH_CHANGCI')}">
								<option value="${dic.value}" <c:if test="${match.changci==dic.value }">selected="selected"</c:if>  >${dic.label }</option>
							</c:forEach>
						</select>
						</div><br/>
						<c:forEach var="type" items="${fns:getDictList('MatchTypeNote_type')}">
						<div class="label js-check clearfix" style="margin-top: 20px;">
							<c:set var="hasType" value="false"></c:set>
							<c:set var="cc" value=""></c:set>
							<c:forEach var="typeNode" items="${fns:getMatchTypeNote(match.id,2) }">
								<c:if test="${typeNode.type==type.value }">
									<c:set var="hasType" value="true"></c:set>
									<c:set var="cc" value="${typeNode.num }"></c:set>
								</c:if>
							</c:forEach>
							<c:choose>
								<c:when test='${hasType }'>
									<em class="checked fl ttypecheck"></em>
								</c:when>
								<c:otherwise>
									<em class="unchecked fl ttypecheck"></em>
								</c:otherwise>
							</c:choose>
							<span class="fl">${type.label }</span>
							<span class="fl" style="margin-left: 40px;margin-top: -4px;"><input type="text" value="${cc }" style="width: 60px;border-style:solid;border-width: 1px;"></span><span class="fl">场</span>
						</div>
						<br/>
						</c:forEach>
						
					</div>
				</div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">比赛时间：</label>
			<div class="controls">
				<input name="starttime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${match.starttime}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>至
				<input name="endtime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${match.endtime}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">报名开始时间：</label>
			<div class="controls">
				<input name="regstarttime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${match.regstarttime}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>至
				<input name="regendtime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${match.regendtime}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">创建时间：</label>
			<div class="controls">
				<input name="createtime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${match.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">更新时间：</label>
			<div class="controls">
				<input name="updatetime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${match.updatetime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">比赛地点：</label>
			<div class="controls">
				<form:input path="address" htmlEscape="false"  maxlength="100" class="input-xlarge "/>
				<form:input path="detailAddress" htmlEscape="false"  maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系人：</label>
			<div class="controls">
				<form:input path="contacts" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系电话：</label>
			<div class="controls">
				<form:input path="phone" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">比赛简介：</label>
			<div class="controls">
				<form:textarea path="des" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">奖金奖品：</label>
			<div class="controls">
				<form:textarea path="jiangpin" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">状态</label>
			<div class="controls">
				<form:radiobuttons path="state" items="${fns:getDictList('MATCH_STATE')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="bisai:match:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>