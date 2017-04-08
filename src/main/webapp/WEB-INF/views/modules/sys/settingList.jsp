<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>参数管理</title>
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
		<li class="active"><a href="${ctx}/sys/setting/">参数列表</a></li>
		<shiro:hasPermission name="sys:setting:edit"><li><a href="${ctx}/sys/setting/form">参数添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="setting" action="${ctx}/sys/setting/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>参数编号：</label>
				<form:input path="code" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>参数名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>参数编号</th>
				<th>参数名称</th>
				<th>参数描述</th>
				<shiro:hasPermission name="sys:setting:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="setting">
			<tr>
				<td>${setting.code }</td>
				<td>
				<a href="${ctx}/sys/setting/form?id=${setting.id}">
					${setting.name}
				</a>
				</td>
				<td>${setting.content }</td>
				<shiro:hasPermission name="sys:setting:edit"><td>
    				<a href="${ctx}/sys/setting/form?id=${setting.id}">修改</a>
					<a href="${ctx}/sys/setting/delete?id=${setting.id}" onclick="return confirmx('确认要删除该参数吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>