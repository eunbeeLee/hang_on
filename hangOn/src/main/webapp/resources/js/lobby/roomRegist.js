/**
 * lobby 은진
 */
$(".room-find").click(function () {
	$("#roomEntrance").show();
    $("#roomRegist").hide();
})
$(".room-regist").click(function () {
	$("#roomEntrance").hide();
    $("#roomRegist").show();
})

$(".plus").click(function () {
	$("#roomRegistBox").slideDown();
})
$(".back").click(function () {
	$("#roomRegistBox").slideUp(300);
})