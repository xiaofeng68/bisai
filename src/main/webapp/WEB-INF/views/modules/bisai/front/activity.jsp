<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/mobile/modules/bisai/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${siteTitle }</title>
    <meta name="keywords" content="${siteKeywords }">
    <meta name="description" content="${siteDescription }">
    <link rel="stylesheet" type="text/css" href="${ctxStaticFront }/css/incstyle.css" media="all">
    <link rel="stylesheet" type="text/css" href="${ctxStaticFront }/css/index.css" media="all">
    <script type="text/javascript" src="${ctxStaticFront }/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctxStaticFront }/js/yf.js"></script>
    <script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="${ctxStaticFront }/js/divselect.js"></script>
    <script type="text/javascript">
        var isCheck = false;
        var lunNum = 0;
        $(function () {
            $(".div_select").each(function () {
                var selid = $(this).attr('div-select-val');
                var divselectid = "#divselect" + selid;
                var inputselectid = "#inputselect" + selid;
                $.divselect(divselectid, inputselectid);
            });
            $(".gains_table li").on("click", function () {
                $(this).addClass("active").siblings().removeClass("active");
                $(".matchdiv").hide().eq($(this).index()).show();
            });
            var changci = parseInt('${match.changci}');
            if (changci) {
                bisai_change(2);
            }

            $('#typeSelect').prop('selectedIndex', 1);
            $('#typeSelect').change();
        });
        function initSelectList(e) {
            var id = $(e).val();
            if (id) {
                $.post('${ctx }${frontPath}/match/initZuSelectList', {
                    id: id,
                }, function (result) {
                    if (result.success) {
                        var lunList = result.obj;
                        lunNum = lunList.length;
                        var optionstring = "";
                        for (var j = 0; j < lunList.length; j++) {
                        	if(j==lunList.length-1){
                        		optionstring += "<option value=\"" + lunList[j] + "\" >第" + lunList[j] + "轮</option>";
                        	}else{
                        		optionstring += "<option value=\"" + lunList[j] + "\" >第" + lunList[j] + "轮</option>";                        		
                        	}
                        }
                        $("#groupnumSelect").html("<option value=''>请选择</option> " + optionstring);
                        $("#groupnumSelect").prop('selectedIndex', lunList.length);
                        $("#groupnumSelect").change();
                    } else {
                        alert(result.msg);
                    }
                }, 'JSON');
            } else {
                $("#groupnumSelect").html("<option value='请选择'>请选择</option> ");
            }
        }
        function changeXiaozu(e) {
            var lun = $(e).val();
            if (lun) {
                $.post('${ctx }${frontPath}/match/initSelectList', {
                    id: $("#typeSelect").val(),
                    saizhi: lun
                }, function (result) {
                    if (result.success) {
                        var zuList = result.obj.list;
                        var optionstring = "";
                        for (var j = 0; j < zuList.length; j++) {
                        	if(j==zuList.length-1){
                        		optionstring += "<option value=\"" + zuList[j] + "\" >第" + zuList[j] + "组</option>";
                        	}else{
                        		optionstring += "<option value=\"" + zuList[j] + "\" >第" + zuList[j] + "组</option>";                        		
                        	}
                        }
                        $("#xiaozuSelect").html("<option value=''>请选择</option> " + optionstring);
                        $("#xiaozuSelect").prop('selectedIndex', zuList.length);
                        $("#xiaozuSelect").change();
                    } else {
                        $("#xiaozuSelect").html("<option value='请选择'>请选择</option> ");
                    }
                }, 'JSON');
            } else {
                $("#xiaozuSelect").html("<option value='请选择'>请选择</option> ");
            }
        }
        function refrashTable() {
            var type = $("#typeSelect").val();
            var lun = $("#groupnumSelect").val();
            var xiaozu = $("#xiaozuSelect").val();
            if (type && lun && xiaozu) {
                $.post('${ctx }${frontPath}/match/initScoreTable', {
                    id: type,
                    lun: lun,
                    groupnum: xiaozu,
                    readOnly: true
                }, function (result) {
                    if (result.success) {
                        $("#scoreTable").html(result.obj.tableHtml);
                        if (result.obj.notovered) {
                            $("#saveButton").show();
                        } else if (lunNum == lun) {
                            $("#nextButton").show();
                        }
                        $("#scoreTable select").attr("disabled", "disabled");
                    } else {
                        alert(result.msg);
                    }
                }, 'JSON');
            }
            if (lun) {
                $("#lun").val(lun);
            }
        }
        function bisai_change(val) {
            var elm_a = document.getElementById("radio_button_a");
            var elm_b = document.getElementById("radio_button_b");
            if (val == 1) {
                document.getElementById("danxiang").style.display = 'inherit';
                document.getElementById("tuanti").style.display = 'none';
                elm_a.style.backgroundColor = "#44bb95";
                elm_b.style.backgroundColor = "";
                elm_a.style.color = "#fff";
                elm_b.style.color = "#b4b3b3";
            }
            if (val == 2) {
                document.getElementById("danxiang").style.display = 'none';
                document.getElementById("tuanti").style.display = 'inherit';
                elm_a.style.backgroundColor = "";
                elm_b.style.backgroundColor = "#44bb95";
                elm_a.style.color = "#b4b3b3";
                elm_b.style.color = "#fff";
            }
        }
        function baoming(type, flag) {
        	var name = $("#notename"+type).val();
            if (!name) {
                alert("请输入姓名！");
                return;
            }
            var phone = $("#notephone"+type).val();
            if (!phone) {
                alert("请输入手机号！");
                return;
            }
            $.post('${ctx }${frontPath}/match/matchbaoming', {
            	typeid: type,
                flag: flag,
                name: name,
                phone: phone,
                id: $("#noteid"+type).val()
            }, function (result) {
                if (result.success) {
                	$("#noteid"+type).val(result.obj.id);
                    if (flag) {
                        $("#baomspan" + type + "true").hide();
                        $("#baomspan" + type + "false").show();
                        $("#baomspan" + type).show();
                    } else {
                        $("#baomspan" + type + "true").show();
                        $("#baomspan" + type + "false").hide();
                        $("#baomspan" + type).hide();
                        $("#notename"+type).val('${CURRENTACCOUNT.wxname}');
                        $("#notephone"+type).val('${CURRENTACCOUNT.phone}');
                    }
                    if(flag){
                    	alert("保存成功");
                    }
                } else {
                    alert(result.msg);
                }
            }, 'JSON');
        }
        function addPeopleNote(type, flag) {
        	var name0 = $("#notename0"+type).val();
            if (!name0) {
                alert("请输您的姓名！");
                return;
            }
            var phone0 = $("#notephone0"+type).val();
            if (!phone0) {
                alert("请输入您的手机号！");
                return;
            }
            var name1 = $("#notename1"+type).val();
            if (!name1) {
                alert("请输入队友姓名！");
                return;
            }
            var phone1 = $("#notephone1"+type).val();
            if (!phone1) {
                alert("请输入队友手机号！");
                return;
            }
            var num = parseInt($("#num"+type).html());
            $.post('${ctx }${frontPath}/match/matchbaomings', {
                typeid: type,
                flag: flag,
                name: name0+";"+name1,
                phone: phone0+";"+phone1,
                id: $("#noteid"+type).val()
            }, function (result) {
                if (result.success) {
                    $("#noteid"+type).val(result.obj.id);
                    if (flag) {
                        $("#baomspan" + type + "true").hide();
                        $("#baomspan" + type).show();
                        $("#baomspan" + type + "false").show();
                        if(!isNaN(num)){
                        	$("#num"+type).html(num+1)
                        }
                    } else {
                        $("#baomspan" + type + "true").show();
                        $("#baomspan" + type + "false").hide();
                        $("#baomspan" + type).hide();
                        if(!isNaN(num)){
                        	$("#num"+type).html(num-1)
                        }
                    }
                    if(flag){
                    	alert("保存成功");
                    }
                } else {
                    alert(result.msg);
                }
            }, 'JSON');
        }
    </script>
