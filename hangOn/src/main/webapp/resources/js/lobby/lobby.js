/**
 * lobby 은진
 */

function openPass() {
    var pass = document.querySelector("#roomRePa");
    pass.style.display = "block"
}
function offPass() {
    var pass = document.querySelector("#roomRePa");
    pass.style.display = "none"
}
$(".room").click(function () {
    $(this).siblings().css("display", "block");
    $(this).css("opacity","0.7");
});

$(".room-over").mouseleave(function () {
    $(this).css("display", "none");
    $(this).siblings().css("opacity", "none");
});
$(".back").click(function () {
    $(".plus").css("opacity", "none");
});

