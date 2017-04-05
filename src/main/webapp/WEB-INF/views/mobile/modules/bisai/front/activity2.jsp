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
    <script type="text/javascript">
        $(document).ready(function () {
        });
    </script>
</head>
<body>
<header class="grouping_header clearfix">
		<span class="fl">
			<a href="${ctx }/${frontPath}match${urlSuffix}">
				<img src="${ctxStaticFront }/images/r-arrow.png">
			</a>
		</span>
    <span><c:choose>
    <c:when test="${match.state==1 }">
   比赛报名
    </c:when>
    <c:otherwise>
    申请举办比赛
    </c:otherwise>
    </c:choose></span>
</header>
<section>
    <div class="apply_form">
            <input type="hidden" name="id" value="${match.id }"/>
            <ul>
                <li>
                    <span class="namell">赛事名称</span>
                    <input class="textll" type="text" name="name" id="name" value="${match.name }"
                           placeholder="请输入赛事名称">
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
                                       onclick="bisai_change(1)" checked="checked" id="dxcRadio"><label for="dxcRadio" id="radio_button_a" class="radio_button" style="background-color:#44bb95;color:#fff;">单项赛</label>
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
                                                <em class="checked fl typecheck" style="margin-top: -0.4rem;"></em>
                                            </c:when>
                                            <c:otherwise>
                                                <em class="unchecked fl typecheck" style="margin-top:-0.4rem;"></em>
                                            </c:otherwise>
                                        </c:choose>
                                        <span class="fl">${type.label }</span>
                                    </div>
                                </c:forEach>
                            </div>
                            <div id="tuanti" style="font-size: 0.7rem;color: #b4b3b3;display: none;margin-top: 1rem;">
                                <div class="label js-check clearfix">比赛总场次：
                                    <select class="select_font_size_3" name="changci" id="changci">
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
                                                <em class="checked fl ttypecheck" style="margin-top:-0.4rem;"></em>
                                            </c:when>
                                            <c:otherwise>
                                                <em class="unchecked fl ttypecheck" style="margin-top:-0.4rem;"></em>
                                            </c:otherwise>
                                        </c:choose>
                                        <span class="fl">${type.label }</span>
                                        <span class="fl" style="margin-left: 60px;margin-top: -0.5rem;">
											<%--<input type="text" value="${cc }" style="font-size:0.7rem;width: 100px;border-style:solid;border-width: 1px;height: 1rem;">--%>
											<select id="select_option_${type}" class="select_font_size_3">
											</select>
												<script>
													var op_str = "<option value='0'>=请选择=</option>";
                                                    for (var i = 1; i < 10; i++) {
                                                        op_str += "<option value='" + i + "'>" + i + "</option>";
                                                    }
                                                    $("#select_option_${type}").html(op_str);
												</script>
										</span><span class="fl" style="margin-left: 10px;">场</span>
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
                           placeholder="报名时间" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});">
                </li>
                <li>
                    <span class="namell">比赛时间</span>
                    <fmt:formatDate value="${match.starttime }" var="starttime" pattern="yyyy-MM-dd"/>
                    <input class="apply_input1" name="starttime" value="${starttime }" id="starttime" type="text"
                           placeholder="开始时间" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});">
                    <span class="apply_text">至</span>
                    <fmt:formatDate value="${match.endtime }" var="endtime" pattern="yyyy-MM-dd"/>
                    <input class="apply_input1" name="endtime" value="${endtime }" id="endtime" type="text"
                           placeholder="结束时间" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});">
                </li>
                <li class="clearfix">
                    <span class="namell fl v-m">比赛地点</span>
                    <span class="fl clearfix apply_address v-m">
							<span class="add_text fl" style="margin-top: 6px;">${match.address }</span>
						</span>

                </li>
                <li>
                    <span class="namell">详细地址</span>
                    <input class="textll" type="text" name="detailAddress" value="${match.detailAddress }"
                           placeholder="XX街道">
                </li>
                <li>
                    <span class="namell">联系人</span>
                    <input class="textll" type="text" name="contacts" value="${match.contacts }" id="contacts"
                           placeholder="请输入联系人姓名">
                </li>
                <li>
                    <span class="namell">联系电话</span>
                    <input class="textll" type="text" name="phone" value="${match.phone }" id="phone"
                           placeholder="请输入联系号码">
                </li>
                <li style="margin-top:0.3rem;">
                    <span class="namell v-t">比赛简介</span>
                    <textarea name="des" placeholder="请输入比赛简介">${match.des }</textarea>
                </li>
                <li style="margin-top:0.3rem;">
                    <span class="namell v-t">奖金奖品</span>
                    <textarea name="jiangpin" placeholder="请输入奖金奖品">${match.jiangpin }</textarea>
                </li>
            </ul>
            <div class="apply_submit">
                <input type="submit" value="返回" onclick="history.go(-1)">
            </div>
    </div>
</section>
</body>
</html>