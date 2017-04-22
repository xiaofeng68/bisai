<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/mobile/modules/bisai/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta content="telephone=no" name="format-detection">
	<title>${siteTitle }</title>
	<meta name="keywords" content="${siteKeywords }">
	<meta name="description" content="${siteDescription }">
	<link rel="stylesheet" type="text/css" href="${ctxStaticFront }/css/incstyle.css" media="all">
	<link rel="stylesheet" type="text/css" href="${ctxStaticFront }/css/index.css" media="all">
	<script type="text/javascript" src="${ctxStaticFront }/js/jquery.js"></script>
	<script type="text/javascript" src="${ctxStaticFront }/js/divselect.js"></script>
	<script type="text/javascript">
	var isCheck = false;
	var lunNum = 0;
	$(function(){
		$(".div_select").each(function(){
			var selid = $(this).attr('div-select-val');
			var divselectid = "#divselect" + selid;
			var inputselectid = "#inputselect" + selid;
			$.divselect(divselectid,inputselectid);
		});
		$('#typeSelect').prop('selectedIndex', 1);
        $('#typeSelect').change();
	});
	function initSelectList(e){
		var id = $(e).val();
		if(id){
			$.post('${ctx }${frontPath}/match/initZuSelectList', {
				id : id,
			}, function(result) {
				if (result.success) {
					var lunList = result.obj;
					lunNum = lunList.length;
					var optionstring = "";  
		            for (var j = 0; j < lunList.length; j++) {  
		                optionstring += "<option value=\"" + lunList[j] + "\" >第" + lunList[j] + "轮</option>";  
		            }  
		            $("#groupnumSelect").html("<option value=''>请选择</option> "+optionstring);
		            $("#groupnumSelect").prop('selectedIndex', lunList.length);
                    $("#groupnumSelect").change();
				}else{
					alert(result.msg);
				}
			}, 'JSON');
		}else{
	        $("#groupnumSelect").html("<option value='请选择'>请选择</option> ");
		}
	}
	function changeXiaozu(e){
		var lun = $(e).val();
		if(lun){
			$.post('${ctx }${frontPath}/match/initSelectList', {
				id : $("#typeSelect").val(),
				saizhi:lun
			}, function(result) {
				if (result.success) {
					var zuList = result.obj.list;
					var optionstring = "";  
		            for (var j = 0; j < zuList.length; j++) {  
		                optionstring += "<option value=\"" + zuList[j] + "\" >第" + zuList[j] + "组</option>";  
		            }  
		            $("#xiaozuSelect").html("<option value=''>请选择</option> "+optionstring);
		            if(result.obj.next)
		            	$("#xiaozuSelect").prop('selectedIndex', result.obj.next);
		            else
		            	$("#xiaozuSelect").prop('selectedIndex', zuList.length);
                    $("#xiaozuSelect").change();
				}else{
					 $("#xiaozuSelect").html("<option value='请选择'>请选择</option> ");
				}
			}, 'JSON');
		}else{
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
				groupnum:xiaozu,
				readOnly:true
			}, function(result) {
				if (result.success) {
					 $("#scoreTable").html(result.obj.tableHtml);
					 if(result.obj.notovered){
						 $("#saveButton").show();
					 }else if(lunNum==lun){
						 $("#nextButton").show();
					 }
					 $("#scoreTable select").attr("disabled","disabled");
				}else{
					alert(result.msg);
				}
			}, 'JSON');
		}
		if(lun){
			$("#lun").val(lun);
		}
	}
</script>
</head>
<body>
	<bisai:message content="${message}"/>
	<header class="grouping_header clearfix">
		<span class="fl" style="line-height: 120%;">
			<a href="${ctx }/${frontPath}${fromURL}">
				<img src="${ctxStaticFront}/images/r-arrow.png">
			</a>
		</span>
		<span>${match.name }</span>
	</header>
	<section>
		<div class="sheet_table">
			<div class="clearfix sheet_table_title" style="text-align: center;">
				<select name="typeSelect" id="typeSelect" onchange="initSelectList(this)" class="select_font_size_2">
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
				<select name="groupnumSelect" id="groupnumSelect" onchange="changeXiaozu(this)" class="select_font_size_2">
					<option value="">请选择</option>
				</select>
				<select name="xiaozuSelect" id="xiaozuSelect" onchange="refrashTable()" class="select_font_size_2">
					<option value="">请选择</option>
				</select>
			</div>
			<div id="scoreTable">
			</div>
		</div>
	</section>
</body>
</html>