<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
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
		<li class="active"><a href="${ctx}/bisai/tAccount/">用户列表</a></li>
		<shiro:hasPermission name="bisai:tAccount:edit"><li><a href="${ctx}/bisai/tAccount/form">用户添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tAccount" action="${ctx}/bisai/tAccount/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		&nbsp;<label>手机号：</label><form:input path="phone" htmlEscape="false" maxlength="50" class="input-medium"/>
		&nbsp;<label>昵称：</label><form:input path="wxname" htmlEscape="false" maxlength="50" class="input-medium"/>
		&nbsp;<label>微信号：</label><form:input path="wxcode" htmlEscape="false" maxlength="50" class="input-medium"/>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>手机号</th><th>昵称</th><th>微信号</th><th>性别</th><th>地区</th><th>个性签名</th><shiro:hasPermission name="bisai:tAccount:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tAccount">
			<tr>
				<td><a href="form?id=${tAccount.id}">${tAccount.phone}</a></td>
				<td><a href="form?id=${tAccount.id}">${tAccount.wxname}</a></td>
				<td>${tAccount.wxcode}</td>
				<td>${tAccount.sex==1?"男":"女"}</td>
				<td>${tAccount.area}</td>
				<td>${tAccount.des}</td>
				<shiro:hasPermission name="bisai:tAccount:edit"><td>
    				<a href="${ctx}/bisai/tAccount/form?id=${tAccount.id}">修改</a>
					<a href="${ctx}/bisai/tAccount/delete?id=${tAccount.id}" onclick="return confirmx('确认要删除该用户吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>