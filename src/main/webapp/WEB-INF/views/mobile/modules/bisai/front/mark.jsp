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
					var zuList = result.obj;
					var optionstring = "";  
		            for (var j = 0; j < zuList.length; j++) {  
		                optionstring += "<option value=\"" + zuList[j] + "\" >第" + zuList[j] + "组</option>";  
		            }  
		            $("#xiaozuSelect").html("<option value=''>请选择</option> "+optionstring);
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
				groupnum:xiaozu
			}, function(result) {
				if (result.success) {
					 $("#scoreTable").html(result.obj.tableHtml);
					 if(result.obj.notovered){
						 $("#saveButton").show();
					 }else if(lunNum==lun){
						 $("#nextButton").show();
					 }
				}else{
					alert(result.msg);
				}
			}, 'JSON');
		}
		if(lun){
			$("#lun").val(lun);
		}
	}
	function saveScore(){
		if(!isCheck){
			var arr = [];
			$(".textll").each(function (i) {
		        var id = $(this).attr('id').replace("people_","");
		        var score = $(this).val()?$(this).val():0;
		        if(isNaN(parseInt(score))){
		        	alert('请输入数字得分！');
		        	return false;
		        }
		        arr.push({id:id,score:score});
		    });
			$("#scores").val(JSON.stringify(arr));
			if(arr.length<1){
				alert('请录制分数！');
				return false;
			}
		}
		return true;
	}
	function save(){
		isCheck = false;
		$("#markForm").submit()
	}
	function nextGroup(){
		isCheck = true;
		$("#scores").val(JSON.stringify([]));
		$("#markForm").submit()
	}
	function overMatch(){
		$.post('${ctx }${frontPath}/match/overMatch', {
			id : '${match.id}'
		}, function(result) {
			if (result.success) {
				 $("#overButton").hide();
			}else{
				alert(result.msg);
			}
		}, 'JSON');
	}
</script>
</head>
<body>
	<bisai:message content="${message}"/>
	<header class="grouping_header clearfix">
		<span class="fl" style="line-height: 120%;">
			<a href="${ctx }/${frontPath}match${urlSuffix}">
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
	<form id="markForm" action="${ctx }${frontPath}/match/saveScoreTable" method="post" onsubmit="return saveScore();">
		<input type="hidden" name="scores" id="scores">
		<input type="hidden" name="type" value="${type }" id="type">
		<input type="hidden" name="stype" value="${stype }" id="stype">
		<input type="hidden" name="id" value="${match.id }" id="id">
		<input type="hidden" name="lun" id="lun">
		<div class="sheet_submit">
			<input type="button" value="保存" onclick="save()" id="saveButton" style="display:none;">
			<!-- 最后一组 -->
			<input type="button" value="下一轮" onclick="nextGroup()" id="nextButton" style="display:none;">
			<!-- 都评分完成 -->
			<c:if test="${overButton }">
			<input type="button" value="比赛结束" onclick="overMatch()" id="overButton">
			</c:if>
		</div>
	</form>
</body>
</html>