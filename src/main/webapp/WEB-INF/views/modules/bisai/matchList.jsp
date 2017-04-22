<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>比赛管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/bisai/match/">比赛列表</a></li>
		<shiro:hasPermission name="bisai:match:edit"><li><a href="${ctx}/bisai/match/form">比赛添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="match" action="${ctx}/bisai/match/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>赛事名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>主办者：</label>
				<form:input path="orgs" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>承办者：</label>
				<form:input path="contractor" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>赞助商：</label>
				<form:input path="sponsors" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>赛事名称</th>
				<th>主办者</th>
				<th>承办者</th>
				<th>赞助商</th>
				<th>报名时间</th>
				<th>比赛时间</th>
				<th>状态</th>
				<shiro:hasPermission name="bisai:match:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="match">
			<tr>
				<td><a href="${ctxf }/activity.html?id=${match.id}">
					${match.name}
				</a></td>
				<td>
					${match.orgs}
				</td>
				<td>
					${match.contractor}
				</td>
				<td>
					${match.sponsors}
				</td>
				<td>
					<fmt:formatDate value="${match.regstarttime}" pattern="yyyy-MM-dd"/>至<fmt:formatDate value="${match.regendtime}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					<fmt:formatDate value="${match.starttime}" pattern="yyyy-MM-dd"/>至<fmt:formatDate value="${match.endtime}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					<c:choose>
					<c:when test="${match.state==0}">
						申请中
					</c:when>
					<c:when test="${match.state==1}">
						报名中
					</c:when>
					<c:when test="${match.state==2}">
						进行中
					</c:when>
					<c:otherwise>
						关闭
					</c:otherwise>
					</c:choose>
				</td>
				<td>
				<shiro:hasPermission name="bisai:match:edit">
    				<a href="${ctx}/bisai/match/form?id=${match.id}">修改</a>
					<a href="${ctx}/bisai/match/delete?id=${match.id}" onclick="return confirmx('确认要删除该比赛吗？', this.href)">删除</a>
					<c:choose>
						<c:when test="${match.state==1 }">
							<a href="${ctx}/bisai/match/peopleUpdate?id=${match.id}">参数人员</a>
						</c:when>
						<c:when test="${match.state==2 }">
							<a href="${ctx }/bisai/match/matchScore${urlSuffix}?stype=1&id=${match.id}">成绩录入</a>
						</c:when>
						<c:when test="${match.state==-1 }">
							<a href="${ctx }/bisai/match/matchRecreate${urlSuffix}?id=${match.id}"">再次发起</a>
						</c:when>
					</c:choose>
					
				</shiro:hasPermission>
				<c:if test="${match.state==0 }">
				<shiro:hasPermission name="bisai:match:grant">
    				<a href="${ctx}/bisai/match/grant?id=${match.id}&state=1">通过</a>
				</shiro:hasPermission>
				</c:if>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>