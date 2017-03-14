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
	<meta name="description" content="${siteDescription }" />
	<meta name="keywords" content="${siteKeywords }" />
	<link rel="stylesheet" type="text/css" href="${ctxStaticFront}/css/incstyle.css" media="all">
	<link rel="stylesheet" type="text/css" href="${ctxStaticFront}/css/index.css" media="all">
	<script type="text/javascript" src="${ctxStaticFront }/js/jquery.min.js"></script>
	<script type="text/javascript">
		function changeTab(type,index){
			if(index=='1'){
				$("#"+type+"1").addClass("active");
				$("#"+type+"2").removeClass("active");
				$("#"+type+"Div1").show();
				$("#"+type+"Div2").hide();
			}else{
				$("#"+type+"2").addClass("active");
				$("#"+type+"1").removeClass("active");
				$("#"+type+"Div1").hide();
				$("#"+type+"Div2").show();
			}
		}
		function addPeopleNote(typeid,div){
			var orgname = $("#orgname"+typeid).val();
			var name = $("#name"+typeid).val();
			var phone = $("#phone"+typeid).val();
			$.post('${ctx }${frontPath}/match/savePeopleNote', {
				orgname : orgname,
				name : name,
				phone:phone,
				typeid:typeid
			}, function(result) {
				if (result.success) {
					alert("保存成功");
					addPeopleDiv(result.obj,div);
				}else{
					alert(result.msg);
				}
			}, 'JSON');
		}
		function addPeopleDiv(people,div){
			var html = '<div class="second_list_con clearfix">'+
			'<span class="activity_po">'+
				'<img src="${ctxStaticFront}/images/img37.png">'+
			'</span>'+
			'<span class="list_name">'+people.name+'</span>';
			if(people.state==1){
				html+='<span class="list_butt1 fr">恢复</span>';
			}else{
				html+='<span class="list_butt fr">踢人</span>';
			}
			html+='</div>';
			$("#"+div).append(html);
		}
	</script>
</head>
<body>
	<header class="grouping_header clearfix">
		<span class="fl">
			<a href="javascript:history.go(-1);">
				<img src="${ctxStaticFront}/images/r-arrow.png">
			</a>
		</span>
		<span>单项报名</span>
	</header>
	<section>
		<div class="activity_first">
			<p>
				<img src="${ctxStaticFront}/images/img35.png">
			</p>
			<p class="name"><fmt:formatDate value="${match.starttime }" pattern="E"/>${match.name }打球</p>
			<p class="add">${match.name }</p>
			<p class="time"><fmt:formatDate value="${match.starttime }" pattern="M月d日"/>-<fmt:formatDate value="${match.endtime }" pattern="M月d日"/></p>
		</div>
		<div class="activ_list">
			<ul>
				<li class="clearfix">
					<span class="li_left f14">比赛类型</span>
					<c:forEach var="typeNode" items="${fns:getMatchTypeNote(match.id,type) }">
						<div class="li_right2 f13 clearfix">
						<div class="clearfix li_right1" style="width:100%;margin-bottom:0.4rem;">
							<div class="first-meun">
								<img class="first_img1 v-m" src="${ctxStaticFront}/images/img36-1.png">
								<span class="v-m">${fns:getDictLabel(typeNode.type, 'MatchTypeNote_type', '')}</span>
                                <span>（已报名${typeNode.counts }人）</span>
								<span class="label_but" id="dnandannum1" onclick="changeTab('dnandannum','1')">报名中</span>
								<span class="label_but" id="dnandannum2" onclick="changeTab('dnandannum','2')">报名列表</span>
							</div>
							<div  class="tree-second fr" id="dnandannumDiv1" style="display:none;">
								<div class="label1 js-check clearfix"> 
									<input type="text" id="orgname${typeNode.id}" placeholder="单位">
								</div>
								<div class="label1 js-check clearfix">
									<input type="text" id="name${typeNode.id}" placeholder="姓名"> 
									<input type="text" id="phone${typeNode.id}" placeholder="手机号">
									<span class="fr label_but" onclick="addPeopleNote(${typeNode.id},'dnandannumDiv2')">确定</span>
								</div>
							</div>
							<div  class="tree-second fr" id="dnandannumDiv2" style="display:none;">
								<div class="tree_second_list">
									<c:forEach var="people" items="${fns:getPeopleByType(typeNode.id) }">
									<div class="second_list_con clearfix">
										<span class="activity_po">
											<c:choose>
											<c:when test="${people.state==1 }">
												<img src="${ctxStaticFront}/images/img37-1.png">
											</c:when>
											<c:otherwise>
												<img src="${ctxStaticFront}/images/img37.png">
											</c:otherwise>
										</c:choose>
										</span>
										<span class="list_name">${people.name }</span>
										<c:choose>
											<c:when test="${people.state==1 }">
												<span class="list_butt1 fr">恢复</span>
											</c:when>
											<c:otherwise>
												<span class="list_butt fr">踢人</span>
											</c:otherwise>
										</c:choose>
									</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</li>
			</ul>
			<div class="acti_buttom"><a href="${ctx }${frontPath}/match/grouping-${match.id}-${type}${urlSuffix}">分组抽签</a></div>
		</div>
	</section>
</body>
</html>	