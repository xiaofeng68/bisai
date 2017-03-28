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
			var num = parseInt($("#num"+typeid).html());
			$.post('${ctx }${frontPath}/match/savePeopleNote', {
				orgname : orgname,
				name : name,
				phone:phone,
				typeid:typeid
			}, function(result) {
				if (result.success) {
					alert("保存成功");
					window.location.reload();
				}else{
					alert(result.msg);
				}
			}, 'JSON');
		}
		function updateState(id,state){
			$.post('${ctx }${frontPath}/match/updatePeopleNote', {
				id : id,
				state : state
			}, function(result) {
				if (result.success) {
					window.location.reload();
				}else{
					alert(result.msg);
				}
			}, 'JSON');
		}
		function addOrgNote(div){
			var name = $("#name").val();
			var user = $("#user").val();
			var phone = $("#phone").val();
			$.post('${ctx }${frontPath}/match/saveOrgNote', {
				name : name,
				user : user,
				phone:phone,
				matchid:'${match.id}'
			}, function(result) {
				if (result.success) {
					alert("保存成功");
					window.location.reload();
				}else{
					alert(result.msg);
				}
			}, 'JSON');
		}
		function updateOrgState(id,state){
			$.post('${ctx }${frontPath}/match/updateOrgNote', {
				id : id,
				state : state
			}, function(result) {
				if (result.success) {
					window.location.reload();
				}else{
					alert(result.msg);
				}
			}, 'JSON');
		}
	</script>
</head>
<body>
	<header class="grouping_header clearfix">
		<span class="fl">
			<a href="${ctx }/${frontPath}match${urlSuffix}">
				<img src="${ctxStaticFront}/images/r-arrow.png">
			</a>
		</span>
		<span>${type==1?"单项报名":"团体报名" }</span>
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
				<li class="clearfix mtll">
					<span class="fl li_left f14">参赛单位</span>
					<div class="li_right2 f13 clearfix">
						<div class="clearfix li_right1" style="width:100%;margin-bottom:0.4rem;">
							<div class="first-meun">
								<span class="label_but" id="dnandannum1" onclick="changeTab('dnandannum','1')">单位维护</span>
								<span class="label_but" id="dnandannum2" onclick="changeTab('dnandannum','2')">单位列表</span>
							</div>
							<div  class="tree-second fr" id="dnandannumDiv1" style="display:none;">
								<div class="label1 js-check clearfix"> 
									<input type="text" id="name" placeholder="参赛单位名称">
								</div>
								<div class="label1 js-check clearfix">
									<input type="text" id="user" placeholder="联系人"> 
									<input type="text" id="phone" placeholder="联系电话">
									<span class="fr label_but" onclick="addOrgNote('dnandannumDiv2')">确定</span>
								</div>
							</div>
							<div  class="tree-second fr" id="dnandannumDiv2" style="display:none;">
								<div class="tree_second_list">
									<c:forEach var="org" items="${fns:getBaomingOrg(match.id) }">
									<div class="second_list_con clearfix">
										<span class="activity_po">
											<c:choose>
											<c:when test="${org.state==1 }">
												<img id="img${people.id }" src="${ctxStaticFront}/images/img37-1.png">
											</c:when>
											<c:otherwise>
												<img id="img${people.id }" src="${ctxStaticFront}/images/img37.png">
											</c:otherwise>
										</c:choose>
										</span>
										<span class="list_name">${org.name }</span>
										<c:choose>
											<c:when test="${org.state==1 }">
												<span class="list_butt1 fr" onclick="updateOrgState(${org.id },0)">恢复</span>
											</c:when>
											<c:otherwise>
												<span class="list_butt fr" onclick="updateOrgState(${org.id },1)">删除</span>
											</c:otherwise>
										</c:choose>
									</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li class="clearfix">
					<span class="li_left f14">比赛类型</span>
					<c:forEach var="typeNode" items="${fns:getMatchTypeNote(match.id,type) }">
						<div class="li_right2 f13 clearfix">
						<div class="clearfix li_right1" style="width:100%;margin-bottom:0.4rem;">
							<div class="first-meun">
								<img class="first_img1 v-m" src="${ctxStaticFront}/images/img36-1.png">
								<span class="v-m">${fns:getDictLabel(typeNode.type, 'MatchTypeNote_type', '')}</span>
                                <span>（已报名<label id="num${typeNode.id}">${typeNode.counts }</label>人）</span>
								<span class="label_but" id="dnandannum1" onclick="changeTab('dnandannum${typeNode.id}','1')">报名中</span>
								<span class="label_but" id="dnandannum2" onclick="changeTab('dnandannum${typeNode.id}','2')">报名列表</span>
							</div>
							<div  class="tree-second fr" id="dnandannum${typeNode.id}Div1" style="display:none;">
								<div class="label1 js-check clearfix"> 
									<span class="v-m">单位  </span>
									<select id="orgname${typeNode.id}">
										<option value=''>请选择</option>
										<c:forEach var="org" items="${fns:getBaomingOrg(match.id) }">
										<c:if test="${org.state!=1 }">
										<option value="${org.id }">${org.name }</option>
										</c:if>
										</c:forEach>
									</select>
								</div>
								<div class="label1 js-check clearfix">
									<input type="text" id="name${typeNode.id}" placeholder="姓名"> 
									<input type="text" id="phone${typeNode.id}" placeholder="手机号">
									<span class="fr label_but" onclick="addPeopleNote(${typeNode.id},'dnandannum${typeNode.id}Div2')">确定</span>
								</div>
							</div>
							<div  class="tree-second fr" id="dnandannum${typeNode.id}Div2" style="display:none;">
								<div class="tree_second_list">
									<c:forEach var="people" items="${fns:getPeopleByType(typeNode.id) }">
									<div class="second_list_con clearfix">
										<span class="activity_po">
											<c:choose>
											<c:when test="${people.state==1 }">
												<img id="img${people.id }" src="${ctxStaticFront}/images/img37-1.png">
											</c:when>
											<c:otherwise>
												<img id="img${people.id }" src="${ctxStaticFront}/images/img37.png">
											</c:otherwise>
										</c:choose>
										</span>
										<span class="list_name">${people.name }</span>
										<c:choose>
											<c:when test="${people.state==1 }">
												<span class="list_butt1 fr" onclick="updateState(${people.id },0)">恢复</span>
											</c:when>
											<c:otherwise>
												<span class="list_butt fr" onclick="updateState(${people.id },1)">踢人</span>
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
			<div class="acti_buttom"><a href="${ctx }${frontPath}/match/term-${match.id}-${type}${urlSuffix}">分组抽签</a></div>
		</div>
	</section>
</body>
</html>	