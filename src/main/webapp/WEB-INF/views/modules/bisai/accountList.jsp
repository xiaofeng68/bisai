<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>账号管理</title>
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
		<li class="active"><a href="${ctx}/bisai/account/">账号列表</a></li>
		<shiro:hasPermission name="bisai:account:edit"><li><a href="${ctx}/bisai/account/form">账号添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="account" action="${ctx}/bisai/account/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>手机号：</label>
				<form:input path="phone" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>昵称：</label>
				<form:input path="wxname" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>微信号：</label>
				<form:input path="wxcode" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>手机号</th>
				<th>昵称</th>
				<th>微信号</th>
				<th>性别</th>
				<th>地区</th>
				<th>状态</th>
				<shiro:hasPermission name="bisai:account:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="account">
			<tr>
				<td><a href="${ctx}/bisai/account/form?id=${account.id}">
					${account.phone}
				</a></td>
				<td>
					${account.wxname}
				</td>
				<td>
					${account.wxcode}
				</td>
				<td>
					${account.sex}
				</td>
				<td>
					${account.area}
				</td>
				<td>
					${account.state}
				</td>
				<shiro:hasPermission name="bisai:account:edit"><td>
    				<a href="${ctx}/bisai/account/form?id=${account.id}">修改</a>
					<a href="${ctx}/bisai/account/delete?id=${account.id}" onclick="return confirmx('确认要删除该账号吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>