</head>
<body>
<header class="grouping_header clearfix">
		<span class="fl">
			<a href="${ctx }/${frontPath}/logout">
				<img src="${ctxStaticFront }/images/r-arrow.png">
			</a>
		</span>
    <span>${match.name }</span>
</header>
<div class="gains_table">
    <ul style="float: left;font-size: 13px;color: #aaaaaa;background: #fff;line-height: 1.5rem;width: 100%;text-align: center;">
        <li class="active">赛事信息</li>
        <li>人员名单</li>
        <li>分组及成绩</li>
    </ul>
</div>
<br/>
<section>
    <div class="apply_form matchdiv">
        <input type="hidden" name="id" value="${match.id }"/>
        <ul>
            <li>
                <span class="namell">赛事名称</span>
                <span class="textll">${match.name }</span>
            </li>
            <li class="clearfix">
                <div class="apply_border orgsdic">
                    <span class="namell">主办者</span>
                    <c:if test="${not empty match.orgs }">
                        <c:forEach items='${fn:split(match.orgs,",")}' var="org">
                            <span class="apply_borderll"><span>${org }</span></span>
                        </c:forEach>
                    </c:if>
                </div>
            </li>
            <li class="clearfix">&nbsp;&nbsp;
                <div class="apply_border contractordic">
                    <span class="namell">承办者</span>
                    <c:if test="${not empty match.contractor }">
                        <c:forEach items='${fn:split(match.contractor,",")}' var="contractor">
                            <span class="apply_borderll"><span>${contractor }</span></span>
                        </c:forEach>
                    </c:if>
                </div>
            </li>
            <li class="clearfix">
                <div class="apply_border sponsordic">
                    <span class="namell">赞助商</span>
                    <c:if test="${not empty match.sponsors }">
                        <c:forEach items='${fn:split(match.sponsors,",")}' var="sponsors">
                            <span class="apply_borderll"><span>${sponsors }</span></span>
                        </c:forEach>
                    </c:if>
                </div>
            </li>
            <c:set var="isDuanxiang" value="${match.changci==0 }"></c:set>
            <li class="clearfix">
                <div class="clearfix" style="line-height:13px; padding-bottom:0.7rem">
                    <span class="namell fl">比赛项目</span>
                    <input type="hidden" name="type" id="type">
                    <div class="substance fl" style="width:80%;">
                        <div style="height: 40px;font-size: 0.7rem;color: #b4b3b3;">
                            <c:if test="${isDuanxiang }">
                                <input type="radio" name="btype" value="1" style="-webkit-appearance: button;"
                                       onclick="bisai_change(1)" id="dxcRadio"><label for="dxcRadio" id="radio_button_a" class="radio_button" style="background-color:#44bb95;color:#fff;">单项赛</label>
                            </c:if>
                            <c:if test="${!isDuanxiang }">
                                <input type="radio" name="btype" value="2"
                                       style="-webkit-appearance: button;margin-left: 90px;" onclick="bisai_change(2)"
                                       id="tdcRadio"><label for="tdcRadio" id="radio_button_b" class="radio_button" style="background-color:#44bb95;color:#fff;">团体赛</label>
                            </c:if>
                        </div>
                        <c:set var="btypes" value='${fn:split(match.type,";") }'></c:set>
                        <div id="danxiang" style="margin-top: 1.5rem;">
                            <c:forEach var="type" items="${fns:getDictList('MatchTypeNote_type')}">
                                <div class="label js-check clearfix" style="margin-top: 1.5rem;">
                                    <c:set var="hasType" value="false"></c:set>
                                    <c:forEach var="typeNode" items="${fns:getMatchTypeNote(match.id,1) }">
                                        <c:if test="${typeNode.type==type.value }">
                                            <span class="fl">${type.label }</span>
                                            <c:if test="${match.changci==0 and not empty CURRENTACCOUNT and CURRENTACCOUNT.id!=match.account.id}">
										    <jsp:useBean id="now" class="java.util.Date"/>
										    <fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="nowDate"/>
										    <fmt:formatDate value="${match.regendtime}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="regendtime"/>
										    <fmt:formatDate value="${match.regstarttime}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="regstarttime"/>
										    <c:if test="${nowDate ge regstarttime and nowDate le regendtime}">
                                            <!-- 添加对应的比赛申请 -->
                                            <c:if test="${type.value==2 or type.value==4 or type.value==5}">
	                                            <c:set var="peoples" value="${fns:peopleHasBaoming(typeNode.id,CURRENTACCOUNT.openid) }"></c:set>
	                                            <c:set var="peopleLen" value="${fn:length(peoples) }"/>
	                                            <c:choose>
	                                            <c:when test="${peopleLen==1 }">
	                                            	<c:set var="note1" value="${peoples[0] }"/>
	                                            	<input type="hidden" id="noteid${typeNode.id}" value="${note1.id }"/>
	                                            	<input type="text" id="notename0${typeNode.id}" placeholder="姓名" value="${CURRENTACCOUNT.wxname }" style="margin-top: 1rem;" readonly="readonly">
                                                    <input type="text" id="notephone0${typeNode.id}" placeholder="手机号" value="${CURRENTACCOUNT.phone }" style="margin-top: 1rem;">
                                                    <input type="text" id="notename1${typeNode.id}" placeholder="队友姓名" value="${note1.name }" style="margin-top: 1rem;">
                                                    <input type="text" id="notephone1${typeNode.id}" placeholder="手机号" value="${note1.phone }" style="margin-top: 1rem;">
	                                            </c:when>
	                                            <c:otherwise>
	                                            	<c:set var="note1" value="${peoples[0] }"/>
	                                            	<input type="hidden" id="noteid${typeNode.id}" value="${note1.id }"/>
	                                            	<input type="text" id="notename0${typeNode.id}" placeholder="姓名" value="${note1.name }" style="margin-top: 1.5rem;" <c:if test="${note1.name== CURRENTACCOUNT.wxname}"> readonly="readonly"</c:if>>
                                                    <input type="text" id="notephone0${typeNode.id}" placeholder="手机号" value="${note1.phone }" style="margin-top: 3rem;">
                                                    <c:set var="note2" value="${peoples[0] }"/>
                                                    <input type="text" id="notename1${typeNode.id}" placeholder="队友姓名" value="${note2.name }" style="margin-top: 1.5rem;" <c:if test="${note1.name== CURRENTACCOUNT.wxname}"> readonly="readonly"</c:if>>
                                                    <input type="text" id="notephone1${typeNode.id}" placeholder="手机号" value="${note2.phone }" style="margin-top: 3rem;">
	                                            </c:otherwise>
	                                            </c:choose>
	                                            <span class="fl label_but" style="text-align:center;color:#FFF;background-color:#44bb95;margin-right:1rem;float:right;<c:if test="${fn:length(peoples)==2}">display:none;</c:if>" onclick="addPeopleNote(${typeNode.id},true)" id="baomspan${typeNode.id }true">报名</span>
	                                            <span class="fl label_but" style="text-align:center;color:#FFF;background-color:#44bb95;margin-right:1rem;float:right;<c:if test="${fn:length(peoples)==1}">display:none;</c:if>" onclick="addPeopleNote(${typeNode.id},false)" id="baomspan${typeNode.id }false">取消报名</span>
	                                            <span class="fl label_but" style="text-align:center;color:#FFF;background-color:#44bb95;margin-right:1rem;float:right;<c:if test="${fn:length(peoples)==1}">display:none;</c:if>" onclick="addPeopleNote(${typeNode.id},true)" id="baomspan${typeNode.id }">修改</span>
	                                        </c:if>
	                                        <c:if test="${type.value==1 or type.value==3 }">
	                                            <c:set var="note" value="${fns:checkHasBaoming(typeNode.id,CURRENTACCOUNT.openid) }"/>
	                                            <c:choose>
	                                            <c:when test="${empty note }">
	                                            <input type="hidden" id="noteid${typeNode.id}"/>
	                                            <input type="text" id="notename${typeNode.id}" placeholder="姓名" value="${CURRENTACCOUNT.wxname }" style="margin-top: 1.5rem;" readonly="readonly">
	                                            <input type="text" id="notephone${typeNode.id}" placeholder="手机号" value="${CURRENTACCOUNT.phone }" style="margin-top: 3rem;">
	                                            </c:when>
	                                            <c:otherwise>
	                                            <input type="hidden" id="noteid${typeNode.id}" value="${note.id }"/>
	                                            <input type="text" id="notename${typeNode.id}" placeholder="姓名" value="${note.name }" style="margin-top: 1.5rem;" readonly="readonly">
	                                            <input type="text" id="notephone${typeNode.id}" placeholder="手机号" value="${note.phone }" style="margin-top: 3rem;">
	                                            </c:otherwise>
	                                            </c:choose>
	                                            <span class="fl label_but" style="text-align:center;color:#FFF;background-color:#44bb95;margin-right:1rem;float:right;<c:if test="${not empty note }">display:none;</c:if>" onclick="baoming(${typeNode.id},true)" id="baomspan${typeNode.id }true">报名</span>
	                                            <span class="fl label_but" style="text-align:center;color:#FFF;background-color:#44bb95;margin-right:1rem;float:right;<c:if test="${empty note}">display:none;</c:if>" onclick="baoming(${typeNode.id},false)" id="baomspan${typeNode.id }false">取消报名</span>
	                                            <span class="fl label_but" style="text-align:center;color:#FFF;background-color:#44bb95;margin-right:1rem;float:right;<c:if test="${empty note}">display:none;</c:if>" onclick="baoming(${typeNode.id},true)" id="baomspan${typeNode.id }">修改</span>
	                                        </c:if>
                                            <!-- 添加对应的比赛申请 -->
                                            </c:if>
                                            </c:if>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </c:forEach>
                        </div>
                        <div id="tuanti" style="font-size: 0.7rem;color: #b4b3b3;display: none;margin-top: 1rem;">
                            <div class="label js-check clearfix">比赛总场次：
                                <select class="select_font_size_3" name="changci" id="changci" disabled="disabled">
                                    <option value="0">=请选择=</option>
                                    <c:forEach var="dic" items="${fns:getDictList('MATCH_CHANGCI')}">
                                        <option value="${dic.value}"
                                                <c:if test="${match.changci==dic.value }">selected="selected"</c:if>  >${dic.label }</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <c:forEach var="type" items="${fns:getDictList('MatchTypeNote_type')}">
                                <div class="label js-check clearfix" style="margin-top: 1.4rem;">
                                    <c:set var="hasType" value="false"></c:set>
                                    <c:set var="cc" value=""></c:set>
                                    <c:forEach var="typeNode" items="${fns:getMatchTypeNote(match.id,2) }">
                                        <c:if test="${typeNode.type==type.value }">
                                            <c:set var="hasType" value="true"></c:set>
                                            <c:set var="cc" value="${typeNode.num }"></c:set>
                                        </c:if>
                                    </c:forEach>
                                    <c:choose>
                                        <c:when test='${hasType }'>
                                            <span class="fl">${type.label }</span>
                                            <span class="fl" style="margin-left: 60px;margin-top: -0.5rem;">
													<select id="select_option_${type}" class="select_font_size_3" disabled="disabled">
														<option value="0">=请选择=</option>
				                                        <c:forEach var="dic" items="${fns:getDictList('MATCH_CHANGCI')}">
                                                            <option value="${dic.value}"
                                                                    <c:if test="${match.changci==dic.value and hasType}">selected="selected"</c:if>  >${dic.label }</option>
                                                        </c:forEach>
													</select>
												</span><span class="fl" style="margin-left: 10px;">场</span>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <span class="namell">报名时间</span>
                <fmt:formatDate value="${match.regstarttime }" var="regstarttime" pattern="yyyy-MM-dd"/>
                <input class="apply_input1" name="regstarttime" value="${regstarttime }" id="regstarttime" type="text"
                       placeholder="开始时间" readonly="readonly">
                <span class="apply_text">至</span>
                <fmt:formatDate value="${match.regendtime }" var="regendtime" pattern="yyyy-MM-dd"/>
                <input class="apply_input1" name="regendtime" value="${regendtime }" id="regendtime" type="text"
                       placeholder="结束时间" readonly="readonly">

            </li>
            <li>
                <span class="namell">比赛时间</span>
                <fmt:formatDate value="${match.starttime }" var="starttime" pattern="yyyy-MM-dd"/>
                <input class="apply_input1" name="starttime" value="${starttime }" id="starttime" type="text"
                       placeholder="开始时间" readonly="readonly">
                <span class="apply_text">至</span>
                <fmt:formatDate value="${match.endtime }" var="endtime" pattern="yyyy-MM-dd"/>
                <input class="apply_input1" name="endtime" value="${endtime }" id="endtime" type="text"
                       placeholder="结束时间" readonly="readonly">
            </li>
            <li class="clearfix">
                <span class="namell fl v-m">比赛地点</span>
                <span class="fl clearfix apply_address v-m">
							<span class="add_text fl" style="margin-top: 6px;">${match.address }${match.detailAddress }</span>
				</span>
            </li>
            <li>
                <span class="namell">联系人</span>
                <span class="textll">${match.contacts }</span>
            </li>
            <li>
                <span class="namell">联系电话</span>
                <span class="textll">${match.phone }</span>
            </li>
            <li style="margin-top:0.3rem;">
                <span class="namell v-t">比赛简介</span>
                <textarea class="are" name="des" placeholder="请输入比赛简介" readonly="readonly" rows="4" style="overflow-y: auto;">${match.des }</textarea>
            </li>
            <li style="margin-top:0.3rem;">
                <span class="namell v-t">奖金奖品</span>
                <textarea class="are" name="jiangpin" placeholder="请输入奖金奖品" readonly="readonly" rows="4" style="overflow-y: auto;">${match.jiangpin }</textarea>
            </li>
        </ul>
    </div>
    <div class="sheet_table matchdiv" style="display:none;">
        <span class="li_left r05">比赛类型</span>
        <c:forEach var="typeNode" items="${fns:getMatchTypeNote(match.id,type) }">
            <div class="li_right2 r05 clearfix">
                <div class="clearfix li_right1" style="width:100%;margin-bottom:0.4rem;">
                    <div class="first-meun">
                        <img class="first_img1 v-m" src="${ctxStaticFront}/images/img36-1.png">
                        <span class="v-m">${fns:getDictLabel(typeNode.type, 'MatchTypeNote_type', '')}</span>
                        <span>（已报名<label id="num${typeNode.id}">${typeNode.counts }</label>人）</span>
                    </div>
                    <div class="tree-second fr" id="dnandannum${typeNode.id}Div2">
                        <div class="tree_second_list">
                            <c:forEach var="people" items="${fns:getPeopleByType(typeNode.id) }">
                                <c:if test="${people.state!=1 }">
                                    <div class="second_list_con clearfix">
								<span class="activity_po">
                                         <img id="img${people.id }"
                                              src="${ctxStaticFront}/images/img37.png">
								</span>
                                        <span class="list_name">${people.name }</span>
                                        <span class="list_butt1 fr">${people.org.name }</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="sheet_table matchdiv" style="display:none;">
        <section>
            <div class="raning_list">
                <ul>
                    <c:forEach var="type" items="${fns:getMatchTypes(match.id) }">
                        <c:forEach var="dic" items="${fns:getDictList('MatchTypeNote_type')}">
                            <c:if test="${type.type==dic.value }">
                                <li class="clearfix one">${dic.label } </li>
                                <c:forEach var="result" items="${fns:getPeopleSort(match.id,type.btype,type.type) }" end="2" varStatus="num">
                                    <li class="clearfix one">
						<span class="fl left">
							<span class="name">第${util:numToUpper(num.index+1) }名</span>
							<c:choose>
                                <c:when test="${type.btype==2  }">
                                    <span>${result.people.orgname }</span>
                                </c:when>
                                <c:otherwise>
                                    <span>${result.people.name }</span>
                                </c:otherwise>
                            </c:choose>
						</span>
                                        <span class="fl content">
							<img src="${ctxStaticFront}/images/result${num.index+1 }.png">
						</span>
                                        <span class="fr right">${result.jushu }局${result.shengju }胜</span>
                                    </li>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </ul>
            </div>
        </section>
        <div class="clearfix sheet_table_title" style="text-align: center;">
            <select name="typeSelect" id="typeSelect" onchange="initSelectList(this)" class="select_font_size_2">
                <option>请选择</option>
                <c:forEach var="typeNode" items="${fns:getMatchTypeNote(match.id,type) }" varStatus="num">
                    <c:forEach var="dic" items="${fns:getDictList('MatchTypeNote_type')}">
                        <c:if test="${typeNode.type==dic.value }">
                            <option value="${typeNode.id }" >${dic.label }</option>
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
<script>
    $(function () {
        var str=window.location.href;
        var strs=str.split("baoming=");
        if(strs.length==2){
            document.getElementById("danxiang_bottom").style.display="block";
        }
    })
