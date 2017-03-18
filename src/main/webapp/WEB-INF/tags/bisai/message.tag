<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="content" type="java.lang.String" required="true" description="消息内容"%>
<c:if test="${not empty content}">
	<script type="text/javascript">
		alert('${content}');
	</script>
</c:if>