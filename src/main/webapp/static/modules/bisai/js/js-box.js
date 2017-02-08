$(function() {

	$(".js-check em").on("click", function() {
		if ($(this).hasClass("checked")) {
			$(this).removeClass("checked").addClass("unchecked");
		} else {
			$(this).removeClass("unchecked").addClass("checked");
		}
	});

});


