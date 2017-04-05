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
	$(function(){
		$(".div_select").each(function(){
			var selid = $(this).attr('div-select-val');
			var divselectid = "#divselect" + selid;
			var inputselectid = "#inputselect" + selid;
			$.divselect(divselectid,inputselectid);
		});
		$(".gains_table li").on("click", function() {
			$(this).addClass("active").siblings().removeClass("active");
			$(".matchdiv").hide().eq($(this).index()).show();
		});
		var changci = parseInt('${match.changci}');
		if(changci){
			bisai_change(2);
		}
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
	function bisai_change(val) {
		var elm_a=document.getElementById("radio_button_a");
        var elm_b=document.getElementById("radio_button_b");
        if (val == 1) {
            document.getElementById("danxiang").style.display = 'inherit';
            document.getElementById("tuanti").style.display = 'none';
            elm_a.style.backgroundColor="#44bb95";
            elm_b.style.backgroundColor="";
            elm_a.style.color="#fff";
            elm_b.style.color="#b4b3b3";
        }
        if (val == 2) {
            document.getElementById("danxiang").style.display = 'none';
            document.getElementById("tuanti").style.display = 'inherit';
            elm_a.style.backgroundColor="";
            elm_b.style.backgroundColor="#44bb95";
            elm_a.style.color="#b4b3b3";
            elm_b.style.color="#fff";
        }
    }
    </script>
</head>
<body>
<header class="grouping_header clearfix">
		<span class="fl">
			<a href="${ctx }/${frontPath}match${urlSuffix}">
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
                    <span class="textll" >${match.name }</span>
                </li>
                <li class="clearfix">
                    <div class="apply_border orgsdic">
                    	<span class="namell">主办者</span>
                        <c:if test="${not empty match.orgs }">
                            <c:forEach items='${fn:split(match.orgs,",")}' var="org">
                                <span class="apply_borderll"><span>${org }</span><em></em></span>
                            </c:forEach>
                        </c:if>
                    </div>
                </li>
                <li class="clearfix">&nbsp;&nbsp;
                    <div class="apply_border contractordic">
                    	<span class="namell">承办者</span>
                        <c:if test="${not empty match.contractor }">
                            <c:forEach items='${fn:split(match.contractor,",")}' var="contractor">
                                <span class="apply_borderll"><span>${contractor }</span><em></em></span>
                            </c:forEach>
                        </c:if>
                    </div>
                </li>
                <li class="clearfix">
                    <div class="apply_border sponsordic">
                    	<span class="namell">赞助商</span>
                        <c:if test="${not empty match.sponsors }">
                            <c:forEach items='${fn:split(match.sponsors,",")}' var="sponsors">
                                <span class="apply_borderll"><span>${sponsors }</span><em></em></span>
                            </c:forEach>
                        </c:if>
                    </div>
                </li>
                <li class="clearfix">
                    <div class="clearfix" style="line-height:13px; padding-bottom:0.7rem">
                        <span class="namell fl">比赛项目</span>
                        <input type="hidden" name="type" id="type">
                        <div class="substance fl" style="width:80%;">
                            <div style="height: 40px;font-size: 0.7rem;color: #b4b3b3;">
                                <input type="radio" name="btype" value="1" style="-webkit-appearance: button;"
                                       onclick="bisai_change(1)" id="dxcRadio"><label for="dxcRadio" id="radio_button_a" class="radio_button" style="background-color:#44bb95;color:#fff;">单项赛</label>
                                <input type="radio" name="btype" value="2"
                                       style="-webkit-appearance: button;margin-left: 90px;" onclick="bisai_change(2)"
                                       id="tdcRadio"><label for="tdcRadio" id="radio_button_b" class="radio_button">团体赛</label>
                            </div>
                            <c:set var="btypes" value='${fn:split(match.type,";") }'></c:set>
                            <div id="danxiang" style="margin-top: 1.5rem;">
                                <c:forEach var="type" items="${fns:getDictList('MatchTypeNote_type')}">
                                    <div class="label js-check clearfix" style="margin-top: 1.5rem;">
                                        <c:set var="hasType" value="false"></c:set>
                                        <c:forEach var="typeNode" items="${fns:getMatchTypeNote(match.id,1) }">
                                            <c:if test="${typeNode.type==type.value }">
                                                <c:set var="hasType" value="true"></c:set>
                                            </c:if>
                                        </c:forEach>
                                        <c:choose>
                                            <c:when test='${hasType }'>
                                                <span class="fl">${type.label }</span>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </c:forEach>
                            </div>
                            <div id="tuanti" style="font-size: 0.7rem;color: #b4b3b3;display: none;margin-top: 1rem;">
                                <div class="label js-check clearfix">比赛总场次：
                                    <select class="select_font_size_3" name="changci" id="changci" disabled="disabled">
                                        <option value="0">=请选择=</option>
                                        <c:forEach var="dic" items="${fns:getDictList('MATCH_CHANGCI')}">
                                            <option value="${dic.value}" <c:if test="${match.changci==dic.value }">selected="selected"</c:if>  >${dic.label }</option>
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
				                                        <option value="${dic.value}" <c:if test="${match.changci==dic.value and hasType}">selected="selected"</c:if>  >${dic.label }</option>
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
                    <input class="textll" type="text" name="regstarttime" value="${regstarttime }" id="regstarttime"
                           placeholder="报名时间" >
                </li>
                <li>
                    <span class="namell">比赛时间</span>
                    <fmt:formatDate value="${match.starttime }" var="starttime" pattern="yyyy-MM-dd"/>
                    <input class="apply_input1" name="starttime" value="${starttime }" id="starttime" type="text"
                           placeholder="开始时间" >
                    <span class="apply_text">至</span>
                    <fmt:formatDate value="${match.endtime }" var="endtime" pattern="yyyy-MM-dd"/>
                    <input class="apply_input1" name="endtime" value="${endtime }" id="endtime" type="text"
                           placeholder="结束时间" >
                </li>
                <li class="clearfix">
                    <span class="namell fl v-m">比赛地点</span>
                    <span class="fl clearfix apply_address v-m">
							<span class="add_text fl" style="margin-top: 6px;">${match.address }</span>
						</span>

                </li>
                <li>
                    <span class="namell">详细地址</span>
                    <span class="textll">${match.detailAddress }</span>
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
                    <textarea name="des" placeholder="请输入比赛简介" readonly="readonly">${match.des }</textarea>
                </li>
                <li style="margin-top:0.3rem;">
                    <span class="namell v-t">奖金奖品</span>
                    <textarea name="jiangpin" placeholder="请输入奖金奖品" readonly="readonly">${match.jiangpin }</textarea>
                </li>
            </ul>
    </div>
    <div class="sheet_table matchdiv" style="display:none;">
    	<span class="li_left f14">比赛类型</span>
        <c:forEach var="typeNode" items="${fns:getMatchTypeNote(match.id,type) }">
            <div class="li_right2 f13 clearfix">
                <div class="clearfix li_right1" style="width:100%;margin-bottom:0.4rem;">
                    <div class="first-meun">
                        <img class="first_img1 v-m" src="${ctxStaticFront}/images/img36-1.png">
                        <span class="v-m">${fns:getDictLabel(typeNode.type, 'MatchTypeNote_type', '')}</span>
                        <span>（已报名<label id="num${typeNode.id}">${typeNode.counts }</label>人）</span>
                    </div>
                    <div class="tree-second fr" id="dnandannum${typeNode.id}Div2" >
                        <div class="tree_second_list">
                            <c:forEach var="people" items="${fns:getPeopleByType(typeNode.id) }">
                                <div class="second_list_con clearfix">
								<span class="activity_po">
									<c:choose>
                                        <c:when test="${people.state==1 }">
                                            <img id="img${people.id }"
                                                 src="${ctxStaticFront}/images/img37-1.png">
                                        </c:when>
                                        <c:otherwise>
                                            <img id="img${people.id }" src="${ctxStaticFront}/images/img37.png">
                                        </c:otherwise>
                                    </c:choose>
								</span>
                                <span class="list_name">${people.name }</span>
                                <span class="list_butt1 fr">${people.org.name }</span>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="sheet_table matchdiv" style="display:none;">
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