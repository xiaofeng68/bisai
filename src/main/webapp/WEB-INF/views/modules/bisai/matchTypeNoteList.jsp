<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>比赛类型记录管理</title>
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
		<li class="active"><a href="${ctx}/bisai/matchTypeNote/">比赛类型记录列表</a></li>
		<shiro:hasPermission name="bisai:matchTypeNote:edit"><li><a href="${ctx}/bisai/matchTypeNote/form">比赛类型记录添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="matchTypeNote" action="${ctx}/bisai/matchTypeNote/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>比赛id：</label>
				<form:input path="matchid" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>比赛大类：</label>
				<form:select path="btype" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('MatchTypeNote_btype')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>比赛小类：</label>
				<form:select path="type" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('MatchTypeNote_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>比赛id</th>
				<th>比赛大类</th>
				<th>比赛小类</th>
				<th>团队赛人数</th>
				<th>统计参赛人数</th>
				<shiro:hasPermission name="bisai:matchTypeNote:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="matchTypeNote">
			<tr>
				<td><a href="${ctx}/bisai/matchTypeNote/form?id=${matchTypeNote.id}">
					${matchTypeNote.matchid}
				</a></td>
				<td>
					${fns:getDictLabel(matchTypeNote.btype, 'MatchTypeNote_btype', '')}
				</td>
				<td>
					${fns:getDictLabel(matchTypeNote.type, 'MatchTypeNote_type', '')}
				</td>
				<td>
					${matchTypeNote.num}
				</td>
				<td>
					<fmt:formatDate value="${matchTypeNote.counts}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="bisai:matchTypeNote:edit"><td>
    				<a href="${ctx}/bisai/matchTypeNote/form?id=${matchTypeNote.id}">修改</a>
					<a href="${ctx}/bisai/matchTypeNote/delete?id=${matchTypeNote.id}" onclick="return confirmx('确认要删除该比赛类型记录吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>