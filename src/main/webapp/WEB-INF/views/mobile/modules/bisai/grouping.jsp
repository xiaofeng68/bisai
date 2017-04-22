<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta content="telephone=no" name="format-detection">
    <title>${siteTitle }</title>
    <meta name="decorator" content="default"/>
    <meta name="keywords" content="${siteKeywords }">
    <meta name="description" content="${siteDescription }">
    <link rel="stylesheet" type="text/css"
          href="${ctxStaticFront }/css/incstyle.css" media="all">
    <link rel="stylesheet" type="text/css"
          href="${ctxStaticFront }/css/index.css" media="all">
    <script type="text/javascript" src="${ctxStaticFront }/js/jquery.js"></script>
    <script type="text/javascript">
        function initGroups() {
            var groups = $("#typeSelect").find("option:selected").attr("groups");
            var num = parseInt(groups);
            if (!isNaN(num)) {
                var html = "<option value=''>请选择</option>";
                for (var i = 1; i <= num; i++) {
                    html += "<option value='" + i + "'>第" + i + "组</option>";
                }
                $("#groupSelect").html(html);
            } else {
                $("#groupSelect").html("<option value=''>请选择</option>");
            }
        }
        function targetDiv() {
            var type = $("#typeSelect").val();
            var group = $("#groupSelect").val();
            $("html,body").animate({scrollTop: $('#' + type + group).offset().top}, 1000);
        }
    </script>
</head>
<body>
<header class="grouping_header clearfix">
		<span class="fl"> <a
                href="${ctx}/bisai/match/"> <img
                src="${ctxStaticFront }/images/r-arrow.png">
		</a>
		</span> <span>分组名单</span>
</header>
<section>
    <select id="typeSelect" onchange="initGroups()" class="select_font_size_3">
        <option value="">请选择</option>
        <c:forEach var="typeNode" items="${fns:getMatchTypeNote(matchid,type) }">
            <option value="${typeNode.id }"
                    groups="${typeNode.peoples }">${fns:getDictLabels(typeNode.type,'MatchTypeNote_type','')}</option>
        </c:forEach>
    </select>
    <select id="groupSelect" onchange="targetDiv()" class="select_font_size_3">
        <option value="">请选择</option>
    </select>
</section>
<c:forEach var="typeNode" items="${fns:getMatchTypeNote(matchid,type) }">
    <section>
        <c:set var="nodeId" value="${typeNode.id }"/>
        <c:forEach items="${groupMap[nodeId] }" var="group" varStatus="num">
            <div class="grouping_table" id="${typeNode.id }${num.index+1 }">
                <p>${fns:getDictLabels(typeNode.type,'MatchTypeNote_type','')}&nbsp;&nbsp;第${num.index+1 }组</p>
                <table>
                    <tr>
                        <td>对战<br></td>
                    </tr>
                    <c:forEach var="chang" items="${group }">
                        <tr>
                            <td>[${chang[0].id }]${chang[0].name } vs [${chang[1].id }]${chang[1].name }<br></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </c:forEach>
    </section>
</c:forEach>
<div class="fenzu_submit">
    <a href="${ctx }/bisai/match/matchScore${urlSuffix}?type=${type }&stype=1&id=${matchid}">
        <div class="fenzu_a">
            开始录入分数
        </div>
    </a>
</div>
</body>
</html>