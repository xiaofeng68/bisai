
$(function() {
	

	//tab切换	
	$(".gains_table li").on("click", function() {
		$(this).addClass("active").siblings().removeClass("active");
		$(".tab-content").hide().eq($(this).index()).show();
	});
	
	//点击展示或者隐藏
	$(".first-meun").click(function() {
		if ($(this).hasClass("active")) {
			$(this).removeClass("active");
			$(this).parents(".li_right1").find(".tree-second").hide();
		} else {
			$(this).addClass("active");
			$(this).parents(".li_right1").find(".tree-second").show();
		}

	});

	// 复选框
	$(".js-check em").on("click", function() {
		if ($(this).hasClass("checked")) {
			$(this).removeClass("checked").addClass("unchecked");
		} else {
			$(this).removeClass("unchecked").addClass("checked");
		}
	});
	
});