</script>
<!-- 单项赛才允许再报名时间段内报名 -->
<c:if test="${match.changci==0 and not empty CURRENTACCOUNT and CURRENTACCOUNT.id!=match.account.id}">
    <fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="nowDate"/>
    <fmt:formatDate value="${match.regendtime}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="regendtime"/>
    <fmt:formatDate value="${match.regstarttime}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="regstarttime"/>
    <c:choose>
        <c:when test="${nowDate lt regstarttime}">
            <div id="danxiang_bottom" class="activity_danxiang" style="display:none;">
                <div class="activity_content">
                    <span>报名还未开始</span>
                    <div class="shut_button" onclick="shut_but()">关闭</div>
                </div>
            </div>
        </c:when>
        <c:when test="${nowDate gt regendtime}">
            <div id="danxiang_bottom" class="activity_danxiang" style="display:none;">
                <div class="activity_content">
                    <span>报名已截止</span>
                    <div class="shut_button" onclick="shut_but()">关闭</div>
                </div>
            </div>
        </c:when>
        <%-- <c:otherwise>
            <div id="danxiang_bottom" class="activity_danxiang" style="display:none;">
                <div class="activity_content">
                    <c:forEach var="type" items="${fns:getDictList('MatchTypeNote_type')}">
                        <div class="label js-check clearfix" style="margin:0 auto;">
                                <c:forEach var="typeNode" items="${fns:getMatchTypeNote(match.id,1) }">
                                    <c:if test="${typeNode.type==type.value }">
                                        <span id="margin_bottom_${typeNode.id}" class="fl" style="margin-left: 1rem;margin-bottom:1rem;line-height:1rem;">${type.label }</span>
                                        <c:if test="${type.value==2 or type.value==4 or type.value==5}">
                                            <c:set var="peoples" value="${fns:peopleHasBaoming(typeNode.id,CURRENTACCOUNT.openid) }"></c:set>
                                            <c:forEach var="note" items="${peoples }">
                                                <script>
                                                </script>
                                                <c:choose>
                                                    <c:when test="${empty note.phone or note.phone != CURRENTACCOUNT.phone}">
                                                        <script>
                                                            if(${empty note.phone or note.phone != CURRENTACCOUNT.phone}){
                                                                document.getElementById("margin_bottom_${typeNode.id}").style.marginBottom="4rem";
                                                            }
                                                        </script>
                                                        <input type="hidden" id="noteid" value="${note.id }"/>
                                                        <input type="text" id="notename" placeholder="队友姓名" value="${note.name }" style="margin-top: 1.5rem;">
                                                        <input type="text" id="notephone" placeholder="手机号" value="${note.phone }" style="margin-top: 3rem;">
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                            <span class="fl label_but" style="text-align:center;color:#FFF;background-color:#44bb95;margin-right:1rem;float:right;<c:if test="${fn:length(peoples)==2}">display:none;</c:if>" onclick="addPeopleNote(${typeNode.id},true)" id="baomspan${typeNode.id }true">报名</span>
                                            <span class="fl label_but" style="text-align:center;color:#FFF;background-color:#44bb95;margin-right:1rem;float:right;<c:if test="${fn:length(peoples)==1}">display:none;</c:if>" onclick="addPeopleNote(${typeNode.id},false)" id="baomspan${typeNode.id }false">取消报名</span>
                                            <span class="fl label_but" style="text-align:center;color:#FFF;background-color:#44bb95;margin-right:1rem;float:right;<c:if test="${fn:length(peoples)==1}">display:none;</c:if>" onclick="addPeopleNote(${typeNode.id},true)" id="baomspan${typeNode.id }">修改</span>
                                        </c:if>
                                        <c:if test="${type.value==1 or type.value==3 }">
                                            <c:set var="hasBaoming" value="${fns:checkHasBaoming(typeNode.id,CURRENTACCOUNT.openid) }"/>
                                            <span class="fl label_but" style="text-align:center;color:#FFF;background-color:#44bb95;margin-right:1rem;float:right;<c:if test="${hasBaoming }">display:none;</c:if>" onclick="baoming(${typeNode.id},true)" id="baomspan${typeNode.id }true">报名</span>
                                            <span class="fl label_but" style="text-align:center;color:#FFF;background-color:#44bb95;margin-right:1rem;float:right;<c:if test="${!hasBaoming }">display:none;</c:if>" onclick="baoming(${typeNode.id},false)" id="baomspan${typeNode.id }false">取消报名</span>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                        </div>
                    </c:forEach>
                    <div class="shut_button" onclick="shut_but()">关闭</div>
                </div>
            </div>
        </c:otherwise> --%>
    </c:choose>
</c:if>
<!-- <script>
    function shut_but() {
        document.getElementById("danxiang_bottom").style.display="none";
    }
</script> -->
</body>
</html>