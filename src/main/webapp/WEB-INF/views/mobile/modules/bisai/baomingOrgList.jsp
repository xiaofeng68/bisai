<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>单位管理</title>
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
		<li class="active"><a href="${ctx}/bisai/baomingOrg/">单位列表</a></li>
		<shiro:hasPermission name="bisai:baomingOrg:edit"><li><a href="${ctx}/bisai/baomingOrg/form">单位添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="baomingOrg" action="${ctx}/bisai/baomingOrg/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>参赛单位名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>参赛单位名称</th>
				<th>联系人</th>
				<th>联系电话</th>
				<th>状态</th>
				<shiro:hasPermission name="bisai:baomingOrg:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="baomingOrg">
			<tr>
				<td><a href="${ctx}/bisai/baomingOrg/form?id=${baomingOrg.id}">
					${baomingOrg.name}
				</a></td>
				<td>
					${baomingOrg.user}
				</td>
				<td>
					${baomingOrg.phone}
				</td>
				<td>
					${fns:getDictLabel(baomingOrg.state, 'BaomingOrg_State', '')}
				</td>
				<shiro:hasPermission name="bisai:baomingOrg:edit"><td>
    				<a href="${ctx}/bisai/baomingOrg/form?id=${baomingOrg.id}">修改</a>
					<a href="${ctx}/bisai/baomingOrg/delete?id=${baomingOrg.id}" onclick="return confirmx('确认要删除该单位吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>