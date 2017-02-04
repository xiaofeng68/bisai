/*!
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */

// 添加收藏
function addFavorite(sURL, sTitle){
	if(!sTitle){sTitle = document.title;}
    try{
    	window.external.addFavorite(sURL, sTitle);
    }catch (e){
        try{
        	window.sidebar.addPanel(sTitle, sURL, "");
        }catch (e){
        	alert("加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}
// 首页菜单特效  自动滚动：setInterval("autoScroll('.jcarousellite')",3000);
function autoScroll(obj){
	var height = $(obj).find("ul:first li:first").height()+3;
    $(obj).find("ul:first").animate({marginTop:"-" + height + "px"},'slow',function(){
    		$(this).css({marginTop:"0px"}).find("li:first").appendTo(this);
    });
}

$(function () {
    $('.nav a').current();
    $(".nav>ul>li").hover(
		function () {
		    $(this).find("ul").stop(true, true).slideDown('slow').fadeTo(500, 0.7);
		    $(this).addClass('hover');
		    $(this).find("span").css("height", 0).stop(true, true).animate({ height: 90 });
		},
		function () {
		    $(this).find("ul").stop(true, true).slideUp('fast').fadeTo(500, 1);
		    $(this).removeClass('hover');
		    $(this).find("span").stop(true, true).animate({ height: 0 });
		}
	)
});
function stop() {
    return false;
}
//禁用鼠标右键
//document.oncontextmenu = stop;