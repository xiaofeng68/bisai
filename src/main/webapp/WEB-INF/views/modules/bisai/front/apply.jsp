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
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=DpmmgKEQnkQSLN7zrlgdCacccrGTatIx"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".apply_border em").live('click', function () {
                var text = "," + $(this).prev().text() + ',';
                var id = $(this).parent().parent().prev().prev().attr("id");
                var input = "," + $("#" + id).val() + ",";
                input = input.replace(text, '');
                if ("," == input.substr(0, 1)) {
                    input = input.substr(1);
                } else if ("," == input.substr(input.length - 1)) {
                    input = input.substr(0, input.length - 1);
                }
                $("#" + id).val(input);
                $(this).parent().remove();
            });
            //toCenter();
        });
        function addOrgItems(input, cls, hidden) {
            var name = $("#" + input).val();
            var html = '<span class="apply_borderll"><span>' + name + '</span><em></em></span>';
            $("." + cls).append(html);
            $("#" + input).val("");
            var value = $("#" + hidden).val();
            if (value) {
                value = value + ",";
            }
            $("#" + hidden).val(value + name);
        }
        function resetValue() {
        	var name = $("#name").val();
        	if(!name){
        		alert("请输入比赛名称！");
        		return false;
        	}
            var contractorStr = "";
            var index = 0;
            $(".contractordic").find("span").each(function () {
                var val = $(this).find("span").html();
                if (val) {
                    if (index == 0) {
                        contractorStr += val;
                    } else {
                        contractorStr += "," + val;
                    }
                }
                index++;
            });
            if(!contractorStr){//承办
            	contractorStr = $("#addContractor").val(); 
            }
            $("#contractor").val(contractorStr);
            var orgsStr = "";
            index = 0;
            $(".orgsdic").find("span").each(function () {
                var val = $(this).find("span").html();
                if (val) {
                    if (index == 0) {
                        orgsStr += val;
                    } else {
                        orgsStr += "," + val;
                    }
                }
                index++;
            });
            if(!orgsStr){
            	orgsStr = $("#addOrg").val(); 
            }
            if(!orgsStr){//主办
            	alert("主办方不能为空！");
            	return false;
            }
            $("#orgs").val(orgsStr);
            var sponsorStr = "";
            index = 0;
            $(".sponsordic").find("span").each(function () {
                var val = $(this).find("span").html();
                if (val) {
                    if (index == 0) {
                        sponsorStr += val;
                    } else {
                        sponsorStr += "," + val;
                    }
                }
                index++;
            });
            if(!sponsorStr){//赞助
            	sponsorStr = $("#addSponsor").val(); 
            }
            $("#sponsors").val(sponsorStr);
            var typeStr = "";
            $(".typecheck").each(function () {
                if ($(this).hasClass('checked'))
                    typeStr += $(this).next().html() + ",";
            });
            if (typeStr)
                typeStr = typeStr.substring(0, typeStr.length - 1);
            var ttypeStr = "";
            $(".ttypecheck").each(function () {
                if ($(this).hasClass('checked')) {
                    var cc = $(this).parent().find("select").val();//获取场次
                    ttypeStr += $(this).next().html() + ":" + cc + ",";
                }
            });
            if (ttypeStr)
                ttypeStr = ttypeStr.substring(0, ttypeStr.length - 1);            
            $("#type").val(typeStr + ";" + ttypeStr);
            
            var regstart = new Date($('#regstarttime').val().replace(/-/g,'/'));
            var regend = new Date($('#regendtime').val().replace(/-/g,'/'));
            if(regstart>regend){
        		alert("报名开始时间必须早于结束时间！");
        		return false;
        	}
        	var start = new Date($('#starttime').val().replace(/-/g,'/'));
        	var end = new Date($('#endtime').val().replace(/-/g,'/'));
        	if(regend>start){
        		alert("比赛时间晚于报名时间！");
        		return false;
        	}
        	if(start>end){
        		alert("比赛开始时间必须早于结束时间！");
        		return false;
        	}
            
            return true;
        }
        function bisai_change(val) {
            if (val == 1) {
                document.getElementById("danxiang").style.display = 'inherit';
                document.getElementById("tuanti").style.display = 'none';
                var elm_a=document.getElementById("radio_button_a");
                var elm_b=document.getElementById("radio_button_b");
                $(".ttypecheck").each(function () {
                    if ($(this).hasClass('checked')) {
                        $(this).removeClass('checked').addClass('unchecked');
                        $(this).parent().find("select").val("");//获取场次
                    }
                });
                elm_a.style.backgroundColor="#44bb95";
                elm_b.style.backgroundColor="";
                elm_a.style.color="#fff";
                elm_b.style.color="#b4b3b3";
                $("#changci").val(0);
            }
            if (val == 2) {
                document.getElementById("danxiang").style.display = 'none';
                document.getElementById("tuanti").style.display = 'inherit';
                var elm_a=document.getElementById("radio_button_a");
                var elm_b=document.getElementById("radio_button_b");
                $(".typecheck").each(function () {
                    if ($(this).hasClass('checked')) {
                        $(this).removeClass('checked').addClass('unchecked');
                    }
                });
                elm_a.style.backgroundColor="";
                elm_b.style.backgroundColor="#44bb95";
                elm_a.style.color="#b4b3b3";
                elm_b.style.color="#fff";
            }
        }
        function toCenter(){
        	$.post('${ctx }${frontPath}/match/address', {
        		url: location.href.split('#')[0]
            }, function (result) {
            	var obj = result.obj;
                if (result.success) {
                	wx.config({
                	    debug: false,
                	    appId: obj.appid,
                	    timestamp: obj.timestamp,
                	    nonceStr: obj.noncestr,
                	    signature: obj.signature.toUpperCase(),
                	    jsApiList: ['checkJsApi','openLocation','getLocation']
                	});
                    wx.ready(function () {
                    	wx.checkJsApi({
                    	    jsApiList: [
                    	        'getLocation'
                    	    ],
                    	    success: function (res) {
                    	        if (res.checkResult.getLocation == false) {
                    	            alert('你的微信版本太低，不支持微信JS接口，请升级到最新的微信版本！');
                    	            return;
                    	        }
                    	    }
                    	});
                    	wx.getLocation({
                    		type: 'wgs84',
                    	    success: function (res) {
                    	    	var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
                    	        var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
                    	        var speed = res.speed; // 速度，以米/每秒计
                    	        var accuracy = res.accuracy; // 位置精度
                    	        $.ajax({
                    				url: 'http://api.map.baidu.com/geocoder/v2/?ak=btsVVWf0TM1zUBEbzFz6QqWF&callback=renderReverse&location=' + latitude + ',' + longitude + '&output=json&pois=1',
                    				type: "get",
                    				dataType: "jsonp",
                    				jsonp: "callback",
                    				success: function (data) {
                    					var province = data.result.addressComponent.province;
                    					var cityname = (data.result.addressComponent.city);
                    					var district = data.result.addressComponent.district;
                    					var street = data.result.addressComponent.street;
                    					var street_number = data.result.addressComponent.street_number;
                    					var formatted_address = data.result.formatted_address;
                    					alert("测试当前位置："+province+cityname+district);
                    					$("#address").val(province+cityname+district);
                    				}
                    			});
                    	    },
                    	    cancel: function (res) {
                    	        alert('用户拒绝授权获取地理位置');
                    	    }
                    	});
    		  		});
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
			<%-- <a href="${ctx }/${frontPath}match${urlSuffix}">
				<img src="${ctxStaticFront }/images/r-arrow.png">
			</a> --%>
		</span>
    <span>申请举办比赛</span>
</header>
<section>
    <div class="apply_form">
        <form action="${ctx }/${frontPath}apply_s${urlSuffix}" method="post" onsubmit="return resetValue()">
            <input type="hidden" name="id" value="${match.id }"/>
            <ul>
                <li>
                    <span class="namell">赛事名称</span>
                    <input class="textll" type="text" name="name" id="name" value="${match.name }"
                           placeholder="请输入赛事名称">
                </li>
                <li class="clearfix">
                    <span class="namell">主办者</span>
                    <input class="textll1" id="addOrg" type="text" placeholder="请输入主办者"/>
                    <input type="hidden" name="orgs" id="orgs" value="${match.orgs }"/>
                    <span class="apply_butt" onclick="addOrgItems('addOrg','orgsdic','orgs')">+</span>
                    <div class="apply_border orgsdic">
                        <c:if test="${not empty match.orgs }">
                            <c:forEach items='${fn:split(match.orgs,",")}' var="org">
                                <span class="apply_borderll"><span>${org }</span><em></em></span>
                            </c:forEach>
                        </c:if>
                    </div>
                </li>
                <li class="clearfix">&nbsp;&nbsp;
                    <span class="namell">承办者</span>
                    <input class="textll1" id="addContractor" type="text" placeholder="请输入承办者">
                    <input name="contractor" type="hidden" id="contractor" value="${match.contractor }"/>
                    <span class="apply_butt"
                          onclick="addOrgItems('addContractor','contractordic','contractor')">+</span>
                    <div class="apply_border contractordic">
                        <c:if test="${not empty match.contractor }">
                            <c:forEach items='${fn:split(match.contractor,",")}' var="contractor">
                                <span class="apply_borderll"><span>${contractor }</span><em></em></span>
                            </c:forEach>
                        </c:if>
                    </div>
                </li>
                <li class="clearfix">
                    <span class="namell">赞助商</span>
                    <input class="textll1" id="addSponsor" type="text" placeholder="赞助商名称">
                    <input type="hidden" name="sponsors" id="sponsors" value="${match.sponsors }"/>
                    <span class="apply_butt" onclick="addOrgItems('addSponsor','sponsordic','sponsors')">+</span>
                    <div class="apply_border sponsordic">
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
                    <input class="apply_input1" name="regstarttime" value="${regstarttime }" id="regstarttime" type="text"
                           placeholder="开始时间" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});">
                    <span class="apply_text">至</span>
                    <fmt:formatDate value="${match.regendtime }" var="regendtime" pattern="yyyy-MM-dd"/>
                    <input class="apply_input1" name="regendtime" value="${regendtime }" id="regendtime" type="text"
                           placeholder="结束时间" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});">                           
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
							<input class="textll" name="address" value="${match.address }" id="address" type="text"
                                   placeholder="请选择" >
							<span class="fr add_butt" onclick="toCenter()">重新选择</span>
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
                <input type="submit" value="提交申请">
            </div>
        </form>
    </div>
</section>
</body>
</html>