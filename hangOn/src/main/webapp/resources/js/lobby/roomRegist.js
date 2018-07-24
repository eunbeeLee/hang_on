/**
 * lobby 은진
 */
const defalutBtn = {
		"border" : "1px solid #D5D5D5",
		"background-color" : "#EAEAEA"
}
const onBtn = {
		"border" : "1px solid #dbd0ef",
		"background-color" : "#b39bdd"
}


$( document ).ready(function() {
	$("#roomEntrance").hide();
	$("#roomRegist").show();
});
$("#roomEntranceNav").click(function () {
	$("#roomEntranceNav").attr("class", "active");
	$("#roomRegistNav").attr("class", "");
	
	$("#roomEntrance").show();
    $("#roomRegist").hide();
    $("#roomEntranceNav").children("a").css("color", "#fff").children("h4").css(onBtn);
    $("#roomRegistNav").children("a").css("color", "#BDBDBD").children("h4").css(defalutBtn);
})
$("#roomRegistNav").click(function () {
	$("#roomRegistNav").attr("class", "active");
	$("#roomEntranceNav").attr("class", "");
	
	$("#roomEntrance").hide();
    $("#roomRegist").show();
    $("#roomRegistNav").children("a").css("color", "#fff").children("h4").css(onBtn);
    $("#roomEntranceNav").children("a").css("color", "#BDBDBD").children("h4").css(defalutBtn);
})

$(".plus").click(function () {
//	$("#roomEntranceBtn").click();
	$("#roomRegistBox").slideDown();
	$("#roomRegistNav").children("a").click();

})
$(".close").click(function(){
	$("#roomRegistBox").slideUp(300);
})
$(".back").click(function () {
	$("#roomRegistBox").slideUp(300);
})

// 코드입력, 비밀번호 입력 공백 체크 및 공백 제거
function noSpaceForm(obj) { 
    var str_space = /\s/;  
    if(str_space.exec(obj.value)) { 
    	$("#err6Btn").click();
        obj.focus();
        obj.value = obj.value.replace(' ',''); 
        return false;
    }
}
$("input[name=roomJoinCode]").keyup(function () {
	noSpaceForm(this);
});
$("input[name=roomPassword]").keyup(function () {
	noSpaceForm(this);
});

$("#roomFindBtn").click(function (e) {
	var $code = $("input[name=roomJoinCode]");
	var $pass = $("#findPass");
	if($code.val().length == 0) {
		$("roomEnWarn").attr("visibility", "block");
		$("#err7Btn").click();
		$code.select();
	} else if($pass.val().length == 0) {
		$("#err8Btn").click();
		$pass.select();
	} else if($pass.val().length < 4 || $pass.val().length > 8) {
		$("#err9Btn").click();
		$pass.select();
	} else {
		$("#roomFindForm").submit();
	}
});

$("#roomRegistBtn").click(function () {
	var $name = $("input[name=roomName]");
	var $pass = $("#roomPassword");
	if($name.val().length == 0) {
		$("#err10Btn").click();
		$name.select();
	} else if($pass.val().length == 0) {
		$("#err11Btn").click();
		$pass.select();
	} else if($pass.val().length < 4 || $pass.val().length > 8) {
		$("#err12Btn").click();
		$pass.select();
	} else {
		$("#roomRegistForm").submit();
	}
});

