<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/mobile/modules/bisai/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta content="telephone=no" name="format-detection">
    <title>${siteTitle }</title>
    <!-- <meta name="decorator" content="bisai"/> -->
    <meta name="description" content="${siteDescription }"/>
    <meta name="keywords" content="${siteKeywords }"/>
    <link rel="stylesheet" type="text/css" href="${ctxStaticFront}/css/incstyle.css" media="all">
    <link rel="stylesheet" type="text/css" href="${ctxStaticFront}/css/index.css" media="all">
    <script type="text/javascript" src="${ctxStaticFront }/js/jquery.min.js"></script>
    <script type="text/javascript">
        function changeTab(type, index) {
        	$(".dnandannum").hide();
        	$(".dnandannumtab").removeClass("active");
            if (index == '1') {
                $("#" + type + "1").addClass("active");
                $("#" + type + "2").removeClass("active");
                $("#" + type + "Div1").show();
                $("#" + type + "Div2").hide();
            } else {
            	$("#" + type + "1").removeClass("active");
                $("#" + type + "Div1").hide();
                $("#" + type + "2").addClass("active");
                $("#" + type + "Div2").show();
            }
        }
        function addPeopleNote(typeid, div,num) {
        	if(num>1){
        		var orgname = $("#orgname" + typeid).val();
        		if(!orgname){
        			alert("请选择所属单位");
        			return;
        		}
        	}
        	var arr = [];
        	for(var i=1;i<=num;i++){
        		var namep = $("#name" + typeid+"_"+i+"p").val();
        		if(namep){
        			namep=";"+namep;
        		}else{
        			namep="";
        		}
        		var phonep=$("#phone" + typeid+"_"+i+"p").val();
        		if(phonep){
        			phonep=";"+phonep;
        		}else{
        			phonep="";
        		}
        		var orgname = $("#orgname" + typeid).val();
                var name = $("#name" + typeid+"_"+i).val()+namep;
                var phone = $("#phone" + typeid+"_"+i).val()+phonep;
                var id = $("#id" + typeid+"_"+i).val();
                if(name)
                arr.push({id:id,orgname:orgname,name:name,phone:phone,typeid:typeid});
        	}
            
            //var num = parseInt($("#num" + typeid).html());
            $.post('${ctx }${frontPath}/match/savePeopleNote', {
                peoples:JSON.stringify(arr),
                typeid:typeid
            }, function (result) {
                if (result.success) {
                    alert("保存成功");
                    window.location.reload();
                } else {
                    alert(result.msg);
                }
            }, 'JSON');
        }
        function updateState(id, state) {
            $.post('${ctx }${frontPath}/match/updatePeopleNote', {
                id: id,
                state: state
            }, function (result) {
                if (result.success) {
                    window.location.reload();
                } else {
                    alert(result.msg);
                }
            }, 'JSON');
        }
        function deletePeopleNote(id) {
            $.post('${ctx }${frontPath}/match/deletePeopleNote', {
                id: id
            }, function (result) {
                if (result.success) {
                    window.location.reload();
                } else {
                    alert(result.msg);
                }
            }, 'JSON');
        }
        function addOrgNote(div) {
        	var id = $("#id").val();
            var name = $("#name").val();
            var user = $("#user").val();
            var phone = $("#phone").val();
            $.post('${ctx }${frontPath}/match/saveOrgNote', {
            	id:id,
                name: name,
                user: user,
                phone: phone,
                matchid: '${match.id}'
            }, function (result) {
                if (result.success) {
                    alert("保存成功");
                    window.location.reload();
                } else {
                    alert(result.msg);
                }
            }, 'JSON');
        }
        function updateOrgState(id, state) {
            $.post('${ctx }${frontPath}/match/updateOrgNote', {
                id: id,
                state: state
            }, function (result) {
                if (result.success) {
                    window.location.reload();
                } else {
                    alert(result.msg);
                }
            }, 'JSON');
        }
        
        function updateOrg(id,name,phone,user){
        	$("#id").val(id);
        	$("#name").val(name);
        	$("#phone").val(phone);
        	$("#user").val(user);
        	changeTab('dnandannum','1');
        }
        function updatePeopleNote(id,name,phone,orgname,typeid){
        	var names = name.split(";");
        	var phones = phone.split(";");
        	var name = names[0];
        	var phone = phones[0]
        	$("#orgname"+typeid).val(orgname);
        	$("#name"+typeid+"_"+1).val(name);
        	$("#phone"+typeid+"_"+1).val(phone);
        	try{
        	$("#name"+typeid+"_"+1+"p").val(names[1]);
        	$("#phone"+typeid+"_"+1+"p").val(phones[1]);
        	}catch(e){}
        	$("#id"+typeid+"_"+1).val(id);
        	changeTab('dnandannum'+typeid,'1')
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
        <p class="name">${match.name }</p>
        <p class="add">${match.orgs }</p>
        <p class="time">${match.address }${match.detailAddress }</p>
        <p class="time"><fmt:formatDate value="${match.starttime }" pattern="M月d日"/>-<fmt:formatDate
                value="${match.endtime }" pattern="M月d日"/></p>
    </div>
    <div class="activ_list">
        <ul>
            <li class="clearfix mtll">
                <span class="fl li_left f14">参赛单位</span>
                <div class="li_right2 f13 clearfix">
                    <div class="clearfix li_right1" style="width:100%;margin-bottom:0.4rem;">
                        <div class="first-meun">
                            <span class="label_but dnandannumtab" id="dnandannum1" onclick="changeTab('dnandannum','1')">单位维护</span>
                            <span class="label_but dnandannumtab" id="dnandannum2" onclick="changeTab('dnandannum','2')">单位列表</span>
                        </div>
                        <div class="tree-second fr  dnandannum" id="dnandannumDiv1" style="display:none;">
                            <div class="label1 js-check clearfix">
                            	<input type="hidden" id="id"/>
                                <input type="text" id="name" placeholder="参赛单位名称">
                            </div>
                            <div class="label1 js-check clearfix">
                                <input type="text" id="user" placeholder="联系人">
                            </div>
                            <div class="label1 js-check clearfix">
                                <input type="text" id="phone" placeholder="联系电话">
                            </div>
                                <span class="fr label_but" onclick="addOrgNote('dnandannumDiv2')" style="margin-top: 0.5rem;">确定</span>
                        </div>
                        <div class="tree-second fr dnandannum" id="dnandannumDiv2" style="display:none;">
                            <div class="tree_second_list">
                                <c:forEach var="org" items="${fns:getBaomingOrg(match.id) }">
                                    <div class="second_list_con clearfix">
										<span class="activity_po">
											<c:choose>
                                                <c:when test="${org.state==1 }">
                                                    <img id="img${people.id }"
                                                         src="${ctxStaticFront}/images/img37-1.png">
                                                </c:when>
                                                <c:otherwise>
                                                    <img id="img${people.id }" src="${ctxStaticFront}/images/img37.png">
                                                </c:otherwise>
                                            </c:choose>
										</span>
                                        <span class="list_name">${org.name }</span>
                                        <c:choose>
                                            <c:when test="${org.state==1 }">
                                                <span class="list_butt1 fr"
                                                      onclick="updateOrgState(${org.id },0)">恢复</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="list_butt fr"
                                                      onclick="updateOrgState(${org.id },1)">删除</span>
												<span class="list_butt fr"
                                                      onclick="updateOrg(${org.id },'${org.name }','${org.phone }','${org.user }')">修改</span>                                                      
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
                                <span class="label_but dnandannumtab" id="dnandannum${typeNode.id}1"
                                      onclick="changeTab('dnandannum${typeNode.id}','1')">报名中</span>
                                <span class="label_but dnandannumtab" id="dnandannum${typeNode.id}2"
                                      onclick="changeTab('dnandannum${typeNode.id}','2')">报名列表</span>
                            </div>
                            <div class="tree-second fr dnandannum" id="dnandannum${typeNode.id}Div1" style="display:none;">
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
                                <c:set var="num" value="${typeNode.num==0?1:typeNode.num }"></c:set>
                                <c:forEach var="peo" begin="1" end="${num }">
                                <input type="hidden" id="id${typeNode.id}_${peo}"/>
                                <c:choose>
                                <c:when test="${typeNode.type==2 or typeNode.type==4 or typeNode.type==5}">
                                <div class="label1 js-check clearfix">
                                    <input type="text" id="name${typeNode.id}_${peo}" placeholder="姓名${peo }">
                                </div>
                                <div class="label1 js-check clearfix">
                                    <input type="text" id="phone${typeNode.id}_${peo}" placeholder="手机号">
                                </div>
                                <div class="label1 js-check clearfix">
                                    <input type="text" id="name${typeNode.id}_${peo}p" placeholder="队友${peo }">
                                </div>
                                <div class="label1 js-check clearfix">
                                    <input type="text" id="phone${typeNode.id}_${peo}p" placeholder="手机号">
                                </div>
                                </c:when>
                                <c:otherwise>
                                <div class="label1 js-check clearfix">
                                    <input type="text" id="name${typeNode.id}_${peo}" placeholder="姓名${peo }">
                                </div>
                                <div class="label1 js-check clearfix">
                                    <input type="text" id="phone${typeNode.id}_${peo}" placeholder="手机号">
                                </div>
                                </c:otherwise>
                                </c:choose>
                                </c:forEach>
                                <span class="fr label_but" style="margin-top: 0.5rem;" onclick="addPeopleNote(${typeNode.id},'dnandannum${typeNode.id}Div2',${num })">确定</span>
                            </div>
                            <div class="tree-second fr dnandannum" id="dnandannum${typeNode.id}Div2" style="display:none;">
                                <div class="tree_second_list">
                                    <c:forEach var="people" items="${fns:getPeopleByType(typeNode.id) }">
                                        <div class="second_list_con clearfix">
										<span class="activity_po">
											<c:choose>
                                                <c:when test="${people.state==1 }">
                                                	<c:if test="${empty people.account }">
                                                		 <img id="img${people.id }" src="${ctxStaticFront}/images/img37-1.png">
                                                	</c:if>
                                                   <c:if test="${not empty people.account }">
                                                		 <img id="img${people.id }" src="${account.wxphoto }">
                                                	</c:if>
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
                                                	<span class="list_butt fr"
                                                          onclick="deletePeopleNote(${people.id })">删除</span>
                                                    <span class="list_butt fr"
                                                          onclick="updateState(${people.id },1)">踢人</span>
                                                    <span class="list_butt fr"
                                                      onclick="updatePeopleNote(${people.id },'${people.name }','${people.phone }','${people.orgname }',${typeNode.id })">修改</span>
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
        <div style="height:300px;">
        <a href="${ctx }${frontPath}/match/term-${match.id}-${type}${urlSuffix}">
            <div class="acti_buttom">分组抽签</div>
        </a>
        <a href="${ctx }/${frontPath}match/closeMatch${urlSuffix}?id=${match.id}"">
            <div class="acti_buttom">关闭比赛</div>
        </a>
        </div>
    </div>
</section>
</body>
</html>	