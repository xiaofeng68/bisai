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
	<script type="text/javascript" src="${ctxStaticFront }/js/jquery.js"></script>
	<script type="text/javascript" src="${ctxStaticFront }/js/divselect.js"></script>
	<script type="text/javascript">
	$(function(){
		
	});
	function initSelectList(e){
		var id = $(e).val();
		if(id){
			$.post('${ctx }${frontPath}/match/initSelectList', {
				id : id,
			}, function(result) {
				if (result.success) {
					var lunList = result.obj.lunList;
					var optionstring = "";  
		            for (var j = 0; j < lunList.length; j++) {  
		                optionstring += "<option value=\"" + lunList[j] + "\" >第" + lunList[j] + "轮</option>";  
		            }  
		            $("#groupnumSelect").html("<option value=''>请选择...</option> "+optionstring);  
		            var groupList = result.obj.groupList;
					optionstring = "";  
		            for (var j = 0; j < groupList.length; j++) {  
		                optionstring += "<option value=\"" + groupList[j] + "\" >小组" + groupList[j] + "</option>";  
		            }  
		            $("#xiaozuSelect").html("<option value=''>请选择...</option> "+optionstring);  
				}else{
					alert(result.msg);
				}
			}, 'JSON');
		}else{
            $("#groupnumSelect").html("<option value='请选择'>请选择</option> ");
            $("#xiaozuSelect").html("<option value='请选择'>请选择</option> ");
		}
	}
	function refrashTable(){
		var type = $("#typeSelect").val();
		var lun = $("#groupnumSelect").val();
		var xiaozu = $("#xiaozuSelect").val();
		if(type && lun && xiaozu){
			$.post('${ctx }${frontPath}/match/initScoreTable', {
				id : type,
				lun:lun,
				groupnum:xiaozu
			}, function(result) {
				if (result.success) {
					 $("#scoreTable").html(result.obj.tableHtml);
				}else{
					alert(result.msg);
				}
			}, 'JSON');
		}
	}
</script>
</head>
<body>
	<header class="grouping_header clearfix">
		<span class="fl" style="line-height: 120%;">
			<a href="${ctx }/${frontPath}match${urlSuffix}">
				<img src="${ctxStaticFront }/images/r-arrow.png">
			</a>
		</span>
		<span>${match.name }</span>
	</header>
	<section>
		<form>
			<div class="sheet_table">
				<div class="clearfix sheet_table_title" style="text-align: center;">
					<select name="typeSelect" id="typeSelect" onchange="initSelectList(this)" class="select_font_size_1">
						<option>请选择</option>
						<c:forEach var="typeNode" items="${fns:getMatchTypeNote(match.id,type) }">
							<c:forEach var="dic" items="${fns:getDictList('MatchTypeNote_type')}">
								<c:if test="${typeNode.type==dic.value }">
									<option value="${typeNode.id }">${dic.label }</option>
								</c:if>
							</c:forEach>
						</c:forEach>
					</select>
					<!-- 根据前面选择的类型进行查询 -->
					<select name="groupnumSelect" id="groupnumSelect" onchange="refrashTable()" class="select_font_size_1">
						
					</select>
					<select name="xiaozuSelect" id="xiaozuSelect" onchange="refrashTable()" class="select_font_size_1">
						
					</select>
				</div>
				<div id="scoreTable">
				</div>
			</div>
		</form>
	</section>
</body>
</